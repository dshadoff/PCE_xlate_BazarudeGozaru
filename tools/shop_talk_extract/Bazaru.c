/*
 ============================================================================
 Name        : Bazaru.c
 Author      : Dave Shadoff
 Version     :
 Copyright   : (C) 2021 Dave Shadoff
 Description : Bazaru de Gozaru text extractor from shop
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned char array[65540];
FILE *fin, *fout;

int symbols[] = {
// A I U E O
		0x82A0, 0x82A2, 0x82A4, 0x82A6, 0x82A8,
// KA KI KU KE KO
		0x82A9, 0x82AB, 0x82AD, 0x82AF, 0x82B1,
// SA SHI SU SE SO
		0x82B3, 0x82B5, 0x82B7, 0x82B9, 0x82BB,
// TA CHI TSU TE TO
		0x82BD, 0x82BF, 0x82C2, 0x82C4, 0x82C6,
// NA NI NU NE NO
		0x82C8, 0x82C9, 0x82CA, 0x82CB, 0x82CC,
// HA HI HU HE HO
		0x82CD, 0x82D0, 0x82D3, 0x82D6, 0x82D9,
// MA MI MU ME MO
		0x82DC, 0x82DD, 0x82DE, 0x82DF, 0x82E0,
// RA RI RU RE RO
		0x82E7, 0x82E8, 0x82E9, 0x82EA, 0x82EB,
// YA YU YO
		0x82E2, 0x82E4, 0x82E6,
// WA WO N  Space  Ellipsis
		0x82ED, 0x82F0, 0x82F1, 0x8140, 0x8163,
// GA GI GU GE GO
		0x82AA, 0x82AC, 0x82AE, 0x82B0, 0x82B2,
// ZA ZI ZU ZE ZO
		0x82B4, 0x82B6, 0x82B8, 0x82BA, 0x82BC,
// DA CHI DZU DE DO
		0x82BE, 0x82C0, 0x82C3, 0x82C5, 0x82C7,
// BA BI BU BE BO
		0x82CE, 0x82D1, 0x82D4, 0x82D7, 0x82DA,
// PA PI PU PE PO
		0x82CF, 0x82D2, 0x82D5, 0x82D8, 0x82DB,
// - xya xyu xyo xtsu
		0x815B, 0x82E1, 0x82E3, 0x82E5, 0x82C1,
// ? !
		0x8148, 0x8149
};

int main(void) {

	char foutname[256];
	int ret;
	int ptrloc;
	int addr16, addr16_temp;
	int index1, index2;
	int sjis;
	int message_loc[256];
	int msg_num;
	int i, count;
	char char1, char2;

	fin = fopen("track2.bin", "rb");
	if (fin == NULL) {
		printf("could not open the ISO\n");
		exit(1);
	}

	// disk offset 0xA7C5 corresponds to in-memory 0x77C5
	// grab 64KB, but ignore anything outside the appropriate segment
	//
	fseek(fin, 0x3000, SEEK_SET);

	ret = fread(array, 1, 65536, fin);
	if (ret != 65536) {
		printf("Problem reading 65536 bytes; ret = %d\n", ret);
		exit(1);
	}

	sprintf(foutname, "shoptalk.txt");
	fout = fopen(foutname, "wb");
	if (fout == NULL) {
		printf("could not open the output file\n");
		exit(1);
	}

	fprintf(fout, "; Bazaru de Gozaru - shop dialogue text\n");
	fprintf(fout, "; -------------------------------------\n\n");
	fprintf(fout, "\t.list\n\n");
	fprintf(fout, "\t.code\n");
	fprintf(fout, "\t.bank\t0 \n");
	fprintf(fout, "\t.incbin\t\"txtblk.bin\"\n\n");

	ptrloc = 0x77C5;
	msg_num = 1;

	fprintf(fout, "\t.ORG\t$%4.4X\n\n", ptrloc);

	//	Note the pointer array meanings are something like this:
	//  For example, let's look at:
	//	02 79 06 0C 02 04 01 20
	//  offset -> meaning
	//
	//	00/01 = pointer location ($7902 above)
	//	02 = x-location on line (06 above)
	//	03 = y-location (line ?) (0C above)
	//	04 = related to number of blanks at end (02 above)
	//	05 = unclear
	//	06 = horizontal position of word-bubble pointer (01 above)
	//	07 = unclear

	fprintf(fout, "ptrtbl:\n\n");
	fprintf(fout, "; Pointer table:\n");
	fprintf(fout, "; bytes 00/01 = ptrtbl:\n");
	fprintf(fout, "; 00/01 = pointer location ($7902 above)\n");
	fprintf(fout, "; 02 = x-location on line (06 above)\n");
	fprintf(fout, "; 03 = y-location (line ?) (0C above)\n");
	fprintf(fout, "; 04 = related to number of blanks at end (02 above)\n");
	fprintf(fout, "; 05 = unclear\n");
	fprintf(fout, "; 06 = horizontal position of word-bubble pointer (01 above)\n");
	fprintf(fout, "; 07 = unclear\n\n");

	while (ptrloc < 0x78E4) {
		addr16 = array[ptrloc] + (array[ptrloc + 1] << 8);

		fprintf(fout, "msgptr%2.2d:\n", msg_num);
		fprintf(fout, "\t.dw\tmsg%2.2d\t\t; orig $%4.4X\n", msg_num, addr16);
		message_loc[msg_num -1] = addr16;
		fprintf(fout, "\t.db\t$%2.2X,$%2.2X,$%2.2X,$%2.2X,$%2.2X,$%2.2X\n\n", array[ptrloc+2], array[ptrloc+3],
				array[ptrloc+4], array[ptrloc+5], array[ptrloc+6], array[ptrloc+7]);
		ptrloc += 8;
		msg_num++;
	}
	fprintf(fout, "\n\n");

	fprintf(fout, "; Now for the messages - space is good until $7ADF\n");
	fprintf(fout, "; After that, if more space is needed, start at $7C50\n\n");

//	for (i = 0; i < msg_num - 1; i++) {
//		printf("message %d = $%4.4X\n", i+1, message_loc[i]);
//	}

	i = 0;
	addr16 = 0;

	while (i < msg_num - 1) {
		if (addr16 != message_loc[i]) {
			addr16 = message_loc[i];
			fprintf(fout, "\t.org\t$%4.4X\n", addr16);
		}
		fprintf(fout, "msg%2.2d:\t;", i+1);

		addr16_temp = addr16;

		while (array[addr16] != 0xff) {
			index1 = (array[addr16] & 0xE0) >> 1;
			index2 = array[addr16] & 0x0F;
			sjis = symbols[index1 + index2];

			char1 = ((sjis & 0xff00) >> 8);
			char2 =  (sjis & 0x00ff);

			fprintf(fout, "%c%c", char1, char2 );
			addr16++;
		}
		fprintf(fout, "\n");

		addr16 = addr16_temp;
		count = 0;

		while (1) {
			if (array[addr16] == 0xff) {
				if (count != 0)
					fprintf(fout, "\n");

				fprintf(fout, "\t.db\t$FF");
				addr16++;
				break;
			}

			if (count == 0)
				fprintf(fout, "\t.db\t");
			else
				fprintf(fout, ",");

			fprintf(fout, "$%2.2X", array[addr16++]);
			count++;

			if (count == 8) {
				fprintf(fout, "\n");
				count = 0;
			}
		}
		fprintf(fout, "\n\n");
		i++;
	}

	fclose(fout);
	fclose(fin);
}
