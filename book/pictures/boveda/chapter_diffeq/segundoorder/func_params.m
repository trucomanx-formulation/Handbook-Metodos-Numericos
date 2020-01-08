function [w V  d1 d2]=func_params(P,x1,dx1,t)
	[V LAMBDA]=eig(P);
	W=sqrt(LAMBDA);
	w=diag(W);
	W=diag(w);

	d1=zeros(size(x1));
	d2=zeros(size(x1));

	d=inv([ V*diag(cos(w*t)) V*diag(sin(w*t));
		-V*W*diag(sin(w*t)) V*W*diag(cos(w*t))])*[x1;dx1]
	d1=d(1:(length(d)/2))
	d2=d((1+length(d)/2):end)



endfunction
