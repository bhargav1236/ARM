     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
		MOV R0, #0x0A; INPUT count value for series
        MOV R1, #0x00 ; load first Number
        MOV R2, #0x01 ; load second Number
LOOP	CMP R0, #0x00 ; proceed till count value is reached
        MOVGT R3,R2   ; store second Number in temp variable
		ADDGT R2,R2,R1 ; Add first and second number and make it second Number
		MOVGT R1,R3    ; Make the temp Variable as first number
		SUBGT R0,R0,#0x01;
		BGT LOOP
STOP 	B STOP
		
     ENDFUNC
     END
