     AREA     factorial, CODE, READONLY
     EXPORT decode
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
	 IMPORT	 dequant
	 IMPORT	 dec_mat_mul1
	 IMPORT	 dec_mat_mul2
				
mul_out		EQU	0x20000800
mul2_out	EQU	0x20001800
dct8by8		EQU	0x20000700

     ENTRY 
decode  FUNCTION	
	PUSH	{LR}


	LDR		R0,=mul2_out ;starting address of dct
	LDR		R1,=mul2_out
	LDR		R2,=mul2_out
	MOV		R5,R0
	MOV		R6,R1
	MOV		R7,R2
	MOV		R8,#32
	MOV		R10,#0
	MOV		R11,#1024
dequant_i_block_inc	MOV		R9,#0
dequant_j_block_inc	MOV		R0,R5	;dct8by8_base address
	MLA		R0,R8,R9,R6		;sample_base_address+j*32
	MLA		R0,R11,R10,R0	;sample_base_address+j*32+i*1024

	BL		dequant
	ADD		R9,#1		;
	CMP		R9,#4				;16 blocks of 8by8 in 32by32 image
	BNE		dequant_j_block_inc
	ADD		R10,#1
	CMP		R10,#4
	BNE		dequant_i_block_inc



	LDR		R0,=dct8by8 ;starting address of dct
	LDR		R1,=mul2_out
	LDR		R2,=mul_out
	MOV		R5,R0
	MOV		R6,R1
	MOV		R7,R2
	MOV		R8,#32
	MOV		R10,#0
	MOV		R11,#1024
i_block_inc	MOV		R9,#0
j_block_inc	MOV		R0,R5	;dct8by8_base address
	MLA		R1,R8,R9,R6		;sample_base_address+j*32
	MLA		R1,R11,R10,R1	;sample_base_address+j*32+i*1024
	MLA		R2,R8,R9,R7		;mul_out+j*32
	MLA		R2,R11,R10,R2	;mul_out+j*32+i*1024

	BL		dec_mat_mul1
	ADD		R9,#1		;
	CMP		R9,#4				;16 blocks of 8by8 in 32by32 image
	BNE		j_block_inc
	ADD		R10,#1
	CMP		R10,#4
	BNE		i_block_inc



	LDR		R5,=dct8by8
	LDR		R6,=mul_out
	LDR		R7,=mul2_out
	MOV		R8,#32
	MOV		R10,#0
	MOV		R11,#1024
blk2_i_block_inc	MOV		R9,#0
blk2_j_block_inc	MOV		R1,R5	;idct8by8_base address
	MLA		R0,R8,R9,R6		;mul_out_baseaddress+j*32
	MLA		R0,R11,R10,R0	;mul_out_baseaddress+j*32+i*1024
	MLA		R2,R8,R9,R7		;mul2_out_baseaddress+j*32
	MLA		R2,R11,R10,R2	;mul2_out_baseaddress+j*32+i*1024

	BL		dec_mat_mul2
	ADD		R9,#1		;
	CMP		R9,#4				;16 blocks of 8by8 in 32by32 image
	BNE		blk2_j_block_inc
	ADD		R10,#1
	CMP		R10,#4
	BNE		blk2_i_block_inc

	POP 	{LR}



	
	

    endfunc
     end
