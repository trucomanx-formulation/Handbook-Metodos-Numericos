function err=fune(x,y,b,alpha,q)
	if(norm(length(x)-length(y)) ~= 0)
		error('The size of x and y are not equals.');
	endif

	L=numel(x);
	err=zeros(size(x));

	for LL=1:L
		err(LL)=norm(b-funax([x(LL);y(LL)]))^2+alpha*norm([x(LL);y(LL)]-q)^2;
	endfor
endfunction
