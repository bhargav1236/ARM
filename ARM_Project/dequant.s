    AREA     factorial, CODE, READONLY
     EXPORT dequant
     IMPORT printMsg
	 IMPORT printMsg2p
;	 IMPORT printMsg3p
	 IMPORT printMsg4p
 
	 IMPORT  sample
     IMPORT  sample_end
	 IMPORT  sample_size
	 IMPORT  quant_mat

     ENTRY 
dequant  FUNCTION	
	
	PUSH 	{R5-R11,LR}	;
	;idct is inverese of dct8by = transpose of dct8by8 so we will multiply each row of dct8by8 instead of column 
	;R0 ------> matrix a base address
	;R1 ------> matrix b base address
	;R2 ------> matrix c base address	
	;R3 ------> loop variable i
	;R4 ------> loop variable j
	;R5 ------> loop variable k
	

		
	
			MOV		R6,#4		; Address increment for accessing next row
			MOV		R7,#32		; (8*4) Address increment for for next column in case of 8by8 matrix
			MOV 	R8,#128		; (32*4) Address increment for next column in case of 32by32 matrix
			MOV		R3,#0		; loop varaible i=0
i_loop		MOV 		R4,#0	; loop variable j=0
j_loop		MOV 		R9,R0		; a_base_address
			MLA			R9,R4,R6,R9 ; a_base_address+j*4
			MLA			R9,R3,R8,R9 ; a_base_address+j*4+i*32*4
			LDR			R10,[R9]	; load data present in above address in R10
			VMOV.F32	S10,R10		; load data into floating point register
			VCVT.F32.S32	S10,S10
			
			LDR			R9,=quant_mat
			MLA			R9,R4,R6,R9	;quant_mat_base_address+j*4
			MLA			R9,R3,R7,R9 ;quant_mat_base_address+j*4+i*32
			VLDR.F32	S11,[R9]	;Q
			VCVT.F32.U32	S11,S11
			VMUL.F32	S10,S11		;G*Q
			MOV			R9,R0		; c_base_address		
			MLA			R9,R4,R6,R9 ; c_base_address+j*4
			MLA			R9,R3,R8,R9 ; c_base_address+j*4+i*32*4
;			VCVTR.S32.F32		S10,S10
			VMOV.F32	R10,S10
			STR			R10,[R9]	; store data present in R10 to address in R9
;			PUSH		{R0-R3}
;			MOV			R0,R9
;			VCVTR.S32.F32		S10,S10
;			VMOV.F32			R1,S10
;			BL			printMsg2p
;			POP			{R0-R3}
			ADD			R4,#1
			CMP			R4,#8
			BNE			j_loop
			ADD			R3,#1
			CMP			R3,#8
			BNE			i_loop
			
		
	POP		{R5-R11,LR}
	BX 		LR
		

    endfunc
     end