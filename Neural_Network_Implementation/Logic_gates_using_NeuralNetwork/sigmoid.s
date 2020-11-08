     AREA     factorial, CODE, READONLY
     EXPORT sigmoid
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
	 IMPORT Neural_Network
     ENTRY 
sigmoid	FUNCTION
	   PUSH		{R5-R7,LR};
       VMOV.F32		S21,R0 ;Provide x to calculate ln(1+x) 
	   VCVT.F32.S32	S20,S21
	   LDR		R3, = 10000 ; loop variable
	   VMOV.F32		S1,S20 ;Copying x to S1
	   VNEG.F32		S2,S20 ;Copying -x to S2
	   VLDR.F32		S5,=2 ;The Value of ln(1+x) after each iterarion is stored in S5
	   VLDR.F32		S19, = 1;
	   VLDR.F32		S18, = 1;
	   VLDR.F32		S16, = 0.0625;
	   
	   VLDR.F32		S3, = 1	;
LOOP 	VDIV.F32		S4,S2,S18 ;
       VMOV.F32		S17,S5 	; Store previous iteration value to compare
	   VADD.F32		S5,S4   ; Calculate new iteration value
	   VCMP.F32		S17,S5	; Compare with previous iteration value
	   VMRS.F32		APSR_nzcv, FPSCR ;Copy Floating point status registers into normal status registers 
	   BEQ			final   	; Stop if series converges(previous value equal to present value)
							; Even if counter in Not Zero
	   VADD.F32		S3,S19 	; Denominator Value
	   VMUL.F32		S18,S3	; Factorial
	   VNMUL.F32	S2,S1 	;
	   SUB			R3,#1
	   CMP			R3,#0	;compare if maimum iteration is reached 
	   BNE 			LOOP	;Goto Next iteration if maximum iteration is not reached
final	VDIV.F32		S5,S19,S5 ; Computing [1/(1+e^-x)]
		VCVTR.U32.F32	S5,S5
		VMOV			R0, D2[1];
		BL 		printMsg;
		POP		{R5-R7,LR};
		BX		LR

    endfunc
     end
