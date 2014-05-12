#create a page table for the kernel to correlate the physical address space
#to paged space

#What is the proper name for the memory allocater procedure in the kernel we are using
procedure extern 4 mem_alloc(4 x)

#Same question for this procedure
procedure extern 4 find_device(4 x 
	  	 	       4 y)

procedure 0 pageKernel()
	  	     [4 RAMlim
		      4 UPbase
		      4 LPbase	
		      4 LPlim
		      4 num]

{


	(= &UPbase (mem_alloc 1024))
	(= &LPbase (mem_alloc 1024))


	#Store the pointer to the kernel's upper page table in the statics
	#(and lower page table, for convenient access for other processes)in the statics
	asm("	SUBUS	%FP	%FP 8
		COPY  *+kernel_Upper_Page_Table *%FP#put these in kernel as statics
		SUBUS	%FP	%FP 4
		COPY  *+kernel_Lower_Page_Table	*%FP
		ADDUS	%FP	%FP 12
		COPY *+x	%G0
		COPY %G0 *+kernel_Upper_Page_Table
		COPY *%G0 *+kernel_Lower_Page_Table
		COPY %G0  *+x") 

	(= *(4)UPbase LPbase)

	(= &LPlim (+ LPbase 1024))#limit
	
	#Initialize num to 
	(= &num 0x0000000011111)#meta12 mapped resident r/w k r/w proc rtol

	while((< LPbase LPlim)){ #through lpt, 0 and 12 into so 1,12 2,12 

		(= &LPbase num)
		(= &num (+ num 0x1000))
		(= &LPbase (+ LPbase 4))	
	
	}
#Does setting the page table register automatically begin paging, or do we need to jump modes somehow?

asm("SUBUS %FP %FP 8 #UPbase off stack
     SETPTR  *%FP
     JUMPMD +jump c #Turn on paging and virtual addressing
jump: ADDUS %FP %FP 8")

}
