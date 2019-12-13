%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=5;
B=[0.8;0.8;2.2];

tx = ty = linspace (0, 2, 25)';
[xx, yy] = meshgrid (tx, ty);
err=fune(xx,yy,B);
figure(1)
surfc(xx,yy,err)
hz=zlabel('e(x)');
set(hz,'fontsize',FONTSIZE);
hx=xlabel('x_1');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',FONTSIZE);
colormap(jet)
view([30, 20])
set(gca,'fontsize',FONTSIZE)
print(gcf,'surfcex.eps','-depsc',['-F:' num2str(FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	A=funa();
	[INVERSA RCOND]=inv(A'*A);
	if(RCOND==0)
		error(['Not exist inverse matrix']);
	endif
	P=INVERSA*A'*B
	
	ERR=fune(P(1),P(2),B)

	F=funax(P);

	Ep=funax(P)-B

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[U V W]=funmax(xx,yy);
figure(2)
surfc(U,V,W)
hx=xlabel('x_1');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',FONTSIZE);
hz=zlabel('Ax');
set(hz,'fontsize',FONTSIZE);
daspect([1 1 1])
colormap(jet)
view([30, 20])
set(gca,'XTick',0:1:2);
set(gca,'YTick',0:1:2);
set(gca,'fontsize',FONTSIZE)
hold on
scatter3(B(1),B(2),B(3),'MarkerFaceColor',[0.75 0 0],'filled','linewidth',LINEWIDTH)
colormap(jet)
hold off
hold on
quiver3(B(1),B(2),B(3),F(1)-B(1),F(2)-B(2),F(3)-B(3),'linewidth',LINEWIDTH)
hold off
print(gcf,'surfcax.eps','-depsc','-tight',['-F:' num2str(FONTSIZE)])



