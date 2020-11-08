     AREA     factorial, CODE, READONLY
     EXPORT __main
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg3p
	 IMPORT printMsg4p
	 IMPORT Neural_Network
	 IMPORT sigmoid	 
     ENTRY 
__main  FUNCTION	
		;R0------> 	INPUT1
		;R1------>	INPUT2
		;R2------>	INPUT3
		;R3------>	Selects logic gate
		
		;load R3 with below values to get respctive logic gate truth table
		;0------->	OR GATE
		;1------->	AND GATE
		;2------->	NOT GATE
		;3------->	NAND GATE
		;4------->	NOR GATE
		;5------->	XNOR GATE
		;6------->	XOR GATE
		
		
		
		LDR		R3, =1 ;
		MOV 	R7,	R3
		
	 	MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		BL		printMsg3p
	 	MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, R7  ;Input to choose the logic to evaluate 
		BL 		Neural_Network
		
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		BL		printMsg3p
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, R7  ;Input to choose the logic to evaluate 		
		BL 		Neural_Network
		
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		BL		printMsg3p
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, R7   ;Input to choose the logic to evaluate 
		BL Neural_Network
		
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		BL		printMsg3p
		MOV		R0, #0	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, R7   ;Input to choose the logic to evaluate 	
		BL		Neural_Network
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		BL		printMsg3p
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, R7   ;Input to choose the logic to evaluate 
		BL 		Neural_Network
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		BL		printMsg3p
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #0  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, R7   ;Input to choose the logic to evaluate
		BL   	Neural_Network
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		BL		printMsg3p
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #0	;INPUT3(x3)
		MOV     R3, R7   ;Input to choose the logic to evaluate 
		BL 		Neural_Network
		
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		BL		printMsg3p
		MOV		R0, #1	;INPUT1(x1)
		MOV		R1, #1  ;INPUT2(x2)
		MOV		R2, #1	;INPUT3(x3)
		MOV     R3, R7   ;Input to choose the logic to evaluate 
		BL      Neural_Network

		
		
STOP	   B STOP 

    endfunc
     end
