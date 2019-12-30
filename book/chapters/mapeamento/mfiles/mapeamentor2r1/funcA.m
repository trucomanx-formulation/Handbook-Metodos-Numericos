function A=funcA(X,Y,M)
	N=length(X);
	A=zeros(N,(M+1)*(M+2)/2);
	for II=1:N
		A(II,:)=afunc(X(II),Y(II),M);
	endfor
endfunction
