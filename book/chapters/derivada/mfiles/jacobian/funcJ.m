function [JL1,JL2]=funcJ(X,Y)

	%JL1=[(Y-1)/3   X/3];
	%JL2=[Y/3      (X-1)/3];
	JL1=[(3/5)*X^2  1/5];
	JL2=[1/5        (3/5)*Y^2];
	
endfunction
