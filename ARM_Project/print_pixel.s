     AREA     factorial, CODE, READONLY
     EXPORT print_pixel
     IMPORT printMsg
	 IMPORT printMsg2p
;	 IMPORT printMsg3p
	 IMPORT printMsg4p
	
	 IMPORT  mat_mul
	 IMPORT  mat_mul_block_by_idct
	 IMPORT  sample
     IMPORT  sample_end
	 IMPORT  sample_size
	 IMPORT	 dcteye
				
mul_out		EQU	0x20000800
mul2_out	EQU	0x20001800
dct8by8		EQU	0x20000700

     ENTRY 
print_pixel  FUNCTION	
	PUSH	{LR}
	

	LDR		R5,=mul2_out
	LDR		R6,=0x200027fc
	MOV		R7,#0
	
i_block_inc	ADD		R8,R5,R7

	LDR		R9,[R8]
	MOV		R0,R9
	ADD		R7,#4		;
	CMP		R7,R6				;16 blocks of 8by8 in 32by32 image

	BNE		i_block_inc


	BL		printMsg


	POP 	{LR}
	BX		LR


	
	

    endfunc
     end
