function [C ERROR RCON]=funcC(X,Y,alpha,C0,NITER)

    ERROR=zeros(1,NITER);

    L=length(C0);
    C{1}=C0;

    FF=funcF(C{1},X);
    ERROR(1)=norm(FF-Y)^2;

    for II=2:NITER
    	JJ=funcJ(C{II-1},X);
	FF=funcF(C{II-1},X);

    	[INVERSA RCON]=inv(JJ'*JJ+alpha*eye(L));
    	C{II}=C{II-1}-INVERSA*JJ'*(FF-Y);

	ERROR(II)=norm(funcF(C{II},X)-Y)^2;
    endfor

endfunction
