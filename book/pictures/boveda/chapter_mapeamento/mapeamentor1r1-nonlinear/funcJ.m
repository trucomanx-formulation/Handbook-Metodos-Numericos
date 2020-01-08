function JJ=funcJ(C,X)
	N=length(X);
	L=length(C);
	JJ=zeros(N,L);
	for II=1:N
		JJ(II,:)=jfunc(C,X(II));
	endfor
endfunction
