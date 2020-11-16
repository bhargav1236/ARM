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

				
mul_out		EQU	0x20000800
mul2_out	EQU	0x20001800
dct8by8		EQU	0x20000700

     ENTRY 
__main  FUNCTION	
		BL		dcteye

	BL	encode
	BL	decode




	
	
STOP	   B STOP 

    endfunc
     end
