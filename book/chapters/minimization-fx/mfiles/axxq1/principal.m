%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=5;
B=[0.8;0.8;2.2];
alpha=0.5;
Q=[0;0];

tx = ty = linspace (0, 2, 25)';
[xx, yy] = meshgrid (tx, ty);
err=fune(xx,yy,B,alpha,Q);
figure(1)
surfc(xx,yy,err)
hz=zlabel('e(x)')
set(hz,'fontsize',FONTSIZE);
hx=xlabel('x_1')
set(hx,'fontsize',FONTSIZE);
hy=ylabel('x_2')
set(hy,'fontsize',FONTSIZE);
colormap(jet)
view([30, 20])
set(gca,'fontsize',FONTSIZE)
print(gcf,'surfcex.eps','-depsc',['-F:' num2str(FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	A=funa();
	[INVERSA RCOND]=inv(A'*A+alpha*eye(2));
	if(RCOND==0)
		error(['Not exist inverse matrix']);
	endif
	P=INVERSA*A'*B+alpha*Q
	
	ERR=fune(P(1),P(2),B,alpha,Q)

	F=funax(P);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




