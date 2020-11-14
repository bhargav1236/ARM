     AREA     factorial, CODE, READONLY
     EXPORT dcteye
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
	 IMPORT cos
	 
		 
pi EQU	0x40490fdb
dct8by8		EQU		0x20000700
     ENTRY 
dcteye  FUNCTION	
; IGNORE THIS PART 	
			PUSH			{R4-R12,LR}
			
			LDR				R12,=dct8by8
			MOV				R4,#0		; i_loop incrementer
i_loop		MOV				R5,#0		; k_loop incrementer
k_loop		MOV				R7,#0		; n_loop incrementer
n_loop		CMP				R7,R4
			BEQ				compute
next		ADD				R7,#1
			CMP				R7,#8
			BNE				n_loop
			CMP				R5,#0
			VLDREQ.F32		S14,=8
			VLDRNE.F32		S14,=4
			VSQRT.F32		S14,S14
			VDIV.F32		S9,S14
					
	;		VCVT.S32.F32	S9,S9,#32
			VMOV			R0,S9
			VSTR.F32		S9,[R12]
			ADD				R12,#4
			BL				printMsg	
			VLDR.F32		S9,=0
			ADD				R5,#1
			CMP				R5,#8
			BNE				k_loop
			ADD				R4,#1
			CMP				R4,#8
			BNE				i_loop
		
			B 				stop ; stop program
	
		
compute		ADD			R10,R7,R7		; n+n=2n
		ADD				R10,#1			; 2n+1
		MUL				R10,R5			; (2n+1)*k
		VMOV.F32		S10,R10
		VCVT.F32.U32	S10,S10			; (2n+1)*k
		LDR				R10,=pi
		VMOV.F32		S12,R10
		VMUL.F32		S10,S12			; (2n+1)*k*pi
		MOV				R10,#16
		VMOV.F32		S12,R10
		VCVT.F32.U32	S12,S12
		VDIV.F32		S10,S12			; (2n+1)*k*pi/16
		VMOV.F32		R0,S10
		BL				cos
		VMOV.F32		S14,R0
		VADD.F32		S9,S14

		B				next			
stop	POP			{R4-R12,LR}
		BX			LR
		
     ENDFUNC
     END 