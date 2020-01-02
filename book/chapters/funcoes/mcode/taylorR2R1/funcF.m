function F=funcF(X,Y)
	F=zeros(size(X));
	N=numel(X);
	for II=1:N
    		F(II)=1-exp(-X(II)^2-Y(II)^2);
	endfor
end
