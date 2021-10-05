/*
 * pce_gfx.c
 *
 * This is a graphics extracter/importer to convert to txtfile format
 * 
 */


#include <stdio.h>
#include <stdlib.h>

/*
#define DEBUG			0
#define VERBOSE			0
*/

#define PCE_GET			0
#define	PCE_PUT			1
#define	PCE_TILE		2
#define PCE_SPRITE		3

/* global arrays for thingy and wordcount */
FILE *binfile, *txtfile, *xlatefile;
unsigned char textarray[65536];
unsigned char romtile[128];
int maxtextx = 0;
int maxtexty = 0;
int get_put = 0;
int sprite_tile = 0;

int x_bits, y_bits, byte_width, bytes_in_tile;
int plane_0_offset, plane_1_offset, plane_2_offset, plane_3_offset;

char *hexadecimal = "0123456789ABCDEF";

char xlate_str[17];


/* forward-reference declarations for functions */
int   readromtile(FILE *in, long offset, int size, char *rom);
int   writeromtile(FILE *out, long offset, int size, char *rom);
int   readtextfile(FILE *in, char *text);
int   writetextfile(FILE *out, char *text);
int   num_param(char *in, int *out, int radix, int len);
void  hexdump(char *in, int count);


int
main(int argc, char ** argv)
{
/* internal stuff */
int i, j, k, l, x, y;
int dummy, len;
int offset_base;
int virt_width, x_tiles, y_tiles, x_text, y_text;
unsigned char buff;
int extra_byte, tile_offset, offset, shift_bit;
int pos_bitmask, neg_bitmask;
int p0, p1, p2, p3;
int x1, y1;

/* command-line parameters */
char textfile_name[256];
char romfile_name[256];
char xlatefile_name[256];


#ifdef DEBUG
	/* print list of command-line parameters */
	for (i = 0; i < argc; i++)
	{
		printf("argv[%d] = %s\n", i, argv[i]);
	}
	printf("\n");
#endif

    if ((argc < 11) || (argc > 12))
	{
		printf("Invalid number of parameters : %d\n", argc);
		printf("Usage:\n------\n");
		printf("pce_gfx <get|put> <tile|sprite> <ROM file> <offset> <virt_width> <x_iter> <y_iter> <text_file> <text_x> <text_y> <xlate_file>\n\n");
		printf("(Currently doesn't update ROM file)\n");
		exit(1);
	}

/*	strcpy(get_put, argv[1]); */
/*	strcpy(sprite_tile, argv[2]); */
	if (strcmp("GET", argv[1]) == 0) get_put = PCE_GET;
	else if (strcmp("get", argv[1]) == 0) get_put = PCE_GET;
	else if (strcmp("Get", argv[1]) == 0) get_put = PCE_GET;
	else if (strcmp("PUT", argv[1]) == 0) get_put = PCE_PUT;
	else if (strcmp("put", argv[1]) == 0) get_put = PCE_PUT;
	else if (strcmp("Put", argv[1]) == 0) get_put = PCE_PUT;
	else
	{
		printf("1st argument - expected GET/PUT, found '%s'\n", argv[1]);
		exit(1);
	}

	if (strcmp("SPRITE", argv[2]) == 0) sprite_tile = PCE_SPRITE;
	else if (strcmp("sprite", argv[2]) == 0) sprite_tile = PCE_SPRITE;
	else if (strcmp("Sprite", argv[2]) == 0) sprite_tile = PCE_SPRITE;
	else if (strcmp("TILE", argv[2]) == 0) sprite_tile = PCE_TILE;
	else if (strcmp("tile", argv[2]) == 0) sprite_tile = PCE_TILE;
	else if (strcmp("Tile", argv[2]) == 0) sprite_tile = PCE_TILE;
	else
	{
		printf("2nd argument - expected SPRITE/TILE, found '%s'\n", argv[2]);
		exit(1);
	}

	strcpy(romfile_name, argv[3]);
	num_param(argv[4], &offset_base, 10, strlen(argv[4]));
	num_param(argv[5], &virt_width, 10, strlen(argv[5]));
	num_param(argv[6], &x_tiles, 10, strlen(argv[6]));
	num_param(argv[7], &y_tiles, 10, strlen(argv[7]));
	strcpy(textfile_name, argv[8]);
	num_param(argv[9], &x_text, 10, strlen(argv[9]));
	num_param(argv[10], &y_text, 10, strlen(argv[10]));

	if (argc == 12)
	{
		strcpy(xlatefile_name, argv[11]);
		xlatefile = fopen(xlatefile_name, "r");
		if (xlatefile)
		{
			for (i = 0; i < 16; i++)
			{
				xlate_str[i] = fgetc(xlatefile);
			}
			fclose(xlatefile);
		}
		else
		{
			printf("Couldn't open xlatefile %s\n", xlatefile_name);
			exit(1);
		}
	}
	else
	{
		strcpy(xlate_str, hexadecimal);
	}

#ifdef DEBUG
	printf("Values:\n");
	printf("-------\n");
	printf("ROM file     = %s\n", romfile_name);
	printf("Text file    = %s\n", textfile_name);
	printf("\n");
#endif

	if (sprite_tile == PCE_TILE)
	{
		byte_width = 1;
		x_bits = 8;
		y_bits = 8;
		plane_0_offset = 0;
		plane_1_offset = 1;
		plane_2_offset = 16;
		plane_3_offset = 17;
		bytes_in_tile  = 0x20;
	}
	else
	{
		byte_width = 2;
		x_bits = 16;
		y_bits = 16;
		plane_0_offset = 0;
		plane_1_offset = 32;
		plane_2_offset = 64;
		plane_3_offset = 96;
		bytes_in_tile  = 128;
	}

	/* open rom file */
	binfile = fopen(romfile_name, "rb+");

	if (!binfile)
	{
		printf("Couldn't open ROM file %s\n", romfile_name);
		exit(1);
	}

	/*****************/
	/* read ROM file */
	/*****************/

	dummy = fseek(binfile, 0, SEEK_END);
	len = ftell(binfile);
	dummy = fseek(binfile, 0, SEEK_SET);
#ifdef DEBUG
	printf("size of file = %ld\n\n", len);
#endif


	/* init text array */

	maxtextx = 0;
	maxtexty = 0;
	for (i = 0; i < 256; i++)
	{
		for (j = 0; j < 256; j++)
		{
			textarray[(i * 256) + j] = 0;
		}
	}

	/* open text file */

	txtfile = fopen(textfile_name, "r");
	if (txtfile)
	{
	    readtextfile(txtfile, textarray);
	    fclose(txtfile);
	}
	/*
	else
	{
		printf("Couldn't open Textfile '%s' for input\n", textfile_name);
		exit(1);
	}
	*/

#ifdef DEBUG
	printf("maxtextx = %d\nmaxtexty = %d\n", maxtextx, maxtexty);
#endif

	/****************************/
	/* Time to do the REAL work */
	/****************************/
	for (i = 0; i < y_tiles; i++)
	{
		for (j = 0; j < x_tiles; j++)
		{
			offset = offset_base + (((virt_width * i) + j) * bytes_in_tile);

			if (get_put == PCE_GET)
			{
				readromtile(binfile, offset, bytes_in_tile, romtile);

				for (k = 0; k < y_bits; k++)
				{
					for (l = x_bits; l > 0; l--)
					{
						if (l > 8)
						{
							extra_byte = 1;
							shift_bit = l-9;
						}
						else
						{
							extra_byte = 0;
							shift_bit = l-1;
						}

						/* this would be (k * byte_width), but tiles also need 2 bytes offset */
						tile_offset = (k * 2) + extra_byte;

						p0 = (romtile[tile_offset+plane_0_offset] & (1 << shift_bit)) ? 0x01 : 0x00;
						p1 = (romtile[tile_offset+plane_1_offset] & (1 << shift_bit)) ? 0x02 : 0x00;
						p2 = (romtile[tile_offset+plane_2_offset] & (1 << shift_bit)) ? 0x04 : 0x00;
						p3 = (romtile[tile_offset+plane_3_offset] & (1 << shift_bit)) ? 0x08 : 0x00;

						buff = (p3 + p2 + p1 + p0);

						x1 = x_text + (j * x_bits) + (x_bits-l);
						y1 = y_text + (i * y_bits) + k;

						if (x1 > maxtextx)
							maxtextx = x1;

						if (y1 > maxtexty)
							maxtexty = y1;

						textarray[(y1 * 256) + x1] = buff;
					}
				}
			}
			else
			{
				for (k = 0; k < y_bits; k++)
				{
					for (l = x_bits; l > 0; l--)
					{
						if (l > 8)
						{
							extra_byte = 1;
							shift_bit = l-9;
						}
						else
						{
							extra_byte = 0;
							shift_bit = l-1;
						}

						/* this would be (k * byte_width), but tiles also need 2 bytes offset */
						tile_offset = (k * 2) + extra_byte;

						x1 = x_text + (j * x_bits) + (x_bits-l);
						y1 = y_text + (i * y_bits) + k;

						buff = textarray[(y1 * 256) + x1];

						pos_bitmask = (1 << shift_bit);
						neg_bitmask = ~(pos_bitmask);

						p0 = (romtile[tile_offset+plane_0_offset] & neg_bitmask);
						p0 = (buff & 0x01) ? (p0 | pos_bitmask) : p0;
						romtile[tile_offset+plane_0_offset] = p0;

						p1 = (romtile[tile_offset+plane_1_offset] & neg_bitmask);
						p1 = (buff & 0x02) ? (p1 | pos_bitmask) : p1;
						romtile[tile_offset+plane_1_offset] = p1;

						p2 = (romtile[tile_offset+plane_2_offset] & neg_bitmask);
						p2 = (buff & 0x04) ? (p2 | pos_bitmask) : p2;
						romtile[tile_offset+plane_2_offset] = p2;

						p3 = (romtile[tile_offset+plane_3_offset] & neg_bitmask);
						p3 = (buff & 0x08) ? (p3 | pos_bitmask) : p3;
						romtile[tile_offset+plane_3_offset] = p3;
					}
				}

				writeromtile(binfile, offset, bytes_in_tile, romtile);
			}
		}
	}

	/*******************/
	/* write text file */
	/*******************/
	if (get_put == PCE_GET)
	{
		txtfile = fopen(textfile_name, "w");
		if (txtfile)
		{
			writetextfile(txtfile, textarray);
			fclose(txtfile);
		}
		else
		{
			printf("Couldn't open Textfile '%s' for output\n", textfile_name);
			exit(1);
		}
	}

	/*********************/
	/* close binary file */
	/*********************/

	fclose(binfile);


	/* free buffers */

	exit(0);
}


int readromtile(FILE *fin, long offset, int size, char *buf)
{
int i, inchar;

	fseek(fin, offset, SEEK_SET);

	for (i = 0; i < bytes_in_tile; i++)
	{
		inchar = fgetc(fin);
		if (inchar == EOF)
			break;

		buf[i] = (char)inchar;
	}

	return(i);
}


int writeromtile(FILE *fout, long offset, int size, char *buf)
{
int i, ret;

	ret = fseek(fout, offset, SEEK_SET);

	ret = fwrite(buf, 1, size, fout);

	if (ret < size)
		printf("writeromtile offset = %X is bad, ret = %d\n", offset, ret);

	return(ret);
}


int
readtextfile(FILE *fin, char *buf)
{
int  i, j, k, len;
char read_buf[256];
char *ret;
char found;

	i = 0;

	while (1)
	{
		ret = fgets(read_buf, 256, fin);

		if (ret == NULL)
			break;

		len = strlen(read_buf);
		if (read_buf[len-1] == '\n')
		{
			read_buf[len-1] = '\0';
			len = strlen(read_buf);
		}

		for (j = 0; j < len; j++)
		{
/*printf("j = %d: %c (%x)\n", j, read_buf[j], (int)read_buf[j]); */

/*
			if ((read_buf[j] >= '0') && (read_buf[j] <= '9'))
				read_buf[j] = read_buf[j] - '0';
			else if ((read_buf[j] >= 'A') && (read_buf[j] <= 'F'))
				read_buf[j] = read_buf[j] - 'A' + 0x0A;
			else if ((read_buf[j] >= 'a') && (read_buf[j] <= 'f'))
				read_buf[j] = read_buf[j] - 'a' + 0x0A;
			else
				read_buf[j] = 0;
*/
			found = 0;
			for (k = 0; k < 16; k++)
			{
				if (read_buf[j] == xlate_str[k])
					found = k;
			}
			read_buf[j] = found;
		}

		if (len > maxtextx)
			maxtextx = len-1;

		if (i > maxtexty)
			maxtexty = i;

		memcpy((buf + (256*i)), read_buf, len);
		i++;
	}

	return(i);
}


int
writetextfile(FILE *fout, char *buf)
{
int  i, j;

	for (i = 0; i < (maxtexty + 1); i++)
	{
		for (j = 0; j < (maxtextx + 1); j++)
		{
			fprintf(fout, "%c", xlate_str[(int)*(buf + (i*256) + j)]);
		}
		fprintf(fout, "\n");
	}
}


int
num_param(char *in, int *out, int radix, int len)
{
int i, ret;
int currval, tempint;
char temp;

	i = 0;
	ret = 0;
	currval = 0;

	/* if len = 0, then it's limitless */
	if (len == 0)
		len = 65535;

	/* default radix to 10 */
	if (radix == 0)
		radix = 10;

	/* if '0x' found in input stream, force override to radix of 16 */
	if (strncmp(in, "0x", 2) == 0)
	{
		radix = 16;
		i = 2;
	}

	while ( (*(in+i) != 0) && (i < len))
	{
		temp = *(in+i);

		if ((temp >= '0') && (temp <= '9'))
		{
			tempint = (int) (temp - '0');
		}
		else if (radix == 16)
		{
			if ((temp >= 'A') && (temp <= 'F'))
			{
				tempint = (int) (temp - 'A') + 10;
			}
			else if ((temp >= 'a') && (temp <= 'f'))
			{
				tempint = (int) (temp - 'a') + 10;
			}
		}
		else
		{
			*out = currval;
			return(1);
		}

		currval *= radix;
		currval += tempint;
		i++;
	}
			
	*out = currval;
	return(0);
}

void
hexdump(char *in, int count)
{
int i, j;
unsigned char c;

	for (i = 0; i < count; i += 16)
	{
		printf("%4.4X: ", i);

		for (j = 0; j < 16; j++)
		{
			c = *(in+i+j);
			printf("%2.2X ", c);
		}

		printf("\n");
	}
}

