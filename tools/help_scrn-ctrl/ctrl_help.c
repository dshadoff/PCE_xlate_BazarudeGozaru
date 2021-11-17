/*
 ============================================================================
 Name        : Bazaru1.c
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned char array[65540];
FILE *fextract;


int main(void) {

	int i, j;
	int row, col;
	int tile_up, tile_down;
	int lft_rgt;
	char letter;
	char * pos;
	int chridx;
	int data1, data2;

// this will be new text; a '*' indicates to leave the values unchanged
//
	char * text[] = {
		"**  [D-PAD]   ***  [1-BVTT0N] **",
		"*Use to scroll***Open window,  |",
		"*the screen.  ***select icon,or|",
		"*             ***choose action.|",
		"*If window is ******************",
		"*open, use to ***  [2-BVTT0N]  *",
		"*move cursor. ***Close window. *",
		""
	};

//	int panel[][16] = {
//			{0x80,0x81,0x82,0x83,0x84,0x85,0x86,0xE7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0x8E,0xBF},  // find a spare to replace 8E
//			{0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0xFF,0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xCE,0xC7},  // find a spare to replace CE
//			{0x90,0x91,0x92,0x93,0x94,0x95,0x96,0xFF,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xFF},  // find
//			{0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0xFF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xFF},  // find a spare to replace FF
//			{0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xB7},  // put F7 at [4][15]
//			{0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xFF,0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7},
//			{0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xFF,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF},
//			{0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7}   // put B7 at [7][15]
//	};

	int panel[][16] = {
			{0x80,0x81,0x82,0x83,0x84,0x85,0x86,0xE7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF},
			{0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0xFF,0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xE0,0xC7},
			{0x90,0x91,0x92,0x93,0x94,0x95,0x96,0xFF,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xE3},
			{0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0xFF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xE4},
			{0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xF7},
			{0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xFF,0xB8,0xE1,0xE2,0xBB,0xBC,0xE5,0xE6,0xE7},
			{0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xFF,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF},
			{0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xB7}
	};

//
//	replace E0, E3, E4
//	patch track2.bin 0x17E63C 0xB8 0xE1 0xE2 0xBB 0xBC
//
//	allow for additional tiles.
//	patch track2.bin 0x17E602 0xE0
//	patch track2.bin 0x17E613 0xE3
//	patch track2.bin 0x17E623 0xE4
//
//	swap B7, F7
//  patch track2.bin 0x17E633 0xF7
//  patch track2.bin 0x17E663 0xB7


	// notes from first pass:
	// B2 = DB
	// B7 = F7 -> this is corner, we already have plans
	// B8 = E0 (top left, this is good !)
	// BB = E3 (top edge/BUTTON)
	// BC = E4 (top edge/BUTTON)
	// -> also make a patch for the metatile map !!


	int metatile_bak[256];
	int metatile[256];

	char * values = " D-PAB12VT0NCIOU.,[]abcdefghijklmnopqrstuvwxyz-?!|";
	int  hex_val[] = {
			0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,
			0x20,0x21,0x22,0x23,0x24,0x25,0x99,0x9A,
			0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x4B,0x4C,0x4D,0x4E,
			0x60,0x61,0x62,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x6B,0x6E,0x6F,0x9D
	};


	fextract = fopen("track2.bin", "rb");
	if (fextract == NULL) {
		printf("could not open the ISO\n");
		exit(1);
	}

//	Calculation:
//	offset = ((metatile - 0x80) * 4) + 0x17E204;
//	So, read from 0x17E204:
	fseek(fextract, 0x17E204, SEEK_SET);

	for (i = 0x80; i < 0x100; i++) {
		fread(array, 1, 1, fextract);
		metatile[i] = array[0] << 24;

		fread(array, 1, 1, fextract);
		metatile[i] |= array[0] << 16;

		fread(array, 1, 1, fextract);
		metatile[i] |= array[0] << 8;

		fread(array, 1, 1, fextract);
		metatile[i] |= array[0];

		metatile_bak[i] = metatile[i];
	}

//	for each line of text, keep the "top line"; use the text to
//	replace the "bottom line" items with the "top line" of the characters in the text
//	also, replace the "top line" of the following metatile line with the "bottom line" of those same characters.

	row = 0;
	while (1) {
		col = 0;
		if (text[row][0] == '\0') break;

		while (text[row][col] != '\0') {
			tile_up   = panel[row][(col>>1)];
			tile_down = panel[row+1][(col>>1)];
			lft_rgt = (col & 1);
			letter = text[row][col];
			if (letter == '*') {
				col++;
				continue;
			}
			pos = strchr(values, letter);
			if (pos == NULL) {
				printf("%c (row %d, col %d) not found in font list\n", letter, row, col);
				exit(1);
			}
			chridx = pos-values;				// offset from start of array; to be used as offset in hex value array
			data1 = hex_val[chridx];			// top half of character (VRAM index)
			data2 = hex_val[chridx] + 0x10;		// bottom half of character

			if (data1 == 0x00) data1 = 0x10;	// special case for spaces

			if (lft_rgt == 1) {
				metatile[tile_up]   = (metatile[tile_up]   & 0xFFFFFF00) | (data1);
				metatile[tile_down] = (metatile[tile_down] & 0xFF00FFFF) | (data2 << 16);
			}
			else {
				metatile[tile_up]   = (metatile[tile_up]   & 0xFFFF00FF) | (data1 << 8);
				metatile[tile_down] = (metatile[tile_down] & 0x00FFFFFF) | (data2 << 24);
			}
			col++;
		}
		row++;
	}


//
//	Go through and find any duplicates and list them
//

	for (i = 0x80; i < 0x100; i++) {
		for (j = (i + 1); j < 0x100; j++) {
			if (metatile[i] == metatile[j]) {
				printf("Metatile duplicates:  0x%2.2X  0x%2.2X\n", i, j);
			}
		}
	}

	printf("\n\n");

//	Go through list and print out for each metatile which is no longer equal to its
//	metatile_bak, a before/after view of its on-screen arrangement
//
	for (i = 0x80; i < 0x100; i++) {
		if (metatile[i] != metatile_bak[i]) {
			printf("0x%2.2X was: %2.2X %2.2X  now: %2.2X %2.2X\n",
					i, ((metatile_bak[i]>>24)&0xFF), ((metatile_bak[i]>>16)&0xFF), ((metatile[i]>>24)&0xFF), ((metatile[i]>>16)&0xFF));
			printf("          %2.2X %2.2X       %2.2X %2.2X\n",
					((metatile_bak[i]>>8)&0xFF), (metatile_bak[i]&0xFF), ((metatile[i]>>8)&0xFF), (metatile[i]&0xFF));
		}
	}

	printf("\n\n");

//	Go through list and print out for each metatile which is no longer equal to its
//	metatile_bak, a "..\tools\patch 0x(hex) (hex) (hex) (hex) (hex)" line
//  for its new notation

	printf("Patch Information:\n");
	printf("\n\n");

	for (i = 0x80; i < 0x100; i++) {
		if (metatile[i] != metatile_bak[i]) {
			printf(":: Patch metatile 0x%2.2X\n", i);
			printf("..\\tools\\patch track2.bin 0x%7.7X 0x%2.2X 0x%2.2X 0x%2.2X 0x%2.2X\n", ((i - 0x80) * 4) + 0x17E204,
					((metatile[i]>>24)&0xFF), ((metatile[i]>>16)&0xFF), ((metatile[i]>>8)&0xFF), (metatile[i]&0xFF));
		}
	}

// Final corrections to outer map
// We needed to make overrides to the right edge of these tiles, if they were
// being placed on the right edge; "leave as original values" was not appropriate

	printf(":: Make outer map corrections:\n");
	printf("::\n");
	printf("::	replace E0, E3, E4\n");
	printf("..\\tools\\patch track2.bin 0x17E63C 0xB8 0xE1 0xE2 0xBB 0xBC\n");
	printf("::\n");
	printf("::	allow for additional tiles.\n");
	printf("..\\tools\\patch track2.bin 0x17E602 0xE0\n");
	printf("..\\tools\\patch track2.bin 0x17E613 0xE3\n");
	printf("..\\tools\\patch track2.bin 0x17E623 0xE4\n");
	printf("::\n");
	printf("::	swap B7, F7\n");
	printf("..\\tools\\patch track2.bin 0x17E633 0xF7\n");
	printf("..\\tools\\patch track2.bin 0x17E663 0xB7\n\n");

	fclose(fextract);
}
