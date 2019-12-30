function [U,V]=funcF(X,Y)
	U=zeros(size(X));
	V=zeros(size(Y));
	N=numel(X);
	for II=1:N
		%U(II)=Y(II)*(X(II)-1)/3;
		%V(II)=X(II)*(Y(II)-1)/3;
		U(II)=(X(II)^3+Y(II))/5;
		V(II)=(Y(II)^3+X(II))/5;
	endfor
endfunction
