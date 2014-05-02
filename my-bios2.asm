	.Code

_start:	
;;; The first loop searches for the limit of the bus controller
;;; itself so we can loop through it to find ROM and RAM limits
	COPY ROMLimit	+three
	COPY %G0 *+bcBase
	COPY %G1 *+bcLimit
loop1:	BNEQ	+loop1bottom		*%G0		1
		
	;;Store the address of the limit of the controller,
	;; then save the value in that address into controllerLimit

	ADDUS	*+bCLimitAddr		%G0		+eight
	COPY	controllerLimit		*+bCLimitAddr
		;; Once we have the limit, jump out of this limit to the next part of code
	JUMP	+ROMloop

loop1bottom:	ADDUS	%G0		%G0		+twelve
		JUMP 	+loop1

		;;;Reset the val in spotToBeChecked so we can loop through the bus control		  ler from the beginning again 

		COPY	%G0	*+bcBegin
	
;;; Loop through the bus controller, breaking if the spotToBeChecked ever exceeds the limit of the controller itself
	
		COPY	%G1	+zero
ROMloop:	BGTE	+resetG0	%G0	*+bcLimit

	;;If the type is != 2, jump to next comparison
	;;This loop should leave the address of the correct ROM(the kernel),
	;; not this BIOS in the ROMBase spot, since the BIOS will be listed first
		BNEQ	+ROMloopbottom	*%G0	+two ;Break if whatever is at the address specified in %G0 is != 2
		ADDUS	%G4	%G0	+four	 ;%G4 now holds the address where the ROMBase is stored
		COPY	%G4	*%G4	      	;%G4 now holds the address of the ROMBase
		ADDUS	%G5	%G0 	+eight	 ;%G5 now holds the address in the bus controller that specifies the ROMLimt
		COPY	%G5	*%G5 		;%G5 now holds the address of the ROMLimit
		ADDUS	 %G1	*%G1	+one	;%G1 holds a count for the number of ROMs found, once it = 2, jump out of loop
		BEQ	+resetG0	*%G1	2	 

ROMloopbottom:	ADDUS	%G0	*%G0	+twelve
		JUMP	+ROMloop	

resetG0:	COPY	%G0		*+bcBase
RAMloop:	BGTE	+copyloop	%G0	*+bcLimit
	
		;; If the type is !=3, jump to the bottom of the loop
		BNEQ	+RAMloopbottom	*%G0	+three
		ADDUS	%G0	*%G0	+four ;%G0 now holds the address that holds the RAMBase
		COPY	%G0	*%G0	      ;%G0 now holds the address of the RAMBase
	;;COPY 	+RAMBaseOrig	*+RAMBaseAddr
	;;	JUMP	+nextloop

RAMloopbottom:	ADDUS	%G0	*%G0	12
		JUMP	+RAMloop

	;; Use the shortcut to copy chunks of code
	SUBUS %G3	*+bcLimit	three
	SUBUS %G2	*+bcLimit	two
	SUBUS %G1	*+bcLimit	one
	COPY *%G1	%G4
	COPY *%G2	%G0
	SUBUS *%G3	%G4	%G5 ;The length of the portion of code is the ROMLimit - ROMBase
;;; Loop through the ROM, copying its contents into RAM
nextloop:	BGT	+afterloop	*+ROMBase	*+ROMLimit 
		COPY	+RAMBase	*+ROMBase
		ADDUS	+RAMBase	*+RAMBase	4
		ADDUS	+ROMBase	*+ROMBase	4

;;; Jump into loop
afterloop:	COPY	%G2	*+RAMBase
		JUMP	+RAMBaseOrig


	.Numeric
zero:	0
two:	2
three:	3
one:	1
four:	4
eight:	8
twelve:	12
bCLimitAddr: 0
controllerLimit:	 0
bcBase: 0x00001000
bcLimit:0x00001008
RAMBaseOrig:	 0
RAMBaseAddr: 	0
RAMBase: 	0
ROMBaseAddr:	0
ROMBase: 	0
ROMLimitAddr:	0
ROMLimit: 	
