# Toolset used by the Bazaru de Gozaru patch

## pce_gfx - a graphics extraction/insertion utility

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

### Syntax:
pce_gfx [get|put] [tile|sprite] ROM_file offset virt_width x_iter y_iter text_file text_x text_y xlate_file

Where:
- offset can be in decimal or hex (prefix with '0x' for hexadecimal)
- virtual width indicates the number of (characters/tiles) from the start of line 1 to the start of line 2 in the binary file
- x_ter and y_iter are the number of (charaters/tiles) to extract
- text_x and text_y indicate the positioning in the larger text file, for compositing
- xlate_file is the cross-reference file for which ASCII character to use for each palette value


## patch - a utility to patch locations in a file to a list of values

Sometimes you need to alter small numbers of bytes to reflect new values, like in a reference map for example
You could set them by hand in a hex editor, but it's difficult to record for later communication and adjustment.

### Syntax:
patch ROM_file offset byte1 {byte2 {byte3 {... byte16} } }

Where:
- offset can be in decimal or hex (prefix with '0x' for hexadecimal)
- every byte can be in decimal or hex (prefix with '0x' for hexadecimal) - up to 16 bytes can be set in this way


## yankbank

There are occasions when I need to use the PC Engine assembler to insert data or code based
on a source file, making whatever adjustments to pointers are needed at compile time.  At those times,
it is best to '.incbin' the existing binary file; the assembler will respect existing data and only
overwrite data as required by the source code... but the PCE Assembler won't deal with a CDROM-sized
binary.  So this utility is made for extracting one or more banks to be used as a base layer for the
assembler to overlay as needed.  The utility will also re-implant the adjusted banks.

### Syntax:
yankbank [out|in] main_file offset num_banks extract_file

Where:
- 'out' means to extract from the main_file / 'in' means to replace
- main_file is the ROM file to be sectioned
- offset can be in decimal or hex (prefix with '0x' for hexadecimal)
- num_banks is the number of 8192-byte (0x2000 byte) banks to manipulate
- extract_file is the file which will be used for the extract/re-implant


## shop_talk_extract

This is a specialized tool for Bazaru de Gozaru, which extracts the actual dialogue used by the
shop owner (and Bazaru); this extract is created in the form of a file ready to be used by the
PC Engine assembler, for reinsert of text (once updated with alternate codes).


NOTE: Windows command-line executables have been included here, but may be withdrawn at a later time.

