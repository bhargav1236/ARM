    AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
        MOV R2,#0x100 ; 
        MOV R7,#0x100 ;  
        MOV R4,#0x05 ; 
	CMP R2,R7 ; 
	ITTE NE    ; 
	SUBNE R2,R2,R7 ;
	MOVNE R2,#0    ; 
	ADDEQ R2,R2,R4 ; 
	MOVEQ R4,#0   ; 
		
stop    B stop ; stop program
		 
     ENDFUNC
     END
