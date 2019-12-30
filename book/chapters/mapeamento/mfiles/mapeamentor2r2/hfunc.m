function OUT=hfunc(X,Y,K)
	OUT=0*X;

	L=length(K);
	M=0;
	while ((M+1)*(M+2)/2)<L
		M=M+1;
	end

	for MM=0:M
	for LL=0:MM
		OUT=OUT+K(1+LL+MM*(MM+1)/2)*X.^(MM-LL).*Y.^(LL);
	endfor
	endfor

endfunction
