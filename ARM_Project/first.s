     AREA     cos_fun, CODE, READONLY
     EXPORT cos
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
		 
		 
pi EQU	0x40490fdb
     ENTRY 
cos  FUNCTION	
; IGNORE THIS PART 	
		PUSH		{R4-R12,LR};
       VMOV.F32		S20,R0 ;Provide x to calculate ln(1+x)
	   	   VLDR.F32		S18, = 2;

	   LDR			R6,=pi
	   VMOV.F32		S6,R6
	   VMUL.F32		S6,S6,S18
gt_two_pi	   VCMP.F32		S20,S6
	   VMRS.F32		APSR_nzcv, FPSCR ;Copy Floating point status registers into normal status registers 
		BLT			iter_var
	   VSUB.F32		S20,S6
		B			gt_two_pi	   
iter_var	   LDR		R3, = 100 ; loop variable
	   VMUL.F32		S1,S20,S20 ;Copying x^2 to S1
	   VNMUL.F32	S2,S20,S20 ;Copying -x^2 to S2
	   VLDR.F32		S5,=1 ;The Value of ln(1+x) after each iterarion is stored in S5
	   VLDR.F32		S19, = 1;
	   VLDR.F32		S3, = 2	;


LOOP 	VDIV.F32		S4,S2,S18 ;
       VMOV.F32		S17,S5 	; Store previous iteration value to compare
	   VADD.F32		S5,S4   ; Calculate new iteration value
	   VCMP.F32		S17,S5	; Compare with previous iteration value
	   VMRS.F32		APSR_nzcv, FPSCR ;Copy Floating point status registers into normal status registers 
	   BEQ			stop   	; Stop if series converges(previous value equal to present value)
							; Even if counter in Not Zero
	   VADD.F32		S3,S19 	; Denominator Value
	   VMUL.F32		S18,S3	; Factorial
	   VADD.F32		S3,S19 	; Denominator Value
	   VMUL.F32		S18,S3	; Factorial
	   VNMUL.F32	S2,S1 	;
	   SUB			R3,#1
	   CMP			R3,#0	;compare if maimum iteration is reached 
	   BNE 			LOOP	;Goto Next iteration if maximum iteration is not reached
stop   VMOV.F32		R0,S5
		POP			{R4-R12,LR}
		BX LR
     ENDFUNC
     END 