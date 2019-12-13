function derr=funde(x,y,b,alpha,q)
	if(norm(size(x)-size(y)) ~= 0)
		error('The size of x and y are not equals.');
	endif

	L=numel(x);
	derr=cell(size(x));

	for LL=1:L
		X=[x(LL);y(LL)];
        	JJ=funj(X);
        	F=funf(X);
		derr{LL}=2*JJ'*(F-b)+2*alpha*(X-q);
	endfor
endfunction
