function [U V]=polinomiom(X,Y,C,D)

	if norm(size(X)-size(Y)) !=0 
		error('THe size of vector X and Y is not the same.')
	end

	if norm(size(C)-size(D)) !=0 
		error('THe size of vector C and D is not the same.')
	end

	if ~isvector(C)
		error('C is not a vector.')
	end

	if ~isvector(D)
		error('D is not a vector.')
	end

	U=ffunc(X,Y,C);
	V=ffunc(X,Y,D);

endfunction


function OUT=ffunc(X,Y,K)
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
