function JJ=funj(X)
	x=X(1);
	y=X(2);
	JJ=[(5*pi/2)*cos(x*5*pi/2) 0; ...
		0 (5*pi/2)*cos(y*5*pi/2); ...
		(y-1) (x-1)];

endfunction
