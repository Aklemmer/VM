;;; Stub code

	.Code

	;; The kernel will have placed the process's allocation size (i.e., its virtual limit) in %SP, thus initializing the stack.
	;; Initialize fp.
	COPY		%FP		%SP				; fp = sp

	;; Call main() to enter the program proper.
	SUBUS		%SP		%SP		12		; Push: pfp / ra / rv
	COPY		*%SP		%FP				; pfp = fp
	COPY		%FP		%SP				; fp = sp
	ADDUS		%G0		%FP		4		; %G0 = &ra
	CALL		+_procedure_main		*%G0		; Call main().

	;; Exit, copying the return value from main() as the result code.
	ADDUS		%SP		%SP		4		; Pop: pfp / ra; push: syscall 
	COPY		*%SP		0x1001				; syscall 
	SYSC

	.Code

; No assembly for externally defined procedure mem_alloc
; No assembly for externally defined procedure find_device
	;; Procedure entry point
_procedure_pageKernel:
	;; Callee for pageKernel: (prologue) Push locals
	SUBUS		%SP		%SP		20		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to mem_alloc: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to mem_alloc: (prologue b) Evaluate and push arguments
	;; Call to mem_alloc:   Argument #0
	;; Push integer value 1024 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1024				; Copy the value

	;; Call to mem_alloc: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to mem_alloc
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_mem_alloc		*%G0				; Do call
	;; Call to mem_alloc: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to mem_alloc: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference UPbase
	;; Push the address of dynamic variable UPbase

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-8		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to mem_alloc: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to mem_alloc: (prologue b) Evaluate and push arguments
	;; Call to mem_alloc:   Argument #0
	;; Push integer value 1024 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1024				; Copy the value

	;; Call to mem_alloc: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to mem_alloc
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_mem_alloc		*%G0				; Do call
	;; Call to mem_alloc: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to mem_alloc: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference LPbase
	;; Push the address of dynamic variable LPbase

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-12		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; A literal assembly injection
	SUBUS	%FP	%FP 8
		COPY  *+kernel_Upper_Page_Table *%FP
		SUBUS	%FP	%FP 4
		COPY  *+kernel_Lower_Page_Table	*%FP
		ADDUS	%FP	%FP 12
	;; Statement #3 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: LPbase

	;; Evaluate dynamic variable LPbase
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Dereference #41: Prelude -- evaluate the src pointer
	;; Identifier evaluation: UPbase

	;; Evaluate dynamic variable UPbase
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-8		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #4 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 1024 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1024				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: LPbase

	;; Evaluate dynamic variable LPbase
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference LPlim
	;; Push the address of dynamic variable LPlim

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-16		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #5 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Push integer value 11111 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		11111				; Copy the value

	;; Call to =:   Argument #0
	;; Reference num
	;; Push the address of dynamic variable num

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-20		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #6 of begin-end statement
	;; While 83: (a) Evaluate the conditional expression, leaving its result on top of the stack
_procedure_pageKernel_loop_83_top:
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Identifier evaluation: LPlim

	;; Evaluate dynamic variable LPlim
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-16		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <:   Argument #0
	;; Identifier evaluation: LPbase

	;; Evaluate dynamic variable LPbase
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 83: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; Copy result
	ADDUS		%SP		%SP		4		; Pop result
	BEQ		_procedure_pageKernel_loop_83_end		%G0		0		; Jump if false
	;; While 83: (c) Body

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Identifier evaluation: num

	;; Evaluate dynamic variable num
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-20		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to =:   Argument #0
	;; Reference LPbase
	;; Push the address of dynamic variable LPbase

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-12		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 0x00001000 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0x00001000				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: num

	;; Evaluate dynamic variable num
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-20		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference num
	;; Push the address of dynamic variable num

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-20		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #2 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to +: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to +: (prologue b) Evaluate and push arguments
	;; Call to +:   Argument #1
	;; Push integer value 4 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		4				; Copy the value

	;; Call to +:   Argument #0
	;; Identifier evaluation: LPbase

	;; Evaluate dynamic variable LPbase
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-12		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to +: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to +
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_+		*%G0				; Do call
	;; Call to +: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to +: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference LPbase
	;; Push the address of dynamic variable LPbase

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-12		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; While 83: (d) Iterate
	JUMP		_procedure_pageKernel_loop_83_top						; Jump to top of loop
	;; While 83: (e) Loop's end
_procedure_pageKernel_loop_83_end:
	NOOP								; Placeholder
	;; Statement #7 of begin-end statement
	;; A literal assembly injection
SUBUS %FP %FP 8 
     SETPTR  *%FP
     JUMPMD +jump c 
jump: ADDUS %FP %FP 8
_procedure_pageKernel_epilogue:
	;; Callee for pageKernel: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		4		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_=:
	;; Callee for =: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	4	; %G0 = &value
       COPY	 %G1	*%FP		; %G1 = destination
	      COPY	 *%G1	*%G0		; *destination = value
	;; Statement #1 of begin-end statement
	;; Return statement 96 from =: (a) Evaluate the expression and prepare the destination
	;; Dereference #95: Prelude -- evaluate the src pointer
	;; Identifier evaluation: destination

	;; Evaluate dynamic variable destination
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 96 from =: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 96 from =: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_=_epilogue						; Return to caller
_procedure_=_epilogue:
	;; Callee for =: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_bitand:
	;; Callee for bitand: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      AND	 *%G0	*%FP	*%G1	; result = x & y
	;; Statement #1 of begin-end statement
	;; Return statement 108 from bitand: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 108 from bitand: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 108 from bitand: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_bitand_epilogue						; Return to caller
_procedure_bitand_epilogue:
	;; Callee for bitand: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_bitor:
	;; Callee for bitor: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      OR	 *%G0	*%FP	*%G1	; result = x | y
	;; Statement #1 of begin-end statement
	;; Return statement 120 from bitor: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 120 from bitor: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 120 from bitor: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_bitor_epilogue						; Return to caller
_procedure_bitor_epilogue:
	;; Callee for bitor: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_bitnot:
	;; Callee for bitnot: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
	      NOT	 *%G0	*%FP		; result = ~x
	;; Statement #1 of begin-end statement
	;; Return statement 130 from bitnot: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 130 from bitnot: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 130 from bitnot: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_bitnot_epilogue						; Return to caller
_procedure_bitnot_epilogue:
	;; Callee for bitnot: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		8		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_<<:
	;; Callee for <<: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      SHFTL	 *%G0	*%FP	*%G1	; result = x << y
	;; Statement #1 of begin-end statement
	;; Return statement 142 from <<: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 142 from <<: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 142 from <<: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_<<_epilogue						; Return to caller
_procedure_<<_epilogue:
	;; Callee for <<: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_>>:
	;; Callee for >>: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      SHFTR	 *%G0	*%FP	*%G1	; result = x << y
	;; Statement #1 of begin-end statement
	;; Return statement 154 from >>: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 154 from >>: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 154 from >>: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>>_epilogue						; Return to caller
_procedure_>>_epilogue:
	;; Callee for >>: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_and:
	;; Callee for and: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 175: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 175: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_175_end		%G0		0		; If false, jump over then-branch
	;; If-then 175: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 173: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 173: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_173_end		%G0		0		; If false, jump over then-branch
	;; If-then 173: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 171 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 171 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 171 from and: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_and_epilogue						; Return to caller
	;; If-then 173: (d) End
_and_branch_173_end:
	NOOP								; Placeholder for if-then 173
	;; If-then 175: (d) End
_and_branch_175_end:
	NOOP								; Placeholder for if-then 175
	;; Statement #1 of begin-end statement
	;; Return statement 177 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 177 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 177 from and: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_and_epilogue						; Return to caller
_procedure_and_epilogue:
	;; Callee for and: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_or:
	;; Callee for or: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 192: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 192: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_192_end		%G0		0		; If false, jump over then-branch
	;; If-then 192: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 190 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 190 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 190 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 192: (d) End
_or_branch_192_end:
	NOOP								; Placeholder for if-then 192
	;; Statement #1 of begin-end statement
	;; If-then 200: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Call to !=: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to !=: (prologue b) Evaluate and push arguments
	;; Call to !=:   Argument #1
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Call to !=:   Argument #0
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to !=: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to !=
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_!=		*%G0				; Do call
	;; Call to !=: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to !=: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; If-then 200: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_200_end		%G0		0		; If false, jump over then-branch
	;; If-then 200: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 198 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 198 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 198 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 200: (d) End
_or_branch_200_end:
	NOOP								; Placeholder for if-then 200
	;; Statement #2 of begin-end statement
	;; Return statement 202 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 202 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 202 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
_procedure_or_epilogue:
	;; Callee for or: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_not:
	;; Callee for not: (prologue) Push locals
	SUBUS		%SP		%SP		0		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then-else 213: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; If-then-else 213: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_not_branch_213_else		%G0		0		; If false, jump to else-branch
	;; If-then-else 213: (c) Then-branch
	;; Return statement 210 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 210 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 210 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	JUMP		_not_branch_213_end						; Jump over else-branch
	;; If-then-else213: (d) Else-branch
_not_branch_213_else:
	;; Return statement 212 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 212 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 212 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	;; If-then-else 213: (e) End
_not_branch_213_end:
	NOOP								; Placeholder for if-then-else 213
_procedure_not_epilogue:
	;; Callee for not: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		8		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_+:
	;; Callee for +: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      ADD	 *%G0	*%FP	*%G1	; result = x + y
	;; Statement #1 of begin-end statement
	;; Return statement 225 from +: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 225 from +: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 225 from +: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_+_epilogue						; Return to caller
_procedure_+_epilogue:
	;; Callee for +: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_-:
	;; Callee for -: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      SUB	 *%G0	*%FP	*%G1	; result = x - y
	;; Statement #1 of begin-end statement
	;; Return statement 237 from -: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 237 from -: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 237 from -: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_-_epilogue						; Return to caller
_procedure_-_epilogue:
	;; Callee for -: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_*:
	;; Callee for *: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      MUL	 *%G0	*%FP	*%G1	; result = x * y
	;; Statement #1 of begin-end statement
	;; Return statement 249 from *: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 249 from *: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 249 from *: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_*_epilogue						; Return to caller
_procedure_*_epilogue:
	;; Callee for *: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_/:
	;; Callee for /: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; A literal assembly injection
	      ADDUS	 %G0	%FP	-4	; %G0 = &result
       ADDUS	 %G1	%FP	4	; %G1 = &y
	      DIV	 *%G0	*%FP	*%G1	; result = x / y
	;; Statement #1 of begin-end statement
	;; Return statement 261 from /: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 261 from /: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 261 from /: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_/_epilogue						; Return to caller
_procedure_/_epilogue:
	;; Callee for /: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_==:
	;; Callee for ==: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference difference
	;; Push the address of dynamic variable difference

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Return statement 282 from ==: (a) Evaluate the expression and prepare the destination
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Identifier evaluation: difference

	;; Evaluate dynamic variable difference
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Return statement 282 from ==: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 282 from ==: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_==_epilogue						; Return to caller
_procedure_==_epilogue:
	;; Callee for ==: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_!=:
	;; Callee for !=: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference difference
	;; Push the address of dynamic variable difference

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Return statement 301 from !=: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: difference

	;; Evaluate dynamic variable difference
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 301 from !=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 301 from !=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_!=_epilogue						; Return to caller
_procedure_!=_epilogue:
	;; Callee for !=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_<:
	;; Callee for <: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Call to =: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to =: (prologue b) Evaluate and push arguments
	;; Call to =:   Argument #1
	;; Call to -: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to -: (prologue b) Evaluate and push arguments
	;; Call to -:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to -: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to -
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_-		*%G0				; Do call
	;; Call to -: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to -: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to =:   Argument #0
	;; Reference result
	;; Push the address of dynamic variable result

	SUBUS		%SP		%SP		4		; Push pointer space
	ADDUS		*%SP		%FP		-4		; src = %FP + offset
	;; Call to =: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to =
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_=		*%G0				; Do call
	;; Call to =: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to =: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Statement #1 of begin-end statement
	;; Return statement 323 from <: (a) Evaluate the expression and prepare the destination
	;; Call to >>: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to >>: (prologue b) Evaluate and push arguments
	;; Call to >>:   Argument #1
	;; Push integer value 31 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		31				; Copy the value

	;; Call to >>:   Argument #0
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to >>: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to >>
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_>>		*%G0				; Do call
	;; Call to >>: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to >>: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Return statement 323 from <: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 323 from <: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_<_epilogue						; Return to caller
_procedure_<_epilogue:
	;; Callee for <: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_>:
	;; Callee for >: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 345 from >: (a) Evaluate the expression and prepare the destination
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to or: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to or: (prologue b) Evaluate and push arguments
	;; Call to or:   Argument #1
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or:   Argument #0
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to or
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_or		*%G0				; Do call
	;; Call to or: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to or: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Return statement 345 from >: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 345 from >: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>_epilogue						; Return to caller
_procedure_>_epilogue:
	;; Callee for >: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_<=:
	;; Callee for <=: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 365 from <=: (a) Evaluate the expression and prepare the destination
	;; Call to or: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to or: (prologue b) Evaluate and push arguments
	;; Call to or:   Argument #1
	;; Call to ==: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to ==: (prologue b) Evaluate and push arguments
	;; Call to ==:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to ==: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to ==
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_==		*%G0				; Do call
	;; Call to ==: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to ==: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or:   Argument #0
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to or: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to or
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_or		*%G0				; Do call
	;; Call to or: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to or: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Return statement 365 from <=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 365 from <=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_<=_epilogue						; Return to caller
_procedure_<=_epilogue:
	;; Callee for <=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	;; Procedure entry point
_procedure_>=:
	;; Callee for >=: (prologue) Push locals
	SUBUS		%SP		%SP		4		; Push locals

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 381 from >=: (a) Evaluate the expression and prepare the destination
	;; Call to not: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to not: (prologue b) Evaluate and push arguments
	;; Call to not:   Argument #0
	;; Call to <: (prologue a) Create base of caller frame segment
	SUBUS		%SP		%SP		12		; Push pfp/ra[/rv] spaces
	;; Call to <: (prologue b) Evaluate and push arguments
	;; Call to <:   Argument #1
	;; Identifier evaluation: y

	;; Evaluate dynamic variable y
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <:   Argument #0
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Call to <: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		8		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to <
	ADDUS		%G0		%SP		12		; %G0 = &ra
	CALL		+_procedure_<		*%G0				; Do call
	;; Call to <: (epilogue a) Restore FP
	ADDUS		%G0		%FP		8		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to <: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		16		; Pop args/pfp/ra
	;; Call to not: (prologue c) Preserve and update frame pointer
	ADDUS		%G0		%SP		4		; %G0 = &pfp
	COPY		*%G0		%FP				; pfp = %FP
	COPY		%FP		%SP				; %FP = %SP
	;; Call to not
	ADDUS		%G0		%SP		8		; %G0 = &ra
	CALL		+_procedure_not		*%G0				; Do call
	;; Call to not: (epilogue a) Restore FP
	ADDUS		%G0		%FP		4		; %G0 = &pfp
	COPY		%FP		*%G0				; Restore FP
	;; Call to not: (epilogue b) Pop all but rv
	ADDUS		%SP		%SP		12		; Pop args/pfp/ra
	;; Return statement 381 from >=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 381 from >=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>=_epilogue						; Return to caller
_procedure_>=_epilogue:
	;; Callee for >=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	.Numeric

	.Text

