;;; A very simple program that writes something simple to the console.  Also a first attempt to use the .Text mode.

	.Code

	;; Search for the console.
	;; Start the search at the beginning of the device table.
	COPY		%G0		*+device_table_base
	
search_loop_top:

	;; End the search with failure if we've reached the end of the table without finding the console.
	BEQ		+search_loop_failure	*%G0		*+none_device_code

	;; Is this entry the console?
	BNEQ		+console_not_found	*%G0		*+console_device_code

	;; Yes, this is the console.  Grab the base address and skip to copying the message into it.
	ADDUS		%G0		%G0		*+dt_base_offset
	COPY		%G1		*%G0
	JUMP		+copy_message

console_not_found:
	
	;; No, this is not the console.  Advance to the next entry.
	ADDUS		%G0		%G0		*+dt_entry_size
	JUMP		+search_loop_top

copy_message:

	;; Copy the message, byte by byte, into the console.
	COPY		%G0		+message

copy_loop_top:

	COPYB		%G2		*%G0
	BEQ		+copy_loop_end	%G2		0 ; If this is the null character, end the copying.
	COPYB		*%G1		%G2		  ; Copy the current byte.
	ADDUS		%G0		%G0		1 ; Next byte of the message.
	ADDUS		%G1		%G1		1 ; Next byte of the console.
	JUMP		+copy_loop_top
	
copy_loop_end:	
search_loop_failure:	
end:
	HALT

	.Numeric

device_table_base:	0x00001000
dt_entry_size:		12
dt_base_offset:		4
dt_limit_offset:	8
console_device_code:	4
none_device_code:	0
	
	.Text

message:	"Ahoy ahoy!"
	