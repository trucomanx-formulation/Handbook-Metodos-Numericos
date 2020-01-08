function [U V W]=funmax(X,Y)
	U=zeros(size(X));
	V=zeros(size(X));
	W=zeros(size(X));

	NN=length(U(:));

	for II=1:NN
		b=funa()*[X(II);Y(II)];
		U(II)=b(1);
		V(II)=b(2);
		W(II)=b(3);
	end
endfunction
