;;; William Poss and Avery Klemmer
	.Code

	COPY *+invalid_address		+null_interrupt
	COPY *+invalid_register		+null_interrupt
	COPY *+bus_error		+null_interrupt
	COPY *+clock_alarm		+clock_alarm_handler
	COPY *+divide_by_zero		+null_interrupt
	COPY *+overflow			+null_interrupt
	COPY *+invalid_instruction	+null_interrupt
	COPY *+permission_violation	+null_interrupt	
	COPY *+invalid_shift_amount	+null_interrupt
	COPY *+system_call		+system_call_handler
	
	SETTBR	+tt
	SETIBR	+int_buff

	ADDUS	*+free_space_pointer	+free_space_pointer	4 ;Save the end of the statics (first free space) into the free_space_pointer
	COPY	%G0	*+free_space_pointer
	;; ADDUS	*+process_table		+free_space_pointer	4
	ADDUS	*+kernel_end		+free_space_pointer	1000
	COPY	%SP	*+kernel_end
	COPY	%FP	%SP
	ADDUS *+newPortion	%SP	16
	
	COPY	%G0	0x00001000 ;%G0 holds the bus controller base
	COPY	%G1	0x00001008
	COPY	%G1	*%G1
	COPY	%G2	0


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
	;; Return statement 11 from =: (a) Evaluate the expression and prepare the destination
	;; Dereference #10: Prelude -- evaluate the src pointer
	;; Identifier evaluation: destination

	;; Evaluate dynamic variable destination
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	COPY		%G0		*%SP				; %G0 = src
	ADDUS		%SP		%SP		4		; Pop src pointer
	SUBUS		%SP		%SP		4		; Push dst space
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 11 from =: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 11 from =: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 23 from bitand: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 23 from bitand: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 23 from bitand: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 35 from bitor: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 35 from bitor: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 35 from bitor: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 45 from bitnot: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 45 from bitnot: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 45 from bitnot: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 57 from <<: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 57 from <<: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 57 from <<: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 69 from >>: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 69 from >>: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 69 from >>: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; If-then 90: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 90: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_90_end		%G0		0		; If false, jump over then-branch
	;; If-then 90: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; If-then 88: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 88: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_and_branch_88_end		%G0		0		; If false, jump over then-branch
	;; If-then 88: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 86 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 86 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 86 from and: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_and_epilogue						; Return to caller
	;; If-then 88: (d) End
_and_branch_88_end:
	NOOP								; Placeholder for if-then 88
	;; If-then 90: (d) End
_and_branch_90_end:
	NOOP								; Placeholder for if-then 90
	;; Statement #1 of begin-end statement
	;; Return statement 92 from and: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 92 from and: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 92 from and: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; If-then 107: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 107: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_107_end		%G0		0		; If false, jump over then-branch
	;; If-then 107: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 105 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 105 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 105 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 107: (d) End
_or_branch_107_end:
	NOOP								; Placeholder for if-then 107
	;; Statement #1 of begin-end statement
	;; If-then 115: (a) Evaluate the conditional expression, leaving its result on top of the stack
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
	;; If-then 115: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_or_branch_115_end		%G0		0		; If false, jump over then-branch
	;; If-then 115: (c) Then-branch

	;; Start begin-end statement
	;; Statement #0 of begin-end statement
	;; Return statement 113 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 113 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 113 from or: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_or_epilogue						; Return to caller
	;; If-then 115: (d) End
_or_branch_115_end:
	NOOP								; Placeholder for if-then 115
	;; Statement #2 of begin-end statement
	;; Return statement 117 from or: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 117 from or: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 117 from or: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; If-then-else 128: (a) Evaluate the conditional expression, leaving its result on top of the stack
	;; Identifier evaluation: x

	;; Evaluate dynamic variable x
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		0		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; If-then-else 128: (b) Pop conditional result and branch (or not)
	COPY		%G0		*%SP				; %G0 = conditional result
	ADD		%SP		%SP		4		; Pop result
	BEQ		_not_branch_128_else		%G0		0		; If false, jump to else-branch
	;; If-then-else 128: (c) Then-branch
	;; Return statement 125 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 0 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		0				; Copy the value

	;; Return statement 125 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 125 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	JUMP		_not_branch_128_end						; Jump over else-branch
	;; If-then-else128: (d) Else-branch
_not_branch_128_else:
	;; Return statement 127 from not: (a) Evaluate the expression and prepare the destination
	;; Push integer value 1 onto stack
	SUBUS		%SP		%SP		4		; Push word space
	COPY		*%SP		1				; Copy the value

	;; Return statement 127 from not: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 127 from not: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_not_epilogue						; Return to caller
	;; If-then-else 128: (e) End
_not_branch_128_end:
	NOOP								; Placeholder for if-then-else 128
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
	;; Return statement 140 from +: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 140 from +: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 140 from +: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 152 from -: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 152 from -: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 152 from -: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 164 from *: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 164 from *: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 164 from *: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 176 from /: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: result

	;; Evaluate dynamic variable result
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 176 from /: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 176 from /: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 197 from ==: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 197 from ==: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 197 from ==: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 216 from !=: (a) Evaluate the expression and prepare the destination
	;; Identifier evaluation: difference

	;; Evaluate dynamic variable difference
	SUBUS		%SP		%SP		4		; Push space for resulting value, %SP = dst
	ADDUS		%G0		%FP		-4		; %G0 = src = %FP + offset
	COPY		*%SP		*%G0				; *dst = *src
	;; Return statement 216 from !=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 216 from !=: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 238 from <: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 238 from <: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 238 from <: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 260 from >: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 260 from >: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 260 from >: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 280 from <=: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 280 from <=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 280 from <=: (c) Jump to callee epilogue, since return statements take effect immediately
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
	;; Return statement 296 from >=: (a) Evaluate the expression and prepare the destination
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
	;; Return statement 296 from >=: (b) Copy single-word return value into place
	COPY		*%G0		*%SP				; Copy expression result into rv
	ADDUS		%SP		%SP		4		; Pop expression result
	;; Return statement 296 from >=: (c) Jump to callee epilogue, since return statements take effect immediately
	JUMP		+_procedure_>=_epilogue						; Return to caller
_procedure_>=_epilogue:
	;; Callee for >=: (epilogue) Pop locals and return

	COPY		%SP		%FP				; Pop locals and temp results
	ADDUS		%G0		%FP		12		; %G0 = &ra
	JUMP		*%G0						; Return to caller

	.Numeric

	.Text


ROMloop:
	BEQ	+init	*%G0	0

	;;If the type is = 2:
	;; 	increment count & check if this is 3rd rom (aka init)
	BNEQ	+ROMloopbottom	*%G0	2
	ADDUS	%G2	%G2	1  ;%G2 = # of ROMs found
	COPY	*+img_count	%G2 ;img_count holds the count for # of ROMs
	
	BNEQ	+ROMloopbottom	%G2	3   ;When we have found third ROM (init), call EXECUTE	
	;; Caller prologue
	SUBUS 	%SP	%SP	8
	COPY	*%SP	%FP
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G2
	COPY	%FP	%SP
	ADDUS	%G3	%FP	8
	;; Call EXECUTE on init
	CALL	+EXECUTE	*%G3
	;; Caller epilogue
	SUBUS	%FP	%FP	4

	COPY	%FP	*%FP
	ADDUS	%SP	%SP	12
	
ROMloopbottom:
	ADDUS	%G0	%G0	12
	JUMP	+ROMloop

init:	ADDUS	%G0	*+process_table		8
	COPY	*+curr_process	*+process_table
	SETBS	*%G0
	ADDUS	%G0	%G0	4
	SETLM	*%G0
	COPY	%G0	0
	JUMPMD	%G0	6
	


	;; DMA: third to last spot in RAM (G3) gets source addr
	;;      second to last spot in RAM(G2) gets dest addr
	;; 	last spot in RAM(G1) gets ROM length

;;; COPY:
;;; 	will use DMA to copy a process into RAM
;;; 	Returns: nothing
;;; 	Locals:	(currently)	%G5 = ROMLimit
;;;				%G4 = ROMBase
;;; Caller preserved registers:
;;;	[%SP - 4] = %G0
;;; 	[%SP - 8] = %G1
;;; Params:
;;;	[%FP +0] =  limit
;;; 	[%FP +4] =  base
;;; 
COPY:
;;; Callee Prologue
	;; Preserve caller registers
	SUBUS	%SP		%SP		4
	COPY	*%SP		%G0
	SUBUS	%SP		%SP		4
	COPY	*%SP		%G1
	
;;; Call Function
	COPY	%G1	0x00001008 ;%G1 holds the pointer to bus controller limit
	COPY	%G1	*%G1	   ;%G1 holds the address of the bus controller limit
	
	SUBUS %G3	%G1	12
       	SUBUS %G2	%G1	8
	SUBUS %G1	%G1	4
	
	;; Initialize locals
	COPY	%G5	*%FP	;%G5 = ROMLimit
	ADDUS	%G0	%FP	4
	COPY	%G4	*%G0	;%G4 = ROMBase

	
	COPY *%G3	%G4
	COPY *%G2	*+newPortion
	SUBUS %G2	%G5	%G4 ;%G2 = length of portion of code = ROMLimit - ROMBase

;;; 	ADDUS %G2	%G2	0x00000100 ;Give the process 100 extra spaces in RAM for stack and heap !!!!!!!!!!!!!!!!!!!!!!!

	COPY	*%G1	%G2
	COPY	%G3	*+newPortion 		;%G3 = Physical base
	ADDUS	*+newPortion	%G2	*+newPortion
	ADDUS	*+newPortion	*+newPortion	104 ;16 buffer spaces
	COPY	%G4	*+newPortion
	;; SUBUS	%G4	*+newPortion	16 %G4 = Physical Limit 

	;; Return Base in RAM(%G3) and Limit in RAM(%G4)
	ADDUS	%FP	%FP	20
	COPY	*%FP	%G4
	SUBUS	%FP	%FP	4
	COPY	*%FP	%G3

	;; Callee epilogue
	COPY	%G1	*%SP
	ADDUS	%SP	%SP	4
	COPY	%G0	*%SP
	ADDUS   %SP     %SP     4
	SUBUS	%FP	%FP	4
	
	JUMP	*%FP

	
;;; IMAGE_COUNT: saves the total # of ROMs into rv
IMAGE_COUNT:
	ADDUS	%FP	%FP	8	
	COPY	*%FP	*+img_count
	SUBUS	%FP	%FP	4
	JUMP	*%FP


;;; The EXECUTE procedure will copy the new process into RAM
;;; and enter the new process into the process table.
;;; Callee preserved registers:
;;;   [%SP - 4]:  G0
;;;   [%SP - 8]:  G1
;;;   [%SP - 12]: G2
;;;   [%SP - 16]: G3
;;;   [%SP - 20]: G4
;;;   [%SP - 24]: G5
;;; Parameters:
;;;   [%FP +0] =  device instance
;;; Caller preserved reisters:
;;;   [%FP + 8]	= FP
;;; Locals:
;;; 	%G0:	Incremented pointer into process table entry
;;; 	%G1:	Base of new process in RAM
;;; 	%G2:	Limit of new Process in RAM

EXECUTE:
;;; Callee Prologue
	

	;; Preserve Registers
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G0
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G1
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G2
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G3
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G4
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G5

	COPY	%G1	*%FP

	;; Caller prologue
	SUBUS	%SP %SP	12
	COPY	*%SP %FP
	SUBUS	%SP %SP	4
	COPY	*%SP %G1
	SUBUS	%SP %SP 4
	COPY	*%SP 2
	COPY	%FP %SP
	ADDUS	%G0	%FP	12
	;; Call
	CALL +_procedure_find_device	*%G0
	;; Caller epilogue
	ADDUS	%G2	%FP	16	
	COPY	%G2	*%G2	;%G2 = rv
	ADDUS	%FP	%FP	8
	COPY	%FP	*%FP
	ADDUS	%SP	%SP	20

	;; Initialize 
	ADDUS	%G2	%G2	4
	COPY	%G0	*%G2	;G0 holds the base of new process
	ADDUS	%G2	%G2	4
	COPY	%G1	*%G2	;G1 now holds the limit of the new process

	
;;; Call Function

	;; Caller prologue
	SUBUS	%SP	%SP	16
	COPY	*%SP	%FP
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G0
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G1
	COPY	%FP	%SP
	ADDUS	%G0	%FP	12

	;; Call COPY
;;; NOW WHEN WE CALL COPY WE MUST CHECK IF WE ARE COPYING KERNEL INTO BASE PAGES, IF SO CHANGE BITS SO RWX DISABLED
	CALL	+COPY	*%G0

	;; Caller epilogue
	ADDUS   %SP	%SP	16
	COPY	%G1	*%SP	;base
	ADDUS	%SP	%SP	4
	COPY	%G2	*%SP	;lim
	SUBUS	%FP	%FP	4
	COPY	%FP	*%FP
	ADDUS	%SP	%SP	4
	
;;; Create Process table entry and save info into entry
	;; Give each entry 15 words (Forward link, Reverse link, Base, Lim, Ready?, G0, G1,
	;; G2, G3, G4, G5, FP, SP, IP, Parent ID)

	;; Caller prologue

	SUBUS	%SP	%SP	12
	COPY	*%SP	%FP
	SUBUS	%SP	%SP	4
	COPY	*%SP	60
	COPY	%FP	%SP
	ADDUS	%G0	%FP	8

	;; Call mem_alloc
	CALL	+_procedure_mem_alloc	*%G0

	;; Caller epilogue
	SUBUS	%FP	%FP	4
	COPY	%FP	*%FP
	ADDUS	%SP	%SP	16
	

	SUBUS	%G3	%SP	4 ;%G3 points to RV
	COPY	%G0	*%G3	;%G0 holds return value(new process entry addr) of mem_alloc
			
;;; Process table entry:
	;; 1) Link to next process
	;; 2) Link to prev process
	;; 3) Base
	;; 4) Limit
	;; 5) Ready?
	;; 6) %G0
	;; 7) %G1
	;; 8) %G2
	;; 9) %G3
	;;10) %G4
	;;11) %G5
	;;12) %FP
	;;13) %SP
	;;14) IP
	;;15) Parent Process ID


;;; 1) Save the new process table entry's pointer in the old process table entry's reverse link 
	BEQ	+hop	*+process_table	0

	ADDUS	%G3	*+process_table	4
	COPY	*%G3	%G0
	
hop:	
;;; 2) Save the current process entry pointer into the new process table entry
	COPY	*%G0	*+process_table
;;; 3) Update pointer to process table in statics to new entry
	COPY	*+process_table	%G0

	ADDUS	%G0	%G0	4
	COPY	*%G0	0
;;; 4) Fill in the new entry
	ADDUS	%G0	%G0	4
	COPY	*%G0	%G1	;Base of process in RAM
	ADDUS	%G0	%G0	4
	COPY	*%G0	%G2	;Limit of process in RAM
	ADDUS	%G0	%G0	4
	COPY	*%G0	1	;Status Ready?
	ADDUS	%G0	%G0	36 ;Allocate the space for registers and IP
	COPY	*%G0	0
	ADDUS 	%G0	%G0 4
	COPY	*%G0	*+curr_process	
;;; Callee epilogue

	COPY	%G5	*%SP
	ADDUS	%SP	%SP	4
	COPY	%G4	*%SP
	ADDUS	%SP	%SP	4
	COPY	%G3	*%SP
	ADDUS	%SP	%SP	4
	COPY	%G2	*%SP
	ADDUS	%SP	%SP	4
	COPY	%G1	*%SP
	ADDUS	%SP	%SP	4
	COPY	%G0	*%SP
	ADDUS	%SP	%SP	4

	ADDUS	%FP	%FP	8
	JUMP	*%FP

EXIT:
	COPY	%G0	*+curr_process	
	COPY	%G0	*%G0		;%G0 now holds forward link of process exitin
	BNEQ	+skip1	*+curr_process	*+process_table
	COPY	*+process_table	%G0

	BNEQ	+skip1	%G0	0
	COPY	*+curr_process	0
	JUMP	+skip
	
skip1:	ADDUS	%G1	*+curr_process 4	
	COPY	%G1	*%G1		;%G1 now holds reverse link of process exiting


	ADDUS	%G2	%G0	4 	;%G2 = second entry of forward linked process
	
	COPY	*%G2	%G1 		;Set forward process' reverse link to
	BEQ	+skip	%G1	0
							;; reverse link of process exiting
	COPY	*%G1	%G0		;Set reverse linked process' forward link to

					;;forward link of process exiting

skip:	ADDUS	%FP	%FP	8
	JUMP	*%FP

	

;;; mem_alloc procedure allocates memory in kernerls heap
	;; Parameters: [%FP] = # of spaces requested
	;; Returns: free space pointer

_procedure_mem_alloc:

	;; Preserve Registers 
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G1
	SUBUS	%SP	%SP	4
	COPY	*%SP	%G2

	COPY	%G0	*%FP
	ADDUS	%G2	%FP	12
	ADDUS	*%G2	*+free_space_pointer 4 ;Return value set to pointer
	ADDUS	*+free_space_pointer	*+free_space_pointer	%G0 ;free_space_pointer now holds an incremented value

	;; Reset registers
	COPY	%G2	*%SP
	ADDUS	%SP	%SP	4
	COPY	%G1	*%SP
	ADDUS	%SP	%SP	4
	ADDUS	%FP	%FP	8
	JUMP	*%FP

;;; System call handler must examine %G0 and then call whichever system call it indicates
;;; Preserve registers, and all that.  Give execute the instance of ROM we search
system_call_handler:
	COPY *+x	%G0
	COPY *+y	%G1
	COPY %G0 *+curr_process

	
	ADDUS %G0	%G0	20	
	COPY  *%G0	*+x
	ADDUS %G0	%G0	4
	COPY *%G0	%G1
	ADDUS %G0	%G0	4
	COPY *%G0	%G2
	ADDUS %G0	%G0	4
	COPY *%G0	%G3
	ADDUS %G0	%G0	4
	COPY *%G0	%G4
	ADDUS %G0	%G0	4
	COPY *%G0	%G5
	ADDUS %G0	%G0	4
	COPY *%G0	%FP
	ADDUS %G0	%G0	4
	COPY *%G0	%SP
	ADDUS %G0	%G0	4
	ADDUS *+int_buff	*+int_buff	16
	COPY *%G0	*+int_buff
	
	COPY %G0	*+x
	
	COPY %SP	*+kernel_end
	COPY %FP	%SP

	
	BNEQ	+next1	%G0	1
	;; Caller prologue
	SUBUS	%SP	%SP	12
	COPY	*%SP	%FP
	COPY	%FP	%SP
	ADDUS	%G1	%FP	4
	;; Call
	CALL	+IMAGE_COUNT	*%G1
	;; Calller epilogue
	ADDUS	%FP	%FP	4
	COPY	%G5	*%FP	;return image count in %G5
	COPY	%FP	*%SP
	ADDUS	%SP	%SP	12


next1:	BNEQ	+next2	%G0	2
	;; Caller prologue
	SUBUS %SP	%SP	8
	COPY *%SP	%FP	
	SUBUS %SP	%SP	4
	COPY  *%SP	*+y
	COPY  %FP	%SP
	ADDUS %G1	%FP	8	
	;; Call
	CALL	+EXECUTE	*%G1
	;; Caller epilogue
	SUBUS	%FP	%FP	4
	COPY	%FP	*%FP
	ADDUS	%SP	%SP	16

	

next2:  BNEQ	+scheduler %G0	3
	SUBUS	%SP	%SP	8
	COPY	*%SP	%FP
	ADDUS	%G1	%FP	8
	CALL	+EXIT	*%G1
	SUBUS	%FP	%FP	4
	COPY	%FP	*%FP
	ADDUS	%SP	%SP	8


	JUMP	+scheduler



scheduler:
	BNEQ	+continue	*+curr_process	0
	HALT

continue:	
	COPY	%G0	*+curr_process
	COPY	%G0	*%G0
	

	BNEQ	+RUN	%G0	0 ;IF no forwardlinked process
	ADDUS	%G0	*+curr_process	4
	COPY	%G0	*%G0
	BNEQ	+RUN	%G0	0 ;IF neither forward nor reverse linked process
	COPY	%G0	*+curr_process
	

	
RUN:
;;; Preserve process to its state and jump back
	COPY	*+curr_process %G0
	COPY	*+x	%SP
	ADDUS 	%SP  *+curr_process 8
	SETBS	*%SP
	ADDUS	%SP %SP	4
	SETLM	*%SP
	ADDUS	%SP %SP	8
	COPY	%G0 *%SP
	ADDUS   %SP %SP 4
	COPY	%G1 *%SP
	ADDUS	%SP %SP	4
	COPY	%G2 *%SP
	ADDUS	%SP %SP 4
	COPY	%G3 *%SP
	ADDUS 	%SP %SP 4 
	COPY	%G4 *%SP
	ADDUS   %SP %SP 4
	;; COPY	%G5 *%SP
	ADDUS 	%SP %SP 4
	COPY	%FP *%SP
	ADDUS	%SP %SP 8	;points to old IP
	COPY	*+y *%SP
		
	SUBUS   %SP %SP 4

	COPY	%SP *%SP

	JUMPMD	*+y	6




clock_alarm_handler:
;;; Must store current process' registers and IP into its process table entry

	
	ADDUS %G0	%G0	20	
	COPY  *%G0	*+x
	ADDUS %G0	%G0	4
	COPY *%G0	%G1
	ADDUS %G0	%G0	4
	COPY *%G0	%G2
	ADDUS %G0	%G0	4
	COPY *%G0	%G3
	ADDUS %G0	%G0	4
	COPY *%G0	%G4
	ADDUS %G0	%G0	4
	COPY *%G0	%G5
	ADDUS %G0	%G0	4
	COPY *%G0	%FP
	ADDUS %G0	%G0	4
	COPY *%G0	%SP
	ADDUS %G0	%G0	4
	COPY *%G0	*+int_buff

	JUMP	+scheduler


;;; ================================================================================================================================	
;;; Procedure: find_device
;;; Callee preserved registers:
;;;   [%FP - 4]:  G0
;;;   [%FP - 8]:  G1
;;;   [%FP - 12]: G2
;;;   [%FP - 16]: G4
;;; Parameters:
;;;   [%FP + 0]: The device type to find.
;;;   [%FP + 4]: The instance of the given device type to find (e.g., the 3rd ROM).
;;; Caller preserved registers:
;;;   [%FP + 8]:  FP
;;; Return address:
;;;   [%FP + 12]
;;; Return value:
;;;   [%FP + 16]: If found, a pointer to the correct device table entry; otherwise, null.
;;; Locals:
;;;   %G0: The device type to find (taken from parameter for convenience).
;;;   %G1: The instance of the given device type to find. (from parameter).
;;;   %G2: The current pointer into the device table.

_procedure_find_device:

	;; Prologue: Preserve the registers used on the stack.
	SUBUS		%SP		%SP		4
	COPY		*%SP		%G0
	SUBUS		%SP		%SP		4
	COPY		*%SP		%G1
	SUBUS		%SP		%SP		4
	COPY		*%SP		%G2
	SUBUS		%SP		%SP		4
	COPY		*%SP		%G4
	
	;; Initialize the locals.
	COPY		%G0		*%FP
	ADDUS		%G1		%FP		4
	COPY		%G1		*%G1
	COPY		%G2		*+_static_device_table_base
	
find_device_loop_top:

	;; End the search with failure if we've reached the end of the table without finding the device.

	BEQ	+find_device_loop_failure *%G2	0

	;; If this entry matches the device type we seek, then decrement the instance count.  If the instance count hits zero, then
	;; the search ends successfully.
	BNEQ		+find_device_continue_loop	*%G2		%G0
	SUB		%G1				%G1		1
	BEQ		+find_device_loop_success	%G1		0
	
find_device_continue_loop:	

	;; Advance to the next entry.
	ADDUS		%G2			%G2		*+_static_dt_entry_size
	JUMP		+find_device_loop_top

find_device_loop_failure:

	;; Set the return value to a null pointer.
	ADDUS		%G4			%FP		16 	; %G4 = &rv
	COPY		*%G4			0			; rv = null
	JUMP		+find_device_return

find_device_loop_success:

	;; Set the return pointer into the device table that currently points to the given iteration of the given type.
	ADDUS		%G4			%FP		16 	; %G4 = &rv
	COPY		*%G4			%G2			; rv = &dt[<device>]
	;; Fall through...
	
find_device_return:

	;; Epilogue: Restore preserved registers, then return.
	COPY		%G4		*%SP
	ADDUS		%SP		%SP		4
	COPY		%G2		*%SP
	ADDUS		%SP		%SP		4
	COPY		%G1		*%SP
	ADDUS		%SP		%SP		4
	COPY		%G0		*%SP
	ADDUS		%SP		%SP		4
	ADDUS		%G5		%FP		12 	; %G5 = &ra
	JUMP		*%G5
;;; ================================================================================================================================


	
null_interrupt:	HALT
	.Numeric


	_static_device_table_base: 	0x00001000
_static_dt_entry_size:		12
_static_dt_base_offset:		4
_static_dt_limit_offset:	8
_static_none_device_code:	0
_static_controller_device_code:	1
_static_ROM_device_code:	2
_static_RAM_device_code:	3
_static_console_device_code:	4


		;; Other constants.
_static_min_RAM_KB:		64
_static_bytes_per_KB:		1024
_static_KB_size:		32	; KB taken by the kernel.
x:	 00
y:	 00
newPortion:	0
img_count:	0

process_table:	00
curr_process:	00
kernel_end:	00
last_IP:	00
	
tt:	
invalid_address:	0000
invalid_register:	0000
bus_error:		0000
clock_alarm:		0000
divide_by_zero:		0000
overflow:		0000
invalid_instruction:	0000
permission_violation:	0000
invalid_shift_amount:	0000
system_call:		0000
int_buff:	0 0 
free_space_pointer:	0
