OpenGL R(cid:13) ES
Common Pro?le Speci?cation
Version 2.0.25 (Full Speci?cation)
(November 2, 2010)

Editors (version 2.0): Aaftab Munshi, Jon Leech

Copyright c(cid:13) 2002-2010 The Khronos Group Inc. All Rights Reserved.

This speci?cation is protected by copyright laws and contains material proprietary
to the Khronos Group, Inc. It or any components may not be reproduced, repub-
lished, distributed, transmitted, displayed, broadcast or otherwise exploited in any
manner without the express prior written permission of Khronos Group. You may
use this speci?cation for implementing the functionality therein, without altering or
removing any trademark, copyright or other notice from the speci?cation, but the
receipt or possession of this speci?cation does not convey any rights to reproduce,
disclose, or distribute its contents, or to manufacture, use, or sell anything that it
may describe, in whole or in part.

Khronos Group grants express permission to any current Promoter, Contributor
or Adopter member of Khronos to copy and redistribute UNMODIFIED versions
of this speci?cation in any fashion, provided that NO CHARGE is made for the
speci?cation and the latest available update of the speci?cation for any version
of the API is used whenever possible. Such distributed speci?cation may be re-
formatted AS LONG AS the contents of the speci?cation are not changed in any
way. The speci?cation may be incorporated into a product that is sold as long as
such product includes signi?cant independent work developed by the seller. A link
to the current version of this speci?cation on the Khronos Group web-site should
be included whenever possible with speci?cation distributions.

Khronos Group makes no, and expressly disclaims any, representations or war-
ranties, express or implied, regarding this speci?cation, including, without limita-
tion, any implied warranties of merchantability or ?tness for a particular purpose
or non-infringement of any intellectual property. Khronos Group makes no, and
expressly disclaims any, warranties, express or implied, regarding the correctness,
accuracy, completeness, timeliness, and reliability of the speci?cation. Under no
circumstances will the Khronos Group, or any of its Promoters, Contributors or
Members or their respective partners, of?cers, directors, employees, agents or rep-
resentatives be liable for any damages, whether direct, indirect, special or conse-
quential damages for lost revenues, lost pro?ts, or otherwise, arising from or in
connection with these materials.

Khronos is a trademark of The Khronos Group Inc. OpenGL is a registered trade-
mark, and OpenGL ES is a trademark, of Silicon Graphics, Inc.

Contents

1 Introduction

1.1 Comments on edits to the OpenGL ES 2.0 Speci?cation . . . . . .
1.2 What is the OpenGL ES Graphics System?
. . . . . . . . . . . .
1.3 Programmer’s View of OpenGL ES . . . . . . . . . . . . . . . .
Implementor’s View of OpenGL ES . . . . . . . . . . . . . . . .
1.4
1.5 Our View .
. . . . . . . . . . . . . . . . . . . . . . .
1.6 Companion Documents . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . .

1.6.1 Window System Bindings

. . .

.

.

.

2 OpenGL ES Operation

.

.

.

.

.

.

.

.

.

2.2 GL State .
2.2.1

2.1 OpenGL ES Fundamentals . . . . . . . . . . . . . . . . . . . . .
2.1.1 Numeric Computation . . . . . . . . . . . . . . . . . . .
2.1.2 Data Conversions . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . .
Shared Object State . . . . . . . . . . . . . . . . . . . . .
2.3 GL Command Syntax . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . .
2.4 Basic GL Operation . .
2.5 GL Errors .
. . . . . . . . . . . . . . . . . . . . . . . . .
2.6 Primitives and Vertices . . . . . . . . . . . . . . . . . . . . . . .
Primitive Types . . . . . . . . . . . . . . . . . . . . . . .
2.7 Current Vertex State . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . .
2.8 Vertex Arrays .
. . . . . . . . . . . . . . . . . . . . . . .
2.9 Buffer Objects .
2.9.1 Vertex Arrays in Buffer Objects . . . . . . . . . . . . . .
2.9.2 Array Indices in Buffer Objects
. . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . .
.
. . . . . . . . . .
2.10.1 Loading and Compiling Shader Source
2.10.2 Loading Shader Binaries . . . . . . . . . . . . . . . . . .
2.10.3 Program Objects . . . . . . . . . . . . . . . . . . . . . .

2.10 Vertex Shaders

.
. . .

2.6.1

.
.

.

1
1
1
2
2
3
3
3

4
4
6
7
8
9
9
11
14
15
17
19
19
22
24
25
26
27
28
29

i

CONTENTS

2.10.4 Shader Variables . . . . . . . . . . . . . . . . . . . . . .
2.10.5 Shader Execution . . . . . . . . . . . . . . . . . . . . . .
2.10.6 Required State . . . . . . . . . . . . . . . . . . . . . . .
2.11 Primitive Assembly and Post-Shader Vertex Processing . . . . . .
. . . . . . . . . . . . . . . . . . . .
2.12 Coordinate Transformations
2.12.1 Controlling the Viewport . . . . . . . . . . . . . . . . . .
2.13 Primitive Clipping . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . .

2.13.1 Clipping Varying Outputs

3 Rasterization

3.5 Polygons

.

3.1
.
Invariance .
3.2 Multisampling .
3.3 Points .
.
3.3.1

3.4 Line Segments

.

.

.

.

.

.

.

.

.
.
.

. . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . .
Point Multisample Rasterization . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . .
3.4.1 Basic Line Segment Rasterization . . . . . . . . . . . . .
3.4.2 Other Line Segment Features . . . . . . . . . . . . . . . .
3.4.3 Line Rasterization State
. . . . . . . . . . . . . . . . . .
3.4.4 Line Multisample Rasterization . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . .
3.5.1 Basic Polygon Rasterization . . . . . . . . . . . . . . . .
3.5.2 Depth Offset
. . . . . . . . . . . . . . . . . . . . . . . .
Polygon Multisample Rasterization . . . . . . . . . . . .
3.5.3
. . . . . . . . . . . . . . . .
Polygon Rasterization State
3.5.4
. . . . . . . . . . . . . . . . . . . . . . . . . .
Pixel Storage Modes . . . . . . . . . . . . . . . . . . . .
3.6.1
3.6.2 Transfer of Pixel Rectangles . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . .
3.7.1 Texture Image Speci?cation . . . . . . . . . . . . . . . .
. . . .
3.7.2 Alternate Texture Image Speci?cation Commands
3.7.3 Compressed Texture Images . . . . . . . . . . . . . . . .
3.7.4 Texture Parameters . . . . . . . . . . . . . . . . . . . . .
3.7.5 Cube Map Texture Selection . . . . . . . . . . . . . . . .
3.7.6 Texture Wrap Modes . . . . . . . . . . . . . . . . . . . .
3.7.7 Texture Mini?cation . . . . . . . . . . . . . . . . . . . .
3.7.8 Texture Magni?cation . . . . . . . . . . . . . . . . . . .
3.7.9 Texture Framebuffer Attachment . . . . . . . . . . . . . .
3.7.10 Texture Completeness and Non-Power-Of-Two Textures .
3.7.11 Mipmap Generation . . . . . . . . . . . . . . . . . . . .
3.7.12 Texture State . . . . . . . . . . . . . . . . . . . . . . . .

.

.

.

3.6 Pixel Rectangles .

3.7 Texturing .

ii

32
40
42
43
44
44
45
46

48
49
49
51
51
52
52
54
55
55
56
57
58
59
60
60
60
61
65
66
69
73
75
76
77
78
82
82
83
83
84

Version 2.0.25 (November 2, 2010)

CONTENTS

3.7.13 Texture Objects . . . . . . . . . . . . . . . . . . . . . . .
3.8 Fragment Shaders . . . . . . . . . . . . . . . . . . . . . . . . . .
Shader Variables . . . . . . . . . . . . . . . . . . . . . .
Shader Execution . . . . . . . . . . . . . . . . . . . . . .

3.8.1
3.8.2

iii

84
86
86
87

4 Per-Fragment Operations and the Framebuffer

90
91
4.1 Per-Fragment Operations . . . . . . . . . . . . . . . . . . . . . .
91
Pixel Ownership Test . . . . . . . . . . . . . . . . . . . .
4.1.1
93
4.1.2
Scissor Test . . . . . . . . . . . . . . . . . . . . . . . . .
93
4.1.3 Multisample Fragment Operations . . . . . . . . . . . . .
94
4.1.4
. . . . . . . . . . . . . . . . . . . . . . . . .
Stencil Test
96
. . . . . . . . . . . . . . . . . . . .
4.1.5 Depth Buffer Test . .
4.1.6 Blending . . . . . . . . . . . . . . . . . . . . . . . . . .
96
4.1.7 Dithering . . . . . . . . . . . . . . . . . . . . . . . . . . 100
4.1.8 Additional Multisample Fragment Operations . . . . . . . 100
4.2 Whole Framebuffer Operations . . . . . . . . . . . . . . . . . . . 101
Selecting a Buffer for Writing . . . . . . . . . . . . . . . 101
. . . . . . . . . . . . . . 102
Fine Control of Buffer Updates
. . . . . . . . . . . . . . . . . . . . 103
. . . . . . . . . . . . . . . . . . . . . . . . . . 104
4.3.1 Reading Pixels . . . . . . . . . . . . . . . . . . . . . . . 104
Pixel Draw/Read State . . . . . . . . . . . . . . . . . . . 107
4.3.2
. . . . . . . . . . . . . . . . . . . . . . . . 107
4.4.1 Binding and Managing Framebuffer Objects . . . . . . . . 107
4.4.2 Attaching Images to Framebuffer Objects . . . . . . . . . 110
4.4.3 Renderbuffer Objects . . . . . . . . . . . . . . . . . . . . 110
Feedback Loops Between Textures and the Framebuffer
4.4.4
. 114
4.4.5
Framebuffer Completeness . . . . . . . . . . . . . . . . . 116
4.4.6 Effects of Framebuffer State on Framebuffer Dependent

4.2.1
4.2.2
4.2.3 Clearing the Buffers

4.4 Framebuffer Objects

4.3 Reading Pixels

.

.

Values .

. . . . . . . . . . . . . . . . . . . . . . . . . . 119
4.4.7 Mapping between Pixel and Element in Attached Image . 120
. . . . . . . . . . . . . . . . . . . . . . . . . . 120
4.4.8 Errors .

.

5 Special Functions

5.1 Flush and Finish .
.
5.2 Hints .

.

.

.

.

.

122
. . . . . . . . . . . . . . . . . . . . . . . . . . 122
. . . . . . . . . . . . . . . . . . . . . . . . . . 122

6 State and State Requests

124
6.1 Querying GL State . . . . . . . . . . . . . . . . . . . . . . . . . 124
Simple Queries . . . . . . . . . . . . . . . . . . . . . . . 124

6.1.1

Version 2.0.25 (November 2, 2010)

CONTENTS

iv

6.1.2 Data Conversions . . . . . . . . . . . . . . . . . . . . . . 124
6.1.3 Enumerated Queries
. . . . . . . . . . . . . . . . . . . . 125
6.1.4 Texture Queries . . . . . . . . . . . . . . . . . . . . . . . 127
. . . . . . . . . . . . . . . . . . . . . . . 128
String Queries
6.1.5
6.1.6 Buffer Object Queries
. . . . . . . . . . . . . . . . . . . 128
Framebuffer Object and Renderbuffer Queries . . . . . . . 129
6.1.7
Shader and Program Queries . . . . . . . . . . . . . . . . 129
6.1.8
. . . . . . . . . . . . . . . . . . . . . . . . . . 134

.

.

6.2 State Tables .

A Invariance

159
. . . . . . . . . . . . . . . . . . . . . . . . . . 159
A.1 Repeatability .
. . . . . . . . . . . . . . . . . . . . . . . 160
A.2 Multi-pass Algorithms
A.3 Invariance Rules .
. . . . . . . . . . . . . . . . . . . . . . . . . . 160
A.4 What All This Means . . . . . . . . . . . . . . . . . . . . . . . . 161

.

B Corollaries

162

C Shared Objects and Multiple Contexts

164
C.1 Object Deletion Behavior . . . . . . . . . . . . . . . . . . . . . . 165
C.1.1 Side Effects of Shared Context Destruction . . . . . . . . 165
C.1.2 Automatic Unbinding of Deleted Objects . . . . . . . . . 165
C.1.3 Deleted Object and Object Name Lifetimes . . . . . . . . 165
. . . . . . . . . . . . . . . . . . 166
C.2.1 Determining Completion of Changes to an object . . . . . 166
. . . . . . . . . . . . . . . . . . . . . . . . . 167
C.2.2 De?nitions
. . . . . . . . . . . . . . . . . . . . . . . . . . 167
.
C.2.3 Rules .

C.2 Propagating Changes to Objects

D Version 2.0

169

E Extension Registry, Header Files, and Extension Naming Conventions 170
E.1 Extension Registry . . . . . . . . . . . . . . . . . . . . . . . . . 170
. . . . . . . . . . . . . . . . . . . . . . . . . . 170
E.2 Header Files .
.
. . . . . . . . . . . . . . . . . . . . . . . . . . 171
E.3 OES Extensions .
E.3.1 Naming Conventions . . . . . . . . . . . . . . . . . . . . 171
. . . . . . . . . . . . . . . . . . . . 171
. . . . . . . . . . 172

E.4.1 Promoting Extensions to Core Features

E.4 Vendor and EXT Extensions

.

173
F Packaging and Acknowledgements
F.1 Header Files and Libraries
. . . . . . . . . . . . . . . . . . . . . 173
F.2 Acknowledgements . . . . . . . . . . . . . . . . . . . . . . . . . 173
F.3 Document History . . . . . . . . . . . . . . . . . . . . . . . . . . 176

Version 2.0.25 (November 2, 2010)

CONTENTS

v

F.3.1 Version 2.0.25, updated 2010/11/02 . . . . . . . . . . . . 176
F.3.2 Version 2.0.25, draft of 2010/10/12 . . . . . . . . . . . . 176
F.3.3 Version 2.0.25, draft of 2010/09/20 . . . . . . . . . . . . 177
F.3.4 Version 2.0.24, updated 2009/04/22 . . . . . . . . . . . . 177
F.3.5 Version 2.0.24, draft of 2009/04/01 . . . . . . . . . . . . 178
F.3.6 Version 2.0.23, updated 2008/08/27 . . . . . . . . . . . . 178
F.3.7 Version 2.0.22, updated 2008/08/06 . . . . . . . . . . . . 179
F.3.8 Version 2.0.22, updated 2008/07/17 . . . . . . . . . . . . 179
F.3.9 Version 2.0.22, draft of 2008/04/30 . . . . . . . . . . . . 180
F.3.10 Version 2.0.22, draft of 2008/04/24 . . . . . . . . . . . . 180
F.3.11 Version 2.0.22, draft of 2008/04/08 . . . . . . . . . . . . 180
F.3.12 Version 2.0.22, draft of 2008/03/12 . . . . . . . . . . . . 181
F.3.13 Version 2.0.22, draft of 2008/01/20 . . . . . . . . . . . . 183
F.3.14 Version 2.0.21, draft of 2008/01/11 . . . . . . . . . . . . 184
F.3.15 Version 2.0.21, draft of 2008/01/10 . . . . . . . . . . . . 185
F.3.16 Version 2.0.21, draft of 2008/01/03 . . . . . . . . . . . . 187

Version 2.0.25 (November 2, 2010)

List of Figures

2.1 Block diagram of the GL. . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . .
2.2 Vertex processing and primitive assembly.
2.3 Triangle strips, fans, and independent triangles.
. . . . . . . . . .
. . . . . . . . . . . . . . . . . .
2.4 Vertex transformation sequence.

.

. . .

. . . . . . . . . . . . . . . . . . . . . . .
3.1 Rasterization.
.
. . . . . . . . . . . . . .
3.2 Visualization of Bresenham’s algorithm.
3.3 Rasterization of non-antialiased wide lines.
. . . . . . . . . . . .
3.4 The region used in rasterizing a multisampled line segment. . . . .
. . . . . . . . . . . . . . .
3.5 Transfer of pixel rectangles to the GL.
. . . . . . .
3.6 A texture image and the coordinates used to access it.

11
15
18
44

48
53
54
56
61
69

4.1 Per-fragment operations.
4.2 Operation of ReadPixels. . . . . . . . . . . . . . . .

. . . . . . . . . . . . . . . . . . . . . .

91
. . . . . . . 104

vi

List of Tables

.

. . . . . . . . . . . . . . . . . . . . . . .
2.1 GL command suf?xes .
. . . . . . . . . . . . . . . . . . . . . . .
2.2 GL data types .
. . .
2.3 Summary of GL errors
. . . . . . . . . . . . . . . . . . . . . . .
2.4 Vertex array sizes (values per vertex) and data types . . . . . . . .
. . . . . . . . . . . . .
2.5 Buffer object parameters and their values.
. . . . . . . . . . . . . . . . . . . . . .
2.6 Buffer object initial state.

3.1 PixelStore parameters.
. . . . . . . . . . . . . . . . . . . . . . .
3.2 TexImage2D and ReadPixels types.
. . . . . . . . . . . . . . . .
3.3 TexImage2D and ReadPixels formats. . . . . . . . . . . . . . . .
3.4 Valid pixel format and type combinations.
. . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
3.5 Packed pixel formats.
3.6 UNSIGNED_SHORT formats . . . . . . . . . . . . . . . . . . . . .
3.7 Packed pixel ?eld assignments. . . . . . . . . . . . . . . . . . . .
3.8 Conversion from RGBA pixel components to internal texture com-
. . . . . . . . . . . . . . . . . . . .
. . . .
. . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . .
. . . . . . . . . .

3.9 CopyTexImage internal format/color buffer combinations.
3.10 Texture parameters and their values.
3.11 Selection of cube map images.
3.12 Correspondence of ?ltered texture components.

. . . . . .

ponents.

.

.

.

.

.

10
12
15
20
22
24

61
62
62
63
64
64
65

68
71
76
77
87

4.1 RGB and Alpha blend equations. . . . . . . . . . . . . . . . . . .
4.2 Blending functions.
. . . . . . . . . . . . . . . . . . . . . . . . .
4.3 PixelStore parameters.
4.4 ReadPixels GL data types and reversed component conversion for-

98
99
. . . . . . . . . . . . . . . . . . . . . . . 105

mulas.

. . . . . . . . . . . . . . . . . . . . . . . . . 106
4.5 Renderbuffer image internal formats. . . . . . . . . . . . . . . . . 117

.

.

.

.

.

.

.

6.1 State Variable Types . . . . . . . . . . . . . . . . . . . . . . . . . 135
. . . . . . . . . . . . . . . . . . . . . . . . . 136
6.2 Vertex Array Data .

vii

LIST OF TABLES

viii

.
.

6.3 Buffer Object State . . . . . . . . . . . . . . . . . . . . . . . . . 137
. . . . . . . . . . . . . . . . . . . . . . . . 138
6.4 Transformation state
. . . . . . . . . . . . . . . . . . . . . . . . . . 139
6.5 Rasterization .
. . . . . . . . . . . . . . . . . . . . . . . . . . 140
6.6 Multisampling .
6.7 Textures (state per texture unit and binding point) . . . . . . . . . 141
6.8 Textures (state per texture object) . . . . . . . . . . . . . . . . . . 142
6.9 Texture Environment and Generation . . . . . . . . . . . . . . . . 143
. . . . . . . . . . . . . . . . . . . . . . . . . . 144
6.10 Pixel Operations .
6.11 Pixel Operations (cont.) . . . . . . . . . . . . . . . . . . . . . . . 145
. . . . . . . . . . . . . . . . . . . . . . . . 146
6.12 Framebuffer Control
. . . . . . . . . . . . . . . . . . . . . . . . . . 147
6.13 Pixels .
6.14 Shader Object State . . . . . . . . . . . . . . . . . . . . . . . . . 148
6.15 Program Object State . . . . . . . . . . . . . . . . . . . . . . . . 149
6.16 Vertex Shader State . . . . . . . . . . . . . . . . . . . . . . . . . 150
. . . . . . . . . . . . . . . . . . . . . . . . . . 151
6.17 Hints .
6.18 Implementation Dependent Values . . . . . . . . . . . . . . . . . 152
. . . . . . . . . . . . . 153
6.19 Implementation Dependent Values (cont.)
6.20 Implementation Dependent Values (cont.)
. . . . . . . . . . . . . 154
6.21 Implementation Dependent Pixel Depths . . . . . . . . . . . . . . 155
. . . . . . . . . . . . . . . . . . . . . . . . . . 156
6.22 Miscellaneous .
.
6.23 Renderbuffer State
. . . . . . . . . . . . . . . . . . . . . . . . . 157
6.24 Framebuffer State . . . . . . . . . . . . . . . . . . . . . . . . . . 158

.

.

.

.

.

.

.

.

.

.

.

Version 2.0.25 (November 2, 2010)

Chapter 1

Introduction

This document describes the OpenGL ES graphics system: what it is, how it acts,
and what is required to implement it. We assume that the reader has at least a
rudimentary understanding of computer graphics. This means familiarity with the
essentials of computer graphics algorithms as well as familiarity with basic graph-
ics hardware and associated terms.

1.1 Comments on edits to the OpenGL ES 2.0 Speci?ca-

tion

Changes in the most recent draft are typeset in magenta, as seen in this paragraph.

Editorial comments and questions are typeset in blue.

1.2 What is the OpenGL ES Graphics System?

OpenGL ES is a software interface to graphics hardware. The interface consists of
a set of procedures and functions that allow a programmer to specify the objects
and operations involved in producing high-quality graphical images, speci?cally
color images of three-dimensional objects.

Most of OpenGL ES requires that the graphics hardware contain a framebuffer.
Many OpenGL ES calls pertain to drawing objects such as points, lines and poly-
gons, but the way that some of this drawing occurs (such as when antialiasing or
texturing is enabled) relies on the existence of a framebuffer. Further, some of
OpenGL ES is speci?cally concerned with framebuffer manipulation.

OpenGL ES 2.0 is based on the OpenGL 2.0 graphics system, but is designed
primarily for graphics hardware running on embedded and mobile devices. It re-

1

1.3. PROGRAMMER’S VIEW OF OPENGL ES

2

moves a great deal of redundant and legacy functionality, while adding a few new
features. The differences between OpenGL ES and OpenGL are not described in
detail in this speci?cation; however, they are summarized in a companion docu-
ment titled OpenGL ES Common Pro?le Speci?cation 2.0 (Difference Speci?ca-
tion).

1.3 Programmer’s View of OpenGL ES

To the programmer, OpenGL ES is a set of commands that allow the speci?cation
of geometric objects in two or three dimensions, together with commands that
control how these objects are rendered into the framebuffer. OpenGL ES provides
an immediate-mode interface, meaning that specifying an object causes it to be
drawn.

A typical program that uses OpenGL ES begins with calls to open a window
into the framebuffer into which the program will draw. Then, calls are made to
allocate an OpenGL ES context and associate it with the window. These steps may
be performed using a companion API such as the Khronos Native Platform Graph-
ics Interface (EGL), and are documented separately. Once a context is allocated,
the programmer is free to issue OpenGL ES commands. Some calls are used to
draw simple geometric objects (i.e. points, line segments, and polygons), while
others affect the rendering of these primitives including how they are lit or colored
and how they are mapped from the user’s two- or three-dimensional model space
to the two-dimensional screen. There are also calls which operate directly on the
framebuffer, such as reading pixels.

1.4 Implementor’s View of OpenGL ES

To the implementor, OpenGL ES is a set of commands that affect the operation of
graphics hardware. If the hardware consists only of an addressable framebuffer,
then OpenGL ES must be implemented almost entirely on the host CPU. More
typically, the graphics hardware may comprise varying degrees of graphics accel-
eration, from a raster subsystem capable of rendering two-dimensional lines and
polygons to sophisticated ?oating-point processors capable of transforming and
computing on geometric data. The OpenGL ES implementor’s task is to provide
the CPU software interface while dividing the work for each OpenGL ES com-
mand between the CPU and the graphics hardware. This division must be tailored
to the available graphics hardware to obtain optimum performance in carrying out
OpenGL ES calls.

Version 2.0.25 (November 2, 2010)

1.5. OUR VIEW

3

OpenGL ES maintains a considerable amount of state information. This state
controls how objects are drawn into the framebuffer. Some of this state is directly
available to the user, who can make calls to obtain its value. Some of it, however,
is visible only by the effect it has on what is drawn. One of the main goals of this
speci?cation is to make OpenGL ES state information explicit, to elucidate how it
changes, and to indicate what its effects are.

1.5 Our View

We view OpenGL ES as a state machine that controls a set of speci?c drawing
operations. This model should engender a speci?cation that satis?es the needs of
both programmers and implementors. It does not, however, necessarily provide a
model for implementation. An implementation must produce results conforming
to those produced by the speci?ed methods, but there may be ways to carry out a
particular computation that are more ef?cient than the one speci?ed.

1.6 Companion Documents

This speci?cation should be read together with a companion document titled The
OpenGL ES Shading Language. The latter document (referred to as the OpenGL
ES Shading Language Speci?cation hereafter) de?nes the syntax and semantics
of the programming language used to write vertex and fragment shaders (see sec-
tions 2.10 and 3.8). These sections may include references to concepts and terms
(such as shading language variable types) de?ned in the companion document.

OpenGL ES 2.0 implementations are guaranteed to support at least version 1.0
of the shading language; the actual version supported may be queried as described
in section 6.1.5.

1.6.1 Window System Bindings

OpenGL ES requires a companion API to create and manage graphics contexts,
windows to render into, and other resources beyond the scope of this Speci?cation.
The Khronos Native Platform Graphics Interface or “EGL Speci?cation” de-
scribes the EGL API for use of OpenGL ES on mobile and embedded devices. The
EGL Speci?cation is available in the Khronos Extension Registry at URL

http://www.khronos.org/registry/egl

Khronos strongly encourages OpenGL ES implementations to also support
EGL, but some implementations may provide alternate, platform- or vendor-
speci?c APIs with similar functionality.

Version 2.0.25 (November 2, 2010)

Chapter 2

OpenGL ES Operation

2.1 OpenGL ES Fundamentals

OpenGL ES (henceforth, the “GL”) is concerned only with rendering into a frame-
buffer (and reading values stored in that framebuffer). There is no support for
other peripherals sometimes associated with graphics hardware, such as mice and
keyboards. Programmers must rely on other mechanisms, such as the Khronos
OpenKODE API, to obtain user input.

The GL draws primitives subject to a number of selectable modes. Each primi-
tive is a point, line segment, or triangle. Each mode may be changed independently;
the setting of one does not affect the settings of others (although many modes may
interact to determine what eventually ends up in the framebuffer). Modes are set,
primitives speci?ed, and other GL operations described by sending commands in
the form of function or procedure calls.

Primitives are de?ned by a group of one or more vertices. A vertex de?nes
a point, an endpoint of an edge, or a corner of a triangle where two edges meet.
Data such as positional coordinates, colors, normals, texture coordinates, etc. are
associated with a vertex and each vertex is processed independently, in order, and
in the same way. The only exception to this rule is if the group of vertices must
be clipped so that the indicated primitive ?ts within a speci?ed region; in this
case vertex data may be modi?ed and new vertices created. The type of clipping
depends on which primitive the group of vertices represents.

Commands are always processed in the order in which they are received, al-
though there may be an indeterminate delay before the effects of a command are
realized. This means, for example, that one primitive must be drawn completely
before any subsequent one can affect the framebuffer. It also means that queries
and pixel read operations return state consistent with complete execution of all pre-

4

2.1. OPENGL ES FUNDAMENTALS

5

viously invoked GL commands. In general, the effects of a GL command on either
GL modes or the framebuffer must be complete before any subsequent command
can have any such effects.

In the GL, data binding occurs on call. This means that data passed to a com-
mand are interpreted when that command is received. Even if the command re-
quires a pointer to data, those data are interpreted when the call is made, and any
subsequent changes to the data have no effect on the GL (unless the same pointer
is used in a subsequent command).

The GL provides direct control over the fundamental operations of 3D and 2D
graphics. This includes speci?cation of parameters of application-de?ned shader
programs performing transformation, lighting, texturing, and shading operations,
as well as built-in functionality such as antialiasing and texture ?ltering. It does not
provide a means for describing or modeling complex geometric objects. Another
way to describe this situation is to say that the GL provides mechanisms to de-
scribe how complex geometric objects are to be rendered rather than mechanisms
to describe the complex objects themselves.

The model for interpretation of GL commands is client-server. That is, a pro-
gram (the client) issues commands, and these commands are interpreted and pro-
cessed by the GL (the server). A server may maintain a number of GL contexts,
each of which is an encapsulation of current GL state. A client may choose to con-
nect to any one of these contexts. Issuing GL commands when the program is not
connected to a context results in unde?ned behavior.

The GL interacts with two classes of framebuffers: window-system-provided
framebuffers and application-created framebuffers. There is always one window-
system-provided framebuffer, while application-created framebuffers can be cre-
ated as desired. These two types of framebuffer are distinguished primarily by the
interface for con?guring and managing their state.

The effects of GL commands on the window-system-provided framebuffer are
ultimately controlled by the window-system that allocates framebuffer resources.
It is the window-system that determines which portions of this framebuffer the GL
may access at any given time and that communicates to the GL how those portions
are structured. Therefore, there are no GL commands to con?gure the window-
system-provided framebuffer or initialize the GL. Similarly, display of framebuffer
contents on a monitor or LCD panel (including the transformation of individual
framebuffer values by such techniques as gamma correction) is not addressed by
the GL. Framebuffer con?guration occurs outside of the GL in conjunction with the
window-system; the initialization of a GL context occurs when the window system
allocates a window for GL rendering. The EGL API de?nes a portable mechanism
for creating GL contexts and windows for rendering into, which may be used in
conjunction with different native platform window systems.

Version 2.0.25 (November 2, 2010)

2.1. OPENGL ES FUNDAMENTALS

6

The initialization of a GL context itself occurs when the window-system al-
locates a window for GL rendering and is in?uenced by the state of the window-
system-provided framebuffer.

The GL is designed to be run on a range of graphics platforms with varying
graphics capabilities and performance. To accommodate this variety, we specify
ideal behavior instead of actual behavior for certain GL operations. In cases where
deviation from the ideal is allowed, we also specify the rules that an implemen-
tation must obey if it is to approximate the ideal behavior usefully. This allowed
variation in GL behavior implies that two distinct GL implementations may not
agree pixel for pixel when presented with the same input even when run on identi-
cal framebuffer con?gurations.

Finally, command names, constants, and types are pre?xed in the GL (by gl,
GL_, and GL, respectively in C) to reduce name clashes with other packages. The
pre?xes are omitted in this document for clarity.

2.1.1 Numeric Computation

The GL must perform a number of numeric computations during the course of its
operation.

Implementations will normally perform computations in ?oating-point, and
must meet the range and precision requirements de?ned under ”Floating-Point
Computation” below.

These requirements only apply to computations performed in GL operations
outside of vertex and fragment execution (see sections 2.10 and 3.8), such as tex-
ture image speci?cation and per-fragment operations. Range and precision require-
ments during shader execution differ and are as speci?ed by the OpenGL ES Shad-
ing Language Speci?cation.

Floating-Point Computation

We do not specify how ?oating-point numbers are to be represented or how
operations on them are to be performed. We require simply that numbers’ ?oating-
point parts contain enough bits and that their exponent ?elds are large enough so
that individual results of ?oating-point operations are accurate to about 1 part in
105. The maximum representable magnitude for ?oating-point values must be at
least 232. x · 0 = 0 · x = 0. 1 · x = x · 1 = x. x + 0 = 0 + x = x. 00 =
1.
(Occasionally further requirements will be speci?ed.) Most single-precision
?oating-point formats meet these requirements.

Any representable ?oating-point value is legal as input to a GL command that
requires ?oating-point data. The result of providing a value that is not a ?oating-

Version 2.0.25 (November 2, 2010)

2.1. OPENGL ES FUNDAMENTALS

7

point number to such a command is unspeci?ed, but must not lead to GL interrup-
tion or termination. In IEEE arithmetic, for example, providing a negative zero or
a denormalized number to a GL command yields predictable results, while provid-
ing a NaN or an in?nity yields unspeci?ed results. The identities speci?ed above
do not hold if the value of x is not a ?oating-point number.

Fixed-Point Computation

Vertex attributes may be speci?ed using a 32-bit two’s-complement signed rep-

resentation with 16 bits to the right of the binary point (fraction bits).

General Requirements

Some calculations require division. In such cases (including implied divisions
required by vector normalizations), a division by zero produces an unspeci?ed re-
sult but must not lead to GL interruption or termination.

2.1.2 Data Conversions

When generic vertex attributes and pixel color or depth components are repre-
sented as integers, they are often (but not always) considered to be normalized.
Normalized integer values are treated specially when being converted to and from
?oating-point values.

In the remainder of this section, when an integer type de?ned in table 2.2 is
being discussed, b denotes the minimum required bit width of the integer type as
de?ned in the table. The formulas for conversion to and from unsigned integers
also apply to pixel components packed into unsigned integers (see section 3.6.2),
but b in these cases is de?ned by the speci?c packed pixel format and component
being converted.

All the conversions described below are performed as de?ned, even if the im-
plemented range of an integer data type is greater than the minimum required range.

Conversion from Integer to Floating-Point

Normalized unsigned integers represent numbers in the range [0, 1]. The conver-
sion from a normalized unsigned integer c to the corresponding ?oating-point f is
de?ned as

c
2b ? 1
Normalized signed integers represent numbers in the range [?1, 1]. The con-
version from a normalized signed integer c to the corresponding ?oating-point f is

f =

.

Version 2.0.25 (November 2, 2010)

2.2. GL STATE

de?ned as

f =

2c + 1
2b ? 1

.

8

Conversion from Floating-Point to Integer

The conversion from a ?oating-point value f to the corresponding normalized un-
signed integer c is de?ned by ?rst clamping f to the range [0, 1], then computing

f (cid:48) = f × (2b ? 1).

f (cid:48) is then cast to an unsigned integer value with exactly b bits of precision.

The conversion from a ?oating-point value f to the corresponding normalized
signed integer c is de?ned by ?rst clamping f to the range [?1, 1], then computing

f (cid:48) =

f × (2b ? 1) ? 1
2

.

f (cid:48) is then cast to a signed integer value with exactly b bits of precision.

Conversion from Floating-Point to Framebuffer Fixed-Point

When ?oating-point values are to be written to the ?xed-point color or depth
buffers, they must initially lie in [0, 1]. Values are converted (by rounding to
nearest) to a ?xed-point value with m bits, where m is the number of bits allo-
cated to the corresponding R, G, B, A, or depth buffer component. We assume
that the ?xed-point representation used represents each value k/(2m ? 1), where
k ? {0, 1, . . . , 2m ? 1}, as k (e.g. 1.0 is represented in binary as a string of all
ones). m must be at least as large as the number of bits in the corresponding com-
ponent of the framebuffer. m must be at least 2 for A if the framebuffer does not
contain an A component, or if there is only 1 bit of A in the framebuffer.

2.2 GL State

The GL maintains considerable state. This document enumerates each state vari-
able and describes how each variable can be changed. For purposes of discussion,
state variables are categorized somewhat arbitrarily by their function. Although we
describe the operations that the GL performs on the framebuffer, the framebuffer
is not a part of GL state.

We distinguish two types of state. The ?rst type of state, called GL server
state, resides in the GL server. The majority of GL state falls into this category.
The second type of state, called GL client state, resides in the GL client. Unless

Version 2.0.25 (November 2, 2010)

2.3. GL COMMAND SYNTAX

9

otherwise speci?ed, all state referred to in this document is GL server state; GL
client state is speci?cally identi?ed. Each instance of a GL context implies one
complete set of GL server state; each connection from a client to a server implies
a set of both GL client state and GL server state.

While an implementation of the GL may be hardware dependent, this discus-
sion is independent of the speci?c hardware on which a GL is implemented. We are
therefore concerned with the state of graphics hardware only when it corresponds
precisely to GL state.

2.2.1 Shared Object State

It is possible for groups of contexts to share certain state. Enabling such sharing
between contexts is done through window system binding APIs such as those de-
scribed in section 1.6.1. These APIs are responsible for creation and management
of contexts, and not discussed further here. More detailed discussion of the behav-
ior of shared objects is included in appendix C. Except as de?ned in this appendix,
all state in a context is speci?c to that context only.

2.3 GL Command Syntax

GL commands are functions or procedures. Various groups of commands perform
the same operation but differ in how arguments are supplied to them. To conve-
niently accommodate this variation, we adopt a notation for describing commands
and their arguments.

GL commands are formed from a name followed, depending on the particular
command, by up to 4 characters. The ?rst character indicates the number of values
of the indicated type that must be presented to the command. The second character
or character pair indicates the speci?c type of the arguments: 32-bit integer, 32-bit
?xed-point, or single-precision ?oating-point. The ?nal character, if present, is v,
indicating that the command takes a pointer to an array (a vector) of values rather
than a series of individual arguments. Two speci?c examples:

void Uniform4f( int location, float v0, float v1,

float v2, float v3 );

and

void GetFloatv( enum value, float *data );

Version 2.0.25 (November 2, 2010)

2.3. GL COMMAND SYNTAX

10

Letter Corresponding GL Type

i
f

int
float

Table 2.1: Correspondence of command suf?x letters to GL argument types. Refer
to Table 2.2 for de?nitions of the GL types.

These examples show the ANSI C declarations for these commands. In general,

a command declaration has the form1

rtype Name{(cid:15)1234}{(cid:15) i f}{(cid:15)v}

( [args ,] T arg1 , . . . , T argN [, args] );

rtype is the return type of the function. The braces ({}) enclose a series of char-
acters (or character pairs) of which one is selected. (cid:15) indicates no character. The
arguments enclosed in brackets ([args ,] and [, args]) may or may not be present.
The N arguments arg1 through argN have type T, which corresponds to one of the
type letters or letter pairs as indicated in Table 2.1 (if there are no letters, then the
arguments’ type is given explicitly). If the ?nal character is not v, then N is given
by the digit 1, 2, 3, or 4 (if there is no digit, then the number of arguments is ?xed).
If the ?nal character is v, then only arg1 is present and it is an array of N values of
the indicated type.
For example,

void Uniform{1234}{if}( int location, T value );

indicates the eight declarations

void Uniform1i( int location, int value );
void Uniform1f( int location, float value );
void Uniform2i( int location, int v0, int v1 );
void Uniform2f( int location, float v0, float v1 );
void Uniform3i( int location, int v0, int v1, int v2 );
void Uniform3f( int location, float v1, float v2,

float v2 );

void Uniform4i( int location, int v0, int v1, int v2,

int v3 );

1The declarations shown in this document apply to ANSI C. Languages such as C++ and Ada
that allow passing of argument type information admit simpler declarations and fewer entry points.

Version 2.0.25 (November 2, 2010)

2.4. BASIC GL OPERATION

11

void Uniform4f( int location, float v0, float v1,

float v2, float v3 );

Arguments whose type is ?xed (i.e. not indicated by a suf?x on the command)

are of one of the 13 types (or pointers to one of these) summarized in Table 2.2.

The mapping of GL data types to data types of a speci?c language binding are
part of the language binding de?nition and may be platform-dependent. Type con-
version and type promotion behavior when mixing actual and formal arguments of
different data types are speci?c to the language binding and platform. For exam-
ple, the C language includes automatic conversion between integer and ?oating-
point data types, but does not include automatic conversion between the int and
fixed, or float and fixed GL types since the fixed data type is not a dis-
tinct built-in type. Regardless of language binding, the enum type converts to
?xed-point without scaling, and integer types are converted to ?xed-point by mul-
tiplying by 216.

2.4 Basic GL Operation

Figure 2.1 shows a schematic diagram of the GL. Commands enter the GL on the
left. Some commands specify geometric objects to be drawn while others control
how the objects are handled by the various stages.

The ?rst stage operates on geometric primitives described by vertices: points,
line segments, and triangles.
In this stage vertices are transformed and lit, and
primitives are clipped to a viewing volume in preparation for the next stage, ras-
terization. The rasterizer produces a series of framebuffer addresses and values
using a two-dimensional description of a point, line segment, or triangle. Each
fragment so produced is fed to the next stage that performs operations on individ-
ual fragments before they ?nally alter the framebuffer. These operations include
conditional updates into the framebuffer based on incoming and previously stored
depth values (to effect depth buffering), blending of incoming fragment colors with
stored colors, and other operations on fragment values, such as masking (see chap-
ter 4).

Values may also be read back from the framebuffer. These transfers may in-

clude some type of decoding or encoding.

This ordering is meant only as a tool for describing the GL, not as a strict rule
of how the GL is implemented, and we present it only as a means to organize the
various operations of the GL.

Version 2.0.25 (November 2, 2010)

2.4. BASIC GL OPERATION

12

GL Type

boolean
byte
ubyte
char
short
ushort
int
uint
fixed

sizei
enum
intptr
sizeiptr
bitfield
float
clampf

Minimum Description
Bit Width
1
8
8
8
16
16
32
32
32

Boolean
Signed binary integer
Unsigned binary integer
characters making up strings
Signed 2’s complement binary integer
Unsigned binary integer
Signed 2’s complement binary integer
Unsigned binary integer
Signed 2’s complement 16.16 scaled
integer
Non-negative binary integer size
Enumerated binary integer value
Signed 2’s complement binary integer
Non-negative binary integer size
Bit ?eld
Floating-point value
Floating-point value clamped to [0, 1]

32
32
ptrbits
ptrbits
32
32
32

Table 2.2: GL data types. GL types are not C types. Thus, for example, GL
type int is referred to as GLint outside this document, and is not necessarily
equivalent to the C type int. An implementation may use more bits than the
number indicated in the table to represent a GL type. Correct interpretation of
integer values outside the minimum range is not required, however.
ptrbits is the number of bits required to represent a pointer type; in other words,
types intptr and sizeiptr must be suf?ciently large as to store any address.

Version 2.0.25 (November 2, 2010)

2.4. BASIC GL OPERATION

13

Figure 2.1. Block diagram of the GL.

Version 2.0.25 (November 2, 2010)

Per-VertexOperationsPrimitiveAssemblyRasterizationPer-FragmentOperationsFramebufferPixelOperationsTextureMemory2.5. GL ERRORS

2.5 GL Errors

14

The GL detects only a subset of those conditions that could be considered errors.
This is because in many cases error checking would adversely impact the perfor-
mance of an error-free program.

The command

enum GetError( void );

is used to obtain error information. Each detectable error is assigned a numeric
code. When an error is detected, a ?ag is set and the code is recorded. Further
errors, if they occur, do not affect this recorded code. When GetError is called,
the code is returned and the ?ag is cleared, so that a further error will again record
its code. If a call to GetError returns NO_ERROR, then there has been no detectable
error since the last call to GetError (or since the GL was initialized).

To allow for distributed implementations, there may be several ?ag-code pairs.
In this case, after a call to GetError returns a value other than NO_ERROR each
subsequent call returns the non-zero code of a distinct ?ag-code pair (in unspeci?ed
order), until all non-NO_ERROR codes have been returned. When there are no more
non-NO_ERROR error codes, all ?ags are reset. This scheme requires some positive
number of pairs of a ?ag bit and an integer. The initial state of all ?ags is cleared
and the initial value of all codes is NO_ERROR.

Table 2.3 summarizes GL errors. Currently, when an error ?ag is set, results of
GL operation are unde?ned only if OUT_OF_MEMORY has occurred. In other cases,
the command generating the error is ignored so that it has no effect on GL state or
framebuffer contents. If the generating command returns a value, it returns zero. If
the generating command modi?es values through a pointer argument, no change is
made to these values. These error semantics apply only to GL errors, not to system
errors such as memory access errors. Extensions may change behavior that would
otherwise generate errors in an unextended GL implementation.

Several error generation conditions are implicit in the description of every GL

command:

• If a command that requires an enumerated value is passed a symbolic con-
stant that is not one of those speci?ed as allowable for that command, the er-
ror INVALID_ENUM error is generated. This is the case even if the argument
is a pointer to a symbolic constant, if the value pointed to is not allowable
for the given command.

• If a negative number is provided where an argument of type sizei is spec-

i?ed, the error INVALID_VALUE is generated.

Version 2.0.25 (November 2, 2010)

2.6. PRIMITIVES AND VERTICES

15

Error

INVALID_ENUM
INVALID_FRAMEBUFFER_OPERATION
INVALID_VALUE
INVALID_OPERATION
OUT_OF_MEMORY

Description

Offending com-
mand ignored?
enum argument out of range
Yes
Yes
Framebuffer is incomplete
Numeric argument out of range
Yes
Operation illegal in current state Yes
Not enough memory left to exe-
cute command

Unknown

Table 2.3: Summary of GL errors

• If memory is exhausted as a side effect of the execution of a command, the

error OUT_OF_MEMORY may be generated.

Otherwise, errors are generated only for conditions that are explicitly described in
this speci?cation.

2.6 Primitives and Vertices

In the GL, geometric objects are drawn by specifying a series of generic attribute
sets using vertex arrays (see section 2.8). There are seven geometric objects that are
drawn this way: points, connected line segments (line strips), line segment loops,
separated line segments, triangle strips, triangle fans, and separated triangles.

Each vertex is speci?ed with multiple generic vertex attributes. Each attribute
is speci?ed with one, two, three, or four scalar values. Generic vertex attributes can
be accessed from within vertex shaders (section 2.10) and used to compute values
for consumption by later processing stages.

The methods by which generic attributes are sent to the GL, as well as how
attributes are used by vertex shaders to generate vertices mapped to the two-
dimensional screen, are discussed later.

Before vertex shader execution, the state required by a vertex is its multiple
generic vertex attribute sets. After vertex shader execution, the state required by a
processed vertex is its screen-space coordinates and any varying outputs written by
the vertex shader.

Figure 2.2 shows the sequence of operations that builds a primitive (point, line
segment, or triangle) from a sequence of vertices. After a primitive is formed,
it is clipped to a viewing volume. This may alter the primitive by altering vertex
coordinates and varying outputs. In the case of line and triangle primitives, clipping

Version 2.0.25 (November 2, 2010)

2.6. PRIMITIVES AND VERTICES

16

Figure 2.2. Vertex processing and primitive assembly.

Version 2.0.25 (November 2, 2010)

Point,Line Segment, orTriangle(Primitive)AssemblyPoint culling,Line Segmentor TriangleclippingRasterizationShadedVerticesCoordinatesVaryingOutputsPrimitive type(from DrawArrays orDrawElements mode)VertexShaderExecutionGenericVertexAttributes2.6. PRIMITIVES AND VERTICES

17

may insert new vertices into the primitive. The vertices de?ning a primitive to be
rasterized have varying outputs associated with them.

2.6.1 Primitive Types

A sequence of vertices is passed to the GL using the commands DrawArrays or
DrawElements (see section 2.8). There is no limit to the number of vertices that
may be speci?ed, other than the size of the vertex arrays.

The mode parameter of these commands determines the type of primitives to
be drawn using these coordinate sets. The types, and the corresponding mode
parameters, are:

Points. A series of individual points may be speci?ed with mode POINTS.

Each vertex de?nes a separate point.

Line Strips. A series of one or more connected line segments may be speci?ed
with mode LINE_STRIP. At least two vertices must be provided. In this case, the
?rst vertex speci?es the ?rst segment’s start point while the second vertex speci?es
the ?rst segment’s endpoint and the second segment’s start point. In general, the
ith vertex (for i > 1) speci?es the beginning of the ith segment and the end of the
i ? 1st. The last vertex speci?es the end of the last segment. If only one vertex is
speci?ed, then no primitive is generated.

The required state consists of the processed vertex produced from the preceding
vertex that was passed (so that a line segment can be generated from it to the current
vertex), and a boolean ?ag indicating if the current vertex is the ?rst vertex.

Line Loops. Line loops may be speci?ed with mode LINE_LOOP. Loops are
the same as line strips except that a ?nal segment is added from the ?nal speci?ed
vertex to the ?rst vertex.

The required state consists of the processed ?rst vertex, in addition to the state

required for line strips.

Separate Lines. Individual line segments, each speci?ed by a pair of vertices,
may be speci?ed with mode LINES. The ?rst two vertices passed de?ne the ?rst
segment, with subsequent pairs of vertices each de?ning one more segment. If the
number of speci?ed vertices is odd, then the last one is ignored. The required state
is the same as for line strips but it is used differently: a processed vertex holding
the ?rst endpoint of the current segment, and a boolean ?ag indicating whether the
current vertex is odd or even (a segment start or end).

Triangle strips. A triangle strip is a series of triangles connected along shared
edges, speci?ed by giving a series of de?ning vertices with mode TRIANGLE_-
STRIP. In this case, the ?rst three vertices de?ne the ?rst triangle (and their order
is signi?cant). Each subsequent vertex de?nes a new triangle using that point along

Version 2.0.25 (November 2, 2010)

2.6. PRIMITIVES AND VERTICES

18

Figure 2.3. (a) A triangle strip. (b) A triangle fan. (c) Independent triangles. The
numbers give the sequencing of the vertices in order within the vertex arrays. Note
that in (a) and (b) triangle edge ordering is determined by the ?rst triangle, while in
(c) the order of each triangle’s edges is independent of the other triangles.

with two vertices from the previous triangle. If fewer than three vertices are speci-
?ed, no primitives are produced. See Figure 2.3.

The required state to support triangle strips consists of a ?ag indicating if the
?rst triangle has been completed, two stored processed vertices, (called vertex A
and vertex B), and a one bit pointer indicating which stored vertex will be replaced
with the next vertex. The pointer is initialized to point to vertex A. Each successive
vertex toggles the pointer. Therefore, the ?rst vertex is stored as vertex A, the
second stored as vertex B, the third stored as vertex A, and so on. Any vertex after
the second one sent forms a triangle from vertex A, vertex B, and the current vertex
(in that order).

Triangle fans. A triangle fan is the same as a triangle strip with one excep-
tion: each vertex after the ?rst always replaces vertex B of the two stored vertices.
Triangle fans are speci?ed with mode TRIANGLE_FAN.

Separate Triangles. Separate triangles are speci?ed with mode TRIANGLES.
In this case, The 3i + 1st, 3i + 2nd, and 3i + 3rd vertices (in that order) determine
a triangle for each i = 0, 1, . . . , n ? 1, where there are 3n + k vertices drawn. k is
either 0, 1, or 2; if k is not zero, the ?nal k vertices are ignored. For each triangle,
vertex A is vertex 3i and vertex B is vertex 3i + 1. Otherwise, separate triangles
are the same as a triangle strip.

The order of the vertices in a triangle generated from a triangle strip, trian-
gle fan, or separate triangles is signi?cant in polygon rasterization and fragment

Version 2.0.25 (November 2, 2010)

(a)(b)(c)12345123451234562.7. CURRENT VERTEX STATE

19

shading (see sections 3.5.1 and 3.8.2).

2.7 Current Vertex State

Vertex shaders (see section 2.10) access an array of 4-component generic vertex
attributes. The ?rst slot of this array is numbered 0, and the size of the array is
speci?ed by the implementation-dependent constant MAX_VERTEX_ATTRIBS.

Current generic attribute values de?ne generic attributes for a vertex when a
vertex array de?ning that data is not enabled, as described in section 2.8. A current
value may be changed at any time by issuing one of the commands

void VertexAttrib{1234}{f}( uint index, T values );
void VertexAttrib{1234}{f}v( uint index, T values );

to load the given value(s) into the current generic attribute for slot index, whose
components are named x, y, z, and w. The VertexAttrib1* family of commands
sets the x coordinate to the provided single argument while setting y and z to 0 and
w to 1. Similarly, VertexAttrib2* commands set x and y to the speci?ed values,
z to 0 and w to 1; VertexAttrib3* commands set x, y, and z, with w set to 1, and
VertexAttrib4* commands set all four coordinates. The error INVALID_VALUE is
generated if index is greater than or equal to MAX_VERTEX_ATTRIBS.

The VertexAttrib* commands can also be used to load attributes declared as a
2×2, 3×3 or 4×4 matrix in a vertex shader. Each column of a matrix takes up one
generic 4-component attribute slot out of the MAX_VERTEX_ATTRIBS available
slots. Matrices are loaded into these slots in column major order. Matrix columns
need to be loaded in increasing slot numbers.

The state required to support vertex speci?cation consists of MAX_VERTEX_-
ATTRIBS four-component ?oating-point vectors to store generic vertex attributes.
The initial values for all generic vertex attributes are (0, 0, 0, 1).

2.8 Vertex Arrays

Vertex data is placed into arrays stored in the client’s address space (described
here) or in the server’s address space (described in section 2.9). Blocks of data in
these arrays may then be used to specify multiple geometric primitives through the
execution of a single GL command. The client may specify up to MAX_VERTEX_-
ATTRIBS arrays specifying one or more generic vertex attributes. The command

Version 2.0.25 (November 2, 2010)

2.8. VERTEX ARRAYS

20

Command
VertexAttribPointer

Sizes
1,2,3,4

Normalized Types
byte,
?ag
ushort, fixed, float

ubyte,

short,

Table 2.4: Vertex array sizes (values per vertex) and data types. The “normalized”
column indicates whether integer types are accepted directly or normalized to [0, 1]
(for unsigned types) or [?1, 1] (for signed types). For generic vertex attributes,
integer data are normalized if and only if the VertexAttribPointer normalized ?ag
is set.

void VertexAttribPointer( uint index, int size, enum type,

boolean normalized, sizei stride, const
void *pointer );

type speci?es the data
describes the locations and organizations of these arrays.
type of the values stored in the array. size indicates the number of values per vertex
that are stored in the array. Table 2.4 indicates the allowable values for size and
type. For type the values BYTE, UNSIGNED_BYTE, SHORT, UNSIGNED_SHORT,
FIXED, and FLOAT, indicate types byte, ubyte, short, ushort, fixed, and
float, respectively. The error INVALID_VALUE is generated if size is speci?ed
with a value other than that indicated in the table.

The index parameter in the VertexAttribPointer command identi?es the
generic vertex attribute array being described. The error INVALID_VALUE is gen-
erated if index is greater than or equal to MAX_VERTEX_ATTRIBS. The normalized
parameter in the VertexAttribPointer command identi?es whether integer types
should be normalized when converted to ?oating-point. If normalized is TRUE, in-
teger data are converted as speci?ed in section 2.1.2; otherwise, the integer values
are converted directly.

The one, two, three, or four values in an array that correspond to a single
generic vertex attribute comprise an array element. The values within each array
element are stored sequentially in memory. If stride is speci?ed as zero, then array
elements are stored sequentially as well. The error INVALID_VALUE is generated
if stride is negative. Otherwise pointers to the ith and (i + 1)st elements of an array
differ by stride basic machine units (typically unsigned bytes), the pointer to the
(i + 1)st element being greater. For each command, pointer speci?es the location
in memory of the ?rst value of the ?rst element of the array being speci?ed.

An individual generic vertex attribute array is enabled or disabled by calling

one of

void EnableVertexAttribArray( uint index );

Version 2.0.25 (November 2, 2010)

2.8. VERTEX ARRAYS

21

void DisableVertexAttribArray( uint index );

where index identi?es the generic vertex attribute array to enable or disable. The
error INVALID_VALUE is generated if index is greater than or equal to MAX_-
VERTEX_ATTRIBS.

Transferring Array Elements

When an array element i is transferred to the GL by the DrawArrays or
DrawElements commands, each generic attribute is expanded to four components.
If size is one then the x component of the attribute is speci?ed by the array; the y,
z, and w components are implicitly set to zero, zero, and one, respectively. If size
is two then the x and y components of the attribute are speci?ed by the array; the z,
and w components are implicitly set to zero, and one, respectively. If size is three
then x, y, and z are speci?ed, and w is implicitly set to one. If size is four then all
components are speci?ed.

The command

void DrawArrays( enum mode, int ?rst, sizei count );

constructs a sequence of geometric primitives by successively transferring ele-
ments ?rst through ?rst + count ? 1 of each enabled array to the GL. mode
speci?es what kind of primitives are constructed, as de?ned in section 2.6.1. If
an array corresponding to a generic attribute required by a vertex shader is not en-
abled, then the corresponding element is taken from the current generic attribute
state (see section 2.7).

Specifying f irst < 0 results in unde?ned behavior. Generating the error

INVALID_VALUE is recommended in this case.

The command

void DrawElements( enum mode, sizei count, enum type,

void *indices );

constructs a sequence of geometric primitives by successively transferring the
count elements whose indices are stored in indices to the GL. The ith element trans-
ferred by DrawElements will be taken from element indices[i] of each enabled
array. type must be one of UNSIGNED_BYTE or UNSIGNED_SHORT, indicating that
the values in indices are indices of GL type ubyte or ushort, respectively. mode
speci?es what kind of primitives are constructed; it accepts the same values as the
mode parameter of DrawArrays. If an array corresponding to a generic attribute

Version 2.0.25 (November 2, 2010)

2.9. BUFFER OBJECTS

22

Name

BUFFER_SIZE
BUFFER_USAGE

Type
integer
enum

Initial Value
0
STATIC_DRAW

Legal Values
any non-negative integer
STATIC_DRAW, DYNAMIC_DRAW, STREAM_DRAW

Table 2.5: Buffer object parameters and their values.

required by a vertex shader is not enabled, then the corresponding element is taken
from the current generic attribute state (see section 2.7).

If the number of supported generic vertex attributes (the value of MAX_-
VERTEX_ATTRIBS) is n, then the client state required to implement vertex ar-
rays consists of n boolean values, n memory pointers, n integer stride values, n
symbolic constants representing array types, n integers representing values per
element, and n boolean values indicating normalization. In the initial state, the
boolean values are each false, the memory pointers are each NULL, the strides are
each zero, the array types are each FLOAT, and the integers representing values per
element are each four.

2.9 Buffer Objects

The vertex data arrays described in section 2.8 are stored in client memory. It is
sometimes desirable to store frequently used client data, such as vertex array data,
in high-performance server memory. GL buffer objects provide a mechanism that
clients can use to allocate, initialize, and render from such memory.

The name space for buffer objects is the unsigned integers, with zero reserved
for the GL. A buffer object is created by binding an unused name to ARRAY_-
BUFFER. The binding is effected by calling

void BindBuffer( enum target, uint buffer );

with target set to ARRAY_BUFFER and buffer set to the unused name. The resulting
buffer object is a new state vector, initialized with a zero-sized memory buffer, and
comprising the state values listed in Table 2.5.

BindBuffer may also be used to bind an existing buffer object. If the bind is
successful no change is made to the state of the newly bound buffer object, and any
previous binding to target is broken.

While a buffer object is bound, GL operations on the target to which it is bound
affect the bound buffer object, and queries of the target to which a buffer object is
bound return state from the bound object.

Version 2.0.25 (November 2, 2010)

2.9. BUFFER OBJECTS

23

In the initial state the reserved name zero is bound to ARRAY_BUFFER. There
is no buffer object corresponding to the name zero, so client attempts to modify
or query buffer object state for the target ARRAY_BUFFER while zero is bound will
generate GL errors.

Buffer objects are deleted by calling

void DeleteBuffers( sizei n, const uint *buffers );

buffers contains n names of buffer objects to be deleted. After a buffer object is
deleted it has no contents, and its name is again unused. Unused names in buffers
are silently ignored, as is the value zero.

The command

void GenBuffers( sizei n, uint *buffers );

returns n previously unused buffer object names in buffers. These names are
marked as used, for the purposes of GenBuffers only, but they acquire buffer state
only when they are ?rst bound, just as if they were unused.

While a buffer object is bound, any GL operations on that object affect any
other bindings of that object. If a buffer object is deleted while it is bound, all
bindings to that object in the current context (i.e. in the thread that called Delete-
Buffers) are reset to zero. Bindings to that buffer in other contexts and other
threads are not affected, but attempting to use a deleted buffer in another thread
produces unde?ned results, including but not limited to possible GL errors and
rendering corruption. Using a deleted buffer in another context or thread may not,
however, result in program termination.

The data store of a buffer object is created and initialized by calling

void BufferData( enum target, sizeiptr size, const

void *data, enum usage );

with target set to ARRAY_BUFFER, size set to the size of the data store in basic
machine units, and data pointing to the source data in client memory. If data is
non-null, then the source data is copied to the buffer object’s data store. If data is
null, then the contents of the buffer object’s data store are unde?ned.

usage is speci?ed as one of three enumerated values, indicating the expected

application usage pattern of the data store. The values are:

STATIC_DRAW The data store contents will be speci?ed once by the application,

and used many times as the source for GL drawing commands.

Version 2.0.25 (November 2, 2010)

2.9. BUFFER OBJECTS

24

Name

BUFFER_SIZE
BUFFER_USAGE

Value
size
usage

Table 2.6: Buffer object initial state.

DYNAMIC_DRAW The data store contents will be respeci?ed repeatedly by the ap-

plication, and used many times as the source for GL drawing commands.

STREAM_DRAW The data store contents will be speci?ed once by the application,
and used at most a few times as the source of a GL drawing command.

usage is provided as a performance hint only. The speci?ed usage value does

not constrain the actual usage pattern of the data store.

BufferData deletes any existing data store, and sets the values of the buffer

object’s state variables as shown in table 2.6.

Clients must align data elements consistent with the requirements of the client
platform, with an additional base-level requirement that an offset within a buffer to
a datum comprising N basic machine units be a multiple of N .

If the GL is unable to create a data store of the requested size, the error OUT_-

OF_MEMORY is generated.

To modify some or all of the data contained in a buffer object’s data store, the

client may use the command

void BufferSubData( enum target, intptr offset,

sizeiptr size, const void *data );

with target set to ARRAY_BUFFER. offset and size indicate the range of data in the
buffer object that is to be replaced, in terms of basic machine units. data speci?es
a region of client memory size basic machine units in length, containing the data
that replace the speci?ed buffer range. An INVALID_VALUE error is generated
if offset or size is less than zero, or if o?set + size is greater than the value of
BUFFER_SIZE.

2.9.1 Vertex Arrays in Buffer Objects

Blocks of vertex array data may be stored in buffer objects with the same format
and layout options supported for client-side vertex arrays.

The client state associated with each vertex array type includes a buffer object
binding point. The commands that specify the locations and organizations of vertex

Version 2.0.25 (November 2, 2010)

2.9. BUFFER OBJECTS

25

arrays copy the buffer object name that is bound to ARRAY_BUFFER to the binding
point corresponding to the vertex array of the type being speci?ed. For example,
the VertexAttribPointer command copies the value of ARRAY_BUFFER_BINDING
(the queriable name of the buffer binding corresponding to the target ARRAY_-
BUFFER) to the client state variable VERTEX_ATTRIB_ARRAY_BUFFER_BINDING
for the speci?ed index.

Rendering commands DrawArrays and DrawElements operate as previously
de?ned, except that data for enabled generic attribute arrays are sourced from
buffers if the array’s buffer binding is non-zero. When an array is sourced from
a buffer object, the pointer value of that array is used to compute an offset, in basic
machine units, into the data store of the buffer object. This offset is computed by
subtracting a null pointer from the pointer value, where both pointers are treated as
pointers to basic machine units2.

It is acceptable for generic vertex attribute arrays to be sourced from any com-
bination of client memory and various buffer objects during a single rendering
operation.

2.9.2 Array Indices in Buffer Objects

Blocks of array indices may be stored in buffer objects with the same format op-
tions that are supported for client-side index arrays.
Initially zero is bound to
ELEMENT_ARRAY_BUFFER, indicating that DrawElements is to source its indices
from arrays passed as the indices parameters.

A buffer object is bound to ELEMENT_ARRAY_BUFFER by calling BindBuffer
with target set to ELEMENT_ARRAY_BUFFER, and buffer set to the name of the
buffer object. If no corresponding buffer object exists, one is initialized as de?ned
in section 2.9.

The commands BufferData and BufferSubData may be used with target
set to ELEMENT_ARRAY_BUFFER. In such event, these commands operate in the
same fashion as described in section 2.9, but on the buffer currently bound to the
ELEMENT_ARRAY_BUFFER target.

While a non-zero buffer object name is bound to ELEMENT_ARRAY_BUFFER,
DrawElements sources its indices from that buffer object, using elements of the
indices parameter as offsets into the buffer object in the same fashion as described
in section 2.9.1.

Buffer objects created by binding an unused name to ARRAY_BUFFER and to
ELEMENT_ARRAY_BUFFER are formally equivalent, but the GL may make different

2 To resume using client-side vertex arrays after a buffer object has been bound, call Bind-
Buffer(ARRAY_BUFFER,0) and then specify the client vertex array pointer using the appropriate
command from section 2.8.

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

26

choices about storage implementation based on the initial binding. In some cases
performance will be optimized by storing indices and array data in separate buffer
objects, and by creating those buffer objects with the corresponding binding points.

2.10 Vertex Shaders

Vertices speci?ed with DrawArrays or DrawElements are processed by the vertex
shader. Each vertex attribute consumed by the vertex shader (see section 2.10.4) is
set to the corresponding generic vertex attribute value from the array element being
processed, or from the corresponding current generic attribute if no vertex array is
bound for that attribute.

After shader execution, processed vertices are passed on to primitive assembly

(see section 2.11).

A vertex shader is de?ned by an array of strings containing source code for
the operations that are meant to occur on each vertex that is processed. The lan-
guage used for vertex shaders is described in the OpenGL ES Shading Language
Speci?cation.

To use a vertex shader, shader source code is ?rst loaded into a shader object
and then compiled. Alternatively, pre-compiled shader binary code may be directly
loaded into a shader object. An OpenGL ES implementation must support one of
these methods for loading shaders. If the boolean value SHADER_COMPILER is
TRUE, then the shader compiler is supported. If the integer value NUM_SHADER_-
BINARY_FORMATS is greater than zero, then shader binary loading is supported.

A vertex shader object is then attached to a program object. A program object is
then linked, which generates executable code from all the compiled shader objects
attached to the program. When a linked program object is used as the current
program object, the executable code for the vertex shaders it contains is used to
process vertices.

In addition to vertex shaders, fragment shaders can be created, compiled, and
linked into program objects. Fragment shaders affect the processing of fragments
during rasterization, and are described in section 3.8. A single program object must
contain both a vertex and a fragment shader.

The vertex shader attached to the program object in use by the GL is considered
active, and is used to process vertices. If no program object is currently in use, the
results of vertex shader execution are unde?ned.

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

27

2.10.1 Loading and Compiling Shader Source

The source code that makes up a program that gets executed by one of the pro-
grammable stages is encapsulated in one or more shader objects.

The name space for shader objects is the unsigned integers, with zero reserved
for the GL. This name space is shared with program objects. The following sections
de?ne commands that operate on shader and program objects by name. Commands
that accept shader or program object names will generate the error INVALID_-
VALUE if the provided name is not the name of either a shader or program object
and INVALID_OPERATION if the provided name identi?es an object that is not the
expected type.

To create a shader object, use the command

uint CreateShader( enum type );

The shader object is empty when it is created. The type argument speci?es the type
of shader object to be created. For vertex shaders, type must be VERTEX_SHADER.
A non-zero name that can be used to reference the shader object is returned. If an
error occurs, zero will be returned.

The command

void ShaderSource( uint shader, sizei count, const

char **string, const int *length );

loads source code into the shader object named shader. string is an array of count
pointers to optionally null-terminated character strings that make up the source
code. The length argument is an array with the number of chars in each string
(the string length). If an element in length is negative, its accompanying string is
null-terminated; in this case only the sign of the element in length is considered.
If length is NULL, all strings in the string argument are considered null-terminated.
The ShaderSource command sets the source code for the shader to the text strings
in the string array. If shader previously had source code loaded into it, the exist-
ing source code is completely replaced. Any length passed in excludes the null
terminator in its count.

The strings that are loaded into a shader object are expected to form the source
code for a valid shader as de?ned in the OpenGL ES Shading Language Speci?ca-
tion.

Once the source code for a shader has been loaded, a shader object can be

compiled with the command

void CompileShader( uint shader );

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

28

Each shader object has a boolean status, COMPILE_STATUS, that is modi?ed as
a result of compilation. This status can be queried with GetShaderiv (see sec-
tion 6.1.8). This status will be set to TRUE if shader was compiled without errors
and is ready for use, and FALSE otherwise. Compilation can fail for a variety of
reasons as listed in the OpenGL ES Shading Language Speci?cation. If Compile-
Shader failed, any information about a previous compile is lost. Thus a failed
compile does not restore the old state of shader.

Changing the source code of a shader object with ShaderSource does not

change its compile status or the compiled shader code.

Each shader object has an information log, which is a text string that is over-
written as a result of compilation. This information log can be queried with Get-
ShaderInfoLog to obtain more information about the compilation attempt (see
section 6.1.8).

Resources allocated by the shader compiler may be released with the command

void ReleaseShaderCompiler( void );

This is a hint from the application, and does not prevent later use of the shader
compiler. If shader source is loaded and compiled after ReleaseShaderCompiler
has been called, CompileShader must succeed provided there are no errors in the
shader source.

The range and precision for different numeric formats supported by the shader
compiler may be determined with the command GetShaderPrecisionFormat (see
section 6.1.8).

Shader objects can be deleted with the command

void DeleteShader( uint shader );

If shader is not attached to any program object, it is deleted immediately. Oth-
erwise, shader is ?agged for deletion and will be deleted when it is no longer
attached to any program object. If an object is ?agged for deletion, its boolean
status bit DELETE_STATUS is set to true. The value of DELETE_STATUS can be
queried with GetShaderiv (see section 6.1.8). DeleteShader will silently ignore
the value zero.

If the value of SHADER_COMPILER is not TRUE, then the error INVALID_-
OPERATION is generated for any call to ShaderSource, CompileShader, or Re-
leaseShaderCompiler.

2.10.2 Loading Shader Binaries

Precompiled shader binaries may be loaded with the command

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

29

void ShaderBinary( sizei count, const uint *shaders,

enum binaryformat, const void *binary, sizei length );

shaders contains a list of count shader object handles. Each handle refers to a
unique shader type (vertex shader or fragment shader). binary points to length
bytes of pre-compiled binary shader code in client memory, and binaryformat de-
note the format of the pre-compiled code.

The binary image will be decoded according to the extension speci?cation
de?ning the speci?ed binaryformat. OpenGL ES de?nes no speci?c binary for-
mats, but does provide a mechanism to obtain token values for such formats pro-
vided by extensions. The number of shader binary formats supported can be ob-
tained by querying the value of NUM_SHADER_BINARY_FORMATS. The list of spe-
ci?c binary formats supported can be obtained by querying the value of SHADER_-
BINARY_FORMATS.

Depending on the types of the shader objects in shaders, ShaderBinary will
individually load binary vertex or fragment shaders, or load an executable binary
that contains an optimized pair of vertex and fragment shaders stored in the same
binary.

An INVALID_ENUM error is generated if binaryformat is not a supported format
returned in SHADER_BINARY_FORMATS. An INVALID_VALUE error is generated
if the data pointed to by binary does not match the speci?ed binaryformat. Addi-
tional errors corresponding to speci?c binary formats may be generated as speci?ed
by the extensions de?ning those formats. An INVALID_OPERATION error is gen-
erated if more than one of the handles refers to the same type of shader (vertex or
fragment shader.)

If ShaderBinary fails, the old state of shader objects for which the binary was

being loaded will not be restored.

Note that if shader binary interfaces are supported, then an OpenGL ES imple-
mentation may require that an optimized pair of vertex and fragment shader bina-
ries that were compiled together be speci?ed to LinkProgram. Not specifying an
optimized pair may cause LinkProgram to fail.

2.10.3 Program Objects

The shader objects that are to be used by the programmable stages of the GL are
collected together to form a program object. The programs that are executed by
these programmable stages are called executables. All information necessary for
de?ning an executable is encapsulated in a program object. A program object is
created with the command

uint CreateProgram( void );

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

30

Program objects are empty when they are created. A non-zero name that can be
used to reference the program object is returned.
If an error occurs, 0 will be
returned.

To attach a shader object to a program object, use the command

void AttachShader( uint program, uint shader );

Shader objects may be attached to program objects before source code has been
loaded into the shader object, or before the shader object has been compiled. Multi-
ple shader objects of the same type may not be attached to a single program object.
However, a single shader object may be attached to more than one program object.
The error INVALID_OPERATION is generated if shader is already attached to pro-
gram, or if another shader object of the same type as shader is already attached to
program.

To detach a shader object from a program object, use the command

void DetachShader( uint program, uint shader );

If shader has been ?agged for deletion and is not attached to any other program

object, it is deleted.

The error INVALID_OPERATION is generated if shader is not attached to pro-
gram. The error INVALID_VALUE is generated if program is not a valid program
object created with CreateProgram.

In order to use the shader objects contained in a program object, the program

object must be linked. The command

void LinkProgram( uint program );

will link the program object named program. Each program object has a boolean
status, LINK_STATUS, that is modi?ed as a result of linking. This status can be
queried with GetProgramiv (see section 6.1.8). This status will be set to TRUE if a
valid executable is created, and FALSE otherwise. Linking can fail for a variety of
reasons as speci?ed in the OpenGL ES Shading Language Speci?cation. Linking
will also fail if one or more of the shader objects, attached to program are not com-
piled successfully, if program does not contain both a vertex shader and a fragment
shader, or if more active uniform or active sampler variables are used in program
than allowed (see section 2.10.4). If LinkProgram failed, any information about a
previous link of that program object is lost. Thus, a failed link does not restore the
old state of program. The error INVALID_VALUE is generated if program is not a
valid program object created with CreateProgram.

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

31

Each program object has an information log that is overwritten as a result of a
link operation. This information log can be queried with GetProgramInfoLog to
obtain more information about the link operation or the validation information (see
section 6.1.8).

If a valid executable is created, it can be made part of the current rendering

state with the command

void UseProgram( uint program );

This command will install the executable code as part of current rendering state if
the program object program contains valid executable code, i.e. has been linked
successfully. If UseProgram is called with program set to zero, then the current
rendering state refers to an invalid program object, and the results of vertex and
fragment shader execution due to any DrawArrays or DrawElements commands
are unde?ned. However, this is not an error. If program has not been successfully
linked, the error INVALID_OPERATION is generated and the current rendering state
is not modi?ed.

While a valid program object is in use, applications are free to modify attached
shader objects, compile attached shader objects, attach additional shader objects,
and detach shader objects. These operations do not affect the link status or exe-
cutable code of the program object.

If the program object that is in use is re-linked successfully, the LinkProgram
command will install the generated executable code as part of the current rendering
state if the speci?ed program object was already in use as a result of a previous call
to UseProgram.

If that program object that is in use is re-linked unsuccessfully, the link status
will be set to FALSE, but existing executable and associated state will remain part
of the current rendering state until a subsequent call to UseProgram removes it
from use. After such a program is removed from use, it can not be made part of the
current rendering state until it is successfully re-linked.
Program objects can be deleted with the command

void DeleteProgram( uint program );

If program is not the current program for any GL context, it is deleted immediately.
Otherwise, program is ?agged for deletion and will be deleted when it is no longer
the current program for any context. When a program object is deleted, all shader
objects attached to it are detached. DeleteProgram will silently ignore the value
zero.

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

32

2.10.4 Shader Variables

A vertex shader can reference a number of variables as it executes. Vertex attributes
are the per-vertex values speci?ed in section 2.7. Uniforms are per-program vari-
ables that are constant during program execution. Samplers are a special form of
uniform used for texturing (section 3.7). Varying variables hold the results of ver-
tex shader execution that are used later in the pipeline. The following sections
describe each of these variable types.

Vertex Attributes

Vertex shaders can de?ne named attribute variables, which are bound to the generic
vertex attributes that are set by VertexAttrib*. This binding can be speci?ed by
the application before the program is linked, or automatically assigned by the GL
when the program is linked.

When an attribute variable declared as a float, vec2, vec3 or vec4 is bound
to a generic attribute index i, its value(s) are taken from the x, (x, y), (x, y, z), or
(x, y, z, w) components, respectively, of the generic attribute i. When an attribute
variable is declared as a mat2, its matrix columns are taken from the (x, y) com-
ponents of generic attributes i and i + 1. When an attribute variable is declared
as a mat3, its matrix columns are taken from the (x, y, z) components of generic
attributes i through i + 2. When an attribute variable is declared as a mat4, its
matrix columns are taken from the (x, y, z, w) components of generic attributes i
through i + 3.

A generic attribute variable is considered active if it is determined by the com-
piler and linker that the attribute may be accessed when the shader is executed.
Attribute variables that are declared in a vertex shader but never used are not con-
sidered active. In cases where the compiler and linker cannot make a conclusive
determination, an attribute will be considered active. A program object will fail to
link if the number of active vertex attributes exceeds MAX_VERTEX_ATTRIBS.

To determine the set of active vertex attributes used by a program, and to de-

termine their types, use the command:

void GetActiveAttrib( uint program, uint index,

sizei bufSize, sizei *length, int *size, enum *type,
char *name );

This command provides information about the attribute selected by index. An in-
dex of 0 selects the ?rst active attribute, and an index of ACTIVE_ATTRIBUTES ? 1
selects the last active attribute. The value of ACTIVE_ATTRIBUTES can be queried
If index is greater than or equal to
with GetProgramiv (see section 6.1.8).

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

33

ACTIVE_ATTRIBUTES, the error INVALID_VALUE is generated. Note that index
simply identi?es a member in a list of active attributes, and has no relation to the
generic attribute that the corresponding variable is bound to.

The parameter program is the name of a program object for which the com-
mand LinkProgram has been issued in the past. It is not necessary for program to
have been linked successfully. The link could have failed because the number of
active attributes exceeded the limit.

The name of the selected attribute is returned as a null-terminated string in
name. The actual number of characters written into name, excluding the null termi-
nator, is returned in length. If length is NULL, no length is returned. The maximum
number of characters that may be written into name, including the null termina-
tor, is speci?ed by bufSize. The returned attribute name must be the name of a
generic attribute. The length of the longest attribute name in program is given by
ACTIVE_ATTRIBUTE_MAX_LENGTH, which can be queried with GetProgramiv
(see section 6.1.8).

For the selected attribute, the type of the attribute is returned into type. The
size of the attribute is returned into size. The value in size is in units of the type
returned in type. The type returned can be any of FLOAT, FLOAT_VEC2, FLOAT_-
VEC3, FLOAT_VEC4, FLOAT_MAT2, FLOAT_MAT3, or FLOAT_MAT4.

If an error occurred, the return parameters length, size, type and name will be

unmodi?ed.

This command will return as much information about active attributes as pos-
sible. If no information is available, length will be set to zero and name will be an
empty string. This situation could arise if GetActiveAttrib is issued after a failed
link.

After a program object has been linked successfully, the bindings of attribute

variable names to indices can be queried. The command

int GetAttribLocation( uint program, const char *name );

returns the generic attribute index that the attribute variable named name was bound
to when the program object named program was last linked. name must be a null-
terminated string. If name is active and is an attribute matrix, GetAttribLocation
returns the index of the ?rst column of that matrix. If program has not been suc-
cessfully linked, the error INVALID_OPERATION is generated. If name is not an
active attribute, or if an error occurs, -1 will be returned.

The binding of an attribute variable to a generic attribute index can also be

speci?ed explicitly. The command

void BindAttribLocation( uint program, uint index, const

char *name );

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

34

speci?es that the attribute variable named name in program program should be
bound to generic vertex attribute index when the program is next linked. If name
was bound previously, its assigned binding is replaced with index. name must be a
null terminated string. The error INVALID_VALUE is generated if index is equal or
greater than MAX_VERTEX_ATTRIBS. BindAttribLocation has no effect until the
program is linked. In particular, it doesn’t modify the bindings of active attribute
variables in a program that has already been linked.

The error INVALID_OPERATION is generated if name starts with the reserved

"gl_" pre?x.

When a program is linked, any active attributes without a binding speci?ed
through BindAttribLocation will be automatically be bound to vertex attributes
by the GL. Such bindings can be queried using the command GetAttribLocation.
LinkProgram will fail if the assigned binding of an active attribute variable would
cause the GL to reference a non-existant generic attribute (one greater than or equal
to MAX_VERTEX_ATTRIBS). LinkProgram will fail if the attribute bindings as-
signed by BindAttribLocation do not leave enough space to assign a location for
an active matrix attribute, which requires multiple contiguous generic attributes.

BindAttribLocation may be issued before any vertex shader objects are at-
tached to a program object. Hence it is allowed to bind any name (except a name
starting with "gl_") to an index, including a name that is never used as an at-
tribute in any vertex shader object. Assigned bindings for attribute variables that
do not exist or are not active are ignored.

The values of generic attributes sent to generic attribute index i are part of
current state. If a new program object has been made active, then these values
will be tracked by the GL in such a way that the same values will be observed by
attributes in the new program object that are also bound to index i.

It is possible for an application to bind more than one attribute name to the
same location. This is referred to as aliasing. This will only work if only one of
the aliased attributes is active in the executable program, or if no path through the
shader consumes more than one attribute of a set of attributes aliased to the same
location. A link error can occur if the linker determines that every path through the
shader consumes multiple aliased attributes, but implementations are not required
to generate an error in this case. The compiler and linker are allowed to assume that
no aliasing is done, and may employ optimizations that work only in the absence
of aliasing.

Uniform Variables

Shaders can declare named uniform variables, as described in the OpenGL ES
Shading Language Speci?cation. Values for these uniforms are constant over a

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

35

primitive, and typically they are constant across many primitives. Uniforms are
program object-speci?c state. They retain their values once loaded, and their values
are restored whenever a program object is used, as long as the program object
has not been re-linked. A uniform is considered active if it is determined by the
compiler and linker that the uniform will actually be accessed when the executable
code is executed. In cases where the compiler and linker cannot make a conclusive
determination, the uniform will be considered active.

The amount of storage available for uniform variables accessed by a vertex
shader is speci?ed by the implementation-dependent constant MAX_VERTEX_-
UNIFORM_VECTORS. This value represents the number of four-element ?oating-
point, integer, or boolean vectors that can be held in uniform variable storage for a
vertex shader. A link error will be generated if an attempt is made to utilize more
than the space available for vertex shader uniform variables.

When a program is successfully linked, all active uniforms belonging to the
program object are initialized to zero (FALSE for booleans). A successful link will
also generate a location for each active uniform. The values of active uniforms can
be changed using this location and the appropriate Uniform* command (see be-
low). These locations are invalidated and new ones assigned after each successful
re-link.

To ?nd the location of an active uniform variable within a program object, use

the command

int GetUniformLocation( uint program, const

char *name );

This command will return the location of uniform variable name. name must be a
null terminated string, without white space. The value -1 will be returned if name
does not correspond to an active uniform variable name in program or if name starts
with the reserved pre?x "gl_". If program has not been successfully linked, the
error INVALID_OPERATION is generated. After a program is linked, the location
of a uniform variable will not change, unless the program is re-linked.

A valid name cannot be a structure, an array of structures, or any portion of
a single vector or a matrix. In order to identify a valid name, the "." (dot) and
"[]" operators can be used in name to specify a member of a structure or element
of an array.

The ?rst element of a uniform array is identi?ed using the name of the uniform
array appended with "[0]". Except if the last part of the string name indicates a
uniform array, then the location of the ?rst element of that array can be retrieved
by either using the name of the uniform array, or the name of the uniform array
appended with "[0]".

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

36

To determine the set of active uniform attributes used by a program, and to

determine their sizes and types, use the command:

void GetActiveUniform( uint program, uint index,

sizei bufSize, sizei *length, int *size, enum *type,
char *name );

This command provides information about the uniform selected by index. An index
of 0 selects the ?rst active uniform, and an index of ACTIVE_UNIFORMS ? 1 se-
lects the last active uniform. The value of ACTIVE_UNIFORMS can be queried with
GetProgramiv (see section 6.1.8). If index is greater than or equal to ACTIVE_-
UNIFORMS, the error INVALID_VALUE is generated. Note that index simply iden-
ti?es a member in a list of active uniforms, and has no relation to the location
assigned to the corresponding uniform variable.

The parameter program is a name of a program object for which the command
LinkProgram has been issued in the past. It is not necessary for program to have
been linked successfully. The link could have failed because the number of active
uniforms exceeded the limit.

If an error occurred, the return parameters length, size, type and name will be

unmodi?ed.

For the selected uniform, the uniform name is returned into name. The string
name will be null terminated. The actual number of characters written into name,
excluding the null terminator, is returned in length. If length is NULL, no length
is returned. The maximum number of characters that may be written into name,
including the null terminator, is speci?ed by bufSize. The returned uniform name
can be the name of built-in uniform state as well. The complete list of built-in
uniform state is described in section 7.5 of the OpenGL ES Shading Language
speci?cation. The length of the longest uniform name in program is given by
ACTIVE_UNIFORM_MAX_LENGTH, which can be queried with GetProgramiv (see
section 6.1.8).

Each uniform variable, declared in a shader, is broken down into one or more
strings using the "." (dot) and "[]" operators, if necessary, to the point that it
is legal to pass each string back into GetUniformLocation. Each of these strings
constitutes one active uniform, and each string is assigned an index.

If the active uniform is an array, the uniform name returned in name will always

be the name of the uniform array appended with "[0]".

For the selected uniform, the type of the uniform is returned into type. The
size of the uniform is returned into size. The value in size is in units of the
type returned in type. The type returned can be any of FLOAT, FLOAT_VEC2,
FLOAT_VEC3, FLOAT_VEC4, INT, INT_VEC2, INT_VEC3, INT_VEC4, BOOL,

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

37

BOOL_VEC2, BOOL_VEC3, BOOL_VEC4, FLOAT_MAT2, FLOAT_MAT3, FLOAT_-
MAT4, SAMPLER_2D, or SAMPLER_CUBE.

If one or more elements of an array are active, GetActiveUniform will return
the name of the array in name, subject to the restrictions listed above. The type of
the array is returned in type. The size parameter contains the highest array element
index used, plus one. The compiler or linker determines the highest index used.
There will be only one active uniform reported by the GL per uniform array.

GetActiveUniform will return as much information about active uniforms as
possible. If no information is available, length will be set to zero and name will be
an empty string. This situation could arise if GetActiveUniform is issued after a
failed link.

To load values into the uniform variables of the program object that is currently

in use, use the commands

void Uniform{1234}{if}( int location, T value );
void Uniform{1234}{if}v( int location, sizei count,

T value );

void UniformMatrix{234}fv( int location, sizei count,

boolean transpose, const float *value );

The given values are loaded into the uniform variable location identi?ed by loca-
tion.

The Uniform*f{v} commands will load count sets of one to four ?oating-point
values into a uniform location de?ned as a ?oat, a ?oating-point vector, an array of
?oats, or an array of ?oating-point vectors.

The Uniform*i{v} commands will load count sets of one to four integer val-
ues into a uniform location de?ned as a sampler, an integer, an integer vector, an
array of samplers, an array of integers, or an array of integer vectors. Only the
Uniform1i{v} commands can be used to load sampler values (see below).

The UniformMatrix{234}fv commands will load count 2 × 2, 3 × 3, or 4 × 4
matrices (corresponding to 2, 3, or 4 in the command name) of ?oating-point values
into a uniform location de?ned as a matrix or an array of matrices. The matrix is
speci?ed in column-major order. transpose must be FALSE.

When loading values for a uniform declared as a boolean, a boolean vector,
an array of booleans, or an array of boolean vectors, both the Uniform*i{v} and
Uniform*f{v} set of commands can be used to load boolean values. Type conver-
sion is done by the GL. The uniform is set to FALSE if the input value is 0 or 0.0f,
and set to TRUE otherwise. The Uniform* command used must match the size of
the uniform, as declared in the shader. For example, to load a uniform declared

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

38

as a bvec2, either Uniform2i{v} or Uniform2f{v} can be used. An INVALID_-
OPERATION error will be generated if an attempt is made to use a non-matching
Uniform* command. In this example using Uniform1iv would generate an error.
For all other uniform types the Uniform* command used must match the size
and type of the uniform, as declared in the shader. No type conversions are
done. For example, to load a uniform declared as a vec4, Uniform4f{v} must
be used. To load a 3x3 matrix, UniformMatrix3fv must be used. An INVALID_-
OPERATION error will be generated if an attempt is made to use a non-matching
In this example, using Uniform4i{v} would generate an
Uniform* command.
error.

When loading N elements starting at an arbitrary position k in a uniform de-
clared as an array, elements k through k + N ? 1 in the array will be replaced
with the new values. Values for any array element that exceeds the highest array
element index used, as reported by GetActiveUniform, will be ignored by the GL.
If the value of location is -1, the Uniform* commands will silently ignore the

data passed in, and the current uniform values will not be changed.

If the transpose parameter to any of the UniformMatrix* commands is
not FALSE, an INVALID_VALUE error is generated, and no uniform values are
changed.

If any of the following conditions occur, an INVALID_OPERATION error is

generated by the Uniform* commands, and no uniform values are changed:

• if the size indicated in the name of the Uniform* command used does not

match the size of the uniform declared in the shader,

• if the uniform declared in the shader is not of type boolean and the type
indicated in the name of the Uniform* command used does not match the
type of the uniform,

• if count is greater than one, and the uniform declared in the shader is not an

array variable,

• if no variable with a location of location exists in the program object cur-

rently in use and location is not -1, or

• if there is no program object currently in use.

Samplers

Samplers are special uniforms used in the OpenGL ES Shading Language to
identify the texture object used for each texture lookup. The value of a sam-
pler indicates the texture image unit being accessed. Setting a sampler’s value

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

39

to i selects texture image unit number i. The values of i range from zero to the
implementation-dependent maximum supported number of texture image units.

The type of the sampler identi?es the target on the texture image unit. The
texture object bound to that texture image unit’s target is then used for the texture
lookup. For example, a variable of type sampler2D selects target TEXTURE_2D
on its texture image unit. Binding of texture objects to targets is done as usual with
BindTexture. Selecting the texture image unit to bind to is done as usual with
ActiveTexture.

The location of a sampler needs to be queried with GetUniformLocation, just
like any uniform variable. Sampler values need to be set by calling Uniform1i{v}.
Loading samplers with any of the other Uniform* entry points is not allowed and
will result in an INVALID_OPERATION error.

It is not allowed to have variables of different sampler types pointing to the
same texture image unit within a program object. This situation can only be de-
tected at the next rendering command issued, and an INVALID_OPERATION error
will then be generated.

Active samplers are samplers actually being used in a program object. The
LinkProgram command determines if a sampler is active or not. The LinkPro-
gram command will attempt to determine if the active samplers in the shader(s)
contained in the program object exceed the maximum allowable limits. If it deter-
mines that the count of active samplers exceeds the allowable limits, then the link
fails (these limits can be different for different types of shaders). Each active sam-
pler variable counts against the limit, even if multiple samplers refer to the same
texture image unit. If this cannot be determined at link time, then it will be deter-
mined at the next rendering command issued, and an INVALID_OPERATION error
will then be generated.

Varying Variables

A vertex shader may de?ne one or more varying variables (see the OpenGL ES
Shading Language speci?cation). These values are expected to be interpolated
across the primitive being rendered. The OpenGL ES Shading Language speci?-
cation de?nes a set of built-in varying variables for vertex shaders corresponding
to values required for rasterization following vertex processing.

The number of interpolators available for processing varying variables is given
by the implementation-dependent constant MAX_VARYING_VECTORS. This value
represents the number of four-element ?oating-point vectors that can be interpo-
lated; varying variables declared as matrices or arrays will consume multiple in-
terpolators. When a program is linked, any varying variable written by a vertex
shader, or read by a fragment shader, will count against this limit. The transformed

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

40

vertex position (gl_Position) is not a varying variable and does not count
against this limit. A program whose shaders access more than MAX_VARYING_-
VECTORS worth of varying variables may fail to link, unless device-dependent op-
timizations are able to make the program ?t within available hardware resources.

2.10.5 Shader Execution

If a successfully linked program object that contains a vertex shader is made current
by calling UseProgram, the executable version of the vertex shader is used to
process incoming vertex values.

There are several special considerations for vertex shader execution described

in the following sections.

Texture Access

Vertex shaders have the ability to do a lookup into a texture map, if supported by
the GL implementation. The maximum number of texture image units available to
a vertex shader is MAX_VERTEX_TEXTURE_IMAGE_UNITS; a maximum number of
zero indicates that the GL implemenation does not support texture accesses in ver-
tex shaders. The maximum number of texture image units available to the fragment
stage of the GL is MAX_TEXTURE_IMAGE_UNITS. Both the vertex shader and frag-
ment processing combined cannot use more than MAX_COMBINED_TEXTURE_-
If both the vertex shader and the fragment
IMAGE_UNITS texture image units.
processing stage access the same texture image unit, then that counts as using two
texture image units against the MAX_COMBINED_TEXTURE_IMAGE_UNITS limit.

When a texture lookup is performed in a vertex shader, the ?ltered texture value
? is computed in the manner described in sections 3.7.7 and 3.7.8, and converted to
a texture source color Cs according to table 3.12 (section 3.8.2). A four-component
vector (Rs, Gs, Bs, As) is returned to the vertex shader.

In a vertex shader, it is not possible to perform automatic level-of-detail calcu-
lations using partial derivatives of the texture coordinates with respect to window
coordinates as described in section 3.7.7. Hence, there is no automatic selection of
an image array level. Mini?cation or magni?cation of a texture map is controlled
by a level-of-detail value optionally passed as an argument in the texture lookup
functions. If the texture lookup function supplies an explicit level-of-detail value l,
then the pre-bias level-of-detail value ?base(x, y) = l (replacing equation 3.11). If
the texture lookup function does not supply an explicit level-of-detail value, then
?base(x, y) = 0. The scale factor ?(x, y) and its approximation function f (x, y)
(see equation 3.12) are ignored.

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

41

Using a sampler in a vertex shader will return (R, G, B, A) = (0, 0, 0, 1) under
the same conditions as de?ned for fragment shaders under “Texture Access” in
section 3.8.2.

Validation

It is not always possible to determine at link time if a program object actually will
execute. Therefore validation is done when the ?rst rendering command (DrawAr-
rays or DrawElements) is issued, to determine if the currently active program ob-
ject can be executed. If it cannot be executed then no fragments will be rendered,
and the rendering command will generate the error INVALID_OPERATION.

This error is generated if:

• any two active samplers in the current program object are of different types,

but refer to the same texture image unit,

The INVALID_OPERATION error reported by these rendering commands may
not provide enough information to ?nd out why the currently active program object
would not execute. No information at all is available about a program object that
would still execute, but is inef?cient or suboptimal given the current GL state. As
a development aid, use the command

void ValidateProgram( uint program );

to validate the program object program against the current GL state. Each program
object has a boolean status, VALIDATE_STATUS, that is modi?ed as a result of
validation. This status can be queried with GetProgramiv (see section 6.1.8). If
validation succeeded this status will be set to TRUE, otherwise it will be set to
FALSE. If validation succeeded the program object is guaranteed to execute, given
the current GL state. If validation failed, the program object is guaranteed to not
execute, given the current GL state.

ValidateProgram will check for all the conditions that could lead to an
INVALID_OPERATION error when rendering commands are issued, and may check
for other conditions as well. For example, it could give a hint on how to optimize
some piece of shader code. An empty program will always fail validation. The
information log of program is overwritten with information on the results of the
validation, which could be an empty string. The results written to the information
log are typically only useful during application development; an application should
not expect different GL implementations to produce identical information.

Version 2.0.25 (November 2, 2010)

2.10. VERTEX SHADERS

42

A shader should not fail to compile, and a program object should not fail to
link due to lack of instruction space or lack of temporary variables. Implementa-
tions should ensure that all valid shaders and program objects may be successfully
compiled, linked and executed.

Unde?ned Behavior

When using array or matrix variables in a shader, it is possible to access a vari-
able with an index computed at run time that is outside the declared extent of the
variable. Such out-of-bounds accesses have unde?ned behavior, and system er-
rors (possibly including program termination) may occur. The level of protection
provided against such errors in the shader is implementation-dependent.

2.10.6 Required State

The GL maintains state to indicate which shader and program object names are in
use. Initially, no shader or program objects exist, and no names are in use.

The state required per shader object consists of:

• An unsigned integer specifying the shader object name.

• An integer holding the value of SHADER_TYPE.

• A boolean holding the delete status, initially FALSE.

• A boolean holding the status of the last compile, initially FALSE.

• An array of type char containing the information log, initially empty.

• An integer holding the length of the information log.

• An array of type char containing the concatenated shader string, initially

empty.

• An integer holding the length of the concatenated shader string.

The state required per program object consists of:

• An unsigned integer indicating the program object name.

• A boolean holding the delete status, initially FALSE.

• A boolean holding the status of the last link attempt, initially FALSE.

Version 2.0.25 (November 2, 2010)

2.11. PRIMITIVE ASSEMBLY AND POST-SHADER VERTEX PROCESSING43

• A boolean holding the status of the last validation attempt, initially FALSE.

• An integer holding the number of attached shader objects.

• A list of unsigned integers to keep track of the names of the shader objects

attached.

• An array of type char containing the information log, initially empty.

• An integer holding the length of the information log.

• An integer holding the number of active uniforms.

• For each active uniform, three integers, holding its location, size, and type,

and an array of type char holding its name.

• An array of words that hold the values of each active uniform.

• An integer holding the number of active attributes.

• For each active attribute, three integers holding its location, size, and type,

and an array of type char holding its name.

Additionally, one unsigned integer is required to hold the name of the current pro-
gram object. Initially the current program object is invalid, as if UseProgram had
been called with program set to zero.

2.11 Primitive Assembly and Post-Shader Vertex Process-

ing

Following vertex processing, vertices are assembled into primitives according to
the mode argument of the drawing command (see sections 2.6.1 and 2.8). The
steps of primitive assembly are described in the remaining sections of this chapter
and include

• Perspective division on clip coordinates (section 2.12).

• Viewport mapping, including depth range scaling (section 2.12.1).

• Primitive clipping (section 2.13).

• Clipping varying outputs (section 2.13.1).

Version 2.0.25 (November 2, 2010)

2.12. COORDINATE TRANSFORMATIONS

44

Figure 2.4. Vertex transformation sequence.

2.12 Coordinate Transformations

Vertex shader execution yields a vertex coordinate gl_Position which is as-
sumed to be in clip coordinates. Perspective division is carried out on clip coordi-
nates to yield normalized device coordinates, followed by a viewport transforma-
tion to convert these coordinates into window coordinates (see ?gure 2.4).

Clip coordinates are four-dimensional homogeneous vectors consisting of x, y,

z, and w coordinates (in that order). If a vertex’s clip coordinates are

?

?
?
?

?

?
?
?

xc
yc
zc
wc

then the vertex’s normalized device coordinates are

?

?

xd
yd
zd

?

?

? =

?

?

? .

xc
wcye
wc
ze
wc

2.12.1 Controlling the Viewport

The viewport transformation is determined by the viewport’s width and height in
pixels, px and py, respectively, and its center (ox, oy) (also in pixels). The vertex’s

Version 2.0.25 (November 2, 2010)

ViewportTransformationWindowCoordinatesClip CoordinatesPerspectiveDivisionNormalizedDevice Coordinates2.13. PRIMITIVE CLIPPING

45

window coordinates,

?

? , are given by

?

?

xw
yw
zw

?

?

? =

?

?

?

xw
yw
zw

px
2 xd + ox
py
2 yd + oy
2 zd + n+f
2

f ?n

?

? .

The factor and offset applied to zd encoded by n and f are set using

void DepthRangef( clampf n, clampf f );

Each of n and f are clamped to lie within [0, 1], as are all arguments of type
clampf. zw is taken to be represented in ?xed-point with at least as many bits
as there are in the depth buffer of the framebuffer, as described for framebuffer
components in section 2.1.2.

Viewport transformation parameters are speci?ed using

void Viewport( int x, int y, sizei w, sizei h );

where x and y give the x and y window coordinates of the viewport’s lower left
corner and w and h give the viewport’s width and height, respectively. The viewport
parameters shown in the above equations are found from these values as ox = x+ w
2
and oy = y + h

2 ; px = w, py = h.

Viewport width and height are clamped to implementation-dependent maxi-
mums when speci?ed. The maximum width and height may be found by issuing
an appropriate Get command (see Chapter 6). The maximum viewport dimen-
sions must be greater than or equal to the visible dimensions of the display being
rendered to. INVALID_VALUE is generated if either w or h is negative.

The state required to implement the viewport transformation is four integers
and two clamped ?oating-point values. In the initial state, w and h are set to the
width and height, respectively, of the window into which the GL is to do its ren-
dering. ox and oy are set to w
2 , respectively. n and f are set to 0.0 and 1.0,
respectively.

2 and h

2.13 Primitive Clipping

Primitives are clipped to the clip volume. In clip coordinates, the clip volume is
de?ned by

?wc ? xc ? wc
?wc ? yc ? wc
?wc ? zc ? wc.

Version 2.0.25 (November 2, 2010)

2.13. PRIMITIVE CLIPPING

46

If the primitive under consideration is a point, then clipping discards it if it lies

outside the near or far clip plane; otherwise it is passed unchanged.

If the primitive is a line segment, then clipping does nothing to it if it lies
entirely inside the near and far clip planes, and discards it if it lies entirely outside
these planes.

If part of the line segment lies between the near and far clip planes, and part
lies outside, then the line segment is clipped against these planes and new vertex
coordinates are computed for one or both vertices.

This clipping produces a value, 0 ? t ? 1, for each clipped vertex. If the
coordinates of a clipped vertex are P and the original vertices’ coordinates are P1
and P2, then t is given by

P = tP1 + (1 ? t)P2.

If the primitive is a triangle, then it is passed if every one of its edges lies
entirely inside the clip volume and either clipped or discarded otherwise. Clip-
ping may cause triangle edges to be clipped, but because connectivity must be
maintained, these clipped edges are connected by new edges that lie along the clip
volume’s boundary. Thus, clipping may require the introduction of new vertices
into a triangle, creating a more general polygon.

If it happens that a triangle intersects an edge of the clip volume’s boundary,

then the clipped triangle must include a point on this boundary edge.

A line segment or triangle whose vertices have wc values of differing signs may
generate multiple connected components after clipping. GL implementations are
not required to handle this situation. That is, only the portion of the primitive that
lies in the region of wc > 0 need be produced by clipping.

2.13.1 Clipping Varying Outputs

Next, vertex shader varying variables are clipped. The varying values associated
with a vertex that lies within the clip volume are unaffected by clipping. If a prim-
itive is clipped, however, the varying values assigned to vertices produced by clip-
ping are clipped values.

Let the varying values assigned to the two vertices P1 and P2 of an unclipped
edge be c1 and c2. The value of t (section 2.13) for a clipped point P is used to
obtain the value associated with P as3

c = tc1 + (1 ? t)c2.

3 Since this computation is performed in clip space before division by wc, clipped varying values

are perspective-correct.

Version 2.0.25 (November 2, 2010)

2.13. PRIMITIVE CLIPPING

47

(Multiplying a varying value by a scalar means multiplying each of x, y, z, and w
by the scalar.)

Polygon clipping may create a clipped vertex along an edge of the clip volume’s
boundary. This situation is handled by noting that polygon clipping proceeds by
clipping against one plane of the clip volume’s boundary at a time. Varying value
clipping is done in the same way, so that clipped points always occur at the intersec-
tion of polygon edges (possibly already clipped) with the clip volume’s boundary.

Version 2.0.25 (November 2, 2010)

Chapter 3

Rasterization

Rasterization is the process by which a primitive is converted to a two-dimensional
image. Each point of this image contains such information as color and depth.
Thus, rasterizing a primitive consists of two parts. The ?rst is to determine which
squares of an integer grid in window coordinates are occupied by the primitive.
The second is assigning a color and a depth value to each such square. The results
of this process are passed on to the next stage of the GL (per-fragment operations),
which uses the information to update the appropriate locations in the framebuffer.
Figure 3.1 diagrams the rasterization process. The color values assigned to a frag-
ment are determined by a fragment shader (as de?ned in section 3.8), which uses
varying values generated by rasterization operations (sections 3.3 through 3.6.2).
The ?nal depth value is determined by the rasterization operations. The results
from rasterizing a point, line, or polygon are routed through a fragment shader.

A grid square along with its parameters of assigned z (depth) and varying data
is called a fragment; the parameters are collectively dubbed the fragment’s asso-
ciated data. A fragment is located by its lower left corner, which lies on integer
grid coordinates. Rasterization operations also refer to a fragment’s center, which
is offset by (1/2, 1/2) from its lower left corner (and so lies on half-integer coor-
dinates).

Grid squares need not actually be square in the GL. Rasterization rules are not
affected by the actual aspect ratio of the grid squares. Display of non-square grids,
however, will cause rasterized points and line segments to appear fatter in one
direction than the other. We assume that fragments are square, since it simpli?es
antialiasing and texturing.

Several factors affect rasterization. Points may be given differing diameters and
line segments differing widths. Multisampling must be used to rasterize antialiased
primitives (see section 3.2).

48

3.1. INVARIANCE

49

Figure 3.1. Rasterization.

3.1

Invariance

Consider a primitive p(cid:48) obtained by translating a primitive p through an offset (x, y)
in window coordinates, where x and y are integers. As long as neither p(cid:48) nor p is
clipped, it must be the case that each fragment f (cid:48) produced from p(cid:48) is identical to
a corresponding fragment f from p except that the center of f (cid:48) is offset by (x, y)
from the center of f .

3.2 Multisampling

Multisampling is a mechanism to antialias all GL primitives: points, lines, and tri-
angles. The technique is to sample all primitives multiple times at each pixel. The
color sample values are resolved to a single, displayable color each time a pixel
is updated, so the antialiasing appears to be automatic at the application level.
Because each sample includes color, depth, and stencil information, the color (in-
cluding texture operation), depth, and stencil functions perform equivalently to the
single-sample mode.

An additional buffer, called the multisample buffer, is added to the framebuffer.
Pixel sample values, including color, depth, and stencil values, are stored in this
buffer. When the framebuffer includes a multisample buffer, it does not include

Version 2.0.25 (November 2, 2010)

PointRasterizationTriangleRasterizationLineRasterizationFragmentProgramFromPrimitiveAssemblyFragments3.2. MULTISAMPLING

50

depth or stencil buffers, even if the multisample buffer does not store depth or
stencil values. The color buffer coexists with the multisample buffer, however.

Multisample antialiasing is most valuable for rendering triangles, because it
requires no sorting for hidden surface elimination, and it correctly handles adjacent
triangles, object silhouettes, and even intersecting triangles.

If the value of SAMPLE_BUFFERS is one, the rasterization of all primitives
is changed, and is referred to as multisample rasterization. Otherwise, primitive
rasterization is referred to as single-sample rasterization. The value of SAMPLE_-
BUFFERS is queried by calling GetIntegerv with pname set to SAMPLE_BUFFERS.
During multisample rendering the contents of a pixel fragment are changed
in two ways. First, each fragment includes a coverage value with SAMPLES bits.
The value of SAMPLES is an implementation-dependent constant, and is queried by
calling GetIntegerv with pname set to SAMPLES.

Second, each fragment includes SAMPLES depth values, and sets of varying
values, instead of the single depth value and set of varying values that is main-
tained in single-sample rendering mode. An implementation may choose to assign
the same set of varying values to more than one sample. The location for evalu-
ating the varying values can be anywhere within the pixel including the fragment
center or any of the sample locations. The varying values need not be evaluated at
the same location . Each pixel fragment thus consists of integer x and y grid coor-
dinates, SAMPLES sets of varying values, and a coverage value with a maximum of
SAMPLES bits.

Multisample rasterization cannot be enabled or disabled after a GL context
is created. It is enabled if the value of SAMPLE_BUFFERS is one, and disabled
otherwise 1.

Multisample rasterization of all primitives differs substantially from single-
sample rasterization.
It is understood that each pixel in the framebuffer has
SAMPLES locations associated with it. These locations are exact positions, rather
than regions or areas, and each is referred to as a sample point. The sample points
associated with a pixel may be located inside or outside of the unit square that is
considered to bound the pixel. Furthermore, the relative locations of sample points
may be identical for each pixel in the framebuffer, or they may differ.

If the sample locations differ per pixel, they should be aligned to window, not
screen, boundaries. Otherwise rendering results will be window-position speci?c.
The invariance requirement described in section 3.1 is relaxed for all multisample
rasterization, because the sample locations may be a function of pixel location.

1When using EGL to create OpenGL ES context and surfaces, for example, multisample rasteri-
zation is enabled when the EGLCon?g used to create a context and surface supports a multisample
buffer.

Version 2.0.25 (November 2, 2010)

3.3. POINTS

51

It is not possible to query the actual sample locations of a pixel.

3.3 Points

Point size is taken from the shader builtin gl_PointSize and clamped to the
implementation-dependent point size range. If the value written to gl_PointSize
is less than or equal to zero, results are unde?ned. The range is determined by the
ALIASED_POINT_SIZE_RANGE and may be queried as described in chapter 6.
The maximum point size supported must be at least one.

Point rasterization produces a fragment for each framebuffer pixel whose cen-
ter lies inside a square centered at the point’s (xw, yw), with side length equal to
the point size.

All fragments produced in rasterizing a point are assigned the same associated
data, which are those of the vertex corresponding to the point. However, the gl_-
PointCoord fragment shader input de?nes a per-fragment coordinate space (s, t)
where s varies from 0 to 1 across the point horizontally left-to-right, and t ranges
from 0 to 1 across the point vertically top-to-bottom.

The following formulas are used to evaluate (s, t) values:

s =

t =

1
2

1
2

+

?

xf + 1

yf + 1

2 ? xw
size
2 ? yw
size

where size is the point’s size, xf and yf are the (integral) window coordinates
of the fragment, and xw and yw are the exact, unrounded window coordinates of
the vertex for the point.

3.3.1 Point Multisample Rasterization

If the value of SAMPLE_BUFFERS is one, then points are rasterized using the fol-
lowing algorithm. Point rasterization produces a fragment for each framebuffer
pixel with one or more sample points that intersect a region centered at the point’s
(xw, yw). This region is a square with side length equal to the point size. Coverage
bits that correspond to sample points that intersect the region are 1, other cover-
age bits are 0. All data associated with each sample for the fragment are the data
associated with the point being rasterized.

The set of point sizes supported is equivalent to those for points without multi-

sample.

Version 2.0.25 (November 2, 2010)

3.4. LINE SEGMENTS

52

3.4 Line Segments

A line segment results from a line strip, a line loop, or a series of separate line
segments. Line width may be set by calling

void LineWidth( float width );

with an appropriate positive width to control the width of rasterized line seg-
ments. The default width is 1.0. Values less than or equal to 0.0 generate the
error INVALID_VALUE.

3.4.1 Basic Line Segment Rasterization

Line segment rasterization begins by characterizing the segment as either x-major
or y-major. x-major line segments have slope in the closed interval [?1, 1]; all
other line segments are y-major (slope is determined by the segment’s endpoints).
We shall specify rasterization only for x-major segments except in cases where the
modi?cations for y-major segments are not self-evident.

Ideally, the GL uses a “diamond-exit” rule to determine those fragments that
are produced by rasterizing a line segment. For each fragment f with center at win-
dow coordinates xf and yf , de?ne a diamond-shaped region that is the intersection
of four half planes:

Rf = { (x, y) | |x ? xf | + |y ? yf | < 1/2.}

Essentially, a line segment starting at pa and ending at pb produces those frag-
ments f for which the segment intersects Rf , except if pb is contained in Rf . See
?gure 3.2.

To avoid dif?culties when an endpoint lies on a boundary of Rf we (in princi-
ple) perturb the supplied endpoints by a tiny amount. Let pa and pb have window
coordinates (xa, ya) and (xb, yb), respectively. Obtain the perturbed endpoints p(cid:48)
a
given by (xa, ya) ? ((cid:15), (cid:15)2) and p(cid:48)
b given by (xb, yb) ? ((cid:15), (cid:15)2). Rasterizing the line
segment starting at pa and ending at pb produces those fragments f for which the
segment starting at p(cid:48)
b is contained in
Rf . (cid:15) is chosen to be so small that rasterizing the line segment produces the same
fragments when ? is substituted for (cid:15) for any 0 < ? ? (cid:15).

b intersects Rf , except if p(cid:48)

a and ending on p(cid:48)

When pa and pb lie on fragment centers, this characterization of fragments
reduces to Bresenham’s algorithm with one modi?cation: lines produced in this
description are “half-open,” meaning that the ?nal fragment (corresponding to pb)
is not drawn. This means that when rasterizing a series of connected line segments,

Version 2.0.25 (November 2, 2010)

3.4. LINE SEGMENTS

53

Figure 3.2. Visualization of Bresenham’s algorithm. A portion of a line segment is
shown. A diamond shaped region of height 1 is placed around each fragment center;
those regions that the line segment exits cause rasterization to produce correspond-
ing fragments.

shared endpoints will be produced only once rather than twice (as would occur with
Bresenham’s algorithm).

Because the initial and ?nal conditions of the diamond-exit rule may be dif?cult
to implement, other line segment rasterization algorithms are allowed, subject to
the following rules:

1. The coordinates of a fragment produced by the algorithm may not deviate by
more than one unit in either x or y window coordinates from a corresponding
fragment produced by the diamond-exit rule.

2. The total number of fragments produced by the algorithm may differ from

that produced by the diamond-exit rule by no more than one.

3. For an x-major line, no two fragments may be produced that lie in the same
window-coordinate column (for a y-major line, no two fragments may ap-
pear in the same row).

4. If two line segments share a common endpoint, and both segments are either
x-major (both left-to-right or both right-to-left) or y-major (both bottom-to-
top or both top-to-bottom), then rasterizing both segments may not produce

Version 2.0.25 (November 2, 2010)

(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:1)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:2)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:3)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:4)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:5)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:6)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:7)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:8)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:9)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:10)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:11)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:12)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:13)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:14)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:15)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:16)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:17)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:18)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:19)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:20)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:21)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:22)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:23)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)(cid:24)3.4. LINE SEGMENTS

54

duplicate fragments, nor may any fragments be omitted so as to interrupt
continuity of the connected segments.

Next we must specify how the data associated with each rasterized fragment
are obtained. Let the window coordinates of a produced fragment center be given
by pr = (xd, yd) and let pa = (xa, ya) and pb = (xb, yb). Set

t =

(pr ? pa) · (pb ? pa)
(cid:107)pb ? pa(cid:107)2

.

(3.1)

(Note that t = 0 at pa and t = 1 at pb.) The value of an associated datum f for
the fragment, whether it be the clip w coordinate or an element of a vertex shader
varying output, is found as

f =

(1 ? t)fa/wa + tfb/wb
(1 ? t)/wa + t/wb

(3.2)

where fa and fb are the data associated with the starting and ending endpoints of
the segment, respectively; wa and wb are the clip w coordinates of the starting and
ending endpoints of the segments, respectively. However, the depth value, window
z, must be found using linear interpolation:

f = (1 ? t)fa + tfb.

(3.3)

3.4.2 Other Line Segment Features

We have just described the rasterization of non-antialiased line segments of width
one. We now describe the rasterization of line segments for general values of the
line segment rasterization parameters.

Wide Lines

The actual width of non-antialiased lines is determined by rounding the supplied
width to the nearest integer, then clamping it to the implementation-dependent
maximum non-antialiased line width. This implementation-dependent value must
be no less than one. If rounding the speci?ed width results in the value 0, then it is
as if the value were 1.

Non-antialiased line segments of width other than one are rasterized by off-
setting them in the minor direction (for an x-major line, the minor direction is
y, and for a y-major line, the minor direction is x) and replicating fragments in
the minor direction (see ?gure 3.3). Let w be the width rounded to the nearest
integer (if w = 0, then it is as if w = 1).
If the line segment has endpoints

Version 2.0.25 (November 2, 2010)

3.4. LINE SEGMENTS

55

Figure 3.3. Rasterization of non-antialiased wide lines. x-major line segments are
shown. The heavy line segment is the one speci?ed to be rasterized; the light seg-
ment is the offset segment used for rasterization. x marks indicate the fragment
centers produced by rasterization.

given by (x0, y0) and (x1, y1) in window coordinates, the segment with endpoints
(x0, y0 ? (w ? 1)/2) and (x1, y1 ? (w ? 1)/2) is rasterized, but instead of a single
fragment, a column of fragments of height w (a row of fragments of length w for
a y-major segment) is produced at each x (y for y-major) location. The lowest
fragment of this column is the fragment that would be produced by rasterizing the
segment of width 1 with the modi?ed coordinates.

3.4.3 Line Rasterization State

The state required for line rasterization consists of the ?oating-point line width.
The initial value of the line width is 1.0.

3.4.4 Line Multisample Rasterization

If the value of SAMPLE_BUFFERS is one, then lines are rasterized using the follow-
ing algorithm.
line rasterization produces a fragment for each framebuffer pixel
with one or more sample points that intersect a rectangle centered on the line seg-
ment (see ?gure 3.4). Two of the edges are parallel to the speci?ed line segment;
each is at a distance of one-half the line width from that segment: one above the

Version 2.0.25 (November 2, 2010)

width = 2width = 33.5. POLYGONS

56

Figure 3.4. The region used in rasterizing a multisampled line segment (an x-major
line segment is shown).

segment and one below it. The other two edges pass through the line endpoints and
are perpendicular to the direction of the speci?ed line segment.

Coverage bits that correspond to sample points that intersect a retained rectan-
gle are 1, other coverage bits are 0. Vertex shader varying outputs and depth are
interpolated by substituting the corresponding sample location into equation 3.1,
then using the result to evaluate equation 3.2. An implementation may choose to
assign the same varying values to more than one sample.

Not all widths need be supported for multisampled line segments, but width
1.0 segments must be provided. As with the point width, the GL implementation
may be queried for the range and number of gradations of available multisampled
line widths.

3.5 Polygons

A polygon results from a triangle strip, triangle fan, or series of separate trian-
gles. Like points and line segments, polygon rasterization is controlled by several
variables.

Version 2.0.25 (November 2, 2010)

(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)(cid:0)3.5. POLYGONS

57

3.5.1 Basic Polygon Rasterization

The ?rst step of polygon rasterization is to determine if the polygon is back facing
or front facing. This determination is made based on the sign of the (clipped or
unclipped) polygon’s area computed in window coordinates. One way to compute
this area is

a =

1
2

n?1
(cid:88)

i=0

wyi?1
xi

w ? xi?1

w yi
w

(3.4)

where xi

w and yi

w are the x and y window coordinates of the ith vertex of
the n-vertex polygon (vertices are numbered starting at zero for purposes of this
computation) and i?1 is (i+1) mod n. The interpretation of the sign of this value
is controlled with

void FrontFace( enum dir );

Setting dir to CCW (corresponding to counter-clockwise orientation of the pro-
jected polygon in window coordinates) indicates that the sign of a should be re-
versed prior to use. Setting dir to CW (corresponding to clockwise orientation)
uses the sign of a is as computed above. Front face determination requires one bit
of state, and is initially set to CCW.

If the sign of the area computed by equation 3.4 (including the possible reversal
of this sign as indicated by the last call to FrontFace) is positive, the polygon is
front facing; otherwise, it is back facing. This determination is used in conjunction
with the CullFace enable bit and mode value to decide whether or not a particular
polygon is rasterized. The CullFace mode is set by calling

void CullFace( enum mode );

mode is a symbolic constant: one of FRONT, BACK or FRONT_AND_BACK. Culling
is enabled or disabled with Enable or Disable using the symbolic constant CULL_-
FACE. Front facing polygons are rasterized if either culling is disabled or the Cull-
Face mode is BACK while back facing polygons are rasterized only if either culling
is disabled or the CullFace mode is FRONT. The initial setting of the CullFace
mode is BACK. Initially, culling is disabled.

The rule for determining which fragments are produced by polygon rasteriza-
tion is called point sampling. The two-dimensional projection obtained by taking
the x and y window coordinates of the polygon’s vertices is formed. Fragment
centers that lie inside of this polygon are produced by rasterization. Special treat-
ment is given to a fragment whose center lies on a polygon boundary edge. In

Version 2.0.25 (November 2, 2010)

3.5. POLYGONS

58

such a case we require that if two polygons lie on either side of a common edge
(with identical endpoints) on which a fragment center lies, then exactly one of the
polygons results in the production of the fragment during rasterization.

As for the data associated with each fragment produced by rasterizing a poly-
gon, we begin by specifying how these values are produced for fragments in a
triangle. De?ne barycentric coordinates for a triangle. Barycentric coordinates are
a set of three numbers, a, b, and c, each in the range [0, 1], with a + b + c = 1.
These coordinates uniquely specify any point p within the triangle or on the trian-
gle’s boundary as

p = apa + bpb + cpc,

where pa, pb, and pc are the vertices of the triangle. a, b, and c can be found as

a =

A(ppbpc)
A(papbpc)

,

b =

A(ppapc)
A(papbpc)

,

c =

A(ppapb)
A(papbpc)

,

where A(lmn) denotes the area in window coordinates of the triangle with vertices
l, m, and n.

Denote a datum at pa, pb, or pc as fa, fb, or fc, respectively. Then the value f

of a datum at a fragment produced by rasterizing a triangle is given by

f =

afa/wa + bfb/wb + cfc/wc
a/wa + b/wb + c/wc

(3.5)

where wa, wb and wc are the clip w coordinates of pa, pb, and pc, respectively.
a, b, and c are the barycentric coordinates of the fragment for which the data are
produced. a, b, and c must correspond precisely to the exact coordinates of the
center of the fragment. Another way of saying this is that the data associated with
a fragment must be sampled at the fragment’s center.

Just as with line segment rasterization, the depth value, window z, must be

found using linear interpolation:

f = afa + bfb + cfc

3.5.2 Depth Offset

The depth values of all fragments generated by the rasterization of a polygon may
be offset by a single value that is computed for that polygon. The function that
determines this value is speci?ed by calling

void PolygonOffset( float factor, float units );

Version 2.0.25 (November 2, 2010)

3.5. POLYGONS

59

factor scales the maximum depth slope of the polygon, and units scales an
implementation-dependent constant that relates to the usable resolution of the
depth buffer. The resulting values are summed to produce the polygon offset value.
Both factor and units may be either positive or negative.

The maximum depth slope m of a triangle is

m =

(cid:115)(cid:18) ?zw
?xw

(cid:19)2

(cid:19)2

+

(cid:18) ?zw
?yw

where (xw, yw, zw) is a point on the triangle. m may be approximated as

m = max

(cid:26)(cid:12)
(cid:12)
(cid:12)
(cid:12)

?zw
?xw

(cid:12)
(cid:12)
(cid:12)
(cid:12)

,

(cid:12)
(cid:12)
(cid:12)
(cid:12)

?zw
?yw

(cid:12)
(cid:27)
(cid:12)
(cid:12)
(cid:12)

.

(3.6)

(3.7)

The minimum resolvable difference r is an implementation-dependent con-
stant. It is the smallest difference in window coordinate z values that is guaranteed
to remain distinct throughout polygon rasterization and in the depth buffer. All
pairs of fragments generated by the rasterization of two polygons with otherwise
identical vertices, but zw values that differ by r, will have distinct depth values.

The offset value o for a polygon is

o = m ? factor + r ? units.

(3.8)

m is computed as described above, as a function of depth values in the range [0,1],
and o is applied to depth values in the same range.

Boolean state value POLYGON_OFFSET_FILL determines whether o is applied
during the rasterization of polygons. This boolean state value is enabled and dis-
abled using the commands Enable and Disable. If POLYGON_OFFSET_FILL is
enabled, o is added to the depth value of each fragment produced by the rasteriza-
tion of a polygon.

Fragment depth values are always limited to the range [0,1], either by clamping
after offset addition is performed (preferred), or by clamping the vertex values used
in the rasterization of the polygon.

3.5.3 Polygon Multisample Rasterization

If the value of SAMPLE_BUFFERS is one, then polygons are rasterized using the
following algorithm. Polygon rasterization produces a fragment for each frame-
buffer pixel with one or more sample points that satisfy the point sampling criteria
described in section 3.5.1, including the special treatment for sample points that lie
on a polygon boundary edge. If a polygon is culled, based on its orientation and
the CullFace mode, then no fragments are produced during rasterization.

Version 2.0.25 (November 2, 2010)

3.6. PIXEL RECTANGLES

60

Coverage bits that correspond to sample points that satisfy the point sampling
criteria are 1, other coverage bits are 0. Vertex shader varying outputs and depth are
interpolated by substituting the corresponding sample location into the barycentric
equations described in section 3.5.1, using equation 3.5 or its approximation that
omits w components. An implementation may choose to assign the same set of
varying values to more than one sample by barycentric evaluation using any loca-
tion within the pixel including the fragment center or one of the sample locations.

3.5.4 Polygon Rasterization State

The state required for polygon rasterization consists of the factor and bias values
of the polygon offset equation. The initial polygon offset factor and bias values are
both 0; initially polygon offset is disabled.

3.6 Pixel Rectangles

Rectangles of color values may be speci?ed to the GL using TexImage2D and
related commands described in section 3.7.1. Some of the parameters and opera-
tions governing the operation of TexImage2D are shared by ReadPixels (used to
obtain pixel values from the framebuffer); the discussion of ReadPixels, however,
is deferred until section 4.3, after the framebuffer has been discussed in detail.
Nevertheless, we note in this section when parameters and state pertaining to Tex-
Image2D also pertain to ReadPixels.

This section describes only how these rectangles are de?ned in client memory,
and the steps involved in transferring pixel rectangles from client memory to the
GL or vice-versa.

Parameters controlling the encoding of pixels in client memory (for reading

and writing) are set with the command PixelStorei.

3.6.1 Pixel Storage Modes

Pixel storage modes affect the operation of TexImage2D and ReadPixels (as well
as other commands; see section 3.7) when one of these commands is issued. Pixel
storage modes are set with the command

void PixelStorei( enum pname, T param );

pname is a symbolic constant indicating a parameter to be set, and param is the
value to set it to. Table 3.1 summarizes the pixel storage parameters, their types,
their initial values, and their allowable ranges. Setting a parameter to a value out-
side the given range results in the error INVALID_VALUE.

Version 2.0.25 (November 2, 2010)

3.6. PIXEL RECTANGLES

61

Parameter Name

UNPACK_ALIGNMENT

Type
integer

Initial Value Valid Range

4

1,2,4,8

Table 3.1: PixelStore parameters pertaining to one or more of TexImage2D, and
TexSubImage2D.

Figure 3.5. Transfer of pixel rectangles to the GL. Output is RGBA pixels.

3.6.2 Transfer of Pixel Rectangles

The process of transferring pixels encoded in client memory to the GL is dia-
grammed in ?gure 3.5. We describe the stages of this process in the order in which
they occur.

Commands accepting or returning pixel rectangles take the following argu-

ments (as well as additional arguments speci?c to their function):

format is a symbolic constant indicating what the values in memory represent.
width and height are the width and height, respectively, of the pixel rectangle

to be drawn.

data is a pointer to the data to be drawn. These data are represented with one
of two GL data types, speci?ed by type. The correspondence between the four type

Version 2.0.25 (November 2, 2010)

Unpackbyte, short, or packedpixel component data streamConvert to FloatConvert L to RGBClamp to [0,1]RGBA pixel data outPixel StorageOperationsFinalConversion3.6. PIXEL RECTANGLES

62

type Parameter
Token Name

UNSIGNED_BYTE
UNSIGNED_SHORT_5_6_5
UNSIGNED_SHORT_4_4_4_4
UNSIGNED_SHORT_5_5_5_1

Corresponding
GL Data Type
ubyte
ushort
ushort
ushort

Special
Interpretation
No
Yes
Yes
Yes

Table 3.2: TexImage2D and ReadPixels type parameter values and the corre-
sponding GL data types. Refer to table 2.2 for de?nitions of GL data types. Special
interpretations are described near the end of section 3.6.2. ReadPixels accepts only
a subset of these types (see section 4.3.1).

Format Name

Element Meaning and Order Target Buffer

ALPHA
RGB
RGBA
LUMINANCE
LUMINANCE_ALPHA

A
R, G, B
R, G, B, A
Luminance
Luminance, A

Color
Color
Color
Color
Color

Table 3.3: TexImage2D and ReadPixels formats. The second column gives a de-
scription of and the number and order of elements in a group. ReadPixels accepts
only a subset of these formats (see section 4.3.1).

token values and the GL data types they indicate is given in table 3.2.

Unpacking

Data are taken from client memory as a sequence of unsigned bytes or unsigned
shorts (GL data types ubyte and ushort). These elements are grouped into
sets of one, two, three, or four values, depending on the format, to form a group.
Table 3.3 summarizes the format of groups obtained from memory.

The values of each GL data type are interpreted as they would be speci?ed in

the language of the client’s GL binding.

Not all combinations of format and type are valid. The combinations accepted
by the GL are de?ned in table 3.4. Additional restrictions may be imposed by
speci?c commands.

The groups in memory are treated as being arranged in a rectangle. This rect-
angle consists of a series of rows, with the ?rst element of the ?rst group of the ?rst

Version 2.0.25 (November 2, 2010)

3.6. PIXEL RECTANGLES

63

Format

Type

RGBA
RGB
RGBA
RGBA
RGB
LUMINANCE_ALPHA
LUMINANCE
ALPHA

UNSIGNED_BYTE
UNSIGNED_BYTE
UNSIGNED_SHORT_4_4_4_4
UNSIGNED_SHORT_5_5_5_1
UNSIGNED_SHORT_5_6_5
UNSIGNED_BYTE
UNSIGNED_BYTE
UNSIGNED_BYTE

Bytes per Pixel
4
3
2
2
2
2
1
1

Table 3.4: Valid pixel format and type combinations.

row pointed to by the data pointer passed to TexImage2D. The number of groups
in a row is width; If p indicates the location in memory of the ?rst element of the
?rst row, then the ?rst element of the N th row is indicated by

where N is the row number (counting from zero) and k is de?ned as

p + N k

k =

(cid:26) nl

s ? a,
a/s (cid:100)snl/a(cid:101) s < a

(3.9)

(3.10)

where n is the number of elements in a group, l is the number of groups in
the row, a is the value of UNPACK_ALIGNMENT, and s is the size, in units of GL
ubytes, of an element. If the number of bits per element is not 1, 2, 4, or 8 times
the number of bits in a GL ubyte, then k = nl for all values of a.

A type of UNSIGNED_SHORT_5_6_5, UNSIGNED_SHORT_4_4_4_4, or
UNSIGNED_SHORT_5_5_5_1 is a special case in which all the components of
each group are packed into a single unsigned short. The number of components
per packed pixel is ?xed by the type, and must match the number of components
per group indicated by the format parameter, as listed in table 3.5. The error
INVALID_OPERATION is generated if a mismatch occurs. This constraint also
holds for all other functions that accept or return pixel data using type and format
parameters to de?ne the type and format of that data.

Bit?eld locations of the ?rst, second, third, and fourth components of each
packed pixel type are illustrated in table 3.6. Each bit?eld is interpreted as an un-
signed integer value. If the base GL type is supported with more than the minimum
precision (e.g. a 9-bit byte) the packed components are right-justi?ed in the pixel.

Version 2.0.25 (November 2, 2010)

3.6. PIXEL RECTANGLES

64

type Parameter
Token Name

UNSIGNED_SHORT_5_6_5
UNSIGNED_SHORT_4_4_4_4
UNSIGNED_SHORT_5_5_5_1

GL Data
Type
ushort
ushort
ushort

Number of
Components
3
4
4

Matching
Pixel Formats

RGB
RGBA
RGBA

Table 3.5: Packed pixel formats.

Components are packed with the ?rst component in the most signi?cant bits
of the bit?eld, and successive component occupying progressively less signi?cant
locations. The most signi?cant bit of each component is packed in the most signif-
icant bit location of its location in the bit?eld.

UNSIGNED_SHORT_5_6_5:

15

14

13

12

11

10

9

8

7

6

5

4

3

2

1

0

1st Component

2nd

3rd

UNSIGNED_SHORT_4_4_4_4:

15

14

13

12

11

10

9

8

7

6

5

4

3

2

1

0

1st Component

2nd

3rd

4th

UNSIGNED_SHORT_5_5_5_1:

15

14

13

12

11

10

9

8

7

6

5

4

3

2

1

0

1st Component

2nd

3rd

4th

Table 3.6: UNSIGNED_SHORT formats

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

65

Format

First

Second

Third

Fourth

Component Component Component Component

RGB
RGBA

red
red

green
green

blue
blue

alpha

Table 3.7: Packed pixel ?eld assignments.

The assignment of component to ?elds in the packed pixel is as described in

table 3.7

The above discussions of row length and image extraction are valid for packed
pixels, if “group” is substituted for “component” and the number of components
per group is understood to be one.

Conversion to ?oating-point

Each element in a group is converted to a ?oating-point value according to the
appropriate formula as described in section 2.1.2 for the corresponding integer,
unsigned integer, or unsigned integer bit?eld type of that element.

Conversion to RGB

This step is applied only if the format is LUMINANCE or LUMINANCE_ALPHA. If
the format is LUMINANCE, then each group of one element is converted to a group
of R, G, and B (three) elements by copying the original single element into each of
the three new elements. If the format is LUMINANCE_ALPHA, then each group of
two elements is converted to a group of R, G, B, and A (four) elements by copying
the ?rst original element into each of the ?rst three new elements and copying the
second original element to the A (fourth) new element.

Final Expansion to RGBA

Each group is converted to a group of 4 elements as follows: if a group does not
contain an A element, then A is added and set to 1.0. If any of R, G, or B is missing
from the group, each missing element is added and assigned a value of 0.0.

3.7 Texturing

Texture lookups map a portion of one or more speci?ed images onto a fragment
or vertex. This mapping is accomplished in shaders by sampling the color of an

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

66

image at the location indicated by speci?ed (s, t, r) texture coordinates. Texture
lookups are typically used to modify a fragment’s RGBA color but may be used
for any purpose in a shader.

Shaders support texturing using at least MAX_VERTEX_TEXTURE_IMAGE_-
UNITS images for vertex shaders (see section 2.10.5) and at least MAX_TEXTURE_-
IMAGE_UNITS images for fragment shaders (see section 3.8.2). Multiple sets of
texture coordinates may be speci?ed in generic vertex attributes or computed by
the shader; these coordinates are used to sample separate images.

The following subsections (up to and including section 3.7.7) specify GL op-
eration with a single texture, including speci?cation of the image to be texture
mapped and the means by which the image is ?ltered when sampled. The opera-
tions described here are applied separately for each texture sampled by a shader.

The details of sampling a texture within a shader are described in the OpenGL

ES Shading Language Speci?cation.

The command

void ActiveTexture( enum texture );

speci?es the active texture image unit selector, ACTIVE_TEXTURE. Each texture
image unit consists of all the texture state de?ned in section 3.7.

The active texture unit selector selects the texture image unit accessed by
commands involving texture image processing de?ned in section 3.7. Such
commands include all variants of TexImage commands, BindTexture, and
If the texture image unit number corresponding
queries of all such state.
to the current value of ACTIVE_TEXTURE is greater than or equal
to the
implementation-dependent constant MAX_COMBINED_TEXTURE_IMAGE_UNITS,
the error INVALID_OPERATION is generated by any such command.

ActiveTexture generates the error INVALID_ENUM if an invalid texture is spec-
i?ed. texture is a symbolic constant of the form TEXTUREi, indicating that texture
image unit i is to be modi?ed. The constants obey TEXTUREi = TEXTURE0 + i,
where i is in the range 0 to MAX_COMBINED_TEXTURE_IMAGE_UNITS ? 1.

The state required for the active texture image unit selector is a single integer.

The initial value is TEXTURE0.

3.7.1 Texture Image Speci?cation

The command

void TexImage2D( enum target, int level,

int internalformat, sizei width, sizei height,
int border, enum format, enum type, void *data );

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

67

is used to specify a texture image. target must be one of TEXTURE_2D for a two-
dimensional texture, or one of TEXTURE_CUBE_MAP_POSITIVE_X, TEXTURE_-
CUBE_MAP_NEGATIVE_X,
TEXTURE_CUBE_MAP_POSITIVE_-
Y, TEXTURE_CUBE_MAP_NEGATIVE_Y, TEXTURE_CUBE_MAP_POSITIVE_Z, or
format, type, and
TEXTURE_CUBE_MAP_NEGATIVE_Z for a cube map texture.
data specify the format of the image data, the type of those data, and a pointer to
the image data in client memory, as described in section 3.6.2.

A two-dimensional texture consists of a single two-dimensional texture image.
A cube map texture is a set of six two-dimensional texture images. The six cube
map texture targets form a single cube map texture though each target names a
distinct face of the cube map. The TEXTURE_CUBE_MAP_* targets listed above
update their appropriate cube map face 2D texture image. Note that the six cube
map two-dimensional image tokens such as TEXTURE_CUBE_MAP_POSITIVE_X
are used when specifying, updating, or querying one of a cube map’s six two-
dimensional images, but when enabling cube map texturing or binding to a cube
map texture object (that is when the cube map is accessed as a whole as opposed to
a particular two-dimensional image), the TEXTURE_CUBE_MAP target is speci?ed.
When the target parameter to TexImage2D is one of the six cube map two-
dimensional image targets, the error INVALID_VALUE is generated if the width
and height parameters are not equal.

The groups in memory are treated as being arranged in a rectangle. The rectan-
gle is an image, whose size and organization are speci?ed by the width and height
parameters to TexImage2D.

The selected groups are processed as described in section 3.6.2, stopping after
?nal expansion to RGBA. Each R, G, B, or A value so generated is clamped to
[0, 1].

Components are then selected from the resulting R, G, B, or A values to obtain
a texture with the base internal format speci?ed by internalformat, which must
match format; no conversions between formats are supported during texture im-
age processing.2 Table 3.8 summarizes the mapping of R, G, B, and A values to
texture components, as a function of the base internal format of the texture image.
internalformat may be one of the ?ve internal format symbolic constants listed in
table 3.8. Specifying a value for internalformat that is not one of the above values
generates the error INVALID_VALUE. If internalformat does not match format, the
error INVALID_OPERATION is generated.

2When a non-RGBA format and internalformat are speci?ed, implementations are not required to
actually create and then discard unnecessary R, G, B, or A components. The abstract model de?ned
by section 3.6.2 is used only for consistency and ease of description.

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

68

Base Internal Format RGBA

ALPHA
LUMINANCE
LUMINANCE_ALPHA
RGB
RGBA

Internal Components
A
L
L,A
R,G,B

A
R
R,A
R,G,B
R,G,B,A R,G,B,A

Table 3.8: Conversion from RGBA pixel components to internal texture compo-
nents. Texture components R, G, B, A, and L are converted back to RGBA colors
during ?ltering as shown in table 3.12.

The GL stores the resulting texture with internal component resolutions of its
own choosing. The allocation of internal component resolution may vary based
on any TexImage2D parameter (except target), but the allocation must not be a
function of any other state and cannot be changed once established. Allocation
must be invariant; the same allocation must be chosen each time a texture image is
speci?ed with the same parameter values.

The image itself (pointed to by data) is a sequence of groups of values. The
?rst group is the lower left corner of the texture image. Subsequent groups ?ll
out rows of width width from left to right; height rows are stacked from bottom
to top forming the image. When the ?nal R, G, B, and A components have been
computed for a group, they are assigned to components of a texel as described by
table 3.8. Counting from zero, each resulting N th texel is assigned internal integer
coordinates (i, j), where

i = (N mod width)

j = ((cid:98)

N
width

(cid:99) mod height)

Thus the last row of the image is indexed with the highest value of j.

Each color component is converted (by rounding to nearest) to a ?xed-point
value with n bits, where n is the number of bits of storage allocated to that com-
ponent in the image array. We assume that the ?xed-point representation used
represents each value k/(2n ? 1), where k ? {0, 1, . . . , 2n ? 1}, as k (e.g. 1.0 is
represented in binary as a string of all ones).

The level argument to TexImage2D is an integer level-of-detail number. Levels
of detail are discussed below, under Mipmapping. The main texture image has a
level of detail number of 0 and is known as the level zero array (or the image array
of level zero). If level is less than zero, the error INVALID_VALUE is generated. If

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

69

level is greater than zero, and either width or height is not a power of two, the error
INVALID_VALUE is generated.

If the border argument to TexImage2D is not zero, then the error INVALID_-

VALUE is generated.

If wt and ht are the speci?ed image width and height, and if either wt or ht are

less than zero, then the error INVALID_VALUE is generated.

The maximum allowable width and height of a two-dimensional texture image
must be at least 2k?lod for image arrays of level zero through k, where k is the log
base 2 of MAX_TEXTURE_SIZE. and lod is the level-of-detail of the image array.
It may be zero for image arrays of any level-of-detail greater than k. The error
INVALID_VALUE is generated if the speci?ed image is too large to be stored under
any conditions.

The maximum allowable width and height of a cube map texture must be the
same, and must be at least 2k?lod for image arrays of level zero through k, where
k is the log base 2 of MAX_CUBE_MAP_TEXTURE_SIZE.

An implementation may allow an image array of level zero to be created only if
that single image array can be supported. Additional constraints on the creation of
image arrays of level one or greater are described in more detail in section 3.7.10.
The image indicated to the GL by the image pointer is decoded and copied into

the GL’s internal memory.

We shall refer to the decoded image as the texture array. A texture array has

width and height wt and ht as de?ned above.

An element (i, j) of the texture array is called a texel. The texture value used in
texturing a fragment is determined by that fragment’s associated (s, t) coordinates,
but does not necessarily correspond to any actual texel. See ?gure 3.6.

If the data argument of TexImage2D is a null pointer (a zero-valued pointer
in the C implementation), a texture array is created with the speci?ed target, level,
internalformat, width, and height, but with unspeci?ed image contents.
In this
case no pixel values are accessed in client memory, and no pixel processing is
performed. Errors are generated, however, exactly as though the data pointer were
valid.

3.7.2 Alternate Texture Image Speci?cation Commands

Texture images may also be speci?ed using image data taken directly from the
framebuffer, and rectangular subregions of existing texture images may be respec-
i?ed.

The command

void CopyTexImage2D( enum target, int level,

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

70

Figure 3.6. A texture image and the coordinates used to access it. This is a texture
with wt = 8 and ht = 4. ? and ?, values used in blending adjacent texels to obtain
a texture value, are also shown.

Version 2.0.25 (November 2, 2010)

012345670123iut0.01.0vj4.00.08.00.0s1.00.0??3.7. TEXTURING

71

Texture Format

Color Buffer A L LA RGB RGBA
A
RGB
RGBA

–
–

–
–

–
(cid:8)

–

–

(cid:8)
(cid:8) (cid:8) (cid:8)

(cid:8)
(cid:8)

(cid:8)

Table 3.9: CopyTexImage internal format/color buffer combinations.

enum internalformat, int x, int y, sizei width,
sizei height, int border );

de?nes a texture array in exactly the manner of TexImage2D, except that the im-
target
age data are taken from the framebuffer rather than from client memory.
must be one of TEXTURE_2D, TEXTURE_CUBE_MAP_POSITIVE_X, TEXTURE_-
CUBE_MAP_NEGATIVE_X,
TEXTURE_CUBE_MAP_POSITIVE_-
Y, TEXTURE_CUBE_MAP_NEGATIVE_Y, TEXTURE_CUBE_MAP_POSITIVE_Z, or
TEXTURE_CUBE_MAP_NEGATIVE_Z. x, y, width, and height correspond precisely
to the corresponding arguments to ReadPixels (refer to section 4.3.1); they specify
the image’s width and height, and the lower left (x, y) coordinates of the frame-
buffer region to be copied. The image is taken from the color buffer of the frame-
buffer exactly as if these arguments were passed to ReadPixels with argument for-
mat set to RGBA, stopping after conversion of RGBA values. Subsequent processing
is identical to that described for TexImage2D, beginning with clamping of the R,
G, B, and A values from the resulting pixel groups. Parameters level, internalfor-
mat, and border are speci?ed using the same values, with the same meanings, as the
equivalent arguments of TexImage2D. internalformat is further constrained such
that color buffer components can be dropped during the conversion to internalfor-
mat, but new components cannot be added. For example, an RGB color buffer can
be used to create LUMINANCE or RGB textures, but not ALPHA, LUMINANCE_ALPHA,
or RGBA textures. Table 3.9 summarizes the allowable framebuffer and base inter-
nal format combinations. If the framebuffer format is not compatible with the base
texture format, an INVALID_OPERATION error is generated. The constraints on
width, height, and border are exactly those for the equivalent arguments of TexIm-
age2D.

When the target parameter to CopyTexImage2D is one of the six cube map
two-dimensional image targets, the error INVALID_VALUE is generated if the width
and height parameters are not equal.
Two additional commands,

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

72

void TexSubImage2D( enum target, int level, int xoffset,
int yoffset, sizei width, sizei height, enum format,
enum type, void *data );

void CopyTexSubImage2D( enum target, int level,

int xoffset, int yoffset, int x, int y, sizei width,
sizei height );

respecify only a rectangular subregion of an existing texture array. No change
is made to the internalformat, width, or height, parameters of the speci?ed tex-
ture array, nor is any change made to texel values outside the speci?ed subre-
gion. The target arguments of TexSubImage2D and CopyTexSubImage2D must
be one of TEXTURE_2D, TEXTURE_CUBE_MAP_POSITIVE_X, TEXTURE_CUBE_-
MAP_NEGATIVE_X,
TEXTURE_CUBE_MAP_POSITIVE_-
Y, TEXTURE_CUBE_MAP_NEGATIVE_Y, TEXTURE_CUBE_MAP_POSITIVE_Z, or
TEXTURE_CUBE_MAP_NEGATIVE_Z. The level parameter of each command spec-
If level is less than zero or
i?es the level of the texture array that is modi?ed.
greater than the base 2 logarithm of the maximum texture width or height, the error
INVALID_VALUE is generated.

TexSubImage2D arguments width, height, format, type, and data match the
corresponding arguments to TexImage2D, meaning that they are speci?ed using
the same values, and have the same meanings.

CopyTexSubImage2D arguments x, y, width, and height match the corre-
sponding arguments to CopyTexImage2D. Each of the TexSubImage commands
interprets and processes pixel groups in exactly the manner of its TexImage coun-
terpart, except that the assignment of R, G, B, and A pixel group values to the
texture components is controlled by the internalformat of the texture array, not
by an argument to the command. The same constraints and errors apply to the
TexSubImage commands’ argument format and the internalformat of the texture
array being respeci?ed as apply to the format and internalformat arguments of its
TexImage counterparts.

Arguments xoffset and yoffset of TexSubImage2D and CopyTexSubImage2D
specify the lower left texel coordinates of a width-wide by height-high rectangular
subregion of the texture array, address as in ?gure 3.6. Taking wt and ht to be
the speci?ed width and height of the texture array, and taking x, y, w, and h to
be the xoffset, yoffset, width, and height argument values, any of the following
relationships generates the error INVALID_VALUE:

x < 0

x + w > wt

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

73

y < 0

y + h > ht

Counting from zero, the nth pixel group is assigned to the texel with internal integer
coordinates [i, j], where

j = y + ((cid:98)

i = x + (n mod w)
n
w
or

(cid:99) mod h)

Calling

CopyTexImage2D

will
result in an INVALID_FRAMEBUFFER_OPERATION error if the object bound to
FRAMEBUFFER_BINDING is not framebuffer complete (see section 4.4.5).

CopyTexSubImage2D

Texture Copying Feedback Loops

Calling CopyTexImage2D or CopyTexSubImage2D will result in unde?ned be-
havior if the destination texture image level is also bound to the selected read buffer
(see section 4.3.1) of the read framebuffer. This situation is discussed in more de-
tail in the description of feedback loops in section 4.4.4.

3.7.3 Compressed Texture Images

Texture images may also be speci?ed or modi?ed using image data already stored
in a known compressed image format. The GL de?nes no speci?c compressed
formats, but compressed formats may be de?ned by GL extensions. There is a
mechanism to obtain token values for compressed formats; the number of spe-
ci?c compressed internal formats supported can be obtained by querying the value
of NUM_COMPRESSED_TEXTURE_FORMATS. The set of speci?c compressed inter-
nal formats supported by the renderer can be obtained by querying the value of
COMPRESSED_TEXTURE_FORMATS. The only values returned by this query are
those corresponding to internalformat parameters accepted by CompressedTex-
Image2D and suitable for general-purpose usage. The renderer will not enumerate
formats with restrictions that need to be speci?cally understood prior to use.

The command

void CompressedTexImage2D( enum target, int level,
enum internalformat, sizei width, sizei height,
int border, sizei imageSize, void *data );

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

74

de?nes a texture image, with incoming data stored in a speci?c compressed image
format. The target, level, internalformat, width, height, and border parameters
have the same meaning as in TexImage2D. data points to compressed image data
stored in the compressed image format corresponding to internalformat.

For all compressed internal formats, the compressed image will be decoded ac-
cording to the de?nition of internalformat. Compressed texture images are treated
as an array of imageSize ubytes beginning at address data. All pixel storage and
pixel transfer modes are ignored when decoding a compressed texture image. If the
imageSize parameter is not consistent with the format, dimensions, and contents of
the compressed image, an INVALID_VALUE error results. If the compressed image
is not encoded according to the de?ned image format, the results of the call are
unde?ned.

Speci?c compressed internal formats may impose format-speci?c restrictions
on the use of the compressed image speci?cation calls or parameters. For example,
the compressed image format might not allow width or height values that are not a
multiple of 4. Any such restrictions will be documented in the extension speci?ca-
tion de?ning the compressed internal format; violating these restrictions will result
in an INVALID_OPERATION error.

Any restrictions imposed by speci?c compressed internal formats will be in-
variant with respect to image contents, meaning that if the GL accepts and stores
a texture image in compressed form, CompressedTexImage2D will accept any
properly encoded compressed texture image of the same width, height, compressed
image size, and compressed internal format for storage at the same texture level.

Respecifying Subimages of Compressed Textures

The command

void CompressedTexSubImage2D( enum target, int level,
int xoffset, int yoffset, sizei width, sizei height,
enum format, sizei imageSize, void *data );

respeci?es only a rectangular region of an existing texture array, with incoming
data stored in a known compressed image format. The target, level, xoffset, yoffset,
width, height, and format parameters have the same meaning as in TexSubIm-
age2D. data points to compressed image data stored in the compressed image for-
mat corresponding to format.

The image pointed to by data and the imageSize parameter is interpreted as
though it was provided to CompressedTexImage2D. This command does not pro-
vide for image format conversion, so an INVALID_OPERATION error results if

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

75

format does not match the internal format of the texture image being modi?ed. If
the imageSize parameter is not consistent with the format, dimensions, and con-
tents of the compressed image (too little or too much data), an INVALID_VALUE
error results.

As with CompressedTexImage calls, compressed internal formats may have
additional restrictions on the use of the compressed image speci?cation calls or
parameters. Any such restrictions will be documented in the speci?cation de?n-
ing the compressed internal format; violating these restrictions will result in an
INVALID_OPERATION error.

Any restrictions imposed by speci?c compressed internal formats will be in-
variant with respect to image contents, meaning that if the GL accepts and stores a
texture image in compressed form, CompressedTexSubImage2D will accept any
properly encoded compressed texture image of the same width, height, compressed
image size, and compressed internal format for storage at the same texture level.

Calling CompressedTexSubImage2D will result in an INVALID_OPERATION
error if xoffset or yoffset is not equal to zero, or if width and height do not match
the width and height of the texture, respectively. The contents of any texel outside
the region modi?ed by the call are unde?ned. These restrictions may be relaxed
for speci?c compressed internal formats whose images are easily modi?ed.

3.7.4 Texture Parameters

Various parameters control how the texture array is treated when speci?ed or
changed, and when applied to a fragment. Each parameter is set by calling

void TexParameter{if}( enum target, enum pname, T param );
void TexParameter{if}v( enum target, enum pname,

T params );

target is the target, which must be TEXTURE_2D or TEXTURE_CUBE_MAP. pname
is a symbolic constant indicating the parameter to be set; the possible constants
and corresponding parameters are summarized in table 3.10. In the ?rst form of
the command, param is a value to which to set a single-valued parameter; in the
second form of the command, params is an array of parameters whose type depends
on the parameter being set.

Texture parameters for a cube map texture apply to the cube map as a whole;
the six distinct two-dimensional texture images use the texture parameters of the
cube map itself.

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

76

Name

TEXTURE_WRAP_S

Type
integer

TEXTURE_WRAP_T

integer

TEXTURE_MIN_FILTER

integer

TEXTURE_MAG_FILTER

integer

REPEAT,

REPEAT,

Legal Values
CLAMP_TO_EDGE,
MIRRORED_REPEAT
CLAMP_TO_EDGE,
MIRRORED_REPEAT
NEAREST,
LINEAR,
NEAREST_MIPMAP_NEAREST,
NEAREST_MIPMAP_LINEAR,
LINEAR_MIPMAP_NEAREST,
LINEAR_MIPMAP_LINEAR,
NEAREST,
LINEAR

Table 3.10: Texture parameters and their values.

rz

ry

3.7.5 Cube Map Texture Selection
r(cid:1) texture coordinates
When a cube map sampler is used in a shader, the (cid:0)s t
are treated as a direction vector (cid:0)rx
(cid:1) emanating from the center of a cube
(the q coordinate can be ignored, since it merely scales the vector without affecting
the direction.) At texture application time, the interpolated per-fragment direction
vector selects one of the cube map face’s two-dimensional images based on the
largest magnitude coordinate direction (the major axis direction). If two or more
coordinates have the identical magnitude, the implementation may de?ne the rule
to disambiguate this situation. The rule must be deterministic and depend only
(cid:1). The target column in table 3.11 explains how the major axis
on (cid:0)rx
direction maps to the two-dimensional image of a particular cube map target.

ry

rz

Using the sc, tc, and ma determined by the major axis direction as speci?ed in

table 3.11, an updated (cid:0)s t(cid:1) is calculated as follows:

(cid:19)

1
2

s =

(cid:18) sc
|ma|
(cid:18) tc
|ma|
This new (cid:0)s t(cid:1) is used to ?nd a texture value in the determined face’s two-

+ 1

+ 1

t =

1
2

(cid:19)

dimensional texture image using the rules given in sections 3.7.6 through 3.7.8.

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

Major Axis Direction Target
+rx
?rx
+ry
?ry
+rz
?rz

TEXTURE_CUBE_MAP_POSITIVE_X ?rz ?ry
?ry
TEXTURE_CUBE_MAP_NEGATIVE_X
rz
TEXTURE_CUBE_MAP_POSITIVE_Y
?rz
TEXTURE_CUBE_MAP_NEGATIVE_Y
?ry
TEXTURE_CUBE_MAP_POSITIVE_Z
TEXTURE_CUBE_MAP_NEGATIVE_Z ?rx ?ry

rz
rx
rx
rx

sc

tc

77

ma
rx
rx
ry
ry
rz
rz

Table 3.11: Selection of cube map images based on major axis direction of texture
coordinates.

3.7.6 Texture Wrap Modes

Wrap modes de?ned by the values of TEXTURE_WRAP_S or TEXTURE_WRAP_T
respectively affect the interpretation of s and t texture coordinates. The effect of
each mode is described below.

Wrap Mode REPEAT

Wrap mode REPEAT ignores the integer part of texture coordinates, using only the
fractional part. (For a number f , the fractional part is f ? (cid:98)f (cid:99), regardless of the
sign of f ; recall that the (cid:98)(cid:99) function truncates towards ??.)

REPEAT is the default behavior for all texture coordinates.

Wrap Mode CLAMP_TO_EDGE

Wrap mode CLAMP_TO_EDGE clamps texture coordinates at all mipmap levels such
that the texture ?lter never samples outside the texture image. The color returned
when clamping is derived only from texels at the edge of the texture image.

Texture coordinates are clamped to the range [min, max]. The minimum value

is de?ned as

min =

1
2N

where N is the size of the texture image in the direction of clamping. The maxi-
mum value is de?ned as

max = 1 ? min

so that clamping is always symmetric about the [0, 1] mapped range of a texture
coordinate.

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

78

Wrap Mode MIRRORED_REPEAT

Wrap mode MIRRORED_REPEAT ?rst mirrors the texture coordinate, where mirror-
ing a value f computes

mirror(f ) =

(cid:26) f ? (cid:98)f (cid:99),

1 ? (f ? (cid:98)f (cid:99)),

(cid:98)f (cid:99) is even
(cid:98)f (cid:99) is odd

The mirrored coordinate is then clamped as described above for wrap mode

CLAMP_TO_EDGE.

3.7.7 Texture Mini?cation

Applying a texture to a primitive implies a mapping from texture image space to
framebuffer image space. In general, this mapping involves a reconstruction of
the sampled texture image, followed by a homogeneous warping implied by the
mapping to framebuffer space, then a ?ltering, followed ?nally by a resampling
of the ?ltered, warped, reconstructed image before applying it to a fragment. In
the GL this mapping is approximated by one of two simple ?ltering schemes. One
of these schemes is selected based on whether the mapping from texture space to
framebuffer space is deemed to magnify or minify the texture image.

Scale Factor and Level of Detail

The choice is governed by a scale factor ?(x, y) and the level of detail parameter
?(x, y), de?ned as

?(x, y) = log2[?(x, y)]

(3.11)

If ?(x, y) is less than or equal to the constant c (described below in sec-
tion 3.7.8) the texture is said to be magni?ed; if it is greater, the texture is mini?ed.
Let s(x, y) be the function that associates an s texture coordinate with each set
of window coordinates (x, y) that lie within a primitive; de?ne t(x, y) analogously.
Let u(x, y) = wt ×s(x, y) and v(x, y) = ht ×t(x, y), where wt and ht are equal to
the width and height of the level zero array. For a polygon, ? is given at a fragment
with window coordinates (x, y) by

? = max

?
(cid:115)(cid:18) ?u
?
?x
?

(cid:19)2

(cid:19)2

+

(cid:18) ?v
?x

(cid:115)(cid:18) ?u
?y

,

(cid:19)2

(cid:19)2

+

(cid:18) ?v
?y

?
?

?

(3.12)

where ?u/?x indicates the derivative of u with respect to window x, and similarly
for the other derivatives.

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

79

For a line, the formula is

(cid:115)(cid:18) ?u
?x

? =

?x +

?u
?y

(cid:19)2

?y

+

(cid:18) ?v
?x

?x +

?v
?y

?y

(cid:19)2(cid:30)

l,

(3.13)

where ?x = x2 ? x1 and ?y = y2 ? y1 with (x1, y1) and (x2, y2) being the
segment’s window coordinate endpoints and l = (cid:112)?x2 + ?y2. For a point, ? ?
1.

While it is generally agreed that equations 3.12 and 3.13 give the best results
when texturing, they are often impractical to implement. Therefore, an imple-
mentation may approximate the ideal ? with a function f (x, y) subject to these
conditions:

1. f (x, y) is continuous and monotonically increasing in each of |?u/?x|,

|?u/?y|, |?v/?x|, |?v/?y|,

2. Let

mu = max

mv = max

(cid:26)(cid:12)
(cid:12)
(cid:12)
(cid:12)

?u
?x

(cid:26)(cid:12)
(cid:12)
(cid:12)
(cid:12)

?v
?x

(cid:12)
(cid:12)
(cid:12)
(cid:12)

(cid:12)
(cid:12)
(cid:12)
(cid:12)

(cid:12)
(cid:12)
(cid:12)
(cid:12)

(cid:12)
(cid:12)
(cid:12)
(cid:12)

,

,

?u
?y

(cid:12)
(cid:27)
(cid:12)
(cid:12)
(cid:12)

(cid:27)

?v
?y

(cid:12)
(cid:12)
(cid:12)
(cid:12)

Then max{mu, mv} ? f (x, y) ? mu + mv.

When ? indicates mini?cation, the value assigned to TEXTURE_MIN_FILTER
is used to determine how the texture value for a fragment is selected. When
TEXTURE_MIN_FILTER is NEAREST, the texel in the level zero array that is near-
est (in Manhattan distance) to that speci?ed by (s, t) is obtained. This means the
texel at location (i, j) becomes the texture value, with i given by

i =

(cid:26) (cid:98)u(cid:99),

s < 1
wt ? 1, s = 1

(3.14)

(Recall that if TEXTURE_WRAP_S is REPEAT, then 0 ? s < 1.) Similarly, j is
found as

j =

(cid:26) (cid:98)v(cid:99),

ht ? 1,

t < 1
t = 1

(3.15)

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

80

When TEXTURE_MIN_FILTER is LINEAR, a 2 × 2 square of texels in the level
zero array is selected. This square is obtained by ?rst wrapping texture coordinates
as described in section 3.7.6, then computing

i0 =

j0 =

(cid:26) (cid:98)u ? 1/2(cid:99) mod wt, TEXTURE_WRAP_S is REPEAT

(cid:98)u ? 1/2(cid:99),

otherwise

(cid:26) (cid:98)v ? 1/2(cid:99) mod ht, TEXTURE_WRAP_T is REPEAT

(cid:98)v ? 1/2(cid:99),

otherwise

i1 =

(cid:26) (i0 + 1) mod wt, TEXTURE_WRAP_S is REPEAT
otherwise

i0 + 1,

j1 =

(cid:26) (j0 + 1) mod ht, TEXTURE_WRAP_T is REPEAT
otherwise

j0 + 1,

and

Then

and

Let

? = frac(u ? 1/2)

? = frac(v ? 1/2)

where frac(x) denotes the fractional part of x.

The texture value ? is found as

? = (1 ? ?)(1 ? ?)?i0j0 + ?(1 ? ?)?i1j0 + (1 ? ?)??i0j1 + ???i1j1

(3.16)

where ?ij is the texel at location (i, j) in the texture image.

Rendering Feedback Loops

A rendering feedback loop can occur when a texture is attached to an attach-
ment point of the currently bound framebuffer object. In this case rendering results
are unde?ned. The exact conditions are detailed in section 4.4.4.

Mipmapping

TEXTURE_MIN_FILTER values NEAREST_MIPMAP_NEAREST, NEAREST_-
MIPMAP_LINEAR, LINEAR_MIPMAP_NEAREST, and LINEAR_MIPMAP_LINEAR

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

81

each require the use of a mipmap. A mipmap is an ordered set of arrays represent-
ing the same image; each array has a resolution lower than the previous one. If the
level zero array has dimensions wb × hb, then there are (cid:98)log2(max(wb, hb))(cid:99) + 1
image arrays in the mipmap. Each array subsequent to the level zero array has
dimensions

wb
2i (cid:99)) × max(1, (cid:98)
until the last array is reached with dimension 1 × 1.

max(1, (cid:98)

hb
2i (cid:99))(cid:99))

Each array in a mipmap is de?ned using TexImage2D or CopyTexImage2D;
the array being set is indicated with the level-of-detail argument level. Level-
of-detail numbers proceed from zero for the original texture array through q =
(cid:98)log2(max(wb, hb))(cid:99) with each unit increase indicating an array of half the di-
mensions of the previous one (rounded down to the next integer if fractional) as
already described. All arrays from zero through q must be de?ned, as discussed in
section 3.7.10.

If any dimension of any array in a mipmap is not a power of two (e.g.
if
rounding down as described above is performed), then the mipmap is described as
a non-power-of-two texture. Non-power-of-two textures have restrictions on the
allowed texture wrap modes and ?lters, as described in section 3.8.2.

The mipmap is used in conjunction with the level of detail to approximate the
application of an appropriately ?ltered texture to a fragment. Let c be the value
of ? at which the transition from mini?cation to magni?cation occurs (since this
discussion pertains to mini?cation, we are concerned only with values of ? where
? > c).

For mipmap ?lters NEAREST_MIPMAP_NEAREST and LINEAR_MIPMAP_-

NEAREST, the dth mipmap array is selected, where

d =

?
?

?

0,
(cid:100)? + 1
q,

? ? 1
2
2 (cid:101) ? 1, ? > 1

2 , ? ? q + 1

2

? > q + 1
2

(3.17)

The rules for NEAREST or LINEAR ?ltering are then applied to the selected

array.

For mipmap ?lters NEAREST_MIPMAP_LINEAR and LINEAR_MIPMAP_-

LINEAR, the level d1 and d2 mipmap arrays are selected, where

d1 =

(cid:26) q,

? ? q
(cid:98)?(cid:99), otherwise

d2 =

(cid:26) q,

? ? q

d1 + 1, otherwise

Version 2.0.25 (November 2, 2010)

(3.18)

(3.19)

3.7. TEXTURING

82

The rules for NEAREST or LINEAR ?ltering are then applied to each of the
selected arrays, yielding two corresponding texture values ?1 and ?2. The ?nal
texture value is then found as

? = [1 ? frac(?)]?1 + frac(?)?2.

3.7.8 Texture Magni?cation

When ? indicates magni?cation, the value assigned to TEXTURE_MAG_FILTER
determines how the texture value is obtained. There are two possible values
for TEXTURE_MAG_FILTER: NEAREST and LINEAR. NEAREST behaves exactly as
NEAREST for TEXTURE_MIN_FILTER (equations 3.14 and 3.15 are used); LINEAR
behaves exactly as LINEAR for TEXTURE_MIN_FILTER (equation 3.16 is used).
The level zero array is always used for magni?cation.

Finally, there is the choice of c, the mini?cation vs. magni?cation switch-over
point. If the magni?cation ?lter is given by LINEAR and the mini?cation ?lter is
given by NEAREST_MIPMAP_NEAREST or NEAREST_MIPMAP_LINEAR, then c =
0.5. This is done to ensure that a mini?ed texture does not appear “sharper” than a
magni?ed texture. Otherwise c = 0.

3.7.9 Texture Framebuffer Attachment

The texture values are considered unde?ned if all of the following conditions are
true:

• The current FRAMEBUFFER_BINDING names an application-created frame-

buffer object F .

• The texture is attached to one of the attachment points, A, of framebuffer

object F .

• TEXTURE_MIN_FILTER is NEAREST or LINEAR, and the value of
FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL for attachment point A
is zero; or, TEXTURE_MIN_FILTER is NEAREST_MIPMAP_NEAREST,
NEAREST_MIPMAP_LINEAR, LINEAR_MIPMAP_NEAREST, or LINEAR_-
MIPMAP_LINEAR, and the value of FRAMEBUFFER_ATTACHMENT_-
TEXTURE_LEVEL for attachment point A is within the the inclusive range
from zero to last mip-level.

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

83

3.7.10 Texture Completeness and Non-Power-Of-Two Textures

A texture is said to be complete if all the image arrays and texture parameters
required to utilize the texture for texture application is consistently de?ned.

A two-dimensional texture is complete if the following conditions all hold true:

• The set of mipmap arrays zero through q (where q is de?ned in the Mipmap-
ping discussion of section 3.7.7) were each speci?ed with the same format,
internal format, and type.

• The dimensions of the arrays follow the sequence described in the Mipmap-

ping discussion of section 3.7.7.

• Each dimension of the level zero array is positive.

For cube map textures, a texture is cube complete if the following conditions

all hold true:

• The level zero arrays of each of the six texture images making up the cube

map have identical, positive, and square dimensions.

• The level zero arrays were each speci?ed with the same format, internal

format, and type.

Finally, a cube map texture is mipmap cube complete if, in addition to being
cube complete, each of the six texture images considered individually is complete.

Effects of Completeness on Texture Application

Texture lookups performed in vertex and fragment shaders are affected by com-
pleteness of the texture being sampled as described in sections 2.10.5 and 3.8.2.

Effects of Completeness on Texture Image Speci?cation

An implementation may allow a texture image array of level one or greater to be
created only if a complete set of image arrays consistent with the requested array
can be supported.

3.7.11 Mipmap Generation

Mipmaps can be generated with the command

void GenerateMipmap( enum target );

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

84

target is the target, which must be TEXTURE_2D or TEXTURE_CUBE_MAP.

GenerateMipmap computes a complete set of mipmap arrays (as de?ned in
section 3.7.10) derived from the level zero array. Array levels one through q are
replaced with the derived arrays, regardless of their previous contents. The level
zero array is left unchanged by this computation.

The internal formats of the derived mipmap arrays all match those of the level
zero array, and the dimensions of the derived arrays follow the requirements de-
scribed in section 3.7.10.

The contents of the derived arrays are computed by repeated, ?ltered reduction
of the level zero array. No particular ?lter algorithm is required, though a box ?lter
is recommended as the default ?lter.

For cube maps, the error INVALID_OPERATION is generated if the texture

bound to target is not cube complete.

If either the width or height of the level zero array are not a power or two, the

error INVALID_OPERATION is generated.

If the level zero array is stored in a compressed internal format, the error

INVALID_OPERATION is generated.

3.7.12 Texture State

The state necessary for texture can be divided into two categories. First, there are
the seven sets of mipmap arrays (one for the two-dimensional target and six for
the cube map texture targets) and their number. Each array has associated with it a
width and height, an integer describing the internal format of the image, six integer
values describing the resolutions of each of the red, green, blue, alpha, luminance,
and intensity components of the image, an integer value describing the type of each
of the components, a boolean describing whether the image is compressed or not,
and an integer size of a compressed image. Each initial texture array is null (zero
width and height). Next, there are the two sets of texture properties; each consists
of the selected mini?cation and magni?cation ?lters, and the wrap modes for s and
t. In the initial state, the value assigned to TEXTURE_MIN_FILTER is NEAREST_-
MIPMAP_LINEAR, and the value for TEXTURE_MAG_FILTER is LINEAR. s and t
wrap modes are both set to REPEAT.

3.7.13 Texture Objects

In addition to the default textures TEXTURE_2D and TEXTURE_CUBE_MAP, named
two-dimensional and cube map texture objects can be created and operated upon.
The name space for texture objects is the unsigned integers, with zero reserved by
the GL.

Version 2.0.25 (November 2, 2010)

3.7. TEXTURING

85

A texture object is created by binding an unused name to TEXTURE_2D or

TEXTURE_CUBE_MAP. The binding is effected by calling

void BindTexture( enum target, uint texture );

with target set to the desired texture target and texture set to the unused name. The
resulting texture object is a new state vector, comprising all the state values listed
in section 3.7.12, set to the same initial values. If the new texture object is bound
to TEXTURE_2D, or TEXTURE_CUBE_MAP, it is and remains a two-dimensional or
cube map texture respectively until it is deleted.

BindTexture may also be used to bind an existing texture object to either
TEXTURE_2D or TEXTURE_CUBE_MAP. The error INVALID_OPERATION is gen-
erated if an attempt is made to bind a texture object of different dimensionality
than the speci?ed target. If the bind is successful no change is made to the state of
the bound texture object, and any previous binding to target is broken.

While a texture object is bound, GL operations on the target to which it is
bound affect the bound object, and queries of the target to which it is bound return
state from the bound object.

In the initial state, TEXTURE_2D and TEXTURE_CUBE_MAP have two-
dimensional and cube map texture state vectors respectively associated with them.
In order that access to these initial textures not be lost, they are treated as texture
objects all of whose names are 0. The initial two-dimensional and cube map texture
are therefore operated upon, queried, and applied as TEXTURE_2D or TEXTURE_-
CUBE_MAP respectively while 0 is bound to the corresponding targets.

Texture objects are deleted by calling

void DeleteTextures( sizei n, uint *textures );

textures contains n names of texture objects to be deleted. After a texture object
is deleted, it has no contents or dimensionality, and its name is again unused. If a
texture that is currently bound to one of the targets TEXTURE_2D, or TEXTURE_-
CUBE_MAP is deleted, it is as though BindTexture had been executed with the
same target and texture zero. Unused names in textures are silently ignored, as is
the value zero.

The command

void GenTextures( sizei n, uint *textures );

returns n previously unused texture object names in textures. These names are
marked as used, for the purposes of GenTextures only, but they acquire texture
state only when they are ?rst bound, just as if they were unused.

Version 2.0.25 (November 2, 2010)

3.8. FRAGMENT SHADERS

86

The texture object name space, including the initial texture object, is shared
among all texture units. A texture object may be bound to more than one texture
unit simultaneously. After a texture object is bound, any GL operations on that tar-
get object affect any other texture units to which the same texture object is bound.
Texture binding is affected by the setting of the state ACTIVE_TEXTURE.
If a texture object is deleted, it is as if all texture units which are bound to that

texture object are rebound to texture object zero.

3.8 Fragment Shaders

The sequence of operations that are applied to fragments that result from rasterizing
a point, line segment, or polygon are described by using a fragment shader.

A fragment shader is de?ned by an array of strings containing source code for
the operations that are meant to occur on each fragment that results from rasteriz-
ing a point, line segment, or polygon. The language used for fragment shaders is
described in the OpenGL ES Shading Language Speci?cation.

Alternatively, fragment shaders may be de?ned by pre-compiled shader binary

code, in the same way as described for vertex shaders in section 2.10.

Fragment shaders are created as described in section 2.10.1 using a type pa-
rameter of FRAGMENT_SHADER. They are attached to and used in program objects
as described in section 2.10.3.

The fragment shader attached to the program object in use by the GL is con-
sidered active, and is used to process fragments. If no program object is currently
in use, the results of fragment shader execution are unde?ned.

3.8.1 Shader Variables

Fragment shaders can access uniforms belonging to the current shader object. The
amount of storage available for fragment shader uniform variables is speci?ed
by the implementation-dependent constant MAX_FRAGMENT_UNIFORM_VECTORS.
This value represents the number of four-element ?oating-point, integer, or boolean
vectors that can be held in uniform variable storage for a fragment shader. A link
error will be generated if an attempt is made to utilize more than the space available
for fragment shader uniform variables.

Fragment shaders can read varying variables that correspond to the attributes
of the fragments produced by rasterization. The OpenGL ES Shading Language
Speci?cation de?nes a set of built-in varying variables that can be be accessed by a
fragment shader. These built-in varying variables include the fragment’s position,
eye z coordinate, and front-facing ?ag.

Version 2.0.25 (November 2, 2010)

3.8. FRAGMENT SHADERS

87

Texture Base
Internal Format

ALPHA
LUMINANCE
LUMINANCE_ALPHA
RGB
RGBA

Texture source color Texture source alpha

(Rs, Gs, Bs)
(0, 0, 0)
(Lt, Lt, Lt)
(Lt, Lt, Lt)
(Rt, Gt, Bt)
(Rt, Gt, Bt)

As
At
1
At
1
At

Table 3.12: Correspondence of ?ltered texture components to texture source color
components. The values Rt, Gt, Bt, At, Lt, and It are respectively the red, green,
blue, alpha, luminance, and intensity components of the ?ltered texture value ?
(see table 3.8.

A vertex shader may de?ne one or more varying variables (see section 2.10.4
and the OpenGL ES Shading Language Speci?cation). These values are interpo-
lated across the primitive being rendered. The results of these interpolations are
available when varying variables of the same name are de?ned in the fragment
shader.

3.8.2 Shader Execution

If a fragment shader is active, the executable version of the fragment shader is used
to process incoming fragment values that are the result of point, line segment, or
polygon rasterization.

Texture Access

When a texture lookup is performed in a fragment shader, the GL computes the
?ltered texture value ? in the manner described in sections 3.7.7 and 3.7.8, and
converts it to a texture source color Cs according to table 3.12. The GL returns a
four-component vector (Rs, Gs, Bs, As) to the fragment shader. For the purposes
of level-of-detail calculations, the derivates du
dy may be
approximated by a differencing algorithm as detailed in section 8.8 of the OpenGL
ES Shading Language speci?cation.

dx and dw

dy , dw

dx , du

dy , dv

dx , dv

Calling a sampler from a fragment shader will return (R, G, B, A) =

(0, 0, 0, 1) if any of the following conditions are true:

• A two-dimensional sampler is called, the mini?cation ?lter is one that re-
quires a mipmap (neither NEAREST nor LINEAR), and the sampler’s associ-

Version 2.0.25 (November 2, 2010)

3.8. FRAGMENT SHADERS

88

ated texture object is not complete, as de?ned in sections 3.7.1 and 3.7.10,

• A two-dimensional sampler is called, the mini?cation ?lter is not one that
requires a mipmap (either NEAREST nor LINEAR), and either dimension of
the level zero array of the associated texture object is not positive.

• A two-dimensional sampler is called, the corresponding texture image is a
non-power-of-two image (as described in the Mipmapping discussion of
section 3.7.7), and either the texture wrap mode is not CLAMP_TO_EDGE, or
the mini?cation ?lter is neither NEAREST nor LINEAR.

• A cube map sampler is called, any of the corresponding texture images are
non-power-of-two images, and either the texture wrap mode is not CLAMP_-
TO_EDGE, or the mini?cation ?lter is neither NEAREST nor LINEAR.

• A cube map sampler is called, and either the corresponding cube map texture
image is not cube complete, or TEXTURE_MIN_FILTER is one that requires
a mipmap and the texture is not mipmap cube complete.

The number of separate texture units that can be accessed from within a
fragment shader during the rendering of a single primitive is speci?ed by the
implementation-dependent constant MAX_TEXTURE_IMAGE_UNITS.

Shader Inputs

The OpenGL ES Shading Language speci?cation describes the values that are
available as inputs to the fragment shader.

The built-in variable gl_FragCoord holds the window coordinates x, y, z,
and 1
w for the fragment. The z component of gl_FragCoord undergoes an im-
plied conversion to ?oating-point. This conversion must leave the values 0 and
1 invariant. Note that this z component already has a polygon offset added in, if
enabled (see section 3.5.2. The 1
w value is computed from the wc coordinate (see
section 2.12).

The built-in variable gl_FrontFacing is set to true if the fragment is gener-
ated from a front facing primitive, and false otherwise. For fragments generated
from polygon primitives the determination is made by examining the sign of the
area computed by equation 3.4 of section 3.5.1 (including the possible reversal of
this sign controlled by FrontFace). If the sign is positive, fragments generated by
the primitive are front facing; otherwise, they are back facing. All other fragments
are considered front facing.

Version 2.0.25 (November 2, 2010)

3.8. FRAGMENT SHADERS

89

Shader Outputs

The OpenGL ES Shading Language speci?cation describes the values that may be
output by a fragment shader. These are gl_FragColor and gl_FragData[0]
3. The ?nal fragment color values or the ?nal fragment data values written by a
fragment shader are clamped to the range [0, 1] and then converted to ?xed-point
as described in section 2.1.2 for framebuffer color components.

Writing to gl_FragColor or gl_FragData[0] speci?es the fragment color
(color number zero) that will be used by subsequent stages of the pipeline. Any
colors, or color components, associated with a fragment that are not written by
the fragment shader are unde?ned. A fragment shader may not statically assign
values to both gl_FragColor and gl_FragData[0]. In this case, a compile or
link error will result. A shader statically assigns a value to a variable if, after pre-
processing, it contains a statement that would write to the variable, whether or not
run-time ?ow of control will cause that statement to be executed.

3gl_FragData is supported for compatibility with the desktop OpenGL Shading Language,

but only a single fragment color output is allowed in the OpenGL ES Shading Language.

Version 2.0.25 (November 2, 2010)

Chapter 4

Per-Fragment Operations and the
Framebuffer

The framebuffer consists of a set of pixels arranged as a two-dimensional array.
The height and width of this array may vary from one GL implementation to an-
other. For purposes of this discussion, each pixel in the framebuffer is simply a set
of some number of bits. The number of bits per pixel may also vary depending on
the particular GL implementation or context.

Further there are two classes of framebuffers: the default framebuffer supplied
by the window-system-provided and application-created framebuffer objects. Ev-
ery OpenGL ES context has a single default window-system-provided framebuffer.
Applications can optionally create additional non-displayable framebuffer objects.
For more information on application-created framebuffer objects, see section 4.4.
Corresponding bits from each pixel in the framebuffer are grouped together into
a bitplane; each bitplane contains a single bit from each pixel. These bitplanes are
grouped into several logical buffers. These are the color, depth, and stencil buffers.
The color buffer actually consists of a number of buffers, and these color buffers
serve related but slightly different purposes depending on whether they are bound
to the default window-system-provided framebuffer or to an application-created
framebuffer object.

For the default window-system provided framebuffer, the color buffers consist
of either or both of a front (single) buffer and a back buffer. Typically the contents
of the front buffer are displayed on a color monitor while the contents of the back
buffer are invisible. The color buffers must have the same number of bitplanes, al-
though a context may not provide both types of buffers. Further, an implementation
or context may not provide depth or stencil buffers 1.

1However, an OpenGL ES implementation must support at least one con?g with a depth bit depth

90

4.1. PER-FRAGMENT OPERATIONS

91

For application-created framebuffer objects, the color buffers are not visible,
and consequently the names of the color buffers are not related to a display de-
vice. The name of the color buffer of an application-created framebuffer ob-
ject is COLOR_ATTACHMENT0. The names of the depth and stencil buffers are
DEPTH_ATTACHMENT and STENCIL_ATTACHMENT. For more information about
the buffers of an application-created framebuffer object, see section 4.4.2. To be
considered framebuffer complete (see section 4.4.5), all color buffers attached to
an application-created framebuffer object must have the same number of bitplanes.
Depth and stencil buffers may optionally be attached to application-created frame-
buffers as well.

Color buffers consist of R, G, B, and, optionally, A unsigned integer values.
The number of bitplanes in each of the color buffers, the depth buffer, and the
stencil buffer is dependent on the currently bound framebuffer. For the default
framebuffer, the number of bitplanes is ?xed. For application-created framebuffer
objects, however, the number of bitplanes in a given logical buffer may change if
the state of the corresponding framebuffer attachment or attached image changes.

The initial state of all provided bitplanes is unde?ned.

4.1 Per-Fragment Operations

A fragment produced by rasterization with window coordinates of (xw, yw) mod-
i?es the pixel in the framebuffer at that location based on a number of parameters
and conditions. We describe these modi?cations and tests, diagrammed in Fig-
ure 4.1, in the order in which they are performed.

4.1.1 Pixel Ownership Test

The ?rst test is to determine if the pixel at location (xw, yw) in the framebuffer
is currently owned by the GL (more precisely, by this GL context). If it is not,
the window system decides the fate of the incoming fragment. Possible results are
that the fragment is discarded or that some subset of the subsequent per-fragment
operations are applied to the fragment. This test allows the window system to
control the GL’s behavior, for instance, when a GL window is obscured.

While an application-created framebuffer object is bound to FRAMEBUFFER,
the pixel ownership test always passes. The pixels of application-created fram-
buffer objects are always owned by OpenGL ES , not the window system.
Only while the window-system-provided framebuffer named zero is bound to
FRAMEBUFFER does the window system control pixel ownership.

of 16 or higher and a stencil bit depth of 8 or higher

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

92

Figure 4.1. Per-fragment operations.

Version 2.0.25 (November 2, 2010)

Depth BufferTestToFramebufferPixelOwnershipTestScissorTestFragment+AssociatedDataStencilTestBlendingDitheringMultisampleFragmentOperationsFramebufferFramebufferFramebuffer4.1. PER-FRAGMENT OPERATIONS

93

4.1.2 Scissor Test

The scissor test determines if (xw, yw) lies within the scissor rectangle de?ned by
four values. These values are set with

void Scissor( int left, int bottom, sizei width,

sizei height );

If left ? xw < left + width and bottom ? yw < bottom + height, then the
scissor test passes. Otherwise, the test fails and the fragment is discarded. The test
is enabled or disabled using Enable or Disable using the constant SCISSOR_TEST.
When disabled, it is as if the scissor test always passes. If either width or height
is less than zero, then the error INVALID_VALUE is generated. The state required
consists of four integer values and a bit indicating whether the test is enabled or
disabled. In the initial state lef t = bottom = 0; width and height are determined
by the size of the GL window. Initially, the scissor test is disabled.

4.1.3 Multisample Fragment Operations

This step modi?es fragment alpha and coverage values based on the values
of SAMPLE_ALPHA_TO_COVERAGE, SAMPLE_COVERAGE, SAMPLE_COVERAGE_-
VALUE, and SAMPLE_COVERAGE_INVERT. No changes to the fragment alpha or
coverage values are made at this step if the value of SAMPLE_BUFFERS is not one.
SAMPLE_ALPHA_TO_COVERAGE and SAMPLE_COVERAGE are enabled and dis-
abled by calling Enable and Disable with cap speci?ed as one of the two token
values. Both values are queried by calling IsEnabled with cap set to the desired
token value. If SAMPLE_ALPHA_TO_COVERAGE is enabled, a temporary coverage
value is generated where each bit is determined by the alpha value at the corre-
sponding sample location. The temporary coverage value is then ANDed with the
fragment coverage value. Otherwise the fragment coverage value is unchanged at
this point.

No speci?c algorithm is required for converting the sample alpha values to a
temporary coverage value. It is intended that the number of 1’s in the temporary
coverage be proportional to the set of alpha values for the fragment, with all 1’s
corresponding to the maximum of all alpha values, and all 0’s corresponding to
all alpha values being 0. It is also intended that the algorithm be pseudo-random
in nature, to avoid image artifacts due to regular coverage sample locations. The
algorithm can and probably should be different at different pixel locations. If it
does differ, it should be de?ned relative to window, not screen, coordinates, so that
rendering results are invariant with respect to window position.

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

94

Finally, if SAMPLE_COVERAGE is enabled, the fragment coverage is ANDed
with another temporary coverage. This temporary coverage is generated in the
same manner as the one described above, but as a function of the value of
SAMPLE_COVERAGE_VALUE. The function need not be identical, but it must have
the same properties of proportionality and invariance. If SAMPLE_COVERAGE_-
INVERT is TRUE, the temporary coverage is inverted (all bit values are inverted)
before it is ANDed with the fragment coverage.

The values of SAMPLE_COVERAGE_VALUE and SAMPLE_COVERAGE_INVERT

are speci?ed by calling

void SampleCoverage( clampf value, boolean invert );

with value set to the desired coverage value, and invert set to TRUE or FALSE.
value is clamped to [0,1] before being stored as SAMPLE_COVERAGE_VALUE.
SAMPLE_COVERAGE_VALUE is queried by calling GetFloatv with pname set to
SAMPLE_COVERAGE_VALUE. SAMPLE_COVERAGE_INVERT is queried by calling
GetBooleanv with pname set to SAMPLE_COVERAGE_INVERT.

4.1.4 Stencil Test

The stencil test conditionally discards a fragment based on the outcome of a com-
parison between the value in the stencil buffer at location (xw, yw) and a reference
value. The test is enabled or disabled with the Enable and Disable commands,
using the symbolic constant STENCIL_TEST. When disabled, the stencil test and
associated modi?cations are not made, and the fragment is always passed.

The stencil test is controlled with

void StencilFunc( enum func, int ref, uint mask );
void StencilFuncSeparate( enum face, enum func, int ref,

uint mask );

void StencilOp( enum sfail, enum dpfail, enum dppass );
void StencilOpSeparate( enum face, enum sfail, enum dpfail,

enum dppass );

There are two sets of stencil-related state, the front stencil state set and the back
stencil state set. Stencil tests and writes use the front set of stencil state when pro-
cessing fragments rasterized from non-polygon primitives (points, lines, bitmaps,
image rectangles) and front-facing polygon primitives while the back set of stencil
state is used when processing fragments rasterized from back-facing polygon prim-
itives. For the purposes of stencil testing, a primitive is still considered a polygon

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

95

even if the polygon is to be rasterized as points or lines due to the current poly-
gon mode. Whether a polygon is front- or back-facing is determined in the same
manner used for face culling (see section 3.5.1).

StencilFuncSeparate and StencilOpSeparate take a face argument which can
be FRONT, BACK, or FRONT_AND_BACK and indicates which set of state is affected.
StencilFunc and StencilOp set front and back stencil state to identical values.

StencilFunc and StencilFuncSeparate take three arguments that control
whether the stencil test passes or fails. ref is an integer reference value that is used
in the unsigned stencil comparison.
Stencil comparison operations and queries
of ref clamp its value to the range [0, 2s ? 1], where s is the number of bits in the
stencil buffer attached to the framebuffer. The s least signi?cant bits of mask are
bitwise ANDed with both the reference and the stored stencil value, and the result-
ing masked values are those that participate in the comparison controlled by func.
func is a symbolic constant that determines the stencil comparison function; the
eight symbolic constants are NEVER, ALWAYS, LESS, LEQUAL, EQUAL, GEQUAL,
GREATER, or NOTEQUAL. Accordingly, the stencil test passes never, always, and
if the masked reference value is less than, less than or equal to, equal to, greater
than or equal to, greater than, or not equal to the masked stored value in the stencil
buffer.

StencilOp and StencilOpSeparate take three arguments that indicate what
happens to the stored stencil value if this or certain subsequent tests fail or pass.
sfail indicates what action is taken if the stencil test fails. The symbolic constants
are KEEP, ZERO, REPLACE, INCR, DECR, INVERT, INCR_WRAP, and DECR_WRAP.
These correspond to keeping the current value, setting to zero, replacing with the
reference value, incrementing with saturation, decrementing with saturation, bit-
wise inverting it, incrementing without saturation, and decrementing without satu-
ration.

For purposes of increment and decrement, the stencil bits are considered as an
unsigned integer. Incrementing or decrementing with saturation clamps the stencil
value at 0 and the maximum representable value. Incrementing or decrementing
without saturation will wrap such that incrementing the maximum representable
value results in 0, and decrementing 0 results in the maximum representable value.
The same symbolic values are given to indicate the stencil action if the depth

buffer test (see section 4.1.5) fails (dpfail), or if it passes (dppass).

If the stencil test fails, the incoming fragment is discarded. The state required
consists of the most recent values passed to StencilFunc or StencilFuncSeparate
and to StencilOp or StencilOpSeparate, and a bit indicating whether stencil test-
ing is enabled or disabled. In the initial state, stenciling is disabled, the front and
back stencil reference value are both zero, the front and back stencil comparison
functions are both ALWAYS, and the front and back stencil mask are both all ones.

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

96

Initially, all three front and back stencil operations are KEEP.

If there is no stencil buffer, no stencil modi?cation can occur, and it is as if the

stencil tests always pass, regardless of any calls to StencilFunc.

4.1.5 Depth Buffer Test

The depth buffer test discards the incoming fragment if a depth comparison fails.
The comparison is enabled or disabled with the generic Enable and Disable com-
mands using the symbolic constant DEPTH_TEST. When disabled, the depth com-
parison and subsequent possible updates to the depth buffer value are bypassed and
the fragment is passed to the next operation. The stencil value, however, is modi-
?ed as indicated below as if the depth buffer test passed. If enabled, the comparison
takes place and the depth buffer and stencil value may subsequently be modi?ed.

The comparison is speci?ed with

void DepthFunc( enum func );

This command takes a single symbolic constant: one of NEVER, ALWAYS, LESS,
LEQUAL, EQUAL, GREATER, GEQUAL, NOTEQUAL. Accordingly, the depth buffer
test passes never, always, if the incoming fragment’s zw value is less than, less
than or equal to, equal to, greater than, greater than or equal to, or not equal to
the depth value stored at the location given by the incoming fragment’s (xw, yw)
coordinates.

If the depth buffer test fails, the incoming fragment is discarded. The stencil
value at the fragment’s (xw, yw) coordinates is updated according to the function
currently in effect for depth buffer test failure. Otherwise, the fragment continues
to the next operation and the value of the depth buffer at the fragment’s (xw, yw)
location is set to the fragment’s zw value. In this case the stencil value is updated
according to the function currently in effect for depth buffer test success.

The necessary state is an eight-valued integer and a single bit indicating
In the initial state the function

whether depth buffering is enabled or disabled.
is LESS and the test is disabled.

If there is no depth buffer, it is as if the depth buffer test always passes.

4.1.6 Blending

Blending combines the incoming source fragment’s R, G, B, and A values with
the destination R, G, B, and A values stored in the framebuffer at the fragment’s
(xw, yw) location.

Source and destination values are combined according to the blend equation,
quadruplets of source and destination weighting factors determined by the blend

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

97

functions, and a constant blend color to obtain a new set of R, G, B, and A val-
ues, as described below. Each of these ?oating-point values is clamped to [0, 1]
and converted back to a ?xed-point value in the manner described in section 2.1.2
for framebuffer color components. The resulting four values are sent to the next
operation.

Blending is dependent on the incoming fragment’s alpha value and that of the
corresponding currently stored pixel. Blending is enabled or disabled using Enable
or Disable with the symbolic constant BLEND. If it is disabled, proceed to the next
operation.

Blend Equation

Blending is controlled by the blend equations, de?ned by the commands

void BlendEquation( enum mode );
void BlendEquationSeparate( enum modeRGB,

enum modeAlpha );

BlendEquationSeparate argument modeRGB determines the RGB blend function
while modeAlpha determines the alpha blend equation. BlendEquation argument
mode determines both the RGB and alpha blend equations. modeRGB and mod-
eAlpha must each be one of FUNC_ADD, FUNC_SUBTRACT, or FUNC_REVERSE_-
SUBTRACT.

Destination (framebuffer) components are taken to be ?xed-point values rep-
resented according to the scheme described in section 2.1.2 for framebuffer color
components, as are source (fragment) components. Constant color components are
taken to be ?oating-point values.

Prior to blending, each ?xed-point color component undergoes an implied con-
version to ?oating-point. This conversion must leave the values 0 and 1 invariant.
Blending components are treated as if carried out in ?oating-point.

Table 4.1 provides the corresponding per-component blend equations for each
mode, whether acting on RGB components for modeRGB or the alpha component
for modeAlpha.

In the table, the s subscript on a color component abbreviation (R, G, B, or
A) refers to the source color component for an incoming fragment, the d subscript
on a color component abbreviation refers to the destination color component at
the corresponding framebuffer location, and the c subscript on a color component
abbreviation refers to the constant blend color component. A color component ab-
breviation without a subscript refers to the new color component resulting from
blending. Additionally, Sr, Sg, Sb, and Sa are the red, green, blue, and alpha com-
ponents of the source weighting factors determined by the source blend function,

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

98

Mode
FUNC_ADD

FUNC_SUBTRACT

Alpha Compoonent

RGB Components
R = Rs ? Sr + Rd ? Dr A = As ? Sa + Ad ? Da
G = Gs ? Sg + Gd ? Dg
B = Bs ? Sb + Bd ? Db
R = Rs ? Sr ? Rd ? Dr A = As ? Sa ? Ad ? Da
G = Gs ? Sg ? Gd ? Dg
B = Bs ? Sb ? Bd ? Db

FUNC_REVERSE_SUBTRACT R = Rd ? Dr ? Rs ? Sr A = Ad ? Da ? As ? Sa

G = Gd ? Dg ? Gs ? Sg
B = Bd ? Db ? Bs ? Sb

Table 4.1: RGB and alpha blend equations.

and Dr, Dg, Db, and Da are the red, green, blue, and alpha components of the
destination weighting factors determined by the destination blend function. Blend
functions are described below.

Blend Functions

The weighting factors used by the blend equation are determined by the blend
functions. Blend functions are speci?ed with the commands

void BlendFuncSeparate( enum srcRGB, enum dstRGB,

enum srcAlpha, enum dstAlpha );
void BlendFunc( enum src, enum dst );

BlendFuncSeparate arguments srcRGB and dstRGB determine the source and
destination RGB blend functions, respectively, while srcAlpha and dstAlpha deter-
mine the source and destination alpha blend functions. BlendFunc argument src
determines both RGB and alpha source functions, while dst determines both RGB
and alpha destination functions.

The possible source and destination blend functions and their corresponding

computed blend factors are summarized in table 4.2.

Blend Color

The constant color Cc to be used in blending is speci?ed with the command

void BlendColor( clampf red, clampf green, clampf blue,

clampf alpha );

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

99

Function

ZERO
ONE
SRC_COLOR
ONE_MINUS_SRC_COLOR
DST_COLOR
ONE_MINUS_DST_COLOR
SRC_ALPHA
ONE_MINUS_SRC_ALPHA
DST_ALPHA
ONE_MINUS_DST_ALPHA
CONSTANT_COLOR
ONE_MINUS_CONSTANT_COLOR
CONSTANT_ALPHA
ONE_MINUS_CONSTANT_ALPHA
SRC_ALPHA_SATURATE1

Alpha Blend Factor

RGB Blend Factors
(Sr, Sg, Sb) or (Dr, Dg, Db) Sa or Da
(0, 0, 0)
(1, 1, 1)
(Rs, Gs, Bs)
(1, 1, 1) ? (Rs, Gs, Bs)
(Rd, Gd, Bd)
(1, 1, 1) ? (Rd, Gd, Bd)
(As, As, As)
(1, 1, 1) ? (As, As, As)
(Ad, Ad, Ad)
(1, 1, 1) ? (Ad, Ad, Ad)
(Rc, Gc, Bc)
(1, 1, 1) ? (Rc, Gc, Bc)
(Ac, Ac, Ac)
(1, 1, 1) ? (Ac, Ac, Ac)
(f, f, f )2

0
1
As
1 ? As
Ad
1 ? Ad
As
1 ? As
Ad
1 ? Ad
Ac
1 ? Ac
Ac
1 ? Ac
1

Table 4.2: RGB and ALPHA source and destination blending functions and the
corresponding blend factors. Addition and subtraction of triplets is performed
component-wise.
1 SRC_ALPHA_SATURATE is valid only for source RGB and alpha blending func-
tions.
2 f = min(As, 1 ? Ad).

Version 2.0.25 (November 2, 2010)

4.1. PER-FRAGMENT OPERATIONS

100

The four parameters are clamped to the range [0, 1] before being stored. The

constant color can be used in both the source and destination blending functions

Blending State

The state required for blending is two integers for the RGB and alpha blend equa-
tions, four integers indicating the source and destination RGB and alpha blending
functions, four ?oating-point values to store the RGBA constant blend color, and a
bit indicating whether blending is enabled or disabled. The initial blend equations
for RGB and alpha are both FUNC_ADD. The initial blending functions are ONE for
the source RGB and alpha functions and ZERO for the destination RGB and alpha
functions. The initial constant blend color is (R, G, B, A) = (0, 0, 0, 0). Initially,
blending is disabled.

Blending occurs once for each color buffer currently enabled for writing (sec-
tion 4.2.1) using each buffer’s color for Cd. If a color buffer has no A value, then
Ad is taken to be 1.

4.1.7 Dithering

Dithering selects between two color values. Consider the value of any of the color
components as a ?xed-point value with m bits to the left of the binary point, where
m is the number of bits allocated to that component in the framebuffer; call each
such value c. For each c, dithering selects a value c1 such that c1 ? {max{0, (cid:100)c(cid:101) ?
1}, (cid:100)c(cid:101)} (after this selection, treat c1 as a ?xed point value in [0,1] with m bits).
This selection may depend on the xw and yw coordinates of the pixel. c must not
be larger than the maximum value representable in the framebuffer for either the
component or the index, as appropriate.

Many dithering algorithms are possible, but a dithered value produced by any
algorithm must depend only the incoming value and the fragment’s x and y window
coordinates. If dithering is disabled, then each color component is truncated to a
?xed-point value with as many bits as there are in the corresponding component in
the framebuffer.

Dithering is enabled with Enable and disabled with Disable using the symbolic
Initially, dithering is

constant DITHER. The state required is thus a single bit.
enabled.

4.1.8 Additional Multisample Fragment Operations

If the value of SAMPLE_BUFFERS is one, the stencil test, depth test, blending, and
dithering operations are performed for each pixel sample, rather than just once for

Version 2.0.25 (November 2, 2010)

4.2. WHOLE FRAMEBUFFER OPERATIONS

101

each fragment. Failure of the stencil or depth test results in termination of the
processing of that sample, rather than discarding of the fragment. All operations
are performed on the color, depth, and stencil values stored in the multisample
buffer (to be described in a following section). The contents of the color buffer are
not modi?ed at this point.

Stencil, depth, blending, and dithering operations are performed for a pixel
sample only if that sample’s fragment coverage bit is a value of 1. If the corre-
sponding coverage bit is 0, no operations are performed for that sample.

If the value of SAMPLE_BUFFERS is one, the fragment may be treated exactly
as described above, with optimization possible because the fragment coverage must
be set to full coverage. Further optimization is allowed, however. An implementa-
tion may choose to identify a centermost sample, and to perform stencil and depth
tests on only that sample. Regardless of the outcome of the stencil test, all multi-
sample buffer stencil sample values are set to the appropriate new stencil value. If
the depth test passes, all multisample buffer depth sample values are set to the depth
of the fragment’s centermost sample’s depth value, and all multisample buffer color
sample values are set to the color value of the incoming fragment. Otherwise, no
change is made to any multisample buffer color or depth value.

After all operations have been completed on the multisample buffer, the color
sample values are combined to produce a single color value, and that value is writ-
ten into the color buffer selected for writing (see section 4.2.1). An implementa-
tion may defer the writing of the color buffer until a later time, but the state of the
framebuffer must behave as if the color buffer was updated as each fragment was
processed. The method of combination is not speci?ed, though a simple average
computed independently for each color component is recommended.

4.2 Whole Framebuffer Operations

The preceding sections described the operations that occur as individual fragments
are sent to the framebuffer. This section describes operations that control or affect
the whole framebuffer.

4.2.1 Selecting a Buffer for Writing

Color values are written into the front buffer for single buffered contexts, or into
the back buffer for back buffered contexts. The type of context is determined when
creating a GL context.

Version 2.0.25 (November 2, 2010)

4.2. WHOLE FRAMEBUFFER OPERATIONS

102

4.2.2 Fine Control of Buffer Updates

Four commands are used to mask the writing of bits to each of the logical frame-
buffers after all per-fragment operations have been performed. The command

void ColorMask( boolean r, boolean g, boolean b,

boolean a );

controls the writing of R, G, B and A values to the color buffer. r, g, b, and a
indicate whether R, G, B, or A values, respectively, are written or not (a value of
TRUE means that the corresponding value is written). In the initial state, all color
values are enabled for writing.

The depth buffer can be enabled or disabled for writing zw values using

void DepthMask( boolean mask );

If mask is non-zero, the depth buffer is enabled for writing; otherwise, it is disabled.
In the initial state, the depth buffer is enabled for writing.

The commands

void StencilMask( uint mask );
void StencilMaskSeparate( enum face, uint mask );

control the writing of particular bits into the stencil planes.

The least signi?cant s bits of mask , where s is the number of bits in the stencil
buffer, specify a mask. Where a 1 appears in this mask, the corresponding bit in
the stencil buffer is written; where a 0 appears, the bit is not written.

The face parameter of StencilMaskSeparate can be FRONT, BACK, or
FRONT_AND_BACK and indicates whether the front or back stencil mask state is
affected. StencilMask sets both front and back stencil mask state to identical val-
ues.

Fragments generated by front facing primitives use the front mask and frag-
ments generated by back facing primitives use the back mask (see section 4.1.4).
The clear operation always uses the front stencil write mask when clearing the
stencil buffer.

The state required for the various masking operations is three integers and a
bit: an integer for color indices, an integer for the front and back stencil values,
and a bit for depth values. A set of four bits is also required indicating which color
components of an RGBA value should be written. In the initial state, the integer
masks are all ones, as are the bits controlling depth value and RGBA component
writing.

Version 2.0.25 (November 2, 2010)

4.2. WHOLE FRAMEBUFFER OPERATIONS

103

Fine Control of Multisample Buffer Update s

When the value of SAMPLE_BUFFERS is one, ColorMask, DepthMask, and Sten-
cilMask control the modi?cation of values in the multisample buffer. The color
mask has no effect on modi?cations to the color buffer. If the color mask is entirely
disabled, the color sample values must still be combined (as described above) and
the result used to replace values of the color buffer.

4.2.3 Clearing the Buffers

The GL provides a means for setting portions of every pixel in a particular buffer
to the same value. The argument to

void Clear( bitfield buf );

is the bitwise OR of a number of values indicating which buffers are to be cleared.
The values are COLOR_BUFFER_BIT, DEPTH_BUFFER_BIT, and STENCIL_-
BUFFER_BIT, indicating the color buffer, the depth buffer, and the stencil buffer,
respectively. The value to which each buffer is cleared depends on the setting of the
clear value for that buffer. If the mask is not a bitwise OR of the speci?ed values,
then the error INVALID_VALUE is generated.

void ClearColor( clampf r, clampf g, clampf b,

clampf a );

sets the clear value for the color buffer. Each of the speci?ed components is
clamped to [0, 1] and converted to ?xed-point as described in section 2.1.2 for
framebuffer color components.

void ClearDepthf( clampf d );

takes a value that is clamped to the range [0, 1] and converted to ?xed-point accord-
ing to the rules for a window z value given in section 2.12.1. Similarly,

void ClearStencil( int s );

takes a single integer argument that is the value to which to clear the stencil buffer.
s is masked to the number of bitplanes in the stencil buffer.

When Clear is called, the only per-fragment operations that are applied (if
enabled) are the pixel ownership test, the scissor test, and dithering. The masking
operations described in the last section (4.2.2) are also effective. If a buffer is not
present, then a Clear directed at that buffer has no effect.

The state required for clearing is a clear value for each of the color buffer,
the depth buffer, and the stencil buffer. Initially, the RGBA color clear value is
(0,0,0,0), the stencil buffer clear value is 0, and the depth buffer clear value is 1.0.

Version 2.0.25 (November 2, 2010)

4.3. READING PIXELS

104

Figure 4.2. Operation of ReadPixels. Operations in dashed boxes may be enabled
or disabled.

Clearing the Multisample Buffer

The color samples of the multisample buffer are cleared when the color buffer is
cleared, as speci?ed by the Clear mask bit COLOR_BUFFER_BIT.

If the Clear mask bits DEPTH_BUFFER_BIT or STENCIL_BUFFER_BIT are

set, then the corresponding depth or stencil samples, respectively, are cleared.

4.3 Reading Pixels

Pixels may be read from the framebuffer to client memory using the ReadPixels
commands, as described below. Pixels may also be copied from client memory or
the framebuffer to texture images in the GL using the TexImage2D and CopyTex-
Image2D commands, as described in section 3.7.1.

4.3.1 Reading Pixels

The method for reading pixels from the framebuffer and placing them in client
memory is diagrammed in Figure 4.2. We describe the stages of the pixel reading
process in the order in which they occur.

Version 2.0.25 (November 2, 2010)

byte, short, or packedpixel component data streamClamp to [0,1]PackConvert to floatRGBA pixel data inPixel StorageOperations4.3. READING PIXELS

105

Parameter Name

PACK_ALIGNMENT

Type
integer

Initial Value Valid Range

4

1,2,4,8

Table 4.3: PixelStore parameters pertaining to ReadPixels.

Pixels are read using

void ReadPixels( int x, int y, sizei width, sizei height,

enum format, enum type, void *data );

The arguments after x and y to ReadPixels are those described in section 3.6.2
de?ning pixel rectangles. Only two combinations of format and type are ac-
cepted. The ?rst is format RGBA and type UNSIGNED_BYTE. The second is an
implementation-chosen format from among those de?ned in table 3.4, exclud-
ing formats LUMINANCE and LUMINANCE_ALPHA. The values of format and type
for this format may be determined by calling GetIntegerv with the symbolic
constants IMPLEMENTATION_COLOR_READ_FORMAT and IMPLEMENTATION_-
COLOR_READ_TYPE, respectively. The implementation-chosen format may vary
depending on the format of the currently bound rendering surface. Unsupported
combinations of format and type will generate an INVALID_OPERATION error.
The pixel storage modes that apply to ReadPixels are summarized in Table 4.3.

Obtaining Pixels from the Framebuffer

The buffer from which values are obtained is the color buffer used for writing (see
section 4.2.1). If FRAMEBUFFER_BINDING is non-zero, pixel values are read from
the buffer attached as the COLOR_ATTACHMENT0 attachment to the currently bound
framebuffer object.

ReadPixels obtains values from the color buffer (with lower left hand corner
at (0, 0)) for each pixel (x + i, y + j) for 0 ? i < width and 0 ? j < height;
this pixel is said to be the ith pixel in the jth row. If any of these pixels lies outside
of the window allocated to the current GL context, the values obtained for those
pixels are unde?ned. Results are also unde?ned for individual pixels that are not
owned by the current context. Otherwise, ReadPixels obtains values from the color
buffer, regardless of how those values were placed there.

Red, green, blue, and alpha values are obtained from the selected buffer at each
pixel location. If the framebuffer does not support alpha values then the A that is
obtained is 1.0.

Version 2.0.25 (November 2, 2010)

4.3. READING PIXELS

106

type Parameter

GL Data Type Component

INT
UNSIGNED_BYTE
UNSIGNED_SHORT_5_6_5
UNSIGNED_SHORT_4_4_4_4
UNSIGNED_SHORT_5_5_5_1

int
ubyte
ushort
ushort
ushort

Conversion Formula
c = [(232 ? 1)f ? 1]/2
c = (28 ? 1)f
c = (2N ? 1)f
c = (2N ? 1)f
c = (2N ? 1)f

Table 4.4: Reversed component conversions, used when component data are be-
ing returned to client memory. Color components are converted from the internal
?oating-point representation (f ) to a datum of the speci?ed GL data type (c) using
the speci?ed equation. All arithmetic is done in the internal ?oating point format.
These conversions apply to component data returned by GL query commands and
to components of pixel data returned to client memory. The equations remain the
same even if the implemented ranges of the GL data types are greater than the
minimum required ranges. (See Table 2.2.) Equations with N as the exponent are
performed for each bit?eld of the packed data type, with N set to the number of
bits in the bit?eld.

Conversion of RGBA values

The R, G, B, and A values form a group of elements. Each element is taken to be a
?xed-point value in [0, 1] with m bits, as described in section 2.1.2 for framebuffer
color components.

Final Conversion

Each component is ?rst clamped to [0, 1]. Then the appropriate conversion formula
from table 4.4 is applied to the component.

Placement in Client Memory

Groups of elements are placed in memory just as they are taken from memory for
TexImage2D. That is, the ith group of the jth row (corresponding to the ith pixel
in the jth row) is placed in memory just where the ith group of the jth row would
be taken from for TexImage2D. See Unpacking under section 3.6.2. The only
difference is that the storage mode parameters whose names begin with PACK_ are
used instead of those whose names begin with UNPACK_. If format is ALPHA, only
the corresponding single element is written. Otherwise all the elements of each
group are written.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

107

4.3.2 Pixel Draw/Read State

The state required for pixel operations consists of the parameters that are set with
PixelStore. This state has been summarized in tables 3.1. State set with PixelStore
is GL client state.

4.4 Framebuffer Objects

As described in chapters 1 and 2, OpenGL ES renders into (and reads values from)
a framebuffer. OpenGL ES de?nes two classes of framebuffers: window-system-
provided framebuffers and application-created framebuffers.

By default, OpenGL ES uses the window-system-provided framebuffer. The
storage, dimensions, allocation, and format of the images attached to this frame-
buffer are managed entirely by the window-system. Consequently, the state of the
window-system-provided framebuffer, including its images, can not be changed
by OpenGL ES , nor can the window-system-provided framebuffer itself, or its
images, be deleted by OpenGL ES .

The routines described in the following sections, however, can be used to cre-
ate, destroy, and modify the state and attachments of application-created frame-
buffer objects.

Application-created framebuffer objects encapsulate the state of a framebuffer
in a similar manner to the way texture objects encapsulate the state of a texture. In
particular, a framebuffer object encapsulates state necessary to describe a collection
of color, depth, and stencil logical buffers. For each logical buffer, a framebuffer-
attachable image can be attached to the framebuffer to store the rendered output
for that logical buffer. Examples of framebuffer-attachable images include texture
images and renderbuffer images.

By allowing the images of a renderbuffer to be attached to a framebuffer,
OpenGL ES provides a mechanism to support off-screen rendering. Further, by
allowing the images of a texture to be attached to a framebuffer, OpenGL ES pro-
vides a mechanism to support render to texture.

4.4.1 Binding and Managing Framebuffer Objects

The operations described in chapter 4 affect the images attached to the framebuffer
object bound to the target FRAMEBUFFER. By default, the framebuffer bound to
the target FRAMEBUFFER is zero, specifying the default implementation-dependent
framebuffer provided by the windowing system. When the framebuffer bound to
target FRAMEBUFFER is not zero, but instead names an application-created frame-

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

108

buffer object, then the operations described in chapter 4 affect the application-
created framebuffer object rather than the default framebuffer.

The namespace for framebuffer objects is the unsigned integers, with zero re-
served by OpenGL ES to refer to the default framebuffer. A framebuffer object
is created by binding an unused name to the target FRAMEBUFFER. The binding is
effected by calling

void BindFramebuffer( enum target, uint framebuffer );

with target set to FRAMEBUFFER and framebuffer set to the unused name. The
resulting framebuffer object is a new state vector. There is one color attachment
point, plus one each for the depth and stencil attachment points.

BindFramebuffer may also be used to bind an existing framebuffer ob-
ject to target.
If the bind is successful no change is made to the state of the
bound framebuffer object and any previous binding to target is broken. The cur-
rent FRAMEBUFFER binding can be queried using GetIntegerv(FRAMEBUFFER_-
BINDING).

While a framebuffer object is bound to the target FRAMEBUFFER, OpenGL ES
operations on the target to which it is bound affect the images attached to the bound
framebuffer object, and queries of the target to which it is bound return state from
the bound object. In particular, queries of the values speci?ed in table 6.21 (Imple-
mentation Dependent Pixel Depths) are derived from the currently bound frame-
buffer object. The framebuffer object bound to the target FRAMEBUFFER is used
as the destination of fragment operations and as the source of pixel reads such as
ReadPixels.

In the initial state, the reserved name zero is bound to the target FRAMEBUFFER.
There is no application created framebuffer object corresponding to the name zero.
Instead, the name zero refers to the window-system-provided framebuffer. All
queries and operations on the framebuffer while the name zero is bound to the target
FRAMEBUFFER operate on this default framebuffer. On some implementations, the
properties of the default window system provided framebuffer can change over
time (e.g., in response to window system events such as attaching the context to a
new window system drawable.)

Application created framebuffer objects (i.e., those with a non-zero name) dif-
fer from the default window-system-provided framebuffer in a few important ways.
First and foremost, unlike the window-system-provided framebuffer, application
created framebuffers have modi?able attachment points for each logical buffer in
the framebuffer. Framebuffer attachable images can be attached to and detached
from these attachment points. Also, the size and format of the images attached
to application created framebuffers are controlled entirely within the OpenGL ES

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

109

interface, and are not affected by window-system events, such as pixel format se-
lection, window resizes, and display mode changes.

Additionally, when rendering to or reading from an application created frame-

buffer object,

• The pixel ownership test always succeeds.

In other words, application-

created framebuffer objects own all of their pixels.

• There are no visible color buffer bitplanes. This means there is no color

buffer corresponding to the back, or front color bitplanes.

• The only color buffer bitplanes are the ones de?ned by the framebuffer at-

tachment point named COLOR_ATTACHMENT0.

• The only depth buffer bitplanes are the ones de?ned by the framebuffer at-

tachment point DEPTH_ATTACHMENT.

• The only stencil buffer bitplanes are the ones de?ned by the framebuffer

attachment point STENCIL_ATTACHMENT.

• There is no multisample buffer, so the value of the implementation-

dependent state variables SAMPLES and SAMPLE_BUFFERS are both 0.

Framebuffer objects are deleted by calling

void DeleteFramebuffers( sizei n, uint *framebuffers );

framebuffers contains n names of framebuffer objects to be deleted. After a
framebuffer object is deleted, it has no attachments, and its name is again unused.
If a framebuffer that is currently bound to the target FRAMEBUFFER is deleted, it is
as though BindFramebuffer had been executed with the target of FRAMEBUFFER
and framebuffer of zero. Unused names in framebuffers are silently ignored, as is
the value zero.

The command

void GenFramebuffers( sizei n, uint *framebuffers );

returns n previously unused framebuffer object names in framebuffers. These
names are marked as used, for the purposes of GenFramebuffers only, but they
acquire state and type only when they are ?rst bound, just as if they were unused.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

110

4.4.2 Attaching Images to Framebuffer Objects

Framebuffer-attachable images may be attached to,
and detached from,
application-created framebuffer objects. In contrast, the image attachments of the
window-system-provided framebuffer may not be changed by OpenGL ES .

A single framebuffer-attachable image may be attached to multiple application-
created framebuffer objects, potentially avoiding some data copies, and possibly
decreasing memory consumption.

For each logical buffer, the framebuffer object stores a set of state which de?nes
the logical buffer’s attachment point. The attachment point state contains enough
information to identify the single image attached to the attachment point, or to
indicate that no image is attached. The per-logical buffer attachment point state is
listed in table 6.24.

There are two types of framebuffer-attachable images: the image of a render-

buffer object, and an image of a texture object.

4.4.3 Renderbuffer Objects

A renderbuffer is a data storage object containing a single image of a renderable
internal format. OpenGL ES provides the methods described below to allocate and
delete a renderbuffer’s image, and to attach a renderbuffer’s image to a framebuffer
object.

The name space for renderbuffer objects is the unsigned integers, with zero
reserved for OpenGL ES . A renderbuffer object is created by binding an unused
name to RENDERBUFFER. The binding is effected by calling

void BindRenderbuffer( enum target, uint renderbuffer );

with target set to RENDERBUFFER and renderbuffer set to the unused name.
If
renderbuffer is not zero, then the resulting renderbuffer object is a new state vector,
initialized with a zero-sized memory buffer, and comprising the state values listed
in table 6.23. Any previous binding to target is broken.

BindRenderbuffer may also be used to bind an existing renderbuffer object.
If the bind is successful, no change is made to the state of the newly bound render-
buffer object, and any previous binding to target is broken.

While a renderbuffer object is bound, OpenGL ES operations on the target to
which it is bound affect the bound renderbuffer object, and queries of the target to
which a renderbuffer object is bound return state from the bound object.

The name zero is reserved. A renderbuffer object cannot be created with the
name zero. If renderbuffer is zero, then any previous binding to target is broken
and the target binding is restored to the initial state.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

111

In the initial state, the reserved name zero is bound to RENDERBUFFER. There is
no renderbuffer object corresponding to the name zero, so client attempts to modify
or query renderbuffer state for the target RENDERBUFFER while zero is bound will
generate errors.

Using GetIntegerv, the current RENDERBUFFER binding can be queried as

RENDERBUFFER_BINDING.

Renderbuffer objects are deleted by calling

void DeleteRenderbuffers( sizei n, const

uint *renderbuffers );

where renderbuffers contains n names of renderbuffer objects to be deleted. After
a renderbuffer object is deleted, it has no contents, and its name is again unused. If
a renderbuffer that is currently bound to RENDERBUFFER is deleted, it is as though
BindRenderbuffer had been executed with the target RENDERBUFFER and name
of zero. Additionally, special care must be taken when deleting a renderbuffer if
the image of the renderbuffer is attached to a framebuffer object. Unused names in
renderbuffers are silently ignored, as is the value zero.

The command

void GenRenderbuffers( sizei n, uint *renderbuffers );

returns n previously unused renderbuffer object names in renderbuffers. These
names are marked as used, for the purposes of GenRenderbuffers only, but they
acquire renderbuffer state only when they are ?rst bound, just as if they were un-
used.

The command

void RenderbufferStorage( enum target, enum internalformat,

sizei width, sizei height );

establishes the data storage, format, and dimensions of a renderbuffer object’s im-
target must be RENDERBUFFER. internalformat must be one of the color-
age.
renderable, depth-renderable, or stencil-renderable formats described in table 4.5.
width and height are the dimensions in pixels of the renderbuffer.
If either
width or height is greater than the value of MAX_RENDERBUFFER_SIZE, the er-
ror INVALID_VALUE is generated. If OpenGL ES is unable to create a data store
of the requested size, the error OUT_OF_MEMORY is generated. RenderbufferStor-
age deletes any existing data store for the renderbuffer and the contents of the data
store after calling RenderbufferStorage are unde?ned.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

112

An OpenGL ES implementation may vary its allocation of internal component
resolution based on any RenderbufferStorage parameter (except target), but the
allocation and chosen internal format must not be a function of any other state and
cannot be changed once they are established. The actual resolution in bits of each
component of the allocated image can be queried with GetRenderbufferParame-
teriv.

Attaching Renderbuffer Images to a Framebuffer

A renderbuffer can be attached as one of the logical buffers of the currently bound
framebuffer object by calling

void FramebufferRenderbuffer( enum target,
enum attachment, enum renderbuffertarget,
uint renderbuffer );

target must be FRAMEBUFFER. An INVALID_OPERATION error is generated if
the current value of FRAMEBUFFER_BINDING is zero when FramebufferRender-
buffer is called. attachment should be set to one of the attachment points COLOR_-
ATTACHMENT0, DEPTH_ATTACHMENT or STENCIL_ATTACHMENT. renderbuffer-
target must be RENDERBUFFER and renderbuffer should be set to the name of the
renderbuffer object to be attached to the framebuffer. renderbuffer must be either
zero or the name of an existing renderbuffer object of type renderbuffertarget, oth-
erwise INVALID_OPERATION is generated. If renderbuffer is zero, then the value
of renderbuffertarget is ignored.

If renderbuffer is not zero and if FramebufferRenderbuffer is successful,
then the renderbuffer named renderbuffer will be used as the logical buffer iden-
ti?ed by attachment of the framebuffer currently bound to target. The value of
FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE for the speci?ed attachment point is
set to RENDERBUFFER and the value of FRAMEBUFFER_ATTACHMENT_OBJECT_-
NAME is set to renderbuffer. All other state values of the attachment point speci?ed
by attachment are set to their default values listed in table 6.24. No change is made
to the state of the renderbuffer object and any previous attachment to the attach-
ment logical buffer of the framebuffer object bound to framebuffer target is broken.
If, on the other hand, the attachment is not successful, then no change is made to
the state of either the renderbuffer object or the framebuffer object.

Calling FramebufferRenderbuffer with the renderbuffer name zero will de-
tach the image, if any, identi?ed by attachment, in the framebuffer currently bound
to target. All state values of the attachment point speci?ed by attachment in the
object bound to target are set to their default values listed in table 6.24.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

113

If a renderbuffer object is deleted while its image is attached to the currently
bound framebuffer, then it is as if FramebufferRenderbuffer had been called,
with a renderbuffer of 0, for each attachment point to which this image was at-
tached in the currently bound framebuffer. In other words, this renderbuffer image
is ?rst detached from all attachment points in the currently bound framebuffer.
Note that the renderbuffer image is speci?cally not detached from any non-bound
framebuffers. Detaching the image from any non-bound framebuffers is the re-
sponsibility of the application.

Attaching Texture Images to a Framebuffer

OpenGL ES supports copying the rendered contents of the framebuffer into the
images of a texture object through the use of the routines CopyTexImage2D and
CopyTexSubImage2D. Additionally, OpenGL ES supports rendering directly into
the images of a texture object.

To render directly into a texture image, a speci?ed image from a texture object
can be attached as one of the logical buffers of the currently bound framebuffer
object by calling the command

void FramebufferTexture2D( enum target, enum attachment,

enum textarget, uint texture, int level );

The target must be FRAMEBUFFER. An INVALID_OPERATION is generated if
the current value of FRAMEBUFFER_BINDING is zero when FramebufferTexture2D
is called. attachment must be one of the attachment points of the framebuffer.

If texture is zero, then textarget and level are ignored.

If texture is not
zero, then texture must either name an existing texture object with an target
of textarget, or texture must name an existing cube map texture and textarget
must be one of: TEXTURE_CUBE_MAP_POSITIVE_X, TEXTURE_CUBE_MAP_-
POSITIVE_Y,
TEXTURE_CUBE_MAP_POSITIVE_-
Z, TEXTURE_CUBE_MAP_NEGATIVE_X, TEXTURE_CUBE_MAP_NEGATIVE_Y, or
TEXTURE_CUBE_MAP_NEGATIVE_Z. Otherwise, INVALID_OPERATION is gener-
ated.

level speci?es the mipmap level of the texture image to be attached to the

framebuffer and must be 0. Otherwise, INVALID_VALUE is generated.

If texture is not zero, then textarget must be one of TEXTURE_2D, TEXTURE_-
TEXTURE_-
TEXTURE_-

CUBE_MAP_POSITIVE_X,
TEXTURE_CUBE_MAP_POSITIVE_Y,
TEXTURE_CUBE_MAP_NEGATIVE_X,
CUBE_MAP_POSITIVE_Z,
CUBE_MAP_NEGATIVE_Y, or TEXTURE_CUBE_MAP_NEGATIVE_Z.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

114

If texture is not zero, and if FramebufferTexture2D is successful, then the
speci?ed texture image will be used as the logical buffer identi?ed by attach-
ment of the framebuffer currently bound to target. The value of FRAMEBUFFER_-
ATTACHMENT_OBJECT_TYPE for the speci?ed attachment point is set to TEXTURE
and the value of FRAMEBUFFER_ATTACHMENT_OBJECT_NAME is set to texture.
Additionally, the value of FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL for the
named attachment point is set to level. If texture is a cubemap texture then the value
of FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE the named attach-
ment point is set to textarget. All other state values of the attachment point speci-
?ed by attachment are set to their default values listed in table 6.24. No change is
made to the state of the texture object, and any previous attachment to the attach-
ment logical buffer of the framebuffer object bound to framebuffer target is broken.
If, on the other hand, the attachment is not successful, then no change is made to
the state of either the texture object or the framebuffer object.

Calling FramebufferTexture2D with texture name zero will detach the image
identi?ed by attachment, if any, in the framebuffer currently bound to target. All
state values of the attachment point speci?ed by attachment are set to their default
values listed in table 6.24.

If a texture object is deleted while its image is attached to the currently bound
framebuffer, then it is as if FramebufferTexture2D had been called, with a texture
of 0, for each attachment point to which this image was attached in the currently
bound framebuffer. In other words, this texture image is ?rst detached from all
attachment points in the currently bound framebuffer. Note that the texture image is
speci?cally not detached from any other framebuffer objects. Detaching the texture
image from any other framebuffer objects is the responsibility of the application.

4.4.4 Feedback Loops Between Textures and the Framebuffer

A feedback loop may exist when a texture object is used as both the source and
destination of a GL operation. When a feedback loop exists, unde?ned behavior
results. This section describes rendering feedback loops (see section 3.7.7) and
texture copying feedback loops (see section 3.7.2) in more detail.

Rendering Feedback Loops

The mechanisms for attaching textures to a framebuffer object do not prevent a
two-dimensional texture level from being attached to the draw framebuffer while
the same texture is bound to a texture unit. While this conditions holds, texturing
operations accessing that image will produce unde?ned results, as described at the
end of section 3.7.7. Conditions resulting in such unde?ned behavior are de?ned

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

115

in more detail below. Such unde?ned texturing operations are likely to leave the
?nal results of fragment processing operations unde?ned, and should be avoided.
Special precautions need to be taken to avoid attaching a texture image to the
currently bound framebuffer while the texture object is currently bound and en-
abled for texturing. Doing so could lead to the creation of a rendering feedback
loop between the writing of pixels by OpenGL ES rendering operations and the si-
multaneous reading of those same pixels when used as texels in the currently bound
texture. In this scenario, the framebuffer will be considered framebuffer complete,
but the values of fragments rendered while in this state will be unde?ned. The val-
ues of texture samples may be unde?ned as well, as described under “Rendering
Feedback Loops” in section 3.7.7.

Speci?cally, the values of rendered fragments are unde?ned if all of the fol-

lowing conditions are true:

• an image from texture object T is attached to the currently bound framebuffer

at attachment point A

• the texture object T is currently bound to a texture unit U, and

• the current programmable vertex and/or fragment processing state makes it
possible (see below) to sample from the texture object T bound to texture
unit U

while either of the following conditions are true:

• the value of TEXTURE_MIN_FILTER for texture object T is NEAREST or
LINEAR, and the value of FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL
for attachment point A is 0 (the level zero array for the texture object T).

• the value of TEXTURE_MIN_FILTER for

texture object T is one
of NEAREST_MIPMAP_NEAREST, NEAREST_MIPMAP_LINEAR, LINEAR_-
MIPMAP_NEAREST, or LINEAR_MIPMAP_LINEAR, and the value of
FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL for attachment point A is
within the range of mipmap levels speci?ed for the texture object T.

For the purposes of this discussion, it is possible to sample from the texture
object T bound to texture unit U if the active fragment or vertex shader contains
any instructions that might sample from the texture object T bound to U, even if
those instructions might only be executed conditionally.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

116

Texture Copying Feedback Loops

Similarly to rendering feedback loops, it is possible for a texture image to be
attached to the read framebuffer while the same texture image is the destination
of a CopyTexImage* operation, as described under “Texture Copying Feedback
Loops” in section 3.7.2. While this condition holds, a texture copying feedback
loop between the writing of texels by the copying operation and the reading of
those same texels when used as pixels in the read framebuffer may exist. In this
scenario, the values of texels written by the copying operation will be unde?ned.

Speci?cally, the values of copied texels are unde?ned if all of the following

conditions are true:

• an image from texture object T is attached to the currently bound framebuffer

at attachment point A

• the selected read buffer is attachment point A

• T is bound to the texture target of a CopyTexImage* operation

• the level argument of the copying operation selects the same image that is

attached to A

4.4.5 Framebuffer Completeness

A framebuffer object is said to be framebuffer complete if all of its attached images,
and all framebuffer parameters required to utilize the framebuffer for rendering and
reading, are consistently de?ned and meet the requirements de?ned below. The
rules of framebuffer completeness are dependent on the properties of the attached
images, and on certain implementation-dependent restrictions. A framebuffer must
be complete to effectively be used as the destination for OpenGL ES framebuffer
rendering operations and the source for OpenGL ES framebuffer read operations.
The internal formats of the attached images can affect the completeness of
the framebuffer, so it is useful to ?rst de?ne the relationship between the internal
format of an image and the attachment points to which it can be attached. Image
internal formats are summarized in table 4.5. Color-renderable formats contain
red, green, blue, and possibly alpha components; depth-renderable formats contain
depth components; and stencil-renderable formats contain stencil components.

Formats not listed in table 4.5, including compressed internal formats. are not

color-, depth-, or stencil-renderable, no matter which components they contain.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

Sized
Internal Format

DEPTH_COMPONENT16
RGBA4
RGB5_A1
RGB565
STENCIL_INDEX8

Renderable
Type
depth-renderable
color-renderable
color-renderable
color-renderable
stencil-renderable

R
bits

G
bits

B
bits

A
bits

4
5
5

4
5
6

4
5
5

4
1

117

S
bits

D
bits
16

8

Table 4.5: Renderbuffer image formats, showing their renderable type (color-,
depth-, or stencil-renderable) and the number of bits each format contains for color
(R, G, B, A), depth (D), and stencil (S) components.

Framebuffer Attachment Completeness

If the value of FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE for the framebuffer
attachment point attachment is not NONE, then it is said that a framebuffer-
attachable image, named image, is attached to the framebuffer at the attachment
point. image is identi?ed by the state in attachment as described in section 4.4.2.

The framebuffer attachment point attachment is said to be framebuffer attach-
ment complete if the value of FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE for
attachment is NONE (i.e., no image is attached), or if all of the following conditions
are true:

• image is a component of an existing object with the name speci?ed by
FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, and of the type speci?ed by
FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE.

• The width and height of image must be non-zero.

• If attachment is COLOR_ATTACHMENT0, then image must have a color-

renderable internal format.

• If attachment is DEPTH_ATTACHMENT, then image must have a depth-

renderable internal format.

• If attachment is STENCIL_ATTACHMENT, then image must have a stencil-

renderable internal format.

Framebuffer Completeness

In this subsection, each rule is followed by an error enum in bold.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

118

The framebuffer object target is said to be framebuffer complete if it is the

window-system-provided framebuffer, or if all the following conditons are true:

• All framebuffer attachment points are framebuffer attachment complete.

FRAMEBUFFER_INCOMPLETE_ATTACHMENT

• There is at least one image attached to the framebuffer.

FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT

• All attached images have the same width and height.

FRAMEBUFFER_INCOMPLETE_DIMENSIONS

• The combination of internal formats of the attached images does not violate

an implementation-dependent set of restrictions.

FRAMEBUFFER_UNSUPPORTED

The enum in bold after each clause of the framebuffer completeness rules
speci?es the return value of CheckFramebufferStatus that is generated when
that clause is violated. If more than one clause is violated, it is implementation-
dependent as to exactly which enum will be returned by CheckFramebufferSta-
tus.

Performing any of the following actions may change whether the framebuffer

is considered complete or incomplete.

• Binding to a different framebuffer with BindFramebuffer.

• Attaching an image to the framebuffer with FramebufferTexture2D or

FramebufferRenderbuffer.

• Detaching an image from the framebuffer with FramebufferTexture2D or

FramebufferRenderbuffer.

• Changing the width, height, or internal format of a texture image that is
attached to the framebuffer by calling TexImage2D, CopyTexImage2D and
CompressedTexImage2D.

• Changing the width, height, or internal format of a renderbuffer that is at-

tached to the framebuffer by calling RenderbufferStorage.

• Deleting, with DeleteTextures or DeleteRenderbuffers, an object contain-
ing an image that is attached to a framebuffer object that is bound to the
framebuffer.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

119

internal

Although OpenGL ES de?nes a wide variety of

formats for
framebuffer-attachable images, such as texture images and renderbuffer images,
some implementations may not support rendering to particular combinations of
internal formats. If the combination of formats of the images attached to a frame-
buffer object are not supported by the implementation, then the framebuffer is not
complete under the clause labeled FRAMEBUFFER_UNSUPPORTED. There must ex-
ist, however, at least one combination of internal formats for which the framebuffer
cannot be FRAMEBUFFER_UNSUPPORTED.

Because of the implementation-dependent clause of the framebuffer complete-
ness test in particular, and because framebuffer completeness can change when the
set of attached images is modi?ed, it is strongly advised, though is not required,
that an application check to see if the framebuffer is complete prior to rendering.
The status of the framebuffer object currently bound to target can be queried by
calling

enum CheckFramebufferStatus( enum target );

If target is not FRAMEBUFFER, INVALID_ENUM is generated. If CheckFrame-

bufferStatus generates an error, 0 is returned.

Otherwise, an enum is returned that identi?es whether or not the framebuffer
bound to target is complete, and if not complete the enum identi?es one of the rules
of framebuffer completeness that is violated. If the framebuffer is complete, then
FRAMEBUFFER_COMPLETE is returned.

Effects of Framebuffer Completeness on Framebuffer Operations

If the currently bound framebuffer is not framebuffer complete, then it is an error
to attempt to use the framebuffer for writing or reading. This means that rendering
commands such as DrawArrays and DrawElements, as well as commands that
read the framebuffer such as ReadPixels and CopyTexSubImage, will generate
the error INVALID_FRAMEBUFFER_OPERATION if called while the framebuffer is
not framebuffer complete.

4.4.6 Effects of Framebuffer State on Framebuffer Dependent Values

The values of the state variables listed in table 6.21 (Implementation Dependant
Pixel Depths) may change when a change is made to FRAMEBUFFER_BINDING, to
the state of the currently bound framebuffer object, or to an image attached to the
currently bound framebuffer object.

When FRAMEBUFFER_BINDING is zero, the values of the state variables listed

in table 6.21 are implementation de?ned.

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

120

When FRAMEBUFFER_BINDING is non-zero, if the currently bound frame-
buffer object is not framebuffer complete, then the values of the state variables
listed in table 6.21 are unde?ned.

When FRAMEBUFFER_BINDING is non-zero and the currently bound frame-
buffer object is framebuffer complete, then the values of the state variables listed
in table 6.21 are completely determined by FRAMEBUFFER_BINDING, the state of
the currently bound framebuffer object, and the state of the images attached to the
currently bound framebuffer object.

4.4.7 Mapping between Pixel and Element in Attached Image

When FRAMEBUFFER_BINDING is non-zero, an operation that writes to the frame-
buffer modi?es the image attached to the selected logical buffer, and an operation
that reads from the framebuffer reads from the image attached to the selected logi-
cal buffer.

If the attached image is a renderbuffer image, then the window coordinates
(xw, yw) correspond to the value in the renderbuffer image at the same coordinates.
If the attached image is a texture image, then the window coordinates (xw, yw)
correspond to the value in the level zero array of that texture at the same coordi-
nates.

Conversion to Framebuffer-Attachable Image Components

When an enabled color value is written to the framebuffer while FRAMEBUFFER_-
BINDING is non-zero, for each draw buffer the R, G, B, and A values are converted
to internal components corresponding to the internal format of the framebuffer-
attachable image attached to the selected logical buffer, and the resulting internal
components are written to the image attached to logical buffer. The masking opera-
tions described by ColorMask, DepthMask, StencilMask, and StencilMaskSep-
arate are also effective.

4.4.8 Errors

The error INVALID_FRAMEBUFFER_OPERATION is generated if the value returned
by CheckFramebufferStatus is not FRAMEBUFFER_COMPLETE, and any attempts
to render to or read from the framebuffer are made.

The error INVALID_OPERATION is generated if GetFramebufferAttach-

mentParameteriv is called while the value of FRAMEBUFFER_BINDING is zero.

The error INVALID_OPERATION is generated if FramebufferRenderbuffer
or FramebufferTexture2D is called while the value of FRAMEBUFFER_BINDING

Version 2.0.25 (November 2, 2010)

4.4. FRAMEBUFFER OBJECTS

121

is zero.

The error INVALID_OPERATION is generated if RenderbufferStorage is

called while the value of RENDERBUFFER_BINDING is zero.

The error INVALID_VALUE is generated if RenderbufferStorage is called

with a width or height that is greater than MAX_RENDERBUFFER_SIZE.

The error INVALID_ENUM is generated if RenderbufferStorage is called with
an internalformat that is not among the list of supported color, depth or stencil
formats.

The error INVALID_OPERATION is generated if FramebufferRenderbuffer

is called and renderbuffer is not the name of a renderbuffer object.

The error INVALID_OPERATION is generated if FramebufferTexture2D is

called and texture is not the name of a texture object.

The error INVALID_VALUE is generated if FramebufferTexture2D is called

with a level that is less than zero.

The error INVALID_VALUE is generated if FramebufferTexture2D is called

with a level that is greater than 0.

The error INVALID_ENUM is generated if CheckFramebufferStatus is called

and target is not FRAMEBUFFER.

The error OUT_OF_MEMORY is generated if OpenGL ES is unable to create a

data store of the required size when calling RenderbufferStorage.

The error INVALID_OPERATION is generated if GenerateMipmap is called
with a target of TEXTURE_CUBE_MAP and the texture object currently bound to
TEXTURE_CUBE_MAP is not cube complete.

Version 2.0.25 (November 2, 2010)

Chapter 5

Special Functions

This chapter describes additional GL functionality that does not ?t easily into any
of the preceding chapters: ?ushing and ?nishing (used to synchronize the GL com-
mand stream), and hints.

5.1 Flush and Finish

The command

void Flush( void );

indicates that all commands that have previously been sent to the GL must complete
in ?nite time.

The command

void Finish( void );

forces all previous GL commands to complete. Finish does not return until all
effects from previously issued commands on GL client and server state and the
framebuffer are fully realized.

5.2 Hints

Certain aspects of GL behavior, when there is room for variation, may be controlled
with hints. A hint is speci?ed using

void Hint( enum target, enum hint );

122

5.2. HINTS

123

target is a symbolic constant indicating the behavior to be controlled, and hint
target must
is a symbolic constant indicating what type of behavior is desired.
be GENERATE_MIPMAP_HINT, indicating the desired quality and performance of
mipmap level generation with GenerateMipmap. hint must be one of FASTEST,
indicating that the most ef?cient option should be chosen; NICEST, indicating that
the highest quality option should be chosen; and DONT_CARE, indicating no pref-
erence in the matter.

The interpretation of hints is implementation-dependent. An implementation

may ignore them entirely.

The initial value of all hints is DONT_CARE.

Version 2.0.25 (November 2, 2010)

Chapter 6

State and State Requests

The state required to describe the GL machine is enumerated in section 6.2. Most
state is set through the calls described in previous chapters, and can be queried
using the calls described in section 6.1.

6.1 Querying GL State

6.1.1 Simple Queries

Much of the GL state is completely identi?ed by symbolic constants. The values
of these state variables can be obtained using a set of Get commands. There are
four commands for obtaining simple state variables:

void GetBooleanv( enum value, boolean *data );
void GetIntegerv( enum value, int *data );
void GetFloatv( enum value, float *data );

The commands obtain boolean, integer, or ?oating-point state variables. value is
a symbolic constant indicating the state variable to return. data is a pointer to a
scalar or array of the indicated type in which to place the returned data. In addition

boolean IsEnabled( enum value );

can be used to determine if value is currently enabled (as with Enable) or disabled.

6.1.2 Data Conversions

If a Get command is issued that returns value types different from the type of the
value being obtained, a type conversion is performed.

124

6.1. QUERYING GL STATE

125

If GetBooleanv is called, a ?oating-point or integer value converts to FALSE if

and only if it is zero (otherwise it converts to TRUE).

If GetIntegerv (or any of the Get commands below) is called, a boolean value
is interpreted as either 1 or 0, and a ?oating-point value is rounded to the nearest
integer, unless the value is an RGBA color component, a DepthRangef value, a
depth buffer clear value, or a normal coordinate. In these cases, the Get command
converts the ?oating-point value to an integer according the INT entry of Table 4.4;
a value not in [?1, 1] converts to an unde?ned value.

If GetFloatv is called, a boolean value is interpreted as either 1.0 or 0.0, and

an integer value is coerced to ?oating-point.

If a value is so large in magnitude that it cannot be represented with the re-
quested type, then the nearest value representable using the requested type is re-
turned.

Unless otherwise indicated, multi-valued state variables return their multiple
values in the same order as they are given as arguments to the commands that set
them. For instance, the two DepthRangef parameters are returned in the order n
followed by f.

Most texture state variables are quali?ed by the value of ACTIVE_TEXTURE to
determine which server texture state vector is queried. Tables 6.2, 6.7, 6.9, and 6.19
indicate those state variables which are quali?ed by ACTIVE_TEXTURE during
state queries. Texture state queries will result in an INVALID_OPERATION error
if the value of ACTIVE_TEXTURE is greater than or equal to MAX_COMBINED_-
TEXTURE_IMAGE_UNITS.

6.1.3 Enumerated Queries

Other commands exist to obtain state variables that are identi?ed by a category
(texture ID, buffer object name, etc.) as well as a symbolic constant. These are

The command

void GetTexParameter{if}v( enum target, enum value,

T data );

returns information about target, which may be one of TEXTURE_2D or
TEXTURE_CUBE_MAP, indicating the currently bound two-dimensional or cube
map texture object. value is a symbolic value indicating which texture parame-
ter is to be obtained. value must be one of the symbolic values in table 3.10.

The command

void GetBufferParameteriv( enum target, enum value,

T data );

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

126

returns information about target, which may be one of ARRAY_BUFFER or
ELEMENT_ARRAY_BUFFER, indicating the currently bound vertex array or element
array buffer object. value is a symbolic value indicating which buffer object pa-
rameter is to be obtained, and must be one of the symbolic values in table 2.6.

The command

void GetFramebufferAttachmentParameteriv( enum target,

enum attachment, enum pname, int *params );

returns information about framebuffer objects. target must be FRAMEBUFFER.
attachment must be one of
the attachment points COLOR_ATTACHMENT0,
pname must be one of
DEPTH_ATTACHMENT, or STENCIL_ATTACHMENT.
the following: FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, FRAMEBUFFER_-
ATTACHMENT_OBJECT_NAME, FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL,
or FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE.

If the framebuffer currently bound to target

is zero,

then INVALID_-

OPERATION is generated.

Upon successful return from GetFramebufferAttachmentParameteriv, if
pname is FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, then param will contain
one of NONE, TEXTURE, or RENDERBUFFER, identifying the type of object which
contains the attached image.

If

value
the
RENDERBUFFER, then

of

FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE

is

• If pname is FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, params will con-
tain the name of the renderbuffer object which contains the attached image.

• Otherwise, INVALID_ENUM is generated.

If the value of FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE is TEXTURE, then

• If pname is FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, then params will
contain the name of the texture object which contains the attached image.

• If pname is FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL, then params
will contain the mipmap level of the texture object which contains the at-
tached image.

• If pname is FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE and
the texture object named FRAMEBUFFER_ATTACHMENT_OBJECT_NAME is a
cube map texture, then params will contain the cube map face of the cube-
map texture object which contains the attached image. Otherwise params
will contain the value zero.

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

127

• Otherwise, INVALID_ENUM is generated.

If the value of FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE is NONE, then

querying any other pname will generate INVALID_ENUM.

The command

void GetRenderbufferParameteriv( enum target, enum pname,

int* params );

returns

about renderbuffer objects.
of the symbolic values in table 6.23 other than RENDERBUFFER_BINDING.

information
target must be RENDERBUFFER. pname must be one

If the renderbuffer currently bound to target

is zero,

then INVALID_-

OPERATION is generated.
Upon successful

return from GetRenderbufferParameteriv,

if pname
is RENDERBUFFER_WIDTH, RENDERBUFFER_HEIGHT, or RENDERBUFFER_-
INTERNAL_FORMAT, then params will contain the width in pixels, height in pixels,
or internal format, respectively, of the image of the renderbuffer currently bound
to target.

Upon successful return from GetRenderbufferParameteriv,

if pname is
RENDERBUFFER_RED_SIZE, RENDERBUFFER_GREEN_SIZE, RENDERBUFFER_-
BLUE_SIZE, RENDERBUFFER_ALPHA_SIZE, RENDERBUFFER_DEPTH_SIZE, or
RENDERBUFFER_STENCIL_SIZE, then params will contain the actual resolutions,
(not the resolutions speci?ed when the image array was de?ned), for the red, green,
blue, alpha depth, or stencil components, respectively, of the image of the render-
buffer currently bound to target.

Otherwise, INVALID_ENUM is generated.

6.1.4 Texture Queries

The command

boolean IsTexture( uint texture );

returns TRUE if texture is the name of a texture object. If texture is zero, or is a non-
zero value that is not the name of a texture object, or if an error condition occurs,
IsTexture returns FALSE. A name returned by GenTextures, but not yet bound, is
not the name of a texture object.

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

128

6.1.5 String Queries

The command

ubyte *GetString( enum name );

returns a pointer to a static string describing some aspect of the current GL con-
nection 1. The possible values for name are VENDOR, RENDERER, VERSION,
SHADING_LANGUAGE_VERSION, and EXTENSIONS. The format of the RENDERER
and VENDOR strings is implementation-dependent. The EXTENSIONS string con-
tains a space separated list of extension names (the extension names themselves do
not contain any spaces).

The VERSION string is laid out as follows:

"OpenGL ES N.M vendor-specific information"

The SHADING_LANGUAGE_VERSION string is laid out as follows:

"OpenGL ES GLSL ES N.M vendor-specific information"

The version number is either of the form major number.minor number or
major number.minor number.release number, where the numbers all have one or
more digits. The release number and vendor speci?c information are optional.
However, if present, then they pertain to the server and their format and contents
are implementation-dependent.

GetString returns the version number (returned in the VERSION string) and
the extension names (returned in the EXTENSIONS string) that can be supported
on the connection. Thus, if the client and server support different versions and/or
extensions, a compatible version and list of extensions is returned.

6.1.6 Buffer Object Queries

The command

boolean IsBuffer( uint buffer );

returns TRUE if buffer is the name of an buffer object. If buffer is zero, or if buffer is
a non-zero value that is not the name of an buffer object, IsBuffer returns FALSE.

1Applications making copies of these static strings should never use a ?xed-length buffer, because
the strings may grow unpredictably between releases, resulting in buffer over?ow when copying.
This is particularly true of the EXTENSIONS string, which has become extremely long in some
GL implementations.

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

129

6.1.7 Framebuffer Object and Renderbuffer Queries

The command

boolean IsFramebuffer( uint framebuffer );

returns TRUE if framebuffer is the name of an framebuffer object. If framebuffer is
zero, or if framebuffer is a non-zero value that is not the name of an framebuffer
object, IsFramebuffer returns FALSE.

The command

boolean IsRenderbuffer( uint renderbuffer );

returns TRUE if renderbuffer is the name of a renderbuffer object. If renderbuffer
is zero, or if renderbuffer is a non-zero value that is not the name of a renderbuffer
object, IsRenderbuffer returns FALSE.

6.1.8 Shader and Program Queries

State stored in shader or program objects can be queried by commands that ac-
cept shader or program object names. These commands will generate the error
INVALID_VALUE if the provided name is not the name of either a shader or pro-
gram object and INVALID_OPERATION if the provided name identi?es a shader of
the other type. If an error is generated, variables used to hold return values are not
modi?ed.

The command

boolean IsShader( uint shader );

returns TRUE if shader is the name of a shader object. If shader is zero, or a non-
zero value that is not the name of a shader object, IsShader returns FALSE. No
error is generated if shader is not a valid shader object name.

The command

void GetShaderiv( uint shader, enum pname, int *params );

returns properties of the shader object named shader in params. The parameter
value to return is speci?ed by pname.

If pname is SHADER_TYPE, VERTEX_SHADER is returned if shader is a vertex
shader object, and FRAGMENT_SHADER is returned if shader is a fragment shader
If pname is DELETE_STATUS, TRUE is returned if the shader has been
object.

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

130

?agged for deletion and FALSE is returned otherwise. If pname is COMPILE_-
STATUS, TRUE is returned if the shader was last compiled sucessfully, and FALSE
is returned otherwise. If pname is INFO_LOG_LENGTH, the length of the info log,
including a null terminator, is returned. If there is no info log, zero is returned. If
pname is SHADER_SOURCE_LENGTH, the length of the concatenation of the source
strings making up the shader source, including a null terminator, is returned. If no
source has been de?ned, zero is returned.

If the value of SHADER_COMPILER is not TRUE, then the error INVALID_-
OPERATION is generated if pname is COMPILE_STATUS, INFO_LOG_LENGTH, or
SHADER_SOURCE_LENGTH.

The command

boolean IsProgram( uint program );

returns TRUE if program is the name of a program object. If program is zero, or a
non-zero value that is not the name of a program object, IsProgram returns FALSE.
No error is generated if program is not a valid program object name.

The command

void GetProgramiv( uint program, enum pname,

int *params );

returns properties of the program object named program in params. The parameter
value to return is speci?ed by pname.

If pname is DELETE_STATUS, TRUE is returned if the shader has been ?agged
for deletion and FALSE is returned otherwise. If pname is LINK_STATUS, TRUE
is returned if the shader was last compiled sucessfully, and FALSE is returned oth-
erwise. If pname is VALIDATE_STATUS, TRUE is returned if the last call to Vali-
dateProgram with program was successful, and FALSE is returned otherwise. If
pname is INFO_LOG_LENGTH, the length of the info log, including a null termina-
tor, is returned. If there is no info log, 0 is returned. If pname is ATTACHED_-
If pname is ACTIVE_-
SHADERS, the number of objects attached is returned.
ATTRIBUTES, the number of active attributes in program is returned. If no active
attributes exist, 0 is returned. If pname is ACTIVE_ATTRIBUTE_MAX_LENGTH, the
length of the longest active attribute name, including a null terminator, is returned.
If no active attributes exist, 0 is returned. If pname is ACTIVE_UNIFORMS, the
number of active uniforms is returned. If no active uniforms exist, 0 is returned.
If pname is ACTIVE_UNIFORM_MAX_LENGTH, the length of the longest active uni-
form name, including a null terminator, is returned. If no active uniforms exist, 0
is returned.

The command

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

131

void GetAttachedShaders( uint program, sizei maxCount,

sizei *count, uint *shaders );

returns the names of shader objects attached to program in shaders. The actual
number of shader names written into shaders is returned in count. If no shaders are
attached, count is set to zero. If count is NULL then it is ignored. The maximum
number of shader names that may be written into shaders is speci?ed by maxCount.
The number of objects attached to program is given by can be queried by calling
GetProgramiv with ATTACHED_SHADERS.

A string that contains information about the last compilation attempt on a
shader object or last link or validation attempt on a program object, called the
info log, can be obtained with the commands

void GetShaderInfoLog( uint shader, sizei bufSize,

sizei *length, char *infoLog );

void GetProgramInfoLog( uint program, sizei bufSize,

sizei *length, char *infoLog );

These commands return the info log string in infoLog. This string will be null
terminated. The actual number of characters written into infoLog, excluding the
null terminator, is returned in length. If length is NULL, then no length is returned.
The maximum number of characters that may be written into infoLog, including
the null terminator, is speci?ed by bufSize. The number of characters in the info
log can be queried with GetShaderiv or GetProgramiv with INFO_LOG_LENGTH.
If shader is a shader object, the returned info log will either be an empty string or
it will contain information about the last compilation attempt for that object. If
program is a program object, the returned info log will either be an empty string or
it will contain information about the last link attempt or last validation attempt for
that object.

If the value of SHADER_COMPILER is not TRUE, then the error INVALID_-

OPERATION is generated.

The info log is typically only useful during application development and an
application should not expect different GL implementations to produce identical
info logs.

The command

void GetShaderSource( uint shader, sizei bufSize,

sizei *length, char *source );

returns in source the string making up the source code for the shader object shader.
The string source will be null terminated. The actual number of characters written

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

132

into source, excluding the null terminator, is returned in length. If length is NULL,
no length is returned. The maximum number of characters that may be written into
source, including the null terminator, is speci?ed by bufSize. The string source is
a concatenation of the strings passed to the GL using ShaderSource. The length
of this concatenation is given by SHADER_SOURCE_LENGTH, which can be queried
with GetShaderiv.

If the value of SHADER_COMPILER is not TRUE, then the error INVALID_-

OPERATION is generated.

The command

void GetShaderPrecisionFormat( enum shadertype,

enum precisiontype, int *range, int *precision );

returns the range and precision for different numeric formats supported by the
shader compiler. shadertype must be VERTEX_SHADER or FRAGMENT_SHADER.
precisiontype must be one of LOW_FLOAT, MEDIUM_FLOAT, HIGH_FLOAT, LOW_-
INT, MEDIUM_INT or HIGH_INT. range points to an array of two integers in which
encodings of the format’s numeric range are returned. If min and max are the
smallest and largest values representable in the format, then the values returned are
de?ned to be

range[0] = (cid:98)log2(|min|)(cid:99)

range[1] = (cid:98)log2(|max|)(cid:99)

precision points to an integer in which the log2 value of the number of bits of
precision of the format is returned. If the smallest representable value greater than
1 is 1 + (cid:15), then *precision will contain (cid:98)?log2((cid:15))(cid:99), and every value in the range

[?2range[0], 2range[1]]

can be represented to at least one part in 2?precision. For example, an IEEE single-
precision ?oating-point format would return range[0] = 127, range[1] = 127,
and ?precision = 23, while a 32-bit twos-complement integer format would re-
turn range[0] = 31, range[1] = 30, and ?precision = 0.

The minimum required precision and range for formats corresponding to the
different values of precisiontype are described in section 4.5 of the OpenGL ES
Shading Language speci?cation.

If high precision ?oating-point is not supported in fragment shaders, calling
GetShaderPrecisionFormat with a precisiontype of HIGH_FLOAT will return zero
for range[0], range[1], and *precision.

Version 2.0.25 (November 2, 2010)

6.1. QUERYING GL STATE

133

If the value of SHADER_COMPILER is not TRUE, then the error INVALID_-

OPERATION is generated.
The commands

void GetVertexAttribfv( uint index, enum pname,

float *params );

void GetVertexAttribiv( uint index, enum pname,

int *params );

obtain the vertex attribute state named by pname for the generic vertex attribute
numbered index and places the information in the array params. pname must be
one of VERTEX_ATTRIB_ARRAY_ENABLED, VERTEX_ATTRIB_ARRAY_SIZE,
VERTEX_ATTRIB_ARRAY_STRIDE, VERTEX_ATTRIB_ARRAY_TYPE, VERTEX_-
ATTRIB_ARRAY_NORMALIZED,
VERTEX_ATTRIB_ARRAY_BUFFER_BINDING,
or CURRENT_VERTEX_ATTRIB. Note that all the queries except CURRENT_-
VERTEX_ATTRIB return client state. The error INVALID_VALUE is generated if
index is greater than or equal to MAX_VERTEX_ATTRIBS.

All but CURRENT_VERTEX_ATTRIB return information about generic vertex
attribute arrays. The enable state of a generic vertex attribute array is set by the
command EnableVertexAttribArray and cleared by DisableVertexAttribArray.
The size, stride, type and normalized ?ag are set by the command VertexAttrib-
Pointer. The query CURRENT_VERTEX_ATTRIB returns the current value for the
generic attribute index.
The command

void GetVertexAttribPointerv( uint index, enum pname,

void **pointer );

obtains the pointer named pname for vertex attribute numbered index and places
the information in the array pointer. pname must be VERTEX_ATTRIB_ARRAY_-
POINTER. The INVALID_VALUE error is generated if index is greater than or equal
to MAX_VERTEX_ATTRIBS.

The commands

void GetUniformfv( uint program, int location,

float *params );

void GetUniformiv( uint program, int location,

int *params );

return the value or values of the uniform at location location for program object
program in the array params. The type of the uniform at location determines the

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

134

number of values returned. The error INVALID_OPERATION is generated if pro-
gram has not been linked successfully, or if location is not a valid location for
program. In order to query the values of an array of uniforms, a GetUniform*
command needs to be issued for each array element. If the uniform queried is a
matrix, the values of the matrix are returned in column major order. If an error
occurred, the return parameter params will be unmodi?ed.

6.2 State Tables

The tables on the following pages indicate which state variables are obtained with
what commands. State variables that can be obtained using any of GetBooleanv,
GetIntegerv, or GetFloatv are listed with just one of these commands – the
one that is most appropriate given the type of the data to be returned. These
state variables cannot be obtained using IsEnabled. However, state variables for
which IsEnabled is listed as the query command can also be obtained using Get-
Booleanv, GetIntegerv, and GetFloatv. State variables for which any other com-
mand is listed as the query command can be obtained by using that command
or any of its typed variants, although information may be lost when not using the
listed command. Unless otherwise speci?ed, when ?oating-point state is returned
as integer values or integer state is returned as ?oating-point values it is converted
in the fashion described in section 6.1.2.

A type is also indicated for each variable. Table 6.1 explains these types. The
type actually identi?es all state associated with the indicated description; in certain
cases only a portion of this state is returned. This is the case with clip planes, where
only the selected clip plane is returned; and with textures, where only the selected
texture or texture parameter is returned.

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

135

Type code Explanation

B
c
C
Z
Z+
Zk, Zk?
R
R+
R[a,b]
Rk
Rk
S
Y
n × type

Boolean
Character in a counted string
Color (?oating-point R, G, B, and A values)
Integer
Non-negative integer
k-valued integer (k? indicates k is minimum)
Floating-point number
Non-negative ?oating-point number
Floating-point number in the range [a, b]
k-tuple of ?oating-point numbers
k-valued ?oating-point number
NULL-terminated string
Pointer (data type unspeci?ed)
n copies of type type (n? indicates n is minimum)

Table 6.1: State Variable Types

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

136

.
c
e
S

8

.

2

8

.

2

8

.

2

8

.

2

8

.

2

8

.

2

9

.

2

2

.

9
2

.

9

.

2

n
o
i
t
p
i
r
c
s
e
D

e
l
b
a
n
e
y
a
r
r
a

b
i
r
t
t
a
x
e
t
r
e
V

e
z
i
s
y
a
r
r
a
b
i
r
t
t
a

x
e
t
r
e
V

e
d
i
r
t
s
y
a
r
r
a
b
i
r
t
t
a

x
e
t
r
e
V

e
p
y
t
y
a
r
r
a
b
i
r
t
t
a

x
e
t
r
e
V

-
r
o
n

y
a
r
r
a

b
i
r
t
t
a

x
e
t
r
e
V

y
a
r
r
a

b
i
r
t
t
a

d
e
z
i
l
a
m

x
e
t
r
e
V

r
e
t
n
i
o
p

r
e
f
f
u
b

y
a
r
r
a

t
n
e
m
e
l
e

g
n
i
d
n
i
b

r
e
f
f
u
b

y
a
r
r
a

e
t
u
b
i
r
t
t

A

g
n
i
d
n
i
b

g
n
i
d
n
i
b

r
e
f
f
u
b

t
n
e
r
r
u
c

l
a
i
t
i
n
I

e
u
l
a
V

e
s
l
a
F

4

0

T
A
O
L
F

e
s
l
a
F

L
L
U
N

0

0

0

d
n
m
C

t
e
G

b

i
r
t
t

A
x
e
t
r
e
V
t
e
G

b

i
r
t
t

A
x
e
t
r
e
V
t
e
G

b

i
r
t
t

A
x
e
t
r
e
V
t
e
G

b

i
r
t
t

A
x
e
t
r
e
V
t
e
G

b

i
r
t
t

A
x
e
t
r
e
V
t
e
G

r
e
t
n

i
o
P
b

i
r
t
t

A

-
x
e
t
r
e
V
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

B
×
?
8

Z
×
?
8

+
Z
×
?
8

4
Z
×
?
8

B
×
?
8

Y
×
?
8

+
Z

+
Z

v
i
b

i
r
t
t

A
x
e
t
r
e
V
t
e
G

+
Z
×
?
8

e
u
l
a
v

t
e
G

D
E
L
B
A
N
E
Y
A
R
R
A
B
R
T
T
A
X
E
T
R
E
V

I

E
Z
I
S
Y
A
R
R
A
B
R
T
T
A
X
E
T
R
E
V

I

I

E
D
R
T
S
Y
A
R
R
A
B
R
T
T
A
X
E
T
R
E
V

I

D
E
Z
I
L
A
M
R
O
N
Y
A
R
R
A
B
R
T
T
A
X
E
T
R
E
V

I

E
P
Y
T
Y
A
R
R
A
B
R
T
T
A
X
E
T
R
E
V

I

I

R
E
T
N
O
P
Y
A
R
R
A
B
R
T
T
A
X
E
T
R
E
V

I

I

G
N
D
N
B

I

I

G
N
D
N
B

I

R
E
F
F
U
B
Y
A
R
R
A

R
E
F
F
U
B
Y
A
R
R
A
T
N
E
M
E
L
E

I

G
N
D
N
B

I

R
E
F
F
U
B
Y
A
R
R
A
B
R
T
T
A
X
E
T
R
E
V

I

Table 6.2. Vertex Array Data

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

137

.
c
e
S

9
2

.

9
2

.

n
o
i
t
p
i
r
c
s
e
D

n
r
e
t
t
a
p

e
g
a
s
u

r
e
f
f
u
b

e
z
i
s

a
t
a
d

r
e
f
f
u
b

W
A
R
D
_
C
I
T
A
T
S

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
B
t
e
G

3
Z
×
n

E
G
A
S
U
R
E
F
F
U
B

l
a
i
t
i
n
I

e
u
l
a
V

0

d
n
m
C

t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
B
t
e
G

e
p
y
T

+
Z
×
n

e
u
l
a
v
t
e
G

E
Z
I
S

R
E
F
F
U
B

Table 6.3. Buffer Object State

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

138

.
c
e
S

1

.

2
1

.

2

1

.

2
1

.

2

n
o
i
t
p
i
r
c
s
e
D

t
n
e
t
x
e
&
n
i
g
i
r
o

t
r
o
p
w
e
i
V

r
a
f

&

r
a
e
n
e
g
n
a
r

h
t
p
e
D

l
a
i
t
i
n
I

e
u
l
a
V

d
n
m
C

t
e
G

1
.
2
1
.
2

e
e
s

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

Z
×
4

1
,
0

v
t
a
o
l
F
t
e
G

+
R
×
2

e
u
l
a
v

t
e
G

E
G
N
A
R
H
T
P
E
D

T
R
O
P
W
E
I
V

Table 6.4. Transformation state

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

139

.
c
e
S

4
3

.

1
5

.

.

3

1
5

.

.

3

1
5

.

.

3

2
5

.

.

3

2
5

.

.

3

2
5

.

.

3

/

-
a
c
i
d
n
i
W
C
C
W
C
e
c
a
f
t
n
o
r
f
n
o
g
y
l
o
P

r
o
t

s
n
o
g
y
l
o
p

g
n
i
c
a
f
k
c
a
b
/
t
n
o
r
f

l
l
u
C

n
o
i
t
p
i
r
c
s
e
D

d
e
l
b
a
n
e

g
n
i
l
l
u
c

n
o
g
y
l
o
P

h
t
d
i
w
e
n
i
L

e
s
l
a
F

d
e
l

b
a
n
E
s
I

K
C
A
B

v
r
e
g
e
t
n
I
t
e
G

W
C
C

v
r
e
g
e
t
n
I
t
e
G

l
a
i
t
i
n
I

e
u
l
a
V

0
.
1

d
n
m
C

t
e
G

v
t
a
o
l
F
t
e
G

e
p
y
T

+
R

r
o
t
c
a
f

t
e
s
f
f
o

n
o
g
y
l
o
P

s
t
i
n
u

t
e
s
f
f
o

n
o
g
y
l
o
P

e
l
b
a
n
e

t
e
s
f
f
o

n
o
g
y
l
o
P

0

0

v
t
a
o
l
F
t
e
G

v
t
a
o
l
F
t
e
G

e
s
l
a
F

d
e
l

b
a
n
E
s
I

B

3
Z

2
Z

R

R

B

e
u
l
a
v

t
e
G

I

H
T
D
W
E
N
I
L

E
C
A
F

L
L
U
C

E
D
O
M
E
C
A
F

L
L
U
C

E
C
A
F

T
N
O
R
F

R
O
T
C
A
F

T
E
S
F
F
O
N
O
G
Y
L
O
P

S
T
I
N
U
T
E
S
F
F
O
N
O
G
Y
L
O
P

L
L
I
F

T
E
S
F
F
O
N
O
G
Y
L
O
P

Table 6.5. Rasterization

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

140

.
c
e
S

3
1

.

.

4

3
1

.

.

4

3
1

.

.

4

3
1

.

.

4

n
o
i
t
p
i
r
c
s
e
D

a
h
p
l
a
m
o
r
f

e
g
a
r
e
v
o
c

y
f
i
d
o
M

e
g
a
r
e
v
o
c

y
f
i
d
o
m
o
t

k
s
a

M

e
u
l
a
v
k
s
a
m
e
g
a
r
e
v
o
C

e
u
l
a
v

k
s
a
m
e
g
a
r
e
v
o
c

t
r
e
v
n
I

l
a
i
t
i
n
I

e
u
l
a
V

e
s
l
a
F

d
n
m
C

t
e
G

d
e
l

b
a
n
E
s
I

e
s
l
a
F

d
e
l

b
a
n
E
s
I

1

v
t
a
o
l
F
t
e
G

e
p
y
T

B

B

+
R

e
u
l
a
v

t
e
G

E
G
A
R
E
V
O
C
O
T
A
H
P
L
A
E
L
P
M
A
S

E
U
L
A
V
E
G
A
R
E
V
O
C

E
L
P
M
A
S

E
G
A
R
E
V
O
C

E
L
P
M
A
S

e
s
l
a
F

v
n
a
e
l
o
o
B
t
e
G

B

T
R
E
V
N

I

E
G
A
R
E
V
O
C

E
L
P
M
A
S

Table 6.6. Multisampling

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

141

.
c
e
S

3
1
7

.

.

3

2
1
7

.

.

3

o
t

d
n
u
o
b

t
c
e
j
b
o

e
r
u
t
x
e
T

D
2
_
E
R
U
T
X
E
T

o
t

d
n
u
o
b

t
c
e
j
b
o

e
r
u
t
x
e
T

P
A
M
_
E
B
U
C
_
E
R
U
T
X
E
T

0

0

n
o
i
t
p
i
r
c
s
e
D

l
a
i
t
i
n
I

e
u
l
a
V

d
n
m
C

t
e
G

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

+
Z
×
?
8

e
u
l
a
v

t
e
G

D
2
G
N
D
N
B

I

I

v
r
e
g
e
t
n
I
t
e
G

+
Z
×
?
8

P
A
M
E
B
U
C
G
N
D
N
B

I

I

E
R
U
T
X
E
T

E
R
U
T
X
E
T

Table 6.7. Textures (state per texture unit and binding point)

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

142

.
c
e
S

7

.

7
3

.

8

.

7
3

.

6

.

7
3

.

6

.

7
3

.

n
o
i
t
p
i
r
c
s
e
D

n
o
i
t
a
c
?
i
n
i
m

n
o
i
t
a
c
?
i
n
g
a
m

e
r
u
t
x
e
T

n
o
i
t
c
n
u
f

e
r
u
t
x
e
T

n
o
i
t
c
n
u
f

e
d
o
m
p
a
r
w
s
d
r
o
o
c
x
e
T

e
d
o
m
p
a
r
w
t
d
r
o
o
c
x
e
T

l
a
i
t
i
n
I

e
u
l
a
V

7
.
3

e
e
s

d
n
m
C

t
e
G

r
e
t
e
m
a
r
a
P
x
e
T
t
e
G

e
p
y
T

6
Z
×
n

7
.
3

e
e
s

r
e
t
e
m
a
r
a
P
x
e
T
t
e
G

2
Z
×
n

T
A
E
P
E
R

r
e
t
e
m
a
r
a
P
x
e
T
t
e
G

2
Z
×
n

T
A
E
P
E
R

r
e
t
e
m
a
r
a
P
x
e
T
t
e
G

2
Z
×
n

e
u
l
a
v

t
e
G

I

R
E
T
L
I
F
N
M
E
R
U
T
X
E
T

R
E
T
L
I
F
G
A
M
E
R
U
T
X
E
T

S

P
A
R
W
E
R
U
T
X
E
T

T

P
A
R
W
E
R
U
T
X
E
T

Table 6.8. Textures (state per texture object)

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

143

.
c
e
S

7
2

.

n
o
i
t
p
i
r
c
s
e
D

r
o
t
c
e
l
e
s

t
i
n
u
e
r
u
t
x
e
t

e
v
i
t
c
A

l
a
i
t
i
n
I

e
u
l
a
V

d
n
m
C

t
e
G

0
E
R
U
T
X
E
T

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

?
8
Z

e
u
l
a
v

t
e
G

E
R
U
T
X
E
T

E
V
I
T
C
A

Table 6.9. Texture Environment and Generation

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

144

.
c
e
S

2
1

.

.

4

2
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

4
1

.

.

4

5
1

.

.

4

5
1

.

.

4

n
o
i
t
c
a

l
i
a
f

r
e
f
f
u
b

h
t
p
e
d

l
i
c
n
e
t
s

t
n
o
r
F

e
u
l
a
v

e
c
n
e
r
e
f
e
r

l
i
c
n
e
t
s

t
n
o
r
F

n
o
i
t
c
a

l
i
a
f

l
i
c
n
e
t
s

t
n
o
r
F

-
c
a

s
s
a
p

r
e
f
f
u
b

h
t
p
e
d

l
i
c
n
e
t
s

t
n
o
r
F

n
o
i
t

e
u
l
a
v

e
c
n
e
r
e
f
e
r

l
i
c
n
e
t
s

k
c
a
B

n
o
i
t
c
a

l
i
a
f

l
i
c
n
e
t
s

k
c
a
B

n
o
i
t
c
n
u
f

l
i
c
n
e
t
s

k
c
a
B

k
s
a
m

l
i
c
n
e
t
s

k
c
a
B

n
o
i
t
c
a

l
i
a
f

r
e
f
f
u
b
h
t
p
e
d
l
i
c
n
e
t
s
k
c
a
B

n
o
i
t
c
a
s
s
a
p
r
e
f
f
u
b
h
t
p
e
d
l
i
c
n
e
t
s
k
c
a
B

n
o
i
t
p
i
r
c
s
e
D

d
e
l
b
a
n
e

g
n
i
r
o
s
s
i
c
S

x
o
b

r
o
s
s
i
c
S

n
o
i
t
c
n
u
f

l
i
c
n
e
t
s

t
n
o
r
F

d
e
l
b
a
n
e

g
n
i
l
i
c
n
e
t

S

k
s
a
m

l
i
c
n
e
t
s

t
n
o
r
F

e
s
l
a
F

d
e
l

b
a
n
E
s
I

S
Y
A
W
L
A

v
r
e
g
e
t
n
I
t
e
G

s
’
1

0

P
E
E
K

P
E
E
K

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

P
E
E
K

v
r
e
g
e
t
n
I
t
e
G

S
Y
A
W
L
A

v
r
e
g
e
t
n
I
t
e
G

s
’
1

0

P
E
E
K

P
E
E
K

P
E
E
K

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

n
o
i
t
c
n
u
f

t
s
e
t

r
e
f
f
u
b

h
t
p
e
D

d
e
l
b
a
n
e

r
e
f
f
u
b

h
t
p
e
D

e
s
l
a
F

d
e
l

b
a
n
E
s
I

S
S
E
L

v
r
e
g
e
t
n
I
t
e
G

l
a
i
t
i
n
I

e
u
l
a
V

e
s
l
a
F

d
n
m
C

t
e
G

d
e
l

b
a
n
E
s
I

e
p
y
T

B

2
.
1
.
4

e
e
s

v
r
e
g
e
t
n
I
t
e
G

Z
×
4

B

8
Z

+
Z

+
Z

8
Z

8
Z

8
Z

8
Z

+
Z

+
Z

8
Z

8
Z

8
Z

B

8
Z

e
u
l
a
v

t
e
G

T
S
E
T

R
O
S
S
I
C
S

X
O
B

R
O
S
S
I
C
S

T
S
E
T

L
I
C
N
E
T
S

C
N
U
F

L
I
C
N
E
T
S

K
S
A
M
E
U
L
A
V
L
I
C
N
E
T
S

F
E
R

L
I
C
N
E
T
S

L
I
A
F

L
I
C
N
E
T
S

L
I
A
F
H
T
P
E
D
S
S
A
P

L
I
C
N
E
T
S

S
S
A
P
H
T
P
E
D
S
S
A
P

L
I
C
N
E
T
S

K
S
A
M
E
U
L
A
V
K
C
A
B

L
I
C
N
E
T
S

C
N
U
F
K
C
A
B

L
I
C
N
E
T
S

F
E
R
K
C
A
B

L
I
C
N
E
T
S

L
I
A
F
K
C
A
B

L
I
C
N
E
T
S

L
I
A
F
H
T
P
E
D
S
S
A
P
K
C
A
B

L
I
C
N
E
T
S

S
S
A
P
H
T
P
E
D
S
S
A
P
K
C
A
B

L
I
C
N
E
T
S

T
S
E
T
H
T
P
E
D

C
N
U
F
H
T
P
E
D

Table 6.10. Pixel Operations

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

145

.
c
e
S

6
1

.

.

4

6
1

.

.

4

6
1

.

.

4

6
1

.

.

4

6
1

.

.

4

6
1

.

.

4

6
1

.

.

4

7
1

.

.

4

n
o
i
t
c
n
u
f

B
G
R
e
c
r
u
o
s

g
n
i
d
n
e
l
B

n
o
i
t
c
n
u
f

A
e
c
r
u
o
s

g
n
i
d
n
e
l
B

n
o
i
t
c
n
u
f

B
G
R

.
t
s
e
d

g
n
i
d
n
e
l
B

n
o
i
t
p
i
r
c
s
e
D

d
e
l
b
a
n
e

g
n
i
d
n
e
l
B

n
o
i
t
c
n
u
f

A

.
t
s
e
d

g
n
i
d
n
e
l
B

n
o
i
t
a
u
q
e

g
n
i
d
n
e
l
b
B
G
R

n
o
i
t
a
u
q
e
g
n
i
d
n
e
l
b

a
h
p
l
A

d
e
l
b
a
n
e

g
n
i
r
e
h
t
i

D

D
D
A
_
C
N
U
F

v
r
e
g
e
t
n
I
t
e
G

D
D
A
_
C
N
U
F

v
r
e
g
e
t
n
I
t
e
G

e
u
r
T

d
e
l

b
a
n
E
s
I

l
a
i
t
i
n
I

e
u
l
a
V

e
s
l
a
F

E
N
O

E
N
O

O
R
E
Z

O
R
E
Z

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

d
n
m
C

t
e
G

d
e
l

b
a
n
E
s
I

e
p
y
T

B

5
1
Z

5
1
Z

4
1
Z

4
1
Z

5
Z

5
Z

B

e
u
l
a
v
t
e
G

D
N
E
L
B

)

C
R
S
D
N
E
L
B
:
1
.
1
v
(

B
G
R

C
R
S
D
N
E
L
B

)
T
S
D
D
N
E
L
B
:
1
.
1
v
(

B
G
R

T
S
D
D
N
E
L
B

A
H
P
L
A
C
R
S
D
N
E
L
B

A
H
P
L
A
T
S
D
D
N
E
L
B

)

N
O
I
T
A
U
Q
E
D
N
E
L
B

:
1
.
1
v
(

B
G
R
N
O
I
T
A
U
Q
E
D
N
E
L
B

A
H
P
L
A
N
O
I
T
A
U
Q
E
D
N
E
L
B

R
E
H
T
I
D

Table 6.11. Pixel Operations (cont.)

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

146

.
c
e
S

2
2

.

.

4

2
2

.

.

4

2
2

.

.

4

2
2

.

.

4

3
2

.

.

4

3
2

.

.

4

3
2

.

.

4

n
o
i
t
p
i
r
c
s
e
D

A

r
o

,

B

,

G

,

R

;
s
e
l
b
a
n
e

e
t
i
r

w

r
o
l
o
C

g
n
i
t
i
r

w

r
o
f
d
e
l
b
a
n
e

r
e
f
f
u
b

h
t
p
e
D

k
s
a
m
e
t
i
r

w

r
e
f
f
u
b

l
i
c
n
e
t
s

t
n
o
r
F

k
s
a
m
e
t
i
r

w

r
e
f
f
u
b

l
i
c
n
e
t
s

k
c
a
B

A
B
G
R

(

e
u
l
a
v

r
a
e
l
c

r
e
f
f
u
b

r
o
l
o
C

)
e
d
o
m

e
u
r
T

v
n
a
e
l
o
o
B
t
e
G

s
’
1

s
’
1

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

0
,
0
,
0
,
0

v
t
a
o
l
F
t
e
G

l
a
i
t
i
n
I

e
u
l
a
V

e
u
r
T

d
n
m
C

t
e
G

v
n
a
e
l
o
o
B
t
e
G

e
p
y
T

B
×
4

e
u
l
a
v

r
a
e
l
c

r
e
f
f
u
b

h
t
p
e
D

e
u
l
a
v

r
a
e
l
c

l
i
c
n
e
t

S

1

0

v
t
a
o
l
F
t
e
G

v
r
e
g
e
t
n
I
t
e
G

B

+
Z

+
Z

C

+
R

+
Z

e
u
l
a
v

t
e
G

K
S
A
M
E
T
I
R
W
R
O
L
O
C

K
S
A
M
E
T
I
R
W
H
T
P
E
D

K
S
A
M
E
T
I
R
W
L
I
C
N
E
T
S

K
S
A
M
E
T
I
R
W
K
C
A
B

L
I
C
N
E
T
S

E
U
L
A
V
R
A
E
L
C

R
O
L
O
C

E
U
L
A
V
R
A
E
L
C
H
T
P
E
D

E
U
L
A
V
R
A
E
L
C

L
I
C
N
E
T
S

Table 6.12. Framebuffer Control

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

147

.
c
e
S

1

.

6
3

.

1

.

3
4

.

T
N
E
M
N
G
I
L
A
_
K
C
A
P
N
U
f
o

e
u
l
a
V

T
N
E
M
N
G
I
L
A
_
K
C
A
P
f
o

e
u
l
a
V

4

4

n
o
i
t
p
i
r
c
s
e
D

l
a
i
t
i
n
I

e
u
l
a
V

d
n
m
C

t
e
G

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

+
Z

e
u
l
a
v

t
e
G

T
N
E
M
N
G
I
L
A
K
C
A
P
N
U

v
r
e
g
e
t
n
I
t
e
G

+
Z

T
N
E
M
N
G
I
L
A
K
C
A
P

Table 6.13. Pixels

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

148

.
c
e
S

1

.

0
1

.

2

1

.

0
1

.

2

1

.

0
1

.

2

8
1

.

.

6

8
1

.

.

6

1

.

0
1

.

2

8
1

.

.

6

n
o
i
t
p
i
r
c
s
e
D

)
t
n
e
m
g
a
r
f

r
o
x
e
t
r
e
v
(

r
e
d
a
h
s

f
o
e
p
y
T

n
o
i
t
e
l
e
d

r
o
f
d
e
g
g
a
?
r
e
d
a
h
S

s
t
c
e
j
b
o

r
e
d
a
h
s

r
o
f

g
o
l

o
f
n
I

d
e
d
e
e
c
c
u
s

e
l
i
p
m
o
c

t
s
a
L

r
e
d
a
h
s

a

r
o
f

e
d
o
c

e
c
r
u
o
S

e
d
o
c

e
c
r
u
o
s

f
o

h
t
g
n
e
L

g
o
l

o
f
n
i

f
o

h
t
g
n
e
L

l
a
i
t
i
n
I

e
u
l
a
V

-

e
s
l
a
F

e
s
l
a
F

d
n
m
C

t
e
G

v
i
r
e
d
a
h
S
t
e
G

v
i
r
e
d
a
h
S
t
e
G

v
i
r
e
d
a
h
S
t
e
G

e
p
y
T

2
Z

B

B

e
u
l
a
v
t
e
G

E
P
Y
T

R
E
D
A
H
S

S
U
T
A
T
S

E
T
E
L
E
D

S
U
T
A
T
S

E
L
I
P
M
O
C

g
n
i
r
t
s

y
t
p
m
e

g
o
L
o
f
n
I
r
e
d
a
h
S
t
e
G

c
×
?
0

-

0

v
i
r
e
d
a
h
S
t
e
G

+
Z

H
T
G
N
E
L
G
O
L
O
F
N

I

g
n
i
r
t
s

y
t
p
m
e

e
c
r
u
o
S
r
e
d
a
h
S
t
e
G

c
×
?
0

-

0

v
i
r
e
d
a
h
S
t
e
G

+
Z

H
T
G
N
E
L

E
C
R
U
O
S

R
E
D
A
H
S

Table 6.14. Shader Object State

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

149

.
c
e
S

n
o
i
t
p
i
r
c
s
e
D

.

3
0
1
2

.

.

3
0
1
2

.

.

3
0
1
2

.

.

3
0
1
2

.

8

.

1
6

.

8

.

1
6

.

8

.

1
6

.

.

4
0
1
2

.

.

4
0
1
2

.

8

.

1
6

.

.

4
0
1
2

.

.

4
0
1
2

.

.

4
0
1
2

.

.

4
0
1
2

.

.

4
0
1
2

.

.

4
0
1
2

.

.

4
0
1
2

.

.

4
0
1
2

.

.

4
0
1
2

.

t
c
e
j
b
o
m
a
r
g
o
r
p
t
n
e
r
r
u
c

f
o

e
m
a
N

d
e
d
e
e
c
c
u
s

t
p
m
e
t
t
a

k
n
i
l

t
s
a
L

d
e
t
e
l
e
d

t
c
e
j
b
o
m
a
r
g
o
r
P

s
t
c
e
j
b
o

r
e
d
a
h
s
d
e
h
c
a
t
t
a

f
o

r
e
b
m
u
N

d
e
d
e
e
c
c
u
s

t
p
m
e
t
t
a

e
t
a
d
i
l
a
v

t
s
a
L

t
c
e
j
b
o
m
a
r
g
o
r
p
r
o
f

g
o
l

o
f
n
I

d
e
h
c
a
t
t
a

s
t
c
e
j
b
o
r
e
d
a
h
S

g
o
l
o
f
n
i

f
o

h
t
g
n
e
L

s
m
r
o
f
i
n
u

e
v
i
t
c
a

f
o

r
e
b
m
u
N

s
m
r
o
f
i
n
u

e
v
i
t
c
a

f
o

n
o
i
t
a
c
o
L

m
r
o
f
i
n
u

e
v
i
t
c
a

f
o

e
z
i

S

m
r
o
f
i
n
u

e
v
i
t
c
a

f
o

e
p
y
T

m
r
o
f
i
n
u
e
v
i
t
c
a

f
o

e
m
a
N

e
u
l
a
v
m
r
o
f
i
n
U

e
t
u
b
i
r
t
t
a

c
i
r
e
n
e
g

e
v
i
t
c
a

f
o

n
o
i
t
a
c
o
L

s
e
t
u
b
i
r
t
t
a

e
v
i
t
c
a

f
o

r
e
b
m
u
N

e
t
u
b
i
r
t
t
a

e
v
i
t
c
a

f
o

e
z
i

S

e
t
u
b
i
r
t
t
a

e
v
i
t
c
a

f
o

e
p
y
T

e
t
u
b
i
r
t
t
a

e
v
i
t
c
a

f
o

e
m
a
N

0

0

–

–

–

0

0

–

–

–

y
t
p
m
e

m
r
o
f
i

n
U
e
v
i
t
c
A
t
e
G

c
×
?
0

n
o
i
t
a
c
o
L
m
r
o
f
i

n
U
t
e
G

Z
×
?
0

m
r
o
f
i

n
U
e
v
i
t
c
A
t
e
G

m
r
o
f
i

n
U
e
v
i
t
c
A
t
e
G

+
Z
×
?
0

+
Z
×
?
0

l
a
i
t
i
n
I

e
u
l
a
V

0

e
s
l
a
F

e
s
l
a
F

e
s
l
a
F

d
n
m
C

t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
i
m
a
r
g
o
r
P
t
e
G

v
i
m
a
r
g
o
r
P
t
e
G

v
i
m
a
r
g
o
r
P
t
e
G

0

v
i
m
a
r
g
o
r
P
t
e
G

e
p
y
T

+
Z

B

B

B

+
Z

y
t
p
m
e

s
r
e
d
a
h
S
d
e
h
c
a
t
t

A
t
e
G

Z
×
?
0

y
t
p
m
e

g
o
L
o
f
n
I
m
a
r
g
o
r
P
t
e
G

c
×
?
0

e
u
l
a
v
t
e
G

M
A
R
G
O
R
P

T
N
E
R
R
U
C

S
U
T
A
T
S

E
T
E
L
E
D

S
U
T
A
T
S
K
N
I
L

S
U
T
A
T
S

E
T
A
D
I
L
A
V

S
R
E
D
A
H
S
D
E
H
C
A
T
T
A

-

-

v
i
m
a
r
g
o
r
P
t
e
G

v
i
m
a
r
g
o
r
P
t
e
G

+
Z

+
Z

H
T
G
N
E
L
G
O
L
O
F
N

I

S
M
R
O
F
I
N
U
E
V
I
T
C
A

m
r
o
f
i

n
U
t
e
G

R
×
?
2
1
5

v
i
m
a
r
g
o
r
P
t
e
G

+
Z

I

S
E
T
U
B
R
T
T
A
E
V
I
T
C
A

y
t
p
m
e

b

i
r
t
t

A
e
v
i
t
c
A
t
e
G

r
a
h
c
×
?
0

n
o
i
t
a
c
o
L
b
i
r
t
t

A
t
e
G

Z
×
?
0

b

i
r
t
t

A
e
v
i
t
c
A
t
e
G

b

i
r
t
t

A
e
v
i
t
c
A
t
e
G

+
Z
×
?
0

+
Z
×
?
0

-

-

-

-

-

-

-

-

Table 6.15. Program Object State

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

150

.
c
e
S

7

.

2

n
o
i
t
p
i
r
c
s
e
D

e
t
u
b
i
r
t
t
a
x
e
t
r
e
v

c
i
r
e
n
e
G

l
a
i
t
i
n
I

e
u
l
a
V

1
,
0
,
0
,
0

d
n
m
C

t
e
G

b

i
r
t
t

A
x
e
t
r
e
V
t
e
G

e
p
y
T

4
R
×
?
6
1

e
u
l
a
v
t
e
G

I

B
R
T
T
A
X
E
T
R
E
V
T
N
E
R
R
U
C

Table 6.16. Vertex Shader State

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

151

.
c
e
S

2
5

.

n
o
i
t
p
i
r
c
s
e
D

t
n
i
h

n
o
i
t
a
r
e
n
e
g

p
a
m
p
i
M

l
a
i
t
i
n
I

e
u
l
a
V

d
n
m
C

t
e
G

E
R
A
C
_
T
N
O
D

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

3
Z

e
u
l
a
v

t
e
G

I

T
N
H
P
A
M
P
I
M
E
T
A
R
E
N
E
G

Table 6.17. Hints

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

152

.
c
e
S

3

1
7

.

.

3

1
7

.

.

3

1

.

2
1

.

2

3
3

.

4
3

.

2
3

.

2
3

.

3
7

.

.

3

3
7

.

.

3

-
b
u
s

f
o

s
t
i
b

f
o

r
e
b
m
u
N

n
e
e
r
c
s

n
i

n
o
i
s
i
c
e
r
p

l
e
x
i
p

w
y

d
n
a

w
x

e
g
a
m

i

e
r
u
t
x
e
t

m
u
m
i
x
a
M

n
o
i
s
n
e
m
i
d

-
x
e
t

p
a
m
e
b
u
c
m
u
m
i
x
a
M

n
o
i
s
n
e
m
i
d

e
g
a
m

i

e
r
u
t

-
i
d

t
r
o
p
w
e
i
v

m
u
m
i
x
a
M

s
n
o
i
s
n
e
m

d
e
s
a
i
l
a
f
o
)
i
h
o
t
o
l
(
e
g
n
a
R

s
e
z
i
s

t
n
i
o
p

d
e
s
a
i
l
a
f
o
)
i
h
o
t
o
l
(
e
g
n
a
R

s
h
t
d
i
w
e
n
i
l

e
l
p
m
a
s
i
t
l
u
m

f
o

r
e
b
m
u
N

s
r
e
f
f
u
b

d
e
s
s
e
r
p
m
o
c

d
e
t
a
r
e
m
u
n
E

s
t
a
m
r
o
f

e
r
u
t
x
e
t

d
e
t
a
r
e
m
u
n
e

f
o

r
e
b
m
u
N

-
r
o
f

e
r
u
t
x
e
t

d
e
s
s
e
r
p
m
o
c

s
t
a
m

e
z
i
s
k
s
a
m
e
g
a
r
e
v
o
C

4

4
6

6
1

1
.
2
1
.
2

e
e
s

1
,
1

1
,
1

0

0

-

0

n
o
i
t
p
i
r
c
s
e
D

m
u
m
i
n
i
M

e
u
l
a
V

d
n
m
C

t
e
G

v
r
e
g
e
t
n
I
t
e
G

Z

S
T
A
M
R
O
F

E
R
U
T
X
E
T
D
E
S
S
E
R
P
M
O
C
M
U
N

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
t
a
o
l
F
t
e
G

v
t
a
o
l
F
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

+
Z

+
Z

+
Z

+
Z
×
2

+
R
×
2

+
R
×
2

+
Z

+
Z

?
0
Z
×
?
0

e
u
l
a
v
t
e
G

S
T
I
B

L
E
X
I
P
B
U
S

E
Z
I
S

E
R
U
T
X
E
T

P
A
M
E
B
U
C
X
A
M

E
Z
I
S

E
R
U
T
X
E
T
X
A
M

E
G
N
A
R

E
Z
I
S

I

T
N
O
P
D
E
S
A
I
L
A

I

E
G
N
A
R
H
T
D
W
E
N
I
L
D
E
S
A
I
L
A

I

S
M
D
T
R
O
P
W
E
I
V
X
A
M

S
T
A
M
R
O
F

E
R
U
T
X
E
T
D
E
S
S
E
R
P
M
O
C

S
R
E
F
F
U
B

E
L
P
M
A
S

S
E
L
P
M
A
S

Table 6.18. Implementation Dependent Values

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

153

.
c
e
S

2

.

0
1

.

2

2

.

0
1

.

2

0
1
2

.

8
1

.

.

6

8
1

.

.

6

5
1

.

.

6

5
1

.

.

6

5
1

.

.

6

5
1

.

.

6

5
1

.

.

6

-
i
b

r
e
d
a
h
s

d
e
t
a
r
e
m
u
n
E

s
t
a
m
r
o
f

y
r
a
n

y
r
a
n
i
b

r
e
d
a
h
s

f
o

r
e
b
m
u
N

-
p
u
s

r
e
l
i
p
m
o
c

s
t
a
m
r
o
f

r
e
d
a
h
S

d
e
t
r
o
p

a
t
a
d

r
e
d
a
h
S

t
n
e
m
g
a
r
F

s
e
g
n
a
r

e
p
y
t

a
t
a
d

r
e
d
a
h
S

t
n
e
m
g
a
r
F

s
n
o
i
s
i
c
e
r
p

e
p
y
t

s
n
o
i
s
n
e
t
x
e

d
e
t
r
o
p
p
u
S

g
n
i
r
t
s

r
e
r
e
d
n
e
R

-
r
e
v

e
g
a
u
g
n
a
L

g
n
i
d
a
h
S

d
e
t
r
o
p
p
u
s
n
o
i
s

g
n
i
r
t
s

r
o
d
n
e
V

-
p
u
s

n
o
i
s
r
e
v

L
G
n
e
p
O

d
e
t
r
o
p

-

0

-

-

-

–

–

–

–

–

n
o
i
t
p
i
r
c
s
e
D

m
u
m
i
n
i
M

e
u
l
a
V

d
n
m
C

t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
n
a
e
l
o
o
B
t
e
G

e
p
y
T

Z
×
f
n

Z

B

t
a
m
r
o
F
n
o
i
s
i
c
e
r
P

-
r
e
d
a
h
S
t
e
G

t
a
m
r
o
F
n
o
i
s
i
c
e
r
P

-
r
e
d
a
h
S
t
e
G

+
Z
×
2
×
6
×
2

+
Z
×
6
×
2

g
n

i
r
t
S
t
e
G

g
n

i
r
t
S
t
e
G

g
n

i
r
t
S
t
e
G

g
n

i
r
t
S
t
e
G

g
n

i
r
t
S
t
e
G

S

S

S

S

S

e
u
l
a
v
t
e
G

S
T
A
M
R
O
F
Y
R
A
N
B

I

R
E
D
A
H
S

S
T
A
M
R
O
F
Y
R
A
N
B

I

R
E
D
A
H
S
M
U
N

R
E
L
I
P
M
O
C

R
E
D
A
H
S

N
O
I
S
R
E
V
E
G
A
U
G
N
A
L
G
N
D
A
H
S

I

R
O
D
N
E
V

N
O
I
S
R
E
V

S
N
O
I
S
N
E
T
X
E

R
E
R
E
D
N
E
R

–

–

Table 6.19. Implementation Dependent Values (cont.)

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

154

.
c
e
S

7
2

.

.

4
0
1
2

.

.

4
0
1
2

.

.

5
0
1
2

.

.

5
0
1
2

.

.

5
0
1
2

.

1

.

8
3

.

3

.

4
4

.

n
o
i
t
p
i
r
c
s
e
D

m
u
m
i
n
i
M

e
u
l
a
V

d
n
m
C

t
e
G

x
e
t
r
e
v

e
v
i
t
c
a

f
o

r
e
b
m
u
N

s
e
t
u
b
i
r
t
t
a

r
o
f

s
r
o
t
c
e
v

f
o

r
e
b
m
u
N

m
r
o
f
i
n
u

r
e
d
a
h
s

x
e
t
r
e
v

s
e
l
b
a
i
r
a
v

r
o
f

s
r
o
t
c
e
v

f
o

r
e
b
m
u
N

s
e
l
b
a
i
r
a
v
g
n
i
y
r
a
v

e
r
u
t
x
e
t

f
o

r
e
b
m
u
n

l
a
t
o
T

e
h
t

y
b

e
l
b
i
s
s
e
c
c
a

s
t
i
n
u

L
G

e
g
a
m

i

e
r
u
t
x
e
t

f
o

r
e
b
m
u
N

-
r
e
v

a

y
b

e
l
b
i
s
s
e
c
c
a

s
t
i
n
u

r
e
d
a
h
s

x
e
t

e
g
a
m

i

e
r
u
t
x
e
t

f
o

r
e
b
m
u
N

-
g
a
r
f

y
b

e
l
b
i
s
s
e
c
c
a

s
t
i
n
u

g
n
i
s
s
e
c
o
r
p

t
n
e
m

r
o
f

s
r
o
t
c
e
v

f
o

r
e
b
m
u
N

m
r
o
f
i
n
u

r
e
d
a
h
s

.

g
a
r
f

s
e
l
b
a
i
r
a
v

r
e
f
f
u
b
r
e
d
n
e
r

m
u
m
i
x
a
M

e
z
i
s

8

8
2
1

8

8

0

8

6
1

1

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

+
Z

e
u
l
a
v

t
e
G

I

S
B
R
T
T
A
X
E
T
R
E
V
X
A
M

+
Z

+
Z

+
Z

+
Z

+
Z

+
Z

+
Z

S
T
I
N
U
E
G
A
M

I

E
R
U
T
X
E
T
D
E
N
B
M
O
C
X
A
M

I

S
R
O
T
C
E
V
G
N
Y
R
A
V
X
A
M

I

S
R
O
T
C
E
V
M
R
O
F
I
N
U
X
E
T
R
E
V
X
A
M

S
T
I
N
U
E
G
A
M

I

E
R
U
T
X
E
T
X
E
T
R
E
V
X
A
M

S
R
O
T
C
E
V
M
R
O
F
I
N
U
T
N
E
M
G
A
R
F
X
A
M

S
T
I
N
U
E
G
A
M

I

E
R
U
T
X
E
T
X
A
M

E
Z
I
S

R
E
F
F
U
B
R
E
D
N
E
R
X
A
M

Table 6.20. Implementation Dependent Values (cont.)

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

155

.
c
e
S

4

4

4

1

.

3
4

.

1

.

3
4

.

r
e
f
f
u
b

r
o
l
o
c

x

,

D
E
R

f
o

e
n
o

n
i

s
i

s
t
i
b

f
o

r
e
b
m
u
N

x

;
t
n
e
n
o
p
m
o
c

A
H
P
L
A
r
o

,

E
U
L
B

,

N
E
E
R
G

e
p
y
t

l
e
x
i
p
d
e
r
r
e
f
e
r
p
n
o
i
t
a
t
n
e
m
e
l
p
m

I

-
r
o
f

l
e
x
i
p

d
e
r
r
e
f
e
r
p

n
o
i
t
a
t
n
e
m
e
l
p
m

I

t
a
m

s
e
n
a
l
p

r
e
f
f
u
b
h
t
p
e
d

f
o
r
e
b
m
u
N

s
e
n
a
l
p
l
i
c
n
e
t
s

f
o
r
e
b
m
u
N

-

-

-

-

-

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
r
e
g
e
t
n
I
t
e
G

n
o
i
t
p
i
r
c
s
e
D

l
a
i
t
i
n
I

e
u
l
a
V

d
n
m
C

t
e
G

e
p
y
T

+
Z

+
Z

+
Z

+
Z

+
Z

T
A
M
R
O
F
D
A
E
R

R
O
L
O
C
N
O
I
T
A
T
N
E
M
E
L
P
M

I

E
P
Y
T
D
A
E
R

R
O
L
O
C
N
O
I
T
A
T
N
E
M
E
L
P
M

I

S
T
I
B
H
T
P
E
D

S
T
I
B

L
I
C
N
E
T
S

e
u
l
a
v

t
e
G

S
T
I
B

x

Table 6.21. Implementation Dependent Pixel Depths

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

156

.
c
e
S

5
2

.

5
2

.

r
o
r
r
e
g
n
i
d
n
o
p
s
e
r
r
o
c
a
s
i
e
r
e
h
t

f
i
e
u
r
T

n
o
i
t
p
i
r
c
s
e
D

)
s
(
e
d
o
c

r
o
r
r
e

t
n
e
r
r
u
C

l
a
i
t
i
n
I

e
u
l
a
V

d
n
m
C

t
e
G

R
O
R
R
E
_
O
N

r
o
r
r
E
t
e
G

e
s
l
a
F

–

e
p
y
T

8
Z
×
n

B
×
n

e
u
l
a
v

t
e
G

–

–

Table 6.22. Miscellaneous

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

157

.
c
e
S

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

3
4

.

.

4

n
o
i
t
p
i
r
c
s
e
D

g
n
i
d
n
i
b

r
e
f
f
u
b
r
e
d
n
e
R

h
t
d
i
w

r
e
f
f
u
b
r
e
d
n
e
R

t
h
g
i
e
h

r
e
f
f
u
b
r
e
d
n
e
R

l
a
i
t
i
n
I

e
u
l
a
V

0

0

0

d
n
m
C

t
e
G

v
r
e
g
e
t
n
I
t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

t
a
m
r
o
f

l
a
n
r
e
t
n
i

r
e
f
f
u
b
r
e
d
n
e
R

4
A
B
G
R

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

e
z
i
s

n
e
e
r
g

r
e
f
f
u
b
r
e
d
n
e
R

e
z
i
s

e
u
l
b

r
e
f
f
u
b
r
e
d
n
e
R

e
z
i
s

a
h
p
l
a

r
e
f
f
u
b
r
e
d
n
e
R

e
z
i
s
h
t
p
e
d

r
e
f
f
u
b
r
e
d
n
e
R

e
z
i
s
d
e
r

r
e
f
f
u
b
r
e
d
n
e
R

e
z
i
s

l
i
c
n
e
t
s

r
e
f
f
u
b
r
e
d
n
e
R

0

0

0

0

0

0

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

v
i
r
e
t
e
m
a
r
a
P
r
e
f
f
u
b
r
e
d
n
e
R
t
e
G

e
p
y
T

+
Z

+
Z

+
Z

+
Z

+
Z

+
Z

+
Z

+
Z

+
Z

+
Z

e
u
l
a
v
t
e
G

I

G
N
D
N
B

I

R
E
F
F
U
B
R
E
D
N
E
R

T
A
M
R
O
F

L
A
N
R
E
T
N

I

R
E
F
F
U
B
R
E
D
N
E
R

I

H
T
D
W
R
E
F
F
U
B
R
E
D
N
E
R

T
H
G
I
E
H
R
E
F
F
U
B
R
E
D
N
E
R

E
Z
I
S
N
E
E
R
G
R
E
F
F
U
B
R
E
D
N
E
R

E
Z
I
S

E
U
L
B

R
E
F
F
U
B
R
E
D
N
E
R

E
Z
I
S
A
H
P
L
A
R
E
F
F
U
B
R
E
D
N
E
R

E
Z
I
S
H
T
P
E
D
R
E
F
F
U
B
R
E
D
N
E
R

E
Z
I
S
D
E
R

R
E
F
F
U
B
R
E
D
N
E
R

E
Z
I
S

L
I
C
N
E
T
S

R
E
F
F
U
B
R
E
D
N
E
R

Table 6.23. Renderbuffer State

Version 2.0.25 (November 2, 2010)

6.2. STATE TABLES

158

.
c
e
S

2
4

.

.

4

2
4

.

.

4

2
4

.

.

4

2
4

.

.

4

n
o
i
t
p
i
r
c
s
e
D

e
p
y
t

t
c
e
j
b
o

r
e
f
f
u
b
e
m
a
r
F

g
n
i
d
n
i
b

r
e
f
f
u
b
e
m
a
r
F

l
a
i
t
i
n
I

e
u
l
a
V

0

E
N
O
N

e
m
a
n

t
c
e
j
b
o

r
e
f
f
u
b
e
m
a
r
F

l
e
v
e
l

e
r
u
t
x
e
t

r
e
f
f
u
b
e
m
a
r
F

0

0

2
4

.

.

4

e
r
u
t
x
e
t

e
c
a
f

p
a
m
e
b
u
c

r
e
f
f
u
b
e
m
a
r
F

E
N
O
N

d
n
m
C

t
e
G

-
r
e
f
f
u
b
e
m
a
r
F
t
e
G

-
t
n
e
m
h
c
a
t
t

A

v
i
r
e
t
e
m
a
r
a
P

-
r
e
f
f
u
b
e
m
a
r
F
t
e
G

-
t
n
e
m
h
c
a
t
t

A

v
i
r
e
t
e
m
a
r
a
P

-
r
e
f
f
u
b
e
m
a
r
F
t
e
G

-
t
n
e
m
h
c
a
t
t

A

v
i
r
e
t
e
m
a
r
a
P

-
r
e
f
f
u
b
e
m
a
r
F
t
e
G

-
t
n
e
m
h
c
a
t
t

A

v
i
r
e
t
e
m
a
r
a
P

v
r
e
g
e
t
n
I
t
e
G

e
p
y
T

+
Z

3
Z
×
n

+
Z
×
n

+
Z
×
n

E
P
Y
T

T
C
E
J
B
O
T
N
E
M
H
C
A
T
T
A
R
E
F
F
U
B
E
M
A
R
F

E
M
A
N
T
C
E
J
B
O
T
N
E
M
H
C
A
T
T
A
R
E
F
F
U
B
E
M
A
R
F

L
E
V
E
L

E
R
U
T
X
E
T

T
N
E
M
H
C
A
T
T
A
R
E
F
F
U
B
E
M
A
R
F

e
u
l
a
v
t
e
G

I

G
N
D
N
B

I

R
E
F
F
U
B
E
M
A
R
F

6
Z
×
n

E
C
A
F

P
A
M
E
B
U
C

E
R
U
T
X
E
T

T
N
E
M
H
C
A
T
T
A
R
E
F
F
U
B
E
M
A
R
F

Table 6.24. Framebuffer State

Version 2.0.25 (November 2, 2010)

Appendix A

Invariance

The OpenGL ES speci?cation is not pixel exact. It therefore does not guarantee an
exact match between images produced by different GL implementations. However,
the speci?cation does specify exact matches, in some cases, for images produced
by the same implementation. The purpose of this appendix is to identify and pro-
vide justi?cation for those cases that require exact matches.

A.1 Repeatability

The obvious and most fundamental case is repeated issuance of a series of GL com-
mands. For any given GL and framebuffer state vector, and for any GL command,
the resulting GL and framebuffer state must be identical whenever the command is
executed on that initial GL and framebuffer state.

One purpose of repeatability is avoidance of visual artifacts when a double-
buffered scene is redrawn. If rendering is not repeatable, swapping between two
buffers rendered with the same command sequence may result in visible changes
in the image. Such false motion is distracting to the viewer. Another reason for
repeatability is testability.

Repeatability, while important, is a weak requirement. Given only repeata-
bility as a requirement, two scenes rendered with one (small) polygon changed
in position might differ at every pixel. Such a difference, while within the law
of repeatability, is certainly not within its spirit. Additional invariance rules are
desirable to ensure useful operation.

159

A.2. MULTI-PASS ALGORITHMS

160

A.2 Multi-pass Algorithms

Invariance is necessary for a whole set of useful multi-pass algorithms. Such al-
gorithms render multiple times, each time with a different GL mode vector, to
eventually produce a result in the framebuffer. Examples of these algorithms in-
clude:

• “Erasing” a primitive from the framebuffer by redrawing it either using the

XOR logical operation or in a different color.

• Using stencil operations to compute capping planes.

On the other hand, invariance rules can greatly increase the complexity of high-
performance implementations of the GL. Even the weak repeatability requirement
signi?cantly constrains a parallel implementation of the GL. Because GL imple-
mentations are required to implement ALL GL capabilities, not just a convenient
subset, those that utilize hardware acceleration are expected to alternate between
hardware and software modules based on the current GL mode vector. A strong
invariance requirement forces the behavior of the hardware and software modules
to be identical, something that may be very dif?cult to achieve (for example, if the
hardware does ?oating-point operations with different precision than the software).
What is desired is a compromise that results in many compliant, high-
performance implementations, and in many software vendors choosing to port to
OpenGL ES .

A.3 Invariance Rules

For a given instantiation of an OpenGL rendering context:

Rule 1 For any given GL and framebuffer state vector, and for any given GL com-
mand, the resulting GL and framebuffer state must be identical each time the com-
mand is executed on that initial GL and framebuffer state.

Rule 2 Changes to the following state values have no side effects (the use of any
other state value is not affected by the change):

Required:

• Framebuffer contents (all bitplanes)

• Scissor parameters (other than enable)

• Writemasks (color, depth, stencil)

Version 2.0.25 (November 2, 2010)

A.4. WHAT ALL THIS MEANS

161

• Clear values (color, depth, stencil)

Strongly suggested:

• Stencil parameters (other than enable)

• Depth test parameters (other than enable)

• Blend parameters (other than enable)

• Pixel storage

• Polygon offset parameters (other than enables, and except as they affect

the depth values of fragments)

Corollary 1 Fragment generation is invariant with respect to the state values
marked with • in Rule 2.

Rule 3 The arithmetic of each per-fragment operation is invariant except with re-
spect to parameters that directly control it (the parameters that control the depth
test, for instance, are the depth test enable and the depth comparison function).

A.4 What All This Means

Hardware accelerated GL implementations are expected to default to software op-
eration when some GL state vectors are encountered. Even the weak repeatability
requirement means, for example, that OpenGL ES implementations cannot apply
hysteresis to this swap, but must instead guarantee that a given mode vector im-
plies that a subsequent command always is executed in either the hardware or the
software machine.

The stronger invariance rules constrain when the switch from hardware to soft-
ware rendering can occur, given that the software and hardware renderers are not
pixel identical. For example, the switch can be made when blending is enabled or
disabled, but it should not be made when a change is made to the blending param-
eters.

Because ?oating point values may be represented using different formats in
different renderers (hardware and software), many OpenGL ES state values may
change subtly when renderers are swapped. This is the type of state value change
that Rule 1 seeks to avoid.

Version 2.0.25 (November 2, 2010)

Appendix B

Corollaries

The following observations are derived from the body and the other appendixes of
the speci?cation. Absence of an observation from this list in no way impugns its
veracity.

1. The error semantics of upward compatible OpenGL ES revisions may
change. Otherwise, only additions can be made to upward compatible re-
visions.

2. GL query commands are not required to satisfy the semantics of the Flush
or the Finish commands. All that is required is that the queried state be con-
sistent with complete execution of all previously executed GL commands.

3. Application speci?ed point size and line width must be returned as speci?ed
when queried. Implementation-dependent clamping affects the values only
while they are in use.

4. The mask speci?ed as the third argument to StencilFunc affects the operands
of the stencil comparison function, but has no direct effect on the update of
the stencil buffer. The mask speci?ed by StencilMask has no effect on the
stencil comparison function; it limits the effect of the update of the stencil
buffer.

5. There is no atomicity requirement for OpenGL ES rendering commands,

even at the fragment level.

6. Because rasterization of non-antialiased polygons is point sampled, poly-
gons that have no area generate no fragments when they are rasterized, and
the fragments generated by the rasterization of “narrow” polygons may not
form a continuous array.

162

163

7. The GL does not force left- or right-handedness on any of its coordinate

systems,

8. (No pixel dropouts or duplicates.) Let two polygons share an identical edge
(that is, there exist vertices A and B of an edge of one polygon, and vertices
C and D of an edge of the other polygon, and the coordinates of vertex A
(resp. B) are identical to those of vertex C (resp. D), and the state of the the
coordinate transfomations is identical when A, B, C, and D are speci?ed).
Then, when the fragments produced by rasterization of both polygons are
taken together, each fragment intersecting the interior of the shared edge is
produced exactly once.

9. Dithering algorithms may be different for different components. In particu-
lar, alpha may be dithered differently from red, green, or blue, and an imple-
mentation may choose to not dither alpha at all.

Version 2.0.25 (November 2, 2010)

Appendix C

Shared Objects and Multiple
Contexts

This appendix describes special considerations for objects shared between multi-
ple OpenGL ES contexts, including deletion behavior and how changes to shared
objects are propagated between contexts. 1

The share list of a context is the group of all contexts which share objects with

that context.

Objects that can be shared between contexts on the share list include vertex
buffer objects, program and shader objects, renderbuffer objects, and texture ob-
jects (except for the texture objects named zero).

It is unde?ned whether framebuffer objects are shared by contexts on the share
list. The framebuffer object namespace may or may not be shared. This means
that using the same name for a framebuffer object in multiple contexts on the share
list could either result in multiple distinct framebuffer objects, or in a single frame-
buffer object which is shared. Therefore applications using OpenGL ES should
avoid using the same framebuffer object name in multiple contexts on the same
share list.

One way to avoid this unde?ned behavior is to use GenFramebuffers for
all framebuffer object names. Framebuffer objects with names returned by Gen-
Framebuffers in one context will never be shared with framebuffer objects whose
names were returned by GenFramebuffers in another context.

Implementations may allow sharing between contexts implementing different
OpenGL ES versions. However, implementation-dependent behavior may result

1This appendix was entirely rewritten in version 2.0.25 of the OpenGL ES Speci?cation, to match
the same appendix in the OpenGL 4.1 Speci?cation and add caveats regarding different treatment of
framebuffer objects in OpenGL ES .

164

C.1. OBJECT DELETION BEHAVIOR

165

when aspects and/or behaviors of such shared objects do not apply to, and/or are
not described by more than one version.

C.1 Object Deletion Behavior

C.1.1 Side Effects of Shared Context Destruction

If a shared object is not explicitly deleted, then destruction of any individual con-
text has no effect on that object unless it is the only remaining context in the share
list. Once the last context on the share list is destroyed, all shared objects, and all
other resources allocated for that context or share list, will be deleted and reclaimed
by the implementation as soon as possible.

C.1.2 Automatic Unbinding of Deleted Objects

When a buffer, texture, or renderbuffer object is deleted, it is unbound from any
bind points it is bound to in the current context, as described for DeleteBuffers,
DeleteTextures, and DeleteRenderbuffers. Bind points in other contexts are not
affected.

C.1.3 Deleted Object and Object Name Lifetimes

When a buffer, texture, or renderbuffer is deleted, its name immediately becomes
invalid (e.g. is marked unused), but the underlying object will not be deleted until
it is no longer in use. A buffer, texture, or renderbuffer object is in use while it is
attached to any container object or bound to a context bind point in any context.

When a shader object or program object is deleted, it is ?agged for deletion,
but its name remains valid until the underlying object can be deleted because it
is no longer in use. A shader object is in use while it is attached to any program
object. A program object is in use while it is the current program in any context.

Caution should be taken when deleting an object attached to a container object
(such as a renderbuffer or texture attached to a framebuffer object), or a shared
object bound in multiple contexts. Following its deletion, the object’s name may
be returned by Gen* commands, even though the underlying object state and data
may still be referred to by container objects, or in use by contexts other than the one
in which the object was deleted. Such a container or other context may continue
using the object, and may still contain state identifying its name as being currently
bound, until such time as the container object is deleted, the attachment point of
the container object is changed to refer to another object, or another attempt to
bind or attach the name is made in that context. Since the name is marked unused,

Version 2.0.25 (November 2, 2010)

C.2. PROPAGATING CHANGES TO OBJECTS

166

binding the name will create a new object with the same name, and attaching the
name will generate an error. The underlying storage backing a deleted object will
not be reclaimed by the GL until all references to the object from container object
attachment points or context binding points are removed.

C.2 Propagating Changes to Objects

GL objects contain two types of information, data and state. Collectively these
are referred to below as the contents of an object. For the purposes of propagating
changes to object contents as described below, data and state are treated consis-
tently.

Data is information the GL implementation does not have to inspect, and does

not have an operational effect. Currently, data consists of:

• Pixels in the framebuffer.

• The contents of textures and renderbuffers.

• The contents of buffer objects.

State determines the con?guration of the rendering pipeline and the driver does

have to inspect it.

In hardware-accelerated GL implementations, state typically lives in GPU reg-

isters, while data typically lives in GPU memory.

When the contents of an object T are changed, such changes are not always
immediately visible, and do not always immediately affect GL operations involving
that object. Changes may occur via any of the following means:

• State-setting commands, such as TexParameter.

• Data-setting commands, such as TexSubImage* or BufferSubData.

• Data-setting through rendering to attached renderbuffers.

• Commands that affect both state and data, such as TexImage* and Buffer-

Data.

C.2.1 Determining Completion of Changes to an object

The contents of an object T are considered to have been changed once a command
such as described in section C.2 has completed. Completion of a command may
be determined by calling Finish.

Version 2.0.25 (November 2, 2010)

C.2. PROPAGATING CHANGES TO OBJECTS

167

C.2.2 De?nitions

In the remainder of this section, the following terminology is used:

• An object T is directly attached to the current context if it has been bound to
one of the context binding points. Examples include but are not limited to
bound textures and current programs.

• T is indirectly attached to the current context if it is attached to another object
C, referred to as a container object, and C is itself directly or indirectly
attached. Examples include but are not limited to renderbuffers or textures
attached to framebuffers and shaders attached to programs.

• An object T which is directly attached to the current context may be re-
attached by re-binding T at the same bind point. An object T which is indi-
rectly attached to the current context may be re-attached by re-attaching the
container object C to which T is attached.

Corollary: re-binding C to the current context re-attaches C and its hierarchy
of contained objects.

C.2.3 Rules

The following rules must be obeyed by all GL implementations:

Rule 1 If the contents of an object T are changed in the current context while T is
directly or indirectly attached, then all operations on T will use the new contents
in the current context.

Note: The intent of this rule is to address changes in a single context only. The

multi-context case is handled by the other rules.

Note: “Updates” via rendering are treated consistently with updates via GL

commands.

Rule 2 While a container object C is bound, any changes made to the contents of
C’s attachments in the current context are guaranteed to be seen. To guarantee
seeing changes made in another context to objects attached to C, such changes
must be completed in that other context (see section C.2.1) prior to C being bound.
Changes made in another context but not determined to have completed as de-
scribed in section C.2.1, or after C is bound in the current context, are not guaran-
teed to be seen.

Rule 3 Changes to the contents of shared objects are not automatically propa-
If the contents of a shared object T are changed in a
gated between contexts.

Version 2.0.25 (November 2, 2010)

C.2. PROPAGATING CHANGES TO OBJECTS

168

context other than the current context, and T is already directly or indirectly at-
tached to the current context, any operations on the current context involving T via
those attachments are not guaranteed to use its new contents.

Rule 4 If the contents of an object T are changed in a context other than the cur-
rent context, T must be attached or re-attached to at least one binding point in the
current context in order to guarantee that the new contents of T are visible in the
current context.

Note: “Attached or re-attached” means either attaching an object to a binding
point it wasn’t already attached to, or attaching an object again to a binding point
it was already attached.

Example: If a texture image is bound to multiple texture bind points and the
texture is changed in another context, re-binding the texture at any one of the tex-
ture bind points is suf?cient to cause the changes to be visible at all texture bind
points.

Version 2.0.25 (November 2, 2010)

Appendix D

Version 2.0

OpenGL ES 2.0 is not upward compatible with prior versions (OpenGL ES 1.0
and 1.1). It introduces programmable vertex and fragment shaders, but removes
the corresponding ?xed-function pipeline functionality.

As of version 2.0.22, OpenGL ES 2.0 includes this Full Speci?cation docu-

ment, which is the authoritative de?nition of the API.

OpenGL ES 2.0 also includes a Difference Speci?cation document written rel-
ative to the OpenGL 2.0 Speci?cation. The Difference Speci?cation is no longer
authoritative, but is maintained as a reference for those familiar with desktop
OpenGL, and to summarize the changes between the two APIs.

169

Appendix E

Extension Registry, Header Files,
and Extension Naming
Conventions

E.1 Extension Registry

Many extensions to the OpenGL ES API have been de?ned by vendors, groups of
vendors, and the Khronos OpenGL ES Working Group. In order not to compromise
the readability of the OpenGL ES Speci?cation, such extensions are not integrated
into the core language; instead, they are made available online in the OpenGL ES
Extension Registry.

Extensions are documented as changes to a particular version of the Speci?ca-

tion. The Registry is available on the World Wide Web at URL

http://www.khronos.org/registry/gles/

E.2 Header Files

OpenGL ES 2.0 provides two header ?les.

<GLES2/gl2.h> de?nes APIs for core OpenGL ES 2.0.
<GLES2/gl2ext.h> de?nes APIs for all registered OES, EXT, and vendor
extensions compatible with OpenGL ES 2.0 (some extensions are only compatible
with OpenGL ES 1.x).

Developers should always be able to download <GLES2/gl2.h> and
<GLES2/gl2ext.h> from the Registry, with these headers replacing, or being
used in place of older versions that may be provided by a platform SDK.

170

E.3. OES EXTENSIONS

171

E.3 OES Extensions

OpenGL ES extensions that have been approved by the Khronos OpenGL ES
Working Group are summarized in this section. These extensions are not required
to be supported by a conformant OpenGL ES implementation, but are expected to
be widely available; they de?ne functionality that is likely to move into the required
feature set in a future version of the Speci?cation.

E.3.1 Naming Conventions

To distinguish OES extensions from core OpenGL ES features and from vendor-
speci?c extensions, the following naming conventions are used:

• A unique name string of the form "GL_OES_name" is associated with each
extension. If the extension is supported by an implementation, this string
will be present in the EXTENSIONS string.

• All functions de?ned by the extension will have names of the form Func-

tionOES

• All enumerants de?ned by the extension will have names of the form

NAME_OES.

E.4 Vendor and EXT Extensions

Vendor extensions (not approved by Khronos) use the same naming conventions
as OES extensions, but with a different tag replacing OES. The following policies
should always be followed when de?ning and shipping vendor extensions:

• A vendor tag will be assigned to a vendor on request to the Khronos Regis-

trar, if one is not already de?ned.

• This vendor tag must be used consistently in the extension name strings
and the corresponding function and enumerant names for extensions de?ned
solely by that vendor.

• Numeric values assigned to enumerants must follow the guidelines described
in the OpenGL ES Extension Registry. Reserved blocks of enumerant values
will be assigned to vendors on request, following the process de?ned in the
Registry.

Version 2.0.25 (November 2, 2010)

E.4. VENDOR AND EXT EXTENSIONS

172

• The reserved tag EXT may be used instead of a company-speci?c tag if

multiple vendors agree to ship the same vendor extension.

• If a vendor decides to ship another vendor’s extension at a later date, the
original extension name and vendor tag should still be used, unless both
vendors agree to promote that extension to an EXT.

An implementation exporting extension strings, or supporting function or enu-

merant names not following these naming guidelines, is not conformant.

Khronos strongly encourages vendors to submit full extension speci?cations
to the OpenGL ES Extension Registry for publication, once they have ?nished
de?ning the functionality in an extension. Extension writing guidelines, templates,
and other process documents are also found in the Registry.

E.4.1 Promoting Extensions to Core Features

OES extensions can be promoted to required core features in later versions of
OpenGL ES . When this occurs, the extension speci?cations are merged into the
core speci?cation. Functions and enumerants that are part of such promoted exten-
sions will have the OES af?x removed.

OpenGL ES implementations of such later versions should continue to export
the name strings of promoted extensions in the EXTENSIONS string and continue to
support the OES-af?xed versions of functions and enumerants as a transition aid.

Version 2.0.25 (November 2, 2010)

Appendix F

Packaging and
Acknowledgements

F.1 Header Files and Libraries

The Khronos Implementer’s Guidelines, a separate document linked from the
Khronos Extension Registry at

https://www.khronos.org/registry/

describes recommended and required practice for implementing OpenGL ES , in-
cluding names of header ?les and libraries making up the implementation, and links
to standard versions of the header ?les de?ning interfaces for the core OpenGL ES
API (gl2.h and gl2platform.h) as well as a separate header (gl2ext.h)
de?ning interfaces for Khronos-approved and vendor extensions.

Preprocessor tokens GL_ES_VERSION_n_m, where n and m are the major and
minor version numbers as described in section 6.1.5, are included in gl2.h. These
tokens indicate the OpenGL ES versions supported at compile-time.

F.2 Acknowledgements

The OpenGL ES 2.0 speci?cation is the result of the contributions of many people,
representing a cross section of the desktop, hand-held, and embedded computer
industry. Following is a partial list of the contributors, including the company that
they represented at the time of their contribution:

Aaftab Munshi, ATI

173

F.2. ACKNOWLEDGEMENTS

174

Akira Uesaki, Panasonic

Aleksandra Krstic, Qualcomm

Andy Methley, Panasonic

Axel Mamode, Sony Computer Entertainment

Barthold Lichtenbelt, 3Dlabs

Benji Bowman, Imagination Technologies

Bill Marshall, Alt Software

Borgar Ljosland, Falanx

Brian Murray, Freescale

Chris Grimm, ATI

Daniel Rice, Sun

David Garcia, AMD

Ed Plowman, ARM

Edvard Sorgard, Falanx

Eisaku Ohbuch, DMP

Eric Fausett, DMP

Gary King, Nvidia

Gordon Grigor, ATI

Graham Connor, Imagination Technologies

Hans-Martin Will, Vincent

Hiroyasu Negishi, Mitsubishi

James McCarthy, Imagination Technologies

Jasin Bushnaief, Hybrid

Jitaek Lim, Samsung

John Howson, Imagination Technologies

John Kessenich, 3Dlabs

Jacob Str¨om, Ericsson

Jani Vaarala, Nokia

Jarkko Kemppainen, Nokia

John Boal, Alt Software

Version 2.0.25 (November 2, 2010)

F.2. ACKNOWLEDGEMENTS

175

John Jarvis, Alt Software

Jon Leech, Silicon Graphics / Independent

Joonas Itaranta, Nokia

Jorn Nystad, Falanx

Justin Radeka, Falanx

Kari Pulli, Nokia

Katzutaka Nishio, Panasonic

Kee Chang Lee, Samsung

Keisuke Kirii, DMP

Lane Roberts, Symbian

Mario Blazevic, Falanx

Mark Callow, HI

Max Kazakov, DMP

Neil Trevett, 3Dlabs

Nicolas Thibieroz, Imagination Technologies

Petri Kero, Hybrid

Petri Nordlund, Bitboys

Phil Huxley, Tao Group

Robin Green, Sony Computer Entertainment

Remi Arnaud, Sony Computer Entertainment

Robert Simpson, Bitboys

Stanley Kao, HI

Stefan von Cavallar, Symbian

Steve Lee, SIS

Tero Pihlajakoski, Nokia

Tero Sarkinnen, Futuremark

Timo Suoranta, Futuremark

Thomas Tannert, Silicon Graphics

Tom McReynolds, Nvidia

Tom Olson, Texas Instruments

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

176

Tomi Aarnio, Nokia

Ville Miettinen, Hybrid Graphics

Woo Sedo Kim, LG Electronics

Yong Moo Kim, LG Electronics

Yoshihiko Kuwahara, DMP

Yoshiyuki Kato, Mitsubishi

Young Seok Kim, ETRI

Yukitaka Takemuta, DMP

F.3 Document History

F.3.1 Version 2.0.25, updated 2010/11/02

• Change terminology from “calling” to “using” a sampler in sections 2.10.5

and 3.7.5 (Bug 3499).

• Change treatment of StencilFunc* stencil reference value to be clamped at
use, not at speci?cation time (matching desktop GL) in section 4.1.4 (Bug
5410).

• Change default value of FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_-

MAP_FACE to NONE in table 6.24 (Bug 3308).

F.3.2 Version 2.0.25, draft of 2010/10/12

• Fix reference to FRAMEBUFFER_BINDING in section 3.7.2 (Bug 6833).

• Update description of mask parameter to StencilMask in section 4.2.2 to

remove reference to nonexistent IndexMask (Bug 6844).

• Split some state table entries into new table 6.11 to ?x page over?ow (Bug

6843).

• Change query for DEPTH_CLEAR_VALUE in table 6.12 from GetIntegerv to

GetFloatv (Bug 6583).

• Update appendix C to remove references to vertex array objects and trans-
form feedback, which exist only in OpenGL and not in OpenGL ES (Bug
6375).

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

177

F.3.3 Version 2.0.25, draft of 2010/09/20

• Update sharing language to match OpenGL 4.1 Speci?cation, including new
sections 1.6.1 and 2.2.1 and extensive changes to appendix C (Bug 6375),
and add caveats to sharing behavior describing how it is unde?ned whether
or not framebuffer objects are shared in OpenGL ES (Bug 6458).

• Fix typo (missing period) in section 2.10 (Bug 5029).

• Update section 2.10.5 for unde?ned behavior on out-of-bounds array reads
from shaders, matching OpenGL ES Shading Language and OpenGL 4.0
Speci?cations (Bug 5891).

• Update texture state summary in section 3.7.12 to remove per-component

resolution and add component type (Bug 3770).

• Correct typo and mention all forms of CopyTexImage* in sections 3.7.2

and 4.4.4 (Bug 4406).

• Update ?gure 4.1 and appendix A to remove references to nonexistent logical

operations (Bug 4176).

• Allow using typed query variants which differ from the internal type of the
queried state in section 6.2, importing language from OpenGL 3.1 (Bug
4127).

• Generalize shader precision and range state in table 6.19 to cover both vertex

and fragment shaders (Bug 5031).

• Add language to Appendix E describing header ?les, as well as naming con-

ventions and other policies for vendor extensions (Bug 5092).

F.3.4 Version 2.0.24, updated 2009/04/22

• Use “level zero” terminology consistently, replacing “level 0”, “zero level”,

and “base level”, in sections 3.7.1, 3.7.10, 4.4.4, and 4.4.7 (bug 4406).

• Replace redundant language in section 3.7.7 with a reference to section 4.4.4

(bug 4406).

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

178

F.3.5 Version 2.0.24, draft of 2009/04/01

• Removed INVALID_OPERATION error from the end of ShaderBinary spec-

i?cation in section 2.10.2 (bug 3673).

• Added forward references from vertex shader “Texture Access” language in
section 2.10.5, and from completeness language in section 3.7.10, to frag-
ment shader “Texture Access” language in section 3.8.2. Replaced reference
to enabled cube map textures in section 3.7.5 and removed reference to tex-
ture mapping being enabled in section 3.7.13 (bug 3499).

• Dropped language about null textures from section 3.7.1; such a texture is
by de?nition incomplete and therefore will be sampled as described in sec-
tion 3.8.2 (bugs 3499,4176)

• Corrected references and descriptions in ?gure 3.6 and section 3.7.7 to ac-

count for NPOT textures (bug 4405).

• Updated completeness requirements in section 3.7.10 to include matching

format and type as well as internal format (bug 3770).

• Updated sampling language in section 3.8.2 to not require texture complete-
ness when non-mipmapped access to a two-dimensional texture is being
done (bug 4282).

• Updated rendering feedback loop language, and added texture copying feed-
back loop language in section 4.4.4. Updated sections 3.7.2 and 3.7.7 as well,
all corresponding to the language in the GL 3.1 Speci?cation (bug 4406).

• Removed “one or more attachment points in” clauses in discussions of delet-
ing a texture or renderbuffer while it’s attached to an FBO with Framebuf-
ferRenderbuffer or FramebufferTexture2D, in section 4.4.3 (bug 3693).

• Enumerated valid GetFramebufferAttachmentParameteriv parameters in

section 6.1.3 (bug 4408).

• Added errors in section 6.1.8 for GetShaderInfoLog and GetShaderiv

when SHADER_COMPILER is FALSE (bug 3753).

F.3.6 Version 2.0.23, updated 2008/08/27

• Removed no-longer-relevant SGI copyright.

• Bump release number to 2.0.23 for public release.

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

179

• Flip sign of log2((cid:15)) in computation of precision for GetShaderPrecision-

Format in section 6.1.8 (bug 3667).

F.3.7 Version 2.0.22, updated 2008/08/06

• Remove BUFFER_ACCESS and BUFFER_MAPPED state from tables 2.5 and
6.3, since they cannot be changed (bug 3449, also much older WG minutes).

• Minor changes to prototypes and error conditions of ShaderBinary in sec-

tion 2.10.2 (bug 3673).

• Removed luminance color buffer formats from CopyTexImage conversion

table 3.9 (bug 3695).

• Minor ?xes to prototypes and error conditions of framebuffer object com-
mands including BindFramebuffer, GenFramebuffers, GetFramebuffer-
AttachmentParameteriv, and GetRenderbufferAttachmentParameteriv
in sections 4.4.1, 4.4.3, 4.4.6, 4.4.8, and 6.1.3. Change initial value of
RENDERBUFFER_INTERNAL_FORMAT to RGBA4 in table 6.23 (bug 3693).

• Specify error behavior when querying a NONE framebuffer attachment for a

parameter other than the attachment’s type in section 6.1.3.

• Clarify meaning of returned values from GetShaderPrecisionFormat in

section 6.1.8 (bug 3667).

• Remove legacy attribute group column from state tables in section 6.2 (bug

3694).

• Added new implementation-dependent state table 6.20 to prevent tables

over?owing the page width.

F.3.8 Version 2.0.22, updated 2008/07/17

• Remove references to enabling/disabling texture units from sections 3.7 and
3.7.10, and move language about as-if disabled behavior to section 3.8.2.
This language may need to be replicated or referred to from the correspond-
ing vertex shader language in section 2.10.5 as well (bug 3499).

• Removed leftover references to alpha test in ?gure 4.1 and section 4.1.8 (bug

3476).

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

180

• De?ne error for unsupported ReadPixels format/type combinations in sec-
tion 4.3.1, disallow LUMINANCE as an implementation-dependent read for-
mat, remove language talking about luminance formats from ReadPixels
(bug 3637).

• Rewrote description of GetShaderPrecisionFormat in section 6.1.8 to clar-

ify meaning of range and precision values returned (bug 3667).

• Removed leftover references to ?xed-function matrix and light state in sec-

tion 6.2 (bug 3413).

F.3.9 Version 2.0.22, draft of 2008/04/30

• Updated ?gures 2.2, 2.4, and 3.1.

• Added appendix D, brie?y summarizing OpenGL ES 2.0.

F.3.10 Version 2.0.22, draft of 2008/04/24

• Moved description of GetShaderPrecisionFormat from section 2.10.1
to 6.1.8 and removed FRAGMENT_PRECISION_HIGH query (bug 3359).
Added state table entries for shader range and precision to table 6.19.

F.3.11 Version 2.0.22, draft of 2008/04/08

• Added boolean state FRAGMENT_PRECISION_HIGH in section 2.10.1 and
table 6.19, indicating whether or not highp ?oating-point is supported
in fragment shaders, and de?ned behavior of GetShaderPrecisionFormat
when it is not supported (bug 3296).

• Moved section 3.2 up one logical level (the surrounding section was removed

earlier in editing) (bug 3277).

• Removed incorrect INVALID_VALUE error for AttachShader in sec-

tion 2.10.3 (bug 3186).

• Require that programs contain both vertex and fragment shaders, and fail

linking otherwise, in sections 2.10, 2.10.3, and 3.8 (bug 3038).

• Removed leftover reference to ?xed-point version of TexParameter in sec-

tion 3.7.4 (bug 3187).

• Added table 4.5 describing valid renderbuffer image formats (bug 3070).

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

181

• Fixed typo in description of GetShaderInfoLog (section 6.1.8) (bug 3225).

• Fixed several small typos and errors in the state tables (bug 3195).

• Added a note that commands causing state changes to shared objects must
complete before the other language in appendix C holds true (bug 3297).

• Changed section F.1 to point to the Khronos Implementer’s Guidelines in-

stead of duplicating header information here (bug 3184).

F.3.12 Version 2.0.22, draft of 2008/03/12

• Generalize references to vertex attributes in section 2.1 (bug 2866).

• Generalize description of per-fragment operations in section 2.4 (bug 2866).

• Clarify that error behavior may be changed by GL extensions in section 2.5

(bug 2866).

• Note that a program object must contain both vertex and fragment shaders in

section 2.10 (bug 2866).

• Note in section 2.10.1 that when a string length speci?ed to ShaderSource

is negative, only its sign matters, not its value (bug 2866).

• Clari?ed the meaning of range and precision in GetShaderPrecisionFor-
mat (section 2.10.1), including documenting that range is a two-element
array (bug 2866). I’m not entirely clear on what these mean myself - please
double-check.

• Removed forward reference to “the limit” in the discussion of vertex at-

tributes in section 2.10.4 (bug 2866).

• Changed

MAX_VERTEX_UNIFORM_COMPONENTS

MAX_VERTEX_-
UNIFORM_VECTORS in section 2.10.4, and changed MAX_VARYING_FLOATS
to MAX_VARYING_VECTORS in section 2.10.4 (bug 2866).

to

• Removed dangling reference to ?xed-function processing in section 2.10.5

(bug 2866).

• Note that an empty program will always fail validation (per conformance

tests) in section 2.10.5 (bug 3038).

• Refer to “disabled” textures as well as incomplete textures in sections 2.10.5

and 3.8.2 (bug 3038).

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

182

• Fixed typos in sections 2.9, 2.9.1, 2.9.2, 2.10, 2.10.4, and 2.10.6 (bug 2866).

• Changed “between” to “outside” in discussion of line clipping (section 2.13)

(bug 2866).

• Fixed constraints on texture mipmap level dimensions in section 3.7.1 (bug

2891).

• Added an INVALID_VALUE error to TexImage2D in section 3.7.1 when
specifying a non-power-of-two image for a level other than zero, and an
INVALID_OPERATION error to GenerateMipmaps in section 3.7.11 when
called for a texture whose level zero array dimensions are non-power-of-two
(bug 2807).

• Proposed that GenerateMipmap on a compressed texture image generate an
error (section 3.7.11). This is based off of Remi’s comments in bug 2893, but
I’m not sure it’s the right resolution - what is existing practice? The group
should make a call on this.

• Removed most references to initial values of texture object state from sec-
tion 3.7.12, as none of this state is queriable in GLES anyway. All that’s
relevant is that enough of it be de?ned to ensure the initial texture is null
for enabling / completeness purposes (bug 3105). Could instead restore the
texture object state table with no query commands, though.

• Dropped _OES suf?x from IMPLEMENTATION_COLOR_READ_FORMAT and

IMPLEMENTATION_COLOR_READ_TYPE in section 4.3.1 (bug 2884).

• Restored INT entry to reversed component conversion table 4.4, since this is

referred to from section 6.1.2 (bug 3082).

• Noted the meaning of RGB565 in section 4.4.5, since we do not have a sized
internal format table to refer to. Actually this section need to be cleaned up
further for this reason (bug 3070).

• Removed

INVALID_OPERATION

error

when

querying

CURRENT_VERTEX_ATTRIB for attribute zero (section 6.1.8) (bug 3038).

• Added missing state tables 6.14, 6.15, and 6.16 describing shader object,

program object, and vertex shader state (bug 2886).

• Corrected names and descriptions of framebuffer attachment state and query
commands in table 6.24 (bug 3038). Unfortunately there’s really no way to
cram in the full cubemap face name and still make the table ?t on the page.

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

183

• Added shader and program objects to list of shared object types in ap-

pendix C (bug 2885).

F.3.13 Version 2.0.22, draft of 2008/01/20

Fixes
https://cvs.khronos.org/bugzilla/show bug.cgi?id=2813 ):

David

from

Garcia

(

• Removed redundancy of “point” and “point sprite” in sections 2.6, 2.6.1, and
3.7.7 - all points are now point sprites and the term “point sprite” is no longer
used.

• Changed description of program object contents in section 2.10, since they

cannot contain multiple vertex shaders or multiple fragment shaders.

• Removed references to non-multisample antialiasing in chapter 3, including
point/line antialiasing in the fourth paragraph of the chapter; all of the old
“Antialiasing” and “Antialiasing Application” sections 3.2 and 3.9; and the
description of mixing multisample and smooth rendering in the third para-
graph of section 3.2.

• Removed references to shading fragments from pixel rectangles or bitmaps

in section 3.8.

• Changed possible values of gl_FrontFacing in section 3.8.2 from TRUE /

FALSE to true / false, since those are the GLSL values.

Other changes:

• Bumped release number on difference and full specs to 22.

• Mandated that GetActiveUniform for an active uniform array variable will
always return the name of the uniform array appended with "[0]", in sec-
tion 2.10.4 and in section 2.15.3 of the difference speci?cation (bug 1832).

• Remove c notation in table 4.1, and ?xed blend equations for FUNC_-

REVERSE_SUBTRACT, per WG discussion.

• Noted that all varying attributes are interpolated perspective-correct in sec-

tions 3.4.1 and 3.5.1 of the difference speci?cation (bug 2508).

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

F.3.14 Version 2.0.21, draft of 2008/01/11

Fixes
https://cvs.khronos.org/bugzilla/show bug.cgi?id=2807 ):

from

Ben

Bowman

184

(

• Noted that only a single vertex shader object can be attached to a program

object in section 2.10.

• Dropped reference to a program object containing only a vertex shader as
an example of sampler non-determinism at link time, from the end of the
“Samplers” subsection of section 2.10.4.

• Dropped validation failures due to interactions with ?xed-function state from

the “Validation” subsection of section 2.10.5.

• Changed references to gl_FragData[n] to gl_FragData[0] in sec-

tion 3.8.2, since OpenGL ES only supports a single fragment color.

Fixes
https://cvs.khronos.org/bugzilla/show bug.cgi?id=2770#c2 ):

Georg

from

Kolling

(

• Removed corollary 2 in appendix A.3, since there is no ?xed-function state
remaining for generated window coordinates to be invariant with respect to.
Changed example for invariance rule 3 to use the depth test instead of the no
longer existent alpha test. Removed corollary 3 since neither DrawBuffers
nor multiple color buffer attachments are supported.

Other changes:

• Removed unused clampx type from table 2.2.

• Added INVALID_OPERATION errors in sections 2.10.1, 2.10.2, and 6.1.8
when calling unsupported shader compiler or shader binary commands.

• Simpli?ed corollary 7 in appendix B to just say that OpenGL ES does not
force left- or right-handedness on any of its coordinate systems, and not talk
about DepthRangef.

• Removed “Libraries” section from appendix F, since library naming is de-

?ned in the separate OpenGL ES Implementer’s Guidelines document.

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

185

F.3.15 Version 2.0.21, draft of 2008/01/10

Fixes from Steve Hill ( https://cvs.khronos.org/bugzilla/show bug.cgi?id=2800
):

• Updated or removed dangling references to ?xed-function pipeline and/or

state in sections 2.1, 2.6, 2.6.1, and 3.8.2.

• Updated references to commands which cause program validation in sec-

tion 2.10.5.

• Fixed typos in sections 1.4 and 2.5.

Fixes
https://cvs.khronos.org/bugzilla/show bug.cgi?id=2770 ):

Georg

from

Kolling

(

• Clari?ed that the range and precision requirements in section 2.1.1 do not

apply during shader execution.

• Replaced example declaration of Color4f and ?xed example declarations of

Uniform[1234][if] in section 2.3.

• Removed “Position Invariance” language preceding section 2.10.5, since
GLSL ES has neither a ?xed-function pipeline nor an ftransform builtin.

• Removed legacy operations following section 2.11, including client-de?ned
clip planes and the sections “Two-Sided Mode”, “Clamping”, “Flatshading”,
and “Final Color Processing” following section 2.13, since these operations
do not apply to primitive assembly in OpenGL ES . Moved equation 3.4
and the de?nition of FrontFace into section 3.5.1, where it’s still used, and
removed references to VERTEX_PROGRAM_TWO_SIDE from section 2.10.6.
Changed section 3.8.2 to refer to the new location of equation 3.4, and re-
moved legacy language about quads and point/line PolygonMode rendering.

• Changed description of normalized “?xed-point types” to “integer types” in

caption to table 2.4.

• Noted how to determine if binary shader loading is supported in section 2.10.

• Removed references to ?xed-function / built-in / “conventional” attributes

and uniforms from sections 2.10.4 and 2.10.4.

• Removed references

to non-square matrices and 1D / 3D sam-
including the UniformMa-

plers from sections 2.10.4 and 2.10.4,
trix{2x3,3x2,2x4,4x2,3x4,4x3}fv commands.

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

186

• Clari?ed that fragment shaders use varying input values generated by ras-
terization to generate fragment color outputs in section 3, and replaced ref-
erences to associated “colors” and “texture coordinates” of a fragment with
“varying data”.

• Removed “potentially clipped’ language in section 3.3 referring to gl_-

PointSize.

• Removed references to ?xed-function color varyings and to vertex shaders

being disabled in section 3.8.1.

• Removed

built-in
gl_SecondaryColor in section 3.8.2.

references

to

variables

gl_Color

and

• Removed references to built-in output gl_FragDepth in section 3.8.2.

• Removed reference to two-sided lighting in section 4.1.4.

• Removed reference to multiple color buffers in section 4.1.6.

• Removed EXT suf?x from GetFramebufferAttachmentParameteriv and
removed

GetRenderbufferParameteriv,
FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET in section 6.1.3.

and

• Fixed format of SHADING_LANGUAGE_VERSION string in section 6.1.5.

• Dropped no-longer-used state variable types from table 6.1.

• Changed minimum number of vertex attributes to 8 in table 6.2.

• Changed minimum number of texture binding points to 8 in tables 6.9

and 6.7.

• Removed ?xed-function state from invariance rules in appendix A.3.

• Removed corollaries involving ?xed-function state in appendix B, and sim-

pli?ed the corollary regarding coordinate systems.

• Corrected name of <GLES2/gl2platform.h> in appendix F.1.

Other changes:

• Removed duplicated language from the start of section 4.1.6.

• Added a description of conversion from ?oating-point to framebuffer ?xed-
point in section 2.1.2, using language formerly in the removed “Final Con-
version” section.

Version 2.0.25 (November 2, 2010)

F.3. DOCUMENT HISTORY

187

F.3.16 Version 2.0.21, draft of 2008/01/03

Initial revision of the full speci?cation, based on the 2.0.21 diff speci?cation.

Version 2.0.25 (November 2, 2010)

Index

*GetString, 128

ACTIVE ATTRIBUTE MAX -

LENGTH, 33, 130
ACTIVE ATTRIBUTES, 32, 33, 130
ACTIVE TEXTURE, 66, 86, 125
ACTIVE UNIFORM MAX LENGTH,

36, 130

ACTIVE UNIFORMS, 36, 130
ActiveTexture, 39, 66
ALIASED POINT SIZE RANGE, 51
ALPHA, 62, 63, 68, 71, 87, 99, 106, 155
ALWAYS, 95, 96, 144
ARRAY BUFFER, 22–25, 126
ARRAY BUFFER BINDING, 25
ATTACHED SHADERS, 130, 131
AttachShader, 30, 180

BACK, 57, 95, 102, 139
BindAttribLocation, 33, 34
BindBuffer, 22, 25
BindFramebuffer, 108, 109, 118, 179
BindRenderbuffer, 110, 111
BindTexture, 39, 66, 85
BLEND, 97
BlendColor, 98
BlendEquation, 97
BlendEquationSeparate, 97
BlendFunc, 98
BlendFuncSeparate, 98
BLUE, 155
BOOL, 36

BOOL VEC2, 37
BOOL VEC3, 37
BOOL VEC4, 37
BUFFER SIZE, 22, 24
BUFFER USAGE, 22, 24
BufferData, 23–25, 166
BufferSubData, 24, 25, 166
bvec2, 38
BYTE, 20

CCW, 57, 139
CheckFramebufferStatus, 118–121
CLAMP TO EDGE, 76–78, 88
Clear, 103, 104
ClearColor, 103
ClearDepthf, 103
ClearStencil, 103
COLOR ATTACHMENT0, 91, 105,

109, 112, 117, 126

COLOR BUFFER BIT, 103, 104
ColorMask, 102, 103, 120
COMPILE STATUS, 28, 130
CompileShader, 27, 28
COMPRESSED TEXTURE FOR-

MATS, 73

CompressedTexImage, 75
CompressedTexImage2D, 73, 74, 118
CompressedTexSubImage2D, 74, 75
CONSTANT ALPHA, 99
CONSTANT COLOR, 99
CopyTexImage, 71, 179
CopyTexImage*, 116, 177

188

INDEX

189

CopyTexImage2D, 69, 71–73, 81, 104,

113, 118

CopyTexSubImage, 119
CopyTexSubImage2D, 72, 73, 113
CreateProgram, 29, 30
CreateShader, 27
CULL FACE, 57
CullFace, 57, 59
CURRENT VERTEX ATTRIB,

182

133,

DECR, 95
DECR WRAP, 95
DELETE STATUS, 28, 129, 130
DeleteBuffers, 23, 165
DeleteFramebuffers, 109
DeleteProgram, 31
DeleteRenderbuffers, 111, 118, 165
DeleteShader, 28
DeleteTextures, 85, 118, 165
DEPTH ATTACHMENT, 91, 109, 112,

117, 126

DEPTH BUFFER BIT, 103, 104
DEPTH CLEAR VALUE, 176
DEPTH COMPONENT16, 117
DEPTH TEST, 96
DepthFunc, 96
DepthMask, 102, 103, 120
DepthRangef, 45, 125, 184
DetachShader, 30
Disable, 57, 59, 93, 94, 96, 97, 100
DisableVertexAttribArray, 21, 133
DITHER, 100
DONT CARE, 123, 151
DrawArrays, 17, 21, 25, 26, 31, 41, 119
DrawElements, 17, 21, 25, 26, 31, 41,

119

DST ALPHA, 99
DST COLOR, 99
DYNAMIC DRAW, 22, 24

ELEMENT ARRAY BUFFER, 25, 126
Enable, 57, 59, 93, 94, 96, 97, 100, 124
EnableVertexAttribArray, 20, 133
EQUAL, 95, 96
EXTENSIONS, 128, 171, 172

FALSE, 28, 30, 31, 37, 38, 41–43, 94,
125, 127–130, 178, 183

false, 88, 183
FASTEST, 123
Finish, 122, 162, 166
FIXED, 20
FLOAT, 20, 22, 33, 36, 136
?oat, 32
FLOAT MAT2, 33, 37
FLOAT MAT3, 33, 37
FLOAT MAT4, 33, 37
FLOAT VEC2, 33, 36
FLOAT VEC3, 33, 36
FLOAT VEC4, 33, 36
Flush, 122, 162
FRAGMENT PRECISION HIGH, 180
FRAGMENT SHADER, 86, 129, 132
FRAMEBUFFER, 91, 107–109, 112,

113, 119, 121, 126

FRAMEBUFFER ATTACH-

MENT OBJECT NAME, 112,
114, 117, 126

FRAMEBUFFER ATTACH-

MENT OBJECT TYPE, 112,
114, 117, 126, 127
FRAMEBUFFER ATTACHMENT -
TEXTURE 3D ZOFFSET,
186

FRAMEBUFFER ATTACHMENT -

TEXTURE -
CUBE MAP FACE, 114, 126,
176

FRAMEBUFFER ATTACHMENT -

TEXTURE LEVEL, 82, 114,

Version 2.0.25 (November 2, 2010)

INDEX

190

112,

113,

186

115, 126

FRAMEBUFFER BINDING, 73, 82,
105, 108, 112, 113, 119, 120,
176

FRAMEBUFFER COMPLETE,

119,

120

FRAMEBUFFER INCOMPLETE AT-

TACHMENT, 118

FRAMEBUFFER INCOMPLETE DI-

MENSIONS, 118
FRAMEBUFFER INCOMPLETE -
MISSING ATTACHMENT,
118

FRAMEBUFFER UNSUPPORTED,

118, 119
FramebufferRenderbuffer,

118, 120, 121, 178

FramebufferTexture2D, 113, 114, 118,

120, 121, 178

FRONT, 57, 95, 102
FRONT AND BACK, 57, 95, 102
FrontFace, 57, 88, 185
FUNC ADD, 97, 98, 100, 145
FUNC REVERSE SUBTRACT,

98, 183
FUNC SUBTRACT, 97, 98

97,

Gen*, 165
GenBuffers, 23
GENERATE MIPMAP HINT, 123
GenerateMipmap, 83, 84, 121, 123, 182
GenerateMipmaps, 182
GenFramebuffers, 109, 164, 179
GenRenderbuffers, 111
GenTextures, 85, 127
GEQUAL, 95, 96
Get, 45, 124, 125
GetActiveAttrib, 32, 33
GetActiveUniform, 36–38, 183
GetAttachedShaders, 131

GetAttribLocation, 33, 34
GetBooleanv, 94, 124, 125, 134
GetBufferParameteriv, 125
GetError, 14
GetFloatv, 9, 94, 124, 125, 134, 176
GetFramebufferAttachmentParameteriv,
120, 126, 178, 179, 186
GetIntegerv, 50, 105, 111, 124, 125,

134, 176
GetProgramInfoLog, 31, 131
GetProgramiv, 30, 32, 33, 36, 41, 130,

131

GetRenderbufferAttachmentParameteriv,

179

GetRenderbufferParameteriv, 112, 127,

GetShaderInfoLog, 28, 131, 178, 181
GetShaderiv, 28, 129, 131, 132, 178
GetShaderPrecisionFormat, 28, 132,

179–181

GetShaderSource, 131
GetString, 128
GetTexParameter, 125
GetUniform*, 134
GetUniformfv, 133
GetUniformiv, 133
GetUniformLocation, 35, 36, 39
GetVertexAttribfv, 133
GetVertexAttribiv, 133
GetVertexAttribPointerv, 133
gl Color, 186
GL ES VERSION n m, 173
gl FragColor, 89
gl FragCoord, 88
gl FragData, 89
gl FragData[0], 89, 184
gl FragData[n], 184
gl FragDepth, 186
gl FrontFacing, 88, 183
gl PointCoord, 51

Version 2.0.25 (November 2, 2010)

INDEX

191

gl PointSize, 51, 186
gl Position, 40, 44
gl SecondaryColor, 186
GREATER, 95, 96
GREEN, 155

HIGH FLOAT, 132
HIGH INT, 132
Hint, 122

IMPLEMENTATION COLOR -

READ FORMAT, 105, 182

IMPLEMENTATION COLOR -
READ TYPE, 105, 182

INCR, 95
INCR WRAP, 95
INFO LOG LENGTH, 130, 131
INT, 36, 106, 182
INT VEC2, 36
INT VEC3, 36
INT VEC4, 36
INVALID ENUM, 14, 15, 29, 66, 119,

121, 126, 127

INVALID FRAMEBUFFER OPERA-

TION, 15, 73, 119, 120
INVALID OPERATION, 15, 27–31,
33–35, 38, 39, 41, 63, 66, 67,
71, 74, 75, 84, 85, 105, 112,
113, 120, 121, 125–127, 129–
134, 178, 182, 184

INVALID VALUE, 14, 15, 19–21, 24,
27, 29, 30, 33, 34, 36, 38, 45,
52, 60, 67–69, 71, 72, 74, 75,
93, 103, 111, 113, 121, 129,
133, 180, 182

INVERT, 95
IsBuffer, 128
IsEnabled, 93, 124, 134
IsFramebuffer, 129
IsProgram, 130

IsRenderbuffer, 129
IsShader, 129
IsTexture, 127

KEEP, 95, 96, 144

LEQUAL, 95, 96
LESS, 95, 96, 144
level zero array, 68
LINE LOOP, 17
LINE STRIP, 17
LINEAR, 76, 80–82, 84, 87, 88, 115
LINEAR MIPMAP LINEAR, 76, 80–

82, 115

LINEAR MIPMAP NEAREST,

76,

80–82, 115

LINES, 17
LineWidth, 52
LINK STATUS, 30, 130
LinkProgram, 29–31, 33, 34, 36, 39
LOW FLOAT, 132
LOW INT, 132
LUMINANCE, 62, 63, 65, 68, 71, 87,

105, 180

LUMINANCE ALPHA, 62, 63, 65, 68,

71, 87, 105

m, 173
mat2, 32
mat3, 32
mat4, 32
MAX COMBINED TEXTURE IM-

AGE UNITS, 40, 66, 125

MAX CUBE MAP TEXTURE SIZE,

69

MAX FRAGMENT UNIFORM VEC-

TORS, 86

MAX RENDERBUFFER SIZE,

111,

121

MAX TEXTURE IMAGE UNITS, 40,

66, 88

Version 2.0.25 (November 2, 2010)

INDEX

192

MAX TEXTURE SIZE, 69
MAX VARYING FLOATS, 181
MAX VARYING VECTORS, 39, 40,

181

ONE MINUS DST COLOR, 99
ONE MINUS SRC ALPHA, 99
ONE MINUS SRC COLOR, 99
OUT OF MEMORY, 14, 15, 24, 111,

MAX VERTEX ATTRIBS, 19–22, 32,

121

34, 133

MAX VERTEX TEXTURE IMAGE -

UNITS, 40, 66

MAX VERTEX UNIFORM COMPO-

NENTS, 181

MAX VERTEX UNIFORM VEC-
TORS, 35, 181
MEDIUM FLOAT, 132
MEDIUM INT, 132
MIRRORED REPEAT, 76, 78

n, 173
NEAREST, 76, 79, 81, 82, 87, 88, 115
NEAREST MIPMAP LINEAR,
80–82, 84, 115

76,

NEAREST MIPMAP NEAREST, 76,

80–82, 115

NEVER, 95, 96
NICEST, 123
NO ERROR, 14, 156
NONE, 117, 126, 127, 158, 176, 179
NOTEQUAL, 95, 96
NULL, 22, 27, 33, 36, 131, 132, 135,

136

NUM COMPRESSED TEXTURE -

FORMATS, 73
NUM SHADER BINARY FOR-
MATS, 26, 29

ONE, 99, 100, 145
ONE MINUS CONSTANT ALPHA,

99

ONE MINUS CONSTANT COLOR,

99

ONE MINUS DST ALPHA, 99

PACK ALIGNMENT, 105, 147
PixelStore, 61, 105, 107
PixelStorei, 60
POINTS, 17
POLYGON OFFSET FILL, 59
PolygonOffset, 58

ReadPixels, 60, 62, 71, 104, 105, 108,

119, 180

RED, 155
ReleaseShaderCompiler, 28
RENDERBUFFER, 110–112, 126, 127
RENDERBUFFER ALPHA SIZE, 127
RENDERBUFFER BINDING,
111,

121, 127

RENDERBUFFER BLUE SIZE, 127
RENDERBUFFER DEPTH SIZE, 127
RENDERBUFFER GREEN SIZE, 127
RENDERBUFFER HEIGHT, 127
RENDERBUFFER INTERNAL FOR-

MAT, 127, 179

RENDERBUFFER RED SIZE, 127
RENDERBUFFER STENCIL SIZE,

127

RENDERBUFFER WIDTH, 127
RenderbufferStorage, 111, 112, 118,

121

RENDERER, 128
REPEAT, 76, 77, 79, 80, 84, 142
REPLACE, 95
RGB, 62–65, 68, 71, 87, 99
RGB565, 117, 182
RGB5 A1, 117
RGBA, 62–65, 68, 71, 87, 105

Version 2.0.25 (November 2, 2010)

INDEX

193

RGBA4, 117, 157, 179

SAMPLE ALPHA TO COVERAGE,

93

SAMPLE BUFFERS, 50, 51, 55, 59,
93, 100, 101, 103, 109
SAMPLE COVERAGE, 93, 94
SAMPLE COVERAGE INVERT, 93,

94

SAMPLE COVERAGE VALUE,

93,

94
SampleCoverage, 94
sampler2D, 39
SAMPLER 2D, 37
SAMPLER CUBE, 37
SAMPLES, 50, 109
Scissor, 93
SCISSOR TEST, 93
SHADER BINARY FORMATS, 29
SHADER COMPILER, 26, 28, 130–

133, 178

SHADER SOURCE LENGTH,

130,

132

SHADER TYPE, 42, 129
ShaderBinary, 29, 178, 179
ShaderSource, 27, 28, 132, 181
SHADING LANGUAGE VERSION,

128, 186

SHORT, 20
SRC ALPHA, 99
SRC ALPHA SATURATE, 99
SRC COLOR, 99
STATIC DRAW, 22, 23, 137
STENCIL ATTACHMENT, 91, 109,

StencilMask, 102, 103, 120, 162, 176
StencilMaskSeparate, 102, 120
StencilOp, 94, 95
StencilOpSeparate, 94, 95
STREAM DRAW, 22, 24

TexImage, 66, 72
TexImage*, 166
TexImage2D, 60–63, 66–69, 71, 72, 74,
81, 104, 106, 118, 182

TexParameter, 75, 166, 180
TexSubImage, 72
TexSubImage*, 166
TexSubImage2D, 61, 72, 74
TEXTURE, 114, 126
TEXTUREi, 66
TEXTURE0, 66, 143
TEXTURE 2D, 39, 67, 71, 72, 75, 84,

85, 113, 125, 141

TEXTURE CUBE MAP, 67, 75, 84,

85, 121, 125, 141

TEXTURE CUBE MAP *, 67
TEXTURE CUBE MAP -

NEGATIVE X, 67, 71, 72, 77,
113

TEXTURE CUBE MAP -

NEGATIVE Y, 67, 71, 72, 77,
113

TEXTURE CUBE MAP -

NEGATIVE Z, 67, 71, 72, 77,
113

TEXTURE CUBE MAP -

POSITIVE X, 67, 71, 72, 77,
113

112, 117, 126

TEXTURE CUBE MAP -

STENCIL BUFFER BIT, 103, 104
STENCIL INDEX8, 117
STENCIL TEST, 94
StencilFunc, 94–96, 162
StencilFuncSeparate, 94, 95

POSITIVE Y, 67, 71, 72, 77,
113

TEXTURE CUBE MAP -

POSITIVE Z, 67, 71, 72, 77,
113

Version 2.0.25 (November 2, 2010)

INDEX

194

TEXTURE MAG FILTER, 76, 82, 84
TEXTURE MIN FILTER, 76, 79, 80,

UNSIGNED SHORT 5 5 5 1, 62–64,

106

82, 84, 88, 115

UNSIGNED SHORT 5 6 5,

62–64,

TEXTURE WRAP S, 76, 77, 79, 80
TEXTURE WRAP T, 76, 77, 80
TRIANGLE FAN, 18
TRIANGLE STRIP, 17
TRIANGLES, 18
TRUE, 20, 26, 28, 30, 37, 41, 94, 102,

125, 127–133, 183

true, 88, 183

Uniform, 10, 37
Uniform*, 35, 37–39
Uniform*f{v}, 37
Uniform*i{v}, 37
Uniform1f, 10
Uniform1i, 10
Uniform1i{v}, 37, 39
Uniform1iv, 38
Uniform2f, 10
Uniform2f{v}, 38
Uniform2i, 10
Uniform2i{v}, 38
Uniform3f, 10
Uniform3i, 10
Uniform4f, 9, 11
Uniform4f{v}, 38
Uniform4i, 10
Uniform4i{v}, 38
UniformMatrix*, 38
UniformMatrix3fv, 38
UniformMatrix{234}fv, 37
UNPACK ALIGNMENT, 61, 63, 147
UNSIGNED BYTE, 20, 21, 62, 63,

105, 106

UNSIGNED SHORT, 20, 21, 64
UNSIGNED SHORT 4 4 4 4, 62–64,

106

106
UseProgram, 31, 40, 43

VALIDATE STATUS, 41, 130
ValidateProgram, 41, 130
vec2, 32
vec3, 32
vec4, 32, 38
VENDOR, 128
VERSION, 128
VERTEX ATTRIB ARRAY -

BUFFER BINDING, 25, 133

VERTEX ATTRIB ARRAY EN-
ABLED, 133

VERTEX ATTRIB ARRAY NOR-
MALIZED, 133

VERTEX ATTRIB ARRAY -

POINTER, 133

VERTEX ATTRIB ARRAY SIZE, 133
VERTEX ATTRIB ARRAY STRIDE,

133

VERTEX ATTRIB ARRAY TYPE,

133

VERTEX PROGRAM TWO SIDE,

185

VERTEX SHADER, 27, 129, 132
VertexAttrib, 19
VertexAttrib*, 19, 32
VertexAttrib1*, 19
VertexAttrib2*, 19
VertexAttrib3*, 19
VertexAttrib4*, 19
VertexAttribPointer, 20, 25, 133
Viewport, 45

ZERO, 95, 99, 100, 145

Version 2.0.25 (November 2, 2010)


