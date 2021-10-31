/*
 * patch.c
 *
 * This is a utility to patch locations in a file to a list of values
 * 
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
#define DEBUG			0
#define VERBOSE			0
*/


/* global arrays for thingy and wordcount */
FILE *binfile;
unsigned char bytes[32];
int num_bytes;

/* forward-reference declarations for functions */
int   num_param(char *in, int *out, int radix, int len);
void  hexdump(char *in, int count);


int
main(int argc, char ** argv)
{
/* internal stuff */
int i;
int dummy, len, ret;
int offset_base;
int in_char;

/* command-line parameters */
char romfile_name[256];


#ifdef DEBUG
	printf("argc = %d\n", argc);
	printf("\n");
	/* print list of command-line parameters */
	for (i = 0; i < argc; i++)
	{
		printf("argv[%d] = %s\n", i, argv[i]);
	}
	printf("\n");
#endif

    if ((argc < 4) || (argc > 19))
	{
		printf("Invalid number of parameters : %d\n", argc - 1);
		printf("Usage:\n------\n");
		printf("patch <ROM file> <offset> <byte1> [<byte2> [...]]\n\n");
		printf("Maximum 16 bytes of patch data at a time.\n\n");
		exit(1);
	}

	strcpy(romfile_name, argv[1]);
	num_param(argv[2], &offset_base, 10, strlen(argv[2]));

	for (i = 3; i < argc; i++) {
		num_param(argv[i], &in_char, 10, strlen(argv[i]));
		bytes[i-3] = (char)in_char;
	}
	num_bytes = argc - 3;


#ifdef DEBUG
	printf("Values:\n");
	printf("-------\n");
	printf("ROM file     = %s\n", romfile_name);
	printf("Offset       = 0x%6.6X\n", offset_base);
	printf("Bytes        = ");
	for (i = 0; i < num_bytes; i++) {
		printf("0x%2.2X ", bytes[i]);
	}
	printf("\n");
	printf("\n");
#endif

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


	/*********************/
	/* write binary file */
	/*********************/
	dummy = fseek(binfile, offset_base, SEEK_SET);
	ret = fwrite(bytes, 1, num_bytes, binfile);

	if (ret < num_bytes)
		printf("write failure. offset = %X, ret = %d\n", offset_base, ret);


	/*********************/
	/* close binary file */
	/*********************/

	fclose(binfile);


	/* free buffers */

	exit(0);
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
		printf("%6.6X: ", i);

		for (j = 0; j < 16; j++)
		{
			c = *(in+i+j);
			printf("%2.2X ", c);
		}

		printf("\n");
	}
}

