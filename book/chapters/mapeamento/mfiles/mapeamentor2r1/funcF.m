function FF=funcF(C,X,Y)
	N=length(X);
	FF=zeros(N,1);
	for II=1:N
		FF(II)=hfunc(C,X(II),Y(II));
	endfor
endfunction
