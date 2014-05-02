	.Code
	ADDUS	%SP	+free_space	16
	COPY	%FP	%SP
	
	COPY	%G0	1	;Set %G0 to system call code for IMAGE_COUNT
	SYSC
	;; Image count returns # of all ROMS found, inluding bios, kernel, and init, in register %G5
	;; Begin count at 4 so first ROM you search for is 4th instance of ROM
	COPY	%G1	4	
loop_top:
	BGT 	+continue %G1 %G5


	;; %G1 holds device instance

	COPY	%G0	2	;Set %G0 to system call code for EXECUTE
	SYSC	

	ADDUS	%G1	%G1	1
	JUMP	+loop_top

continue:

	COPY	%G0	3	;Set %G0 to system call code for EXIT
	SYSC



	.Numeric

free_space:		00