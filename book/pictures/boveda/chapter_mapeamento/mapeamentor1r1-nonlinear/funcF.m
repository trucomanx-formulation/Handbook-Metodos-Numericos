function FF=funcF(C,X)
	N=length(X);
	FF=zeros(N,1);
	for II=1:N
		FF(II)=hfunc(C,X(II));
	endfor
endfunction
