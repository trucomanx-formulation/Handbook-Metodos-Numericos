function b=funf(X)
	x=X(1);
	y=X(2);

	b=[ sin(x*5*pi/2); ...
	    sin(y*5*pi/2); ...
	   x*y-(x+y)];

endfunction
