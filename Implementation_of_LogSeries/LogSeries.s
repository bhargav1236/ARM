     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
       VLDR.F32		S20, = -0.5 ;Provide x to calculate ln(1+x) 
	   LDR		R3, = 105 ; loop variable
	   VMOV.F32		S1,S20 ;Copying x to S1
	   VNEG.F32		S2,S20 ;Copying -x to S2
	   VMOV.F32		S5,S20 ;The Value of ln(1+x) after each iterarion is stored in S5
	   VLDR.F32		S19, = 1;
	   VLDR.F32		S3, = 2	;
LOOP 	VDIV.F32		S4,S2,S3 ;
       VMOV.F32		S17,S5 	; Store previous iteration value to compare
	   VFMA.F32		S5,S1,S4 ;Calculate new iteration value
	   VCMP.F32		S17,S5	; Compare with previous iteration value
	   VMRS.F32		APSR_nzcv, FPSCR ;Copy Floating point status registers into normal status registers 
	   BEQ			STOP   	; Stop if series converges(previous value equal to present value)
							; Even if counter in Not Zero
	   VADD.F32		S3,S19 	; Denominator Value
	   VNMUL.F32	S2,S1 	;
	   SUB			R3,#1
	   CMP			R3,#0	;compare if maimum iteration is reached 
	   BNE 			LOOP	;Goto Next iteration if maximum iteration is not reached
STOP	   B STOP 
	   

     endfunc
     end
