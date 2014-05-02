	.Code

_start:	
	BGTE	+afterthen	*+x	0

	MUL	+x	*+x	1

afterthen:	COPY	+y	*+x

end:	HALT

	.Numeric

x:	-2
y:	0