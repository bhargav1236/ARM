     AREA     factorial, CODE, READONLY
     EXPORT Neural_Network
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
	 IMPORT sigmoid
     ENTRY 
Neural_Network  FUNCTION	
		;R0------> 	INPUT1
		;R1------>	INPUT2
		;R2------>	INPUT3
		;R3------>	Selects logic gate


		PUSH	{R5-R7,LR};
		
		MOV 	R5,R3
		
		CMP		R5,#0
		BNE		logic_and
logic_or		LDR		R9, =2	;W1
		LDR		R10,=2	;W2
		LDR		R8,=2	;W0		
		LDR		R11,=1	;BIAS
		LDR		R12,=-1;W3
		B		compute
		
logic_and	CMP		R5,#1
		BNE		logic_not		
		LDR		R9, =2	;W1
		LDR		R10,=2	;W2
		LDR		R8,=2	;W0				
		LDR		R11,=1	;BIAS
		LDR		R12,=-5;W3
		B		compute
		
logic_not		CMP		R5,#2
		BNE		logic_nand
		LDR		R9, =0	;W1
		LDR		R10,=0	;W2
		LDR		R8,=-3	;W0		
		LDR		R11,=1	;BIAS
		LDR		R12,=2;W3
		B		compute

logic_nand		CMP		R5,#3
		BNE		logic_nor
		LDR		R9, =-2	;W1
		LDR		R10,=-2	;W2
		LDR		R8,=-2	;W0		
		LDR		R11,=1	;BIAS
		LDR		R12,=5;W3
		B		compute

logic_nor		CMP		R5,#4
		BNE		logic_xnor
		LDR		R9, =-2	;W1
		LDR		R10,=-2	;W2
		LDR		R8,=-2	;W0		
		LDR		R11,=1	;BIAS
		LDR		R12,=1;W3
		B		compute
		
logic_xnor		CMP R5,#5
		BNE		logic_xor
		LDR		R9, =-2	;W1
		LDR		R10,=-2	;W2
		LDR		R8,=-2	;W0		
		LDR		R11,=1	;BIAS
		LDR		R12,=3  ;W3
		B		compute

logic_xor		CMP R5,#6
	;	BNE		
		LDR		R9, =-2	;W1
		LDR		R10,=-2	;W2
		LDR		R8,=-2	;W0		
		LDR		R11,=1	;BIAS
		LDR		R12,=3  ;W3
		B		compute

	
compute	MLA		R6,R0,R8,R6
		MLA		R6,R1,R9,R6
		MLA 	R6,R2,R10,R6
		MLA		R6,R11,R12,R6 ;R6=W0*X0+W1*X1+W2*X2+W3*BIAS
		MOV		R0,R6
		BL		sigmoid
		POP		{R5-R7,LR};
		BX		LR

    endfunc
     end
