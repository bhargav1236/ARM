     AREA     factorial, CODE, READONLY
     EXPORT __main
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
	 IMPORT	 encode
	 IMPORT	 decode
;	 IMPORT	 print_pixel
				
mul_out		EQU	0x20000800
mul2_out	EQU	0x20001800
dct8by8		EQU	0x20000700

     ENTRY 
__main  FUNCTION	
		BL		dcteye
	
	BL	encode
	BL	decode
;	BL	print_pixel

	LDR		R5,=mul2_out
	LDR		R6,=sample_size
	MOV		R7,#0
	
i_block_inc	ADD		R8,R5,R7

	LDR		R9,[R8]
	MOV		R0,R9
	BL		printMsg

	ADD		R7,#4		;
	CMP		R7,R6				;16 blocks of 8by8 in 32by32 image

	BNE		i_block_inc




	
	
STOP	   B STOP 

    endfunc
     end
