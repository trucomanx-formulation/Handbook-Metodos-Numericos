function A=funcA(X,M)
	N=length(X);
	A=zeros(N,M+1);
	for II=1:N
		AA=1;
		for JJ=1:M
			AA=[AA X(II)^JJ];
		endfor
		A(II,:)=AA;
	endfor
endfunction
