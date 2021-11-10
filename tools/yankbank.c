/*
 ============================================================================
 Name        : yankbank.c
 Author      : Dave Shadoff
 Version     :
 Copyright   : (C) 2021 Dave Shadoff
 Description : File manipulation utility, to grab banks of data from a binary file (or replace them)
 ============================================================================
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define	DIR_OUT		1
#define DIR_IN		2


// unsigned char track_data[30000000];
FILE *fmain, *fextract;

int get_int(char * in_string)
{
	int a = 0;
	int base = 10;
	int offset = 0;
	int iter;
	int char_val;

	if (in_string[0] == '$') {
		base = 16;
		offset = 1;
	}
	else if ((in_string[0] == '0') && (in_string[1] == 'x')) {
		base = 16;
		offset = 2;
	}

	iter = offset;
	while (iter < strlen(in_string)) {
		char_val = 0;

		if ((in_string[iter] >= '0') && (in_string[iter] <= '9')) {
			char_val = (in_string[iter] - '0');
		}
		else if ( (base == 16) &&  ((in_string[iter] >= 'A') && (in_string[iter] <= 'F'))) {
			char_val = (in_string[iter] - 'A' + 10);
		}
		else if ( (base == 16) &&  ((in_string[iter] >= 'a') && (in_string[iter] <= 'f'))) {
			char_val = (in_string[iter] - 'a' + 10);
		}
		else {
			a = -1;		/* Invalid Character */
			break;
		}

		a = (a * base) + char_val;
		iter++;
	}

	return(a);
}


int main(int argc, char * argv[]) {
	int i;
	int stat;
	char patchbyte[1000];		/* we only use one byte, but just in case.... */
	int direction = 0;

	int offset, num_banks;
	long int main_filesize, extract_filesize;

	if (argc != 6) {
		printf("%d arguments\n", argc);
		printf("Usage: yankbank [out | in] <main_file> <offset> <num_banks> <extract_file>\n");
		exit(1);
	}

	if ((strcmp(argv[1], "out") == 0) || (strcmp(argv[1], "OUT") == 0))
		direction = DIR_OUT;

	if ((strcmp(argv[1], "in") == 0) || (strcmp(argv[1], "IN") == 0))
		direction = DIR_IN;

	if ((direction != DIR_IN) && (direction != DIR_OUT)) {
		printf("Invalid direction (%s)", argv[1]);
		exit(1);
	}

	offset = get_int(argv[3]);
	if (offset == -1) {
		printf("Invalid character in offset\n");
		exit(1);
	}

	num_banks = get_int(argv[4]);
	if (num_banks == -1) {
		printf("Invalid character in num_banks\n");
		exit(1);
	}


//	printf("Direction = %s\n", argv[1]);
//	printf("Main file = %s\n", argv[2]);
//	printf("Offset = 0x%x, (%d)\n", offset, offset);
//	printf("Num Banks = 0x%x, (%d)\n", num_banks, num_banks);
//	printf("Extract file = %s\n", argv[5]);

	fmain = fopen(argv[2], "rb+");

	if (fmain == NULL) {
		printf("could not open the main file\n");
		exit(1);
	}
//	else {
//		printf("success opening target file\n");
//	}

	if (fseek(fmain, 0, SEEK_END) != 0) {
		printf("Error finding end of target file, errno = %d\n", errno);
		exit(1);
	}

	main_filesize = ftell(fmain);

	if (direction == DIR_OUT)
		fextract = fopen(argv[5], "wb");
	else if (direction == DIR_IN)
		fextract = fopen(argv[5], "rb");

	if (fextract == NULL) {
		printf("could not open the patch file\n");
		exit(1);
	}
//	else {
//		printf("success opening patch file\n");
//	}

	if (fseek(fextract, 0, SEEK_END) != 0) {
		printf("Error finding end of patch file, errno = %d\n", errno);
		exit(1);
	}

	extract_filesize = ftell(fextract);

//	printf("\nmain_filesize = %ld\nextract_filesize = %ld\n", main_filesize, extract_filesize);

	if ((offset + (num_banks * 8192) -1) > main_filesize) {
		printf("Bank extract would extend beyond end-of-file; filesize = %ld, offset+length = %d\n", main_filesize, (offset + (num_banks * 8192)));
		exit(1);
	}

	if ((direction == DIR_IN) && ((num_banks * 8192) -1) > extract_filesize) {
		printf("Extract file too short; filesize = %ld, offset+length = %d\n", extract_filesize, (num_banks * 8192));
		exit(1);
	}

	if (fseek(fmain, offset, SEEK_SET) != 0) {
		printf("error seeking to patch area within Main file, errno = %d\n", errno);
		exit(1);
	}

	if (fseek(fextract, 0, SEEK_SET) != 0) {
		printf("Error finding start of patch file, errno = %d\n", errno);
		exit(1);
	}

	if (direction == DIR_OUT) {

		for (i = 0; i < (num_banks * 8192); i++) {
			stat = fread(patchbyte, 1, 1, fmain);
			if (stat < 1) {
				printf("Error reading Main\n");
				exit(1);
			}
			stat = fwrite(patchbyte, 1, 1, fextract);
			if (stat < 1) {
				printf("Error writing extract\n");
				exit(1);
			}
		}
	}
	else {
		for (i = 0; i < (num_banks * 8192); i++) {
			stat = fread(patchbyte, 1, 1, fextract);
			if (stat < 1) {
				printf("Error reading extract\n");
				exit(1);
			}
			stat = fwrite(patchbyte, 1, 1, fmain);
			if (stat < 1) {
				printf("Error writing Main\n");
				exit(1);
			}
		}

	}


	return EXIT_SUCCESS;

}
