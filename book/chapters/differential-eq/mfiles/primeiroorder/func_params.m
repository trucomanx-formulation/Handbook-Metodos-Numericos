function [a V  d]=func_params(P,x1,t)
	[V LAMBDA]=eig(P)
	a=diag(LAMBDA);


	d=inv(V*diag(exp(-a*t)))*x1;




endfunction
