     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
		; Greatest of three Numbers is stored in Register R4 at the end of program
       mov r1,#-10; Load first Number
	   mov r2,#-20;	Load Second Number
	   mov r3,#-3; Load Third Number
	   cmp r1,r2; 
	   bgt r1gt ; Branch to r1gt loop
	   ble r2gt; Branch to r2gt loop
	   
r1gt	cmp r1,r3;
		movgt r4,r1; R1 is Greatest Number
		movle r4,r3;  R3 is Greatest Number
		b stop;
		
r2gt 	cmp r2,r3;
		movgt r4,r2 ;  R2 is Greatest Number
		movle r4,r3;  R3 is Greatest Number
		b stop;
		
stop	b stop;
     ENDFUNC
     END
