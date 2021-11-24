/*
 ============================================================================
 Name        : iconhelp.c
 Author      : David Shadoff
 Version     :
 Copyright   : (C) 2021 David Shadoff
 Description : Determine how to change metatile definitions

 	 	 This program deals with the second screen of Help text
 	 	 in the game - the one which deals with controllers.
 	 	 This is unique; although it deals with a "metatile"
 	 	 type arrangement (2x2 tiles, arranged as larger "tiles"
 	 	 on the screen), in this case, the 16-pix-high letters
 	 	 are split across tiles, making the arrangement very
 	 	 challenging (or perhaps just tedious).
 ============================================================================
 */

#define	ICON_PAGE	4


#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(void) {

	int i;
	int row, col;
	char * pos;
	int chridx;
	int data1, data2;

	int nextmeta;
	int tempmeta;
	int match;

	int panel[16][16];
	int metatile[256];

	char * values = " []@#ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.',-/?!";
	int  hex_val[] = {
			0x5F,0xCE,0xCF,0xE6,0xE7,													// space, brackets, squiggle
			0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,	// A-O
			0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,						// P-Z
			0x61,0x62,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x6B,0x6C,0x6D,0x6E,0x6F,	// a-o
			0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,						// p-z
			0x2B,0x2C,0x2D,																// period apostrophe comma
			0x8B,0x8C,0x8E,0x8F															// -/?!
	};

	int base_addr = 0x198800 + (ICON_PAGE * 0x800);

#if ICON_PAGE == 1
	char * text[] = {
		"                                ",
		"     @# Icons Explained  @#     ",
		"                                ",
		"      [Left/Right]              ",
		"                                ",
		"  Move in the direction of the  ",
		"  icon.  If already moving in   ",
		"  that direction, then run !    ",
		"                                ",
		"      [Jump Icons]              ",
		"                                ",
		"  Jump. If used when running,   ",
		"  you can jump further !        ",
		"                                ",
		"                                ",
		"                                ",
		""
	};

#elif ICON_PAGE == 2

	char * text[] = {
		"                                ",
		"                                ",
		"      [Sit]          [Roll]     ",
		"                                ",
		"  When running,  Roll to pass   ",
		"  get into a     through a      ",
		"  narrow spot.   narrow area.   ",
		"                                ",
		"      [Spin]         [Push]     ",
		"                                ",
		"  Spin to break  If something   ",
		"  barriers or    blocks you,    ",
		"  hit enemies.   try pushing.   ",
		"                                ",
		"                                ",
		"                                ",
		""
	};

#elif ICON_PAGE == 3

	char * text[] = {
		"                                ",
		"                                ",
		"      [Tiptoe]       [Dance]    ",
		"                                ",
		"  Sneak past     Amazing !      ",
		"  dangerous      Bananas may    ",
		"  areas.         appear...      ",
		"                                ",
		"      [Nap]          [Blind]    ",
		"                                ",
		"  Napping can    Ignore scary   ",
		"  restore your   things and     ",
		"  energy.        Action Points. ",
		"                                ",
		"                                ",
		"                                ",
		""
	};

#elif ICON_PAGE == 4

	char * text[] = {
		"                                ",
		"                                ",
		"      [Hopak         [Skip]     ",
		"       Dance]                   ",
		"  Kick things    Bounce along,  ",
		"  and get past   but it's hard  ",
		"  narrow areas.  to stop.       ",
		"                                ",
		"      [Hand          [Moon      ",
		"       Stand]         Walk]     ",
		"  Stop, then     Moonwalk...    ",
		"  perform next   Fall and turn  ",
		"  action.        the other way. ",
		"                                ",
		"                                ",
		"                                ",
		""
	};
#endif



//	for each line of text, keep the "top line"; use the text to
//	replace the "bottom line" items with the "top line" of the characters in the text
//	also, replace the "top line" of the following metatile line with the "bottom line" of those same characters.

	metatile[0] = 0x00000000;	// maybe not referenced
	metatile[1] = 0x5F5F5F5F;	// referenced as blank tile
	nextmeta = 2;
	tempmeta = 0;

	for (row = 0; row < 16; row++) {
		for (col = 0; col < 16; col++) {

			// left letter
			pos = strchr(values, text[row][col*2]);
			if (pos == NULL) {
				printf("%c (row %d, col %d) not found in font list\n", text[row][col*2], row, (col*2));
				exit(1);
			}
			chridx = pos-values;
			data1 = hex_val[chridx];
			if (data1 == 0x5F)
				data2 = data1;
			else
				data2 = hex_val[chridx]+0x10;

			tempmeta = ((data1 & 0xFF) << 24) | ((data2 & 0xFF) << 8);

			//right letter
			pos = strchr(values, text[row][(col*2)+1]);
			if (pos == NULL) {
				printf("%c (row %d, col %d) not found in font list\n", text[row][(col*2)+1], row, (col*2)+1);
				exit(1);
			}
			chridx = pos-values;
			data1 = hex_val[chridx];
			if (data1 == 0x5F)
				data2 = data1;
			else
				data2 = hex_val[chridx]+0x10;

			tempmeta |= ((data1 & 0xFF) << 16) | (data2 & 0xFF) ;

			match = -1;
			for (i = 0; i < nextmeta; i++) {
				if (tempmeta == metatile[i]) {
					if (i != 1) printf("match @ 0x%2.2X\n", i);
					match = i;
					break;
				}
			}
			if (match == -1) {
				metatile[nextmeta] = tempmeta;
				panel[row][col] = nextmeta++;
			}
			else {
				panel[row][col] = match;
			}
		}
	}



//	Go through list and print out for each metatile's definition
//	a "..\tools\patch 0x(hex) (hex) (hex) (hex) (hex)" line
//  for its new notation

	printf("Patch Information:\n");
	printf("\n\n");

	for (i = 0x00; i < nextmeta; i++) {
		printf(":: Patch metatile 0x%2.2X\n", i);
		printf("..\\tools\\patch track2.bin 0x%7.7X 0x%2.2X 0x%2.2X 0x%2.2X 0x%2.2X\n", (i * 4) + base_addr + 4,
				((metatile[i]>>24)&0xFF), ((metatile[i]>>16)&0xFF), ((metatile[i]>>8)&0xFF), (metatile[i]&0xFF));
	}

	printf("\n\n");

// Final corrections to outer map
// We needed to make overrides to the right edge of these tiles, if they were
// being placed on the right edge; "leave as original values" was not appropriate

	printf(":: Make outer map corrections:\n\n");
	for (row = 0; row < 16; row++) {
		printf("..\\tools\\patch track2.bin 0x%6.6X", base_addr + 0x584 + (0x10 * row));
		for (col = 0; col < 16; col++) {
			printf(" 0x%2.2X", panel[row][col]);
		}
		printf("\n");
	}
	printf("\n\n");

}
