function err=fune(x,y,b)
	if(norm(length(x)-length(y)) ~= 0)
		error('The size of x and y are not equals.');
	endif

	L=numel(x);
	err=zeros(size(x));

	for LL=1:L
		err(LL)=norm(b-funax([x(LL) y(LL)]))^2;
	endfor
endfunction
