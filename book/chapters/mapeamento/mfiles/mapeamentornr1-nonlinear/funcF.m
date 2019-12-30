function FF=funcF(C,P)
	N=size(P,1);
	FF=zeros(N,1);
	for II=1:N
		FF(II)=hfunc(C,P(II,:));
	endfor
endfunction
