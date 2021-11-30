/*
 ============================================================================
 Name        : credits.c
 Author      : David Shadoff
 Version     :
 Copyright   : (C) 2021 David Shadoff
 Description : Determine how to change metatile definitions

 	 	 This program deals with the post-completion credits screens.

 	 	 This is closely based on the "icons" code - I just copied and
 	 	 modified it, rather than clean it up an make it "universal",
 	 	 since it's really only going to be run once
 ============================================================================
 */

#define	CREDITS_PAGE	14


#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(void) {

	int i;
	int row, col;
	char * pos;
	int chridx;
	int data1, data2;
	int count, restart;

	int basemeta = 9;			// initial available metatile

	int nextmeta;
	int tempmeta;
	int match;

	int panel[16][16];
	int metatile[256];

	char * values = " ABCDEFGHIJKLMNOPQRSTUVWXYZ'";
	int  hex_val[] = {
			0x11,																	// space
			0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,	// A-N
			0x20,0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,0x2B,			// O-Z
			0x2C
	};

	int base_addr = 0x216800 + (CREDITS_PAGE * 0x800);

#if CREDITS_PAGE == 1
	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"           DIRECTOR             ",
		"          GAME DESIGN           ",
		"                                ",
		"       JUN'ICHI YOSHIZAWA       ",
		"                                ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 2

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"          PROGRAMMING           ",
		"                                ",
		"        JUN'ICHI  MASUDA        ",
		"                                ",
		"        TOMOMICHI OOTA          ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 3

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"           GRAPHICS             ",
		"                                ",
		"        ATSUKO NISHIDA          ",
		"                                ",
		"        KEN    SUGIMORI         ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 4

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"             MUSIC              ",
		"                                ",
		"          GOU ICHINOSE          ",
		"                                ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 5

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"            ADVISOR             ",
		"                                ",
		"         SATOSHI TAJIRI         ",
		"                                ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 6

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"           EXECUTIVE            ",
		"           PRODUCER             ",
		"                                ",
		"         KIYOAKI YASUDA         ",
		"                                ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 7

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"           SUPERVISOR           ",
		"                                ",
		"         MASAO TAKEUCHI         ",
		"                                ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 8

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"                                ",
		"            PRODUCER            ",
		"                                ",
		"         GOROU FUKAGAWA         ",
		"                                ",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 9

	char * text[] = {
		"                                ",
		"                                ",
		"           PROMOTION            ",
		"                                ",
		"        YASUNOBU KASUYA         ",
		"                                ",
		"        NOBUYUKI KONDOU         ",
		"                                ",
		"        HIDEO    KUWABARA       ",
		"                                ",
		"        EMI      AKIBA          ",
		"                                ",
		"        TOORU    SUGIYAMA       ",
		"                                ",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 10

	char * text[] = {
		"                                ",
		"                                ",
		"           MARKETING            ",
		"                                ",
		"       MASAKANE  TOSHIOKA       ",
		"       KATSUHIKO HARAKO         ",
		"       TOORU     YANAGIDA       ",
		"       YOSHIYUKI TACHIBANA      ",
		"       ICHIROU   MATSUE         ",
		"       TAKAYA    MIKAMI         ",
		"       KOUJI     SUGANUMA       ",
		"       CHITOSE   SATOU          ",
		"                                ",
		"                                ",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 11

	char * text[] = {
		"                                ",
		"                                ",
		"    ****** PERSONAL SYSTEMS     ",
		"                                ",
		"       JOUJI    WAKAZONO        ",
		"                                ",
		"       YUUJI    MASUKO          ",
		"                                ",
		"       TAKESHI  SAZE            ",
		"                                ",
		"       HIDEKAZU KOUBAYASHI      ",
		"                                ",
		"       MASAMI   IKEJIRI         ",
		"                                ",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 12

	char * text[] = {
		"                                ",
		"    ****** PERSONAL SYSTEMS     ",
		"                                ",
		"       YUKI      MATSUO         ",
		"                                ",
		"       MATSUHIKO NAKATA         ",
		"                                ",
		"       TAKASHI   TAKANO         ",
		"                                ",
		"       KAZUHIRO  SONE           ",
		"                                ",
		"       HIROKAZU  KIKUCHI        ",
		"                                ",
		"       YOSHITERU TAKENOUCHI     ",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 13

	char * text[] = {
		"                                ",
		"                                ",
		"                                ",
		"         SPECIAL THANKS         ",
		"                                ",
		"       ATSUSHI   IIZAKA         ",
		"       NOBUHIRO  TAKAGAKI       ",
		"       YOSHIKO   TOKUNAGA       ",
		"       MIKAKO    FUJIWARA       ",
		"       HIROTADA  HASHIMOTO      ",
		"       MASAO     MASUTANI       ",
		"       SANAE     MINEGISHI      ",
		"                                ",
		"                                ",
		"********************************",
		"********************************",
		""
	};

#elif CREDITS_PAGE == 14

	char * text[] = {
		"                                ",
		"                                ",
		"           MANAGEMENT           ",
		"                                ",
		"          ************          ",
		"        MASAHIKO  SATOU         ",
		"        MASUMI    UCHINO        ",
		"                                ",
		"                                ",
		"          ************          ",
		"        REIKO     KANDA         ",
		"        KOUICHI   MIZUTOME      ",
		"                                ",
		"                                ",
		"********************************",
		"********************************",
		""
	};

#endif



//	for each line of text, keep the "top line"; use the text to
//	replace the "bottom line" items with the "top line" of the characters in the text
//	also, replace the "top line" of the following metatile line with the "bottom line" of those same characters.

	metatile[0] = 0x00000000;	// maybe not referenced
	metatile[8] = 0x11111111;	// referenced as blank tile
	nextmeta = basemeta;
	tempmeta = 0;

	for (row = 0; row < 16; row++) {
		for (col = 0; col < 16; col++) {

			if ((text[row][col*2] == '*') && (text[row][col*2+1] == '*')) {
				panel[row][col] = 0xff;		// special value
				continue;
			}
			// left letter
			pos = strchr(values, text[row][col*2]);
			if (pos == NULL) {
				printf("%c (row %d, col %d) not found in font list\n", text[row][col*2], row, (col*2));
				exit(1);
			}
			chridx = pos-values;
			data1 = hex_val[chridx];
			if (data1 == 0x11)
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
			if (data1 == 0x11)
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

	for (i = basemeta; i < nextmeta; i++) {
		printf(":: Patch metatile 0x%2.2X\n", i);
		printf("..\\tools\\patch track2.bin 0x%7.7X 0x%2.2X 0x%2.2X 0x%2.2X 0x%2.2X\n", (i * 4) + base_addr + 4,
				((metatile[i]>>24)&0xFF), ((metatile[i]>>16)&0xFF), ((metatile[i]>>8)&0xFF), (metatile[i]&0xFF));
	}

	printf("\n\n");

// Final corrections to outer map
// We needed to make overrides to the right edge of these tiles, if they were
// being placed on the right edge; "leave as original values" was not appropriate

//	printf(":: Make outer map corrections:\n\n");
//	for (row = 0; row < 16; row++) {
//		printf("..\\tools\\patch track2.bin 0x%6.6X", base_addr + 0x584 + (0x10 * row));
//		for (col = 0; col < 16; col++) {
//			printf(" 0x%2.2X", panel[row][col]);
//		}
//		printf("\n");
//	}
//	printf("\n\n");

	count = 0;
	restart = 1;
	printf(":: Make outer map corrections:\n");
	for (row = 0; row < 16; row++) {
		for (col = 0; col < 16; col++) {

			if (panel[row][col] == 0xff) {
				restart = 1;
				continue;
			}

			if (restart == 1) {
				restart = 0;
				printf("\n..\\tools\\patch track2.bin 0x%6.6X 0x%2.2X", (base_addr + 0x584 + (0x10 * row) + col), panel[row][col]);
				count = 1;
			}
			else {
				printf(" 0x%2.2X", panel[row][col]);
				count++;
				if (count == 16) {
					restart = 1;
				}
			}
		}
	}
	printf("\n\n");

}
