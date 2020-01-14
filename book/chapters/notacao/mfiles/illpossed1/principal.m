%
MARKERSIZE=12;
FONTSIZE=28;
LINEWIDTH=2;
B=[2;3;2];




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	A=funa();
	[INVERSA RCOND]=inv(A'*A);
	if(RCOND==0)
		error(['Not exist inverse matrix']);
	endif
	P=INVERSA*A'*B
	

	Bh=funax(P)

	Ep=funax(P)-B

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AMPx1=1;
AMPx2=3;
tx1 = linspace (0,AMPx1, 4)';
tx2 = linspace (0,AMPx2, 10)';
[xx1, xx2] = meshgrid (tx1, tx2);

[U V W]=funmax(xx1,xx2);
figure(2)
surf(U,V,W)
hx=xlabel('y_1');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('y_2');
set(hy,'fontsize',FONTSIZE);
hz=zlabel('y_3');
set(hz,'fontsize',FONTSIZE);
daspect([1 1 1])
colormap(jet)
view([-38.625, 14.626])
ht=text (B(1)-1,B(2), B(3), ['y_{\delta}']);%=[' num2str(B(1)) ';' num2str(B(2)) ';' num2str(B(3)) ']']);
set(ht,'fontsize',FONTSIZE);
set(gca,'fontsize',FONTSIZE)
%set(gca,'linewidth',LINEWIDTH)
hold on
scatter3(B(1),B(2),B(3),160,'MarkerFaceColor',[0 0 0],'filled','linewidth',LINEWIDTH)
scatter3(Bh(1),Bh(2),Bh(3),160,'MarkerFaceColor',[0 0 0],'filled','linewidth',LINEWIDTH)
hold off
hold on
hq=quiver3(B(1),B(2),B(3),Bh(1)-B(1),Bh(2)-B(2),Bh(3)-B(3),'linewidth',LINEWIDTH);
set(hq, 'Color', 'black');
hold off

%TEXTO=['y_o=[' num2str(round(10*Bh(1))/10) ';' num2str(round(10*Bh(2))/10) ';' num2str(round(10*Bh(3))/10) ']'];
%ht2=text(   Bh(1),Bh(2)-0.5, Bh(3), TEXTO);
TEXTO=['y_o'];%= [' num2str(round(10*Bh(1))/10) ';' ];
ht2=text(   Bh(1),Bh(2)-0.5, Bh(3), TEXTO);
set(ht2,'fontsize',FONTSIZE);
%TEXTO=[num2str(round(10*Bh(2))/10) ';' ];
%ht2=text(   Bh(1)+0.5,Bh(2)-1.2, Bh(3)-0.5, TEXTO);
%set(ht2,'fontsize',FONTSIZE);
%TEXTO=[num2str(round(10*Bh(3))/10) ']'];
%ht2=text(   Bh(1)+0.1,Bh(2)-1.7, Bh(3)-1.0, TEXTO);
%set(ht2,'fontsize',FONTSIZE);

print(gcf,'surfcax.eps','-depsc','-tight',['-F:' num2str(FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AMPx1=2;
AMPx2=2;
tx1 = linspace (P(1)-AMPx1,P(1)+AMPx1, 10)';
tx2 = linspace (P(2)-AMPx2,P(2)+AMPx2, 10)';
[xx1, xx2] = meshgrid (tx1, tx2);
err=fune(xx1,xx2,B);
figure(3)
surf(xx1,xx2,err)
hold on
contour(xx1,xx2,err,'linewidth',LINEWIDTH)
hold off
hz=zlabel('e(x)');
set(hz,'fontsize',FONTSIZE);
hx1=xlabel('x_1');
set(hx1,'fontsize',FONTSIZE);
hx2=ylabel('x_2');
set(hx2,'fontsize',FONTSIZE);
colormap(jet)
TEXTO=['x_{o}'];%=[' num2str(round(P(1)*100)/100) ';' num2str(round(P(2)*100)/100)  ']'];
ht2=text(   P(1),P(2), +25.0, TEXTO);
set(ht2,'fontsize',FONTSIZE);
set(ht2, 'Color', 'red');

view([ 36.622, 13.491])
hold on
scatter3(P(1),P(2),fune(P(1),P(2),B),320,'MarkerFaceColor',[1 0 0],'filled','linewidth',LINEWIDTH)
hold off
set(gca,'fontsize',FONTSIZE)
%set(gca,'linewidth',LINEWIDTH)
print(gcf,'surfcex.eps','-depsc',['-F:' num2str(FONTSIZE)])




