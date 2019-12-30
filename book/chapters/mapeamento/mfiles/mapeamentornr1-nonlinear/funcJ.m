function JJ=funcJ(C,P)
	N=size(P,1);	L=length(C);
	JJ=zeros(N,L);
	for II=1:N
		JJ(II,:)=jfunc(C,P(II,:));
	endfor
endfunction
