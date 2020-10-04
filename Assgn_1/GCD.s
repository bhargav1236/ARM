     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
       mov r1,#5;
	   mov r2,#8;
start	cmp r1,r2;
	    bne loop
stop b stop;

loop	subgt r1,r1,r2;
		sublt r2,r2,r1;
		b start;
		

     ENDFUNC
     END
