#!/usr/bin/env node

/**
 * Build script for PShader Tutorial
 *
 * Reads README_SRC.md and replaces import directives with file contents,
 * outputting the result to README.md.
 *
 * Import directive format:
 *   <!-- @import examples/shader_demo_01/shader_demo_01.pde lang:java -->
 *   <!-- @import examples/shader_demo_01/data/shader.glsl lang:glsl -->
 *
 * Optional label (shown above the code block):
 *   <!-- @import examples/shader_demo_01/shader_demo_01.pde lang:java label:sketch.pde -->
 *
 * Optional line range:
 *   <!-- @import examples/shader_demo_04/shader_demo_04.pde lang:java lines:12-18 -->
 */

import { readFileSync, writeFileSync, existsSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const ROOT = resolve(__dirname, "..");

const SRC_FILE = resolve(ROOT, "README_SRC.md");
const OUT_FILE = resolve(ROOT, "README.md");

// Match: <!-- @import path/to/file lang:xxx [label:yyy] [lines:N-M] -->
const IMPORT_RE = /^<!-- @import\s+(\S+)\s+((?:lang|label|lines):\S+(?:\s+(?:lang|label|lines):\S+)*)\s*-->$/gm;

function parseOptions(optStr) {
  const opts = {};
  for (const part of optStr.split(/\s+/)) {
    const [key, value] = part.split(":");
    opts[key] = value;
  }
  return opts;
}

function processImport(match, filePath, optStr) {
  const opts = parseOptions(optStr);
  const lang = opts.lang || "";
  const label = opts.label || null;
  const lines = opts.lines || null;

  const absPath = resolve(ROOT, filePath);

  if (!existsSync(absPath)) {
    console.error(`ERROR: File not found: ${filePath}`);
    return `<!-- @import ERROR: file not found: ${filePath} -->`;
  }

  let content = readFileSync(absPath, "utf-8");

  // Handle line range extraction
  if (lines) {
    const [start, end] = lines.split("-").map(Number);
    const allLines = content.split("\n");
    content = allLines.slice(start - 1, end).join("\n");
  }

  // Trim trailing whitespace/newlines from the file content
  content = content.trimEnd();

  let result = "";
  if (label) {
    result += `${label}\n\n`;
  }
  result += `\`\`\`${lang}\n${content}\n\`\`\``;

  console.log(`  ✓ ${filePath}${lines ? ` (lines ${lines})` : ""}`);
  return result;
}

function build() {
  if (!existsSync(SRC_FILE)) {
    console.error(`ERROR: ${SRC_FILE} not found.`);
    process.exit(1);
  }

  console.log("Building README.md from README_SRC.md...\n");

  const src = readFileSync(SRC_FILE, "utf-8");
  let importCount = 0;

  const output = src.replace(IMPORT_RE, (...args) => {
    importCount++;
    return processImport(...args);
  });

  writeFileSync(OUT_FILE, output, "utf-8");
  console.log(`\nDone! Processed ${importCount} import(s). Output: README.md`);
}

build();
