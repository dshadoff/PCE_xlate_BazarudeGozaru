# pce_gfx - a graphics  extraction/insertion utility

While working on several PC Engine conversion projects, I found that there
is a challenge extracting the grpahics - both characters and tiles - from
the original binary file, and changing them into something easy to alter.

One challenge I faced is that I am not an artist...

Other challenges invovle graphic editing programs from the post-90s period:
they tend not te respect the original palette values/sequences, which can
make PC Engine graphics (16 palette entries) very challenging to edit.

pce_gfx aims to fix these issues... by exporting/importing in the form of... ASCII art.

Two files are output (or input):
1) A pallette reference file, which simply shows which character is referenced for each
of the 16 pallette entries, and
2) The actual art file.

pce_gfx can also deal with smaller graphic elements, to build them into a larger file
(or extract portions for reinsertion).

## Syntax:
pce_gfx <get|put> <tile|sprite> <ROM file> <offset> <virt_width> <x_iter> <y_iter> <text_file> <text_x> <text_y> <xlate_file>

Where:
- offset can be in decimal or hex (prefix with '0x' for hexadecimal)
- virtual width indicates the number of (characters/tiles) from the start of line 1 to the start of line 2 in the binary file
- x_ter and y_iter are the number of (charaters/tiles) to extract
- text_x and text_y indicate the positioning in the larger text file, for compositing
- xlate_file is the cross-reference file for which ASCII character to use for each palette value



NOTE: A Windows command-line executable has been included here, but may be withdrawn at a later time.

