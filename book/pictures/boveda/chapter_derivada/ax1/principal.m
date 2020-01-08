%
MARKERSIZE=12;
FONTSIZE=28;
LINEWIDTH=2.5;
AMP=2;

B=[0.5;0.5;3];

tx = ty = linspace (0, AMP, 6)';
[xx, yy] = meshgrid (tx, ty);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	A=funa();
	[INVERSA RCOND]=inv(A'*A);
	if(RCOND==0)
		error(['Not exist inverse matrix']);
	endif
	P=INVERSA*A'*B
	F=funax(P);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[U V W]=funmax(xx,yy);
figure(2)
surfc(U,V,W,'linewidth',LINEWIDTH)
hx=xlabel('x_1');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',FONTSIZE);
hz=zlabel('Ax');
set(hz,'fontsize',FONTSIZE);
daspect([1 1 1])
colormap(jet)
view([30, 20])

%hold on
%scatter3(B(1),B(2),B(3),'MarkerFaceColor',[0.75 0 0],'filled','linewidth',LINEWIDTH)
%colormap(jet)
%hold off
hold on
hq=quiver3(F(1),F(2),F(3),-F(1)+B(1),-F(2)+B(2),-F(3)+B(3),'linewidth',3*LINEWIDTH)
set (hq, "maxheadsize", 0.3)
hold off

set(gca,'XTick',0:1:AMP);
set(gca,'YTick',0:1:AMP);
set(gca,'fontsize',FONTSIZE)
set(gca,'linewidth',LINEWIDTH)

print(gcf,'surfcax.eps','-deps','-tight',['-F:' num2str(FONTSIZE)])



