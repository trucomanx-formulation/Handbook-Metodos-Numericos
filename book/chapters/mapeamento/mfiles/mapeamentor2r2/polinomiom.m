function [U V]=polinomiom(X,Y,C,D)

	if norm(size(X)-size(Y)) !=0 
		error('THe size of vector X and Y is not the same.')
	end

	if norm(size(C)-size(D)) !=0 
		error('THe size of vector C and D is not the same.')
	end

	if ~isvector(C)
		error('C is not a vector.')
	end

	if ~isvector(D)
		error('D is not a vector.')
	end

	U=hfunc(X,Y,C);
	V=hfunc(X,Y,D);

endfunction



