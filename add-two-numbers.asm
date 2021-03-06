

	.Code

;;; The entry point.
__start:

	;; Initialize the stack at the limit.
	ADDUS	%SP	+limit	16

	;; Copy one of the source values into a register.
	COPY	%G0	*+x
	
	;; Allocate a space on the stack for the result.
	SUBUS	%SP	%SP	4
	
	;; Sum the two values.  In particular:
	;;   src A (%G0): A value taken from a register.
	;;   src B (*+y): A indirect value stored in a static space named by a label.
	;;   dst   (%SP): A register that contains a pointer to a main memory space.
	ADD	*%SP	%G0	*+y

	;; Halt the processor.
end:
	COPY	%G0	3
	SYSC

	.Numeric

	;; The source values to be added.
x:	5
y:	-3

	;; Assume (at least) a 16 KB main memory.
limit:	00
