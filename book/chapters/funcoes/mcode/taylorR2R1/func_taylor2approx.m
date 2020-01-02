function F=func_taylor2approx(X,Y)
	F=zeros(size(X));
	N=numel(X);
	for II=1:N
    		F(II)=X(II)^2+Y(II)^2;
	endfor
end
