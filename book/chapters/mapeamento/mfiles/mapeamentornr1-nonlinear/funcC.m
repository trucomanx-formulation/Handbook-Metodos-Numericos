function [C ERROR RCON]=funcC(P,Z,alpha,C0,NITER)

    ERROR=zeros(1,NITER);

    L=length(C0);
    C{1}=C0;

    FF=funcF(C{1},P);
    ERROR(1)=norm(FF-Z)^2;

    for II=2:NITER
    	JJ=funcJ(C{II-1},P);
	FF=funcF(C{II-1},P);

    	[INVERSA RCON]=inv(JJ'*JJ+alpha*eye(L));
    	C{II}=C{II-1}-INVERSA*JJ'*(FF-Z);

	ERROR(II)=norm(funcF(C{II},P)-Z)^2;
    endfor

endfunction
