#!/usr/bin/env node

/**
 * Renumber example directories and update references in README_SRC.md.
 *
 * Usage:
 *   node scripts/renumber.js insert <position>
 *     — Shifts all examples at <position> and above up by one,
 *       creating a gap for a new example directory.
 *
 *   node scripts/renumber.js remove <position>
 *     — Shifts all examples above <position> down by one,
 *       closing the gap left by a removed example.
 *       Does NOT delete the directory at <position>.
 *
 * What it does:
 *   1. Renames example directories (##_name -> ##_name) from highest first
 *   2. Renames .pde files inside each directory to match
 *   3. Updates all @import references in README_SRC.md
 *
 * Examples:
 *   node scripts/renumber.js insert 8
 *     — Examples 08+ become 09+, leaving 08 slot open.
 *
 *   node scripts/renumber.js remove 8
 *     — Examples 09+ become 08+, closing the gap.
 */

import { readdirSync, renameSync, readFileSync, writeFileSync, existsSync } from "fs";
import { resolve, dirname, join } from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const ROOT = resolve(__dirname, "..");
const EXAMPLES_DIR = resolve(ROOT, "examples");
const SRC_FILE = resolve(ROOT, "README_SRC.md");

// Parse numbered example directories: "08_sdf_circle" -> { num: 8, name: "sdf_circle", dir: "08_sdf_circle" }
function parseExamples() {
  const entries = readdirSync(EXAMPLES_DIR, { withFileTypes: true })
    .filter((d) => d.isDirectory() && /^\d{2}_/.test(d.name))
    .map((d) => {
      const match = d.name.match(/^(\d{2})_(.+)$/);
      return { num: parseInt(match[1], 10), name: match[2], dir: d.name };
    })
    .sort((a, b) => a.num - b.num);
  return entries;
}

function pad(n) {
  return String(n).padStart(2, "0");
}

function run() {
  const [action, posStr] = process.argv.slice(2);

  if (!action || !posStr || !["insert", "remove"].includes(action)) {
    console.error("Usage: node scripts/renumber.js <insert|remove> <position>");
    console.error("  insert <N>  — shift examples N+ up by one (make room)");
    console.error("  remove <N>  — shift examples N+1 down by one (close gap)");
    process.exit(1);
  }

  const position = parseInt(posStr, 10);
  if (isNaN(position) || position < 1) {
    console.error("Position must be a positive integer.");
    process.exit(1);
  }

  const examples = parseExamples();
  const delta = action === "insert" ? 1 : -1;
  const startFrom = action === "insert" ? position : position + 1;

  // Filter to examples that need renumbering
  const toRename = examples.filter((e) => e.num >= startFrom);

  if (toRename.length === 0) {
    console.log("No examples to renumber.");
    return;
  }

  // Check for collision on insert: would the highest number collide with an existing dir?
  if (action === "insert") {
    const highestNew = pad(toRename[toRename.length - 1].num + 1);
    const wouldCollide = `${highestNew}_${toRename[toRename.length - 1].name}`;
    if (existsSync(join(EXAMPLES_DIR, wouldCollide))) {
      console.error(`ERROR: Target directory already exists: ${wouldCollide}`);
      process.exit(1);
    }
  }

  // Rename in reverse order for insert (high->low), forward for remove (low->high)
  const ordered = action === "insert" ? [...toRename].reverse() : toRename;

  console.log(`\n${action === "insert" ? "Inserting gap" : "Closing gap"} at position ${position}...\n`);

  // Track old->new directory names for README_SRC updates
  const renames = [];

  for (const ex of ordered) {
    const newNum = ex.num + delta;
    const oldDir = ex.dir;
    const newDir = `${pad(newNum)}_${ex.name}`;
    const oldPath = join(EXAMPLES_DIR, oldDir);
    const newPath = join(EXAMPLES_DIR, newDir);

    // Rename directory
    console.log(`  ${oldDir}/ -> ${newDir}/`);
    renameSync(oldPath, newPath);

    // Rename .pde file inside if it matches the old directory name
    const oldPde = join(newPath, `${oldDir}.pde`);
    const newPde = join(newPath, `${newDir}.pde`);
    if (existsSync(oldPde)) {
      renameSync(oldPde, newPde);
      console.log(`    ${oldDir}.pde -> ${newDir}.pde`);
    }

    renames.push({ oldDir, newDir });
  }

  // Update README_SRC.md import references
  console.log(`\nUpdating README_SRC.md...`);

  let src = readFileSync(SRC_FILE, "utf-8");
  let updateCount = 0;

  // Sort renames so longest old names are replaced first (prevents partial matches)
  renames.sort((a, b) => b.oldDir.length - a.oldDir.length || b.oldDir.localeCompare(a.oldDir));

  for (const { oldDir, newDir } of renames) {
    // Replace directory references in import paths: examples/08_name/ -> examples/09_name/
    const pattern = new RegExp(`examples/${escapeRegex(oldDir)}/`, "g");
    const replacement = `examples/${newDir}/`;
    const before = src;
    src = src.replace(pattern, replacement);
    const count =
      before.length - src.replace(pattern, replacement).length === 0
        ? src.split(replacement).length - before.split(replacement).length + (before.match(pattern) || []).length
        : 0;
    // Count actual replacements
    const matches = before.match(pattern);
    if (matches) {
      updateCount += matches.length;
      console.log(`  ${oldDir} -> ${newDir} (${matches.length} reference${matches.length > 1 ? "s" : ""})`);
    }
  }

  writeFileSync(SRC_FILE, src, "utf-8");
  console.log(
    `\nDone! Renamed ${renames.length} director${renames.length === 1 ? "y" : "ies"}, updated ${updateCount} import reference${updateCount === 1 ? "" : "s"} in README_SRC.md.`,
  );
  console.log(`\nNext steps:`);
  console.log(`  1. Create the new example directory (if inserting)`);
  console.log(`  2. Add @import directives to README_SRC.md for the new example`);
  console.log(`  3. Run: npm run build:readme`);
}

function escapeRegex(str) {
  return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

run();
