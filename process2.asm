;;; Count to 10

	.Code

__start:
	COPY 	%G1	*+y		;G1 = 2
	COPY	%G2	*+z		;G2 = 10
	COPY	%G3	*+one		;G3 = 1
	
top:
	COPY	%G0	*+x		;G0 = 0
 	BEQ	+end	%G4	%G1 	;Go to end if gone through twice
	
loop:		
	ADDUS	%G0	%G0	%G1 	;Increment G0 by 2	
	BLT	+loop	%G0	%G2	;Go to loop if G0 < 10
	ADDUS	%G4	%G4	%G3	;G4 = G4 + 1 -> holds count	
	JUMP	+top			;Go to top if G0 >= 10

end:
	COPY	%G0	3
	SYSC
	
	.Numeric

x:	0
y:	2
z:	10
one:	1