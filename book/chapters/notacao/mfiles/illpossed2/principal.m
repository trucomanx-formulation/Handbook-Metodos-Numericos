%
MARKERSIZE=12;
FONTSIZE=28;
LINEWIDTH=2;
B=[2;2;2];

alpha=1.0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


	A=funa();
	[INVERSA RCOND]=inv(A'*A+alpha*eye(2));
	if(RCOND==0)
		error(['Not exist inverse matrix']);
	endif
	Xo=INVERSA*A'*B

    Xo2=zeros(length(Xo),7);
    Xo2(:,1)=Xo;
    Xo2(:,2)=INVERSA*(A'*B+alpha*Xo2(:,1));
    Xo2(:,3)=INVERSA*(A'*B+alpha*Xo2(:,2));
    Xo2(:,4)=INVERSA*(A'*B+alpha*Xo2(:,3));
    Xo2(:,5)=INVERSA*(A'*B+alpha*Xo2(:,4));
    Xo2(:,6)=INVERSA*(A'*B+alpha*Xo2(:,5));
    Xo2(:,7)=INVERSA*(A'*B+alpha*Xo2(:,6));
    Xo2

	Bh=funax(Xo)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1=linspace(0,2,10);
x2=B(1)-x1;
x1b=linspace(0,norm(Xo),200);
x2b=sqrt(norm(Xo)^2-x1b.^2);
figure(1)
plot(   x1,x2,'--','linewidth',LINEWIDTH, ...
        x1b,x2b,'-','linewidth',LINEWIDTH)
daspect([1 1 1])
hx1=xlabel('x_1');
set(hx1,'fontsize',FONTSIZE);
hx2=ylabel('x_2');
set(hx2,'fontsize',FONTSIZE);
hl=legend('x_1+x_2=2','x_1^2+x_2^2=||x_o||^2')
set(hl,'fontsize',FONTSIZE);
set(hl,'linewidth',LINEWIDTH)
hold on
scatter(Xo(1),Xo(2),160,'MarkerFaceColor',[1 0 0],'filled','linewidth',LINEWIDTH)
hold off
set(gca,'fontsize',FONTSIZE)
set(gca,'linewidth',LINEWIDTH)
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
hy1=xlabel('y_1');
set(hy1,'fontsize',FONTSIZE);
hy2=ylabel('y_2');
set(hy2,'fontsize',FONTSIZE);
hy3=zlabel('y_3');
set(hy3,'fontsize',FONTSIZE);
daspect([1 1 1])
colormap(gray)
view([-38.625, 14.626])
ht=text (B(1)-1,B(2)+2, B(3), ['y=[' num2str(B(1)) ';' num2str(B(2)) ';' num2str(B(3)) ']']);
set(ht,'fontsize',FONTSIZE);
set(ht, 'Color', 'red');
set(gca,'fontsize',FONTSIZE)
hold on
scatter3(B(1),B(2),B(3),160,'MarkerFaceColor',[1 0 0],'filled','linewidth',LINEWIDTH)
hold off
%hold on
%hq=quiver3(B(1),B(2),B(3),Bh(1)-B(1),Bh(2)-B(2),Bh(3)-B(3),'linewidth',LINEWIDTH);
%set(hq, 'Color', 'black');
%hold off

%TEXTO=['y_o=[' num2str(round(10*Bh(1))/10) ';' num2str(round(10*Bh(2))/10) ';' num2str(round(10*Bh(3))/10) ']'];
%ht2=text(   Bh(1),Bh(2)-0.5, Bh(3), TEXTO);
TEXTO=['y_o= [' num2str(round(10*Bh(1))/10) ';' ];
ht2=text(   Bh(1),Bh(2)-0.5, Bh(3), TEXTO);
set(ht2,'fontsize',FONTSIZE);
set(ht2, 'Color', 'blue');
TEXTO=[num2str(round(10*Bh(2))/10) ';' ];
ht2=text(   Bh(1)+0.5,Bh(2)-1.2, Bh(3)-0.5, TEXTO);
set(ht2,'fontsize',FONTSIZE);
set(ht2, 'Color', 'blue');
TEXTO=[num2str(round(10*Bh(3))/10) ']'];
ht2=text(   Bh(1)+0.1,Bh(2)-1.7, Bh(3)-1.0, TEXTO);
set(ht2,'fontsize',FONTSIZE);
set(ht2, 'Color', 'blue');
hold on
scatter3(Bh(1),Bh(2),Bh(3),160,'MarkerFaceColor',[0 0 1],'filled','linewidth',LINEWIDTH)
hold off

print(gcf,'surfcax.eps','-depsc','-tight',['-F:' num2str(FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AMPx1=1.0;
AMPx2=1.0;
tx1 = linspace (0,1+AMPx1, 10)';
tx2 = linspace (0,1+AMPx2, 10)';
[xx1, xx2] = meshgrid (tx1, tx2);
err=fune(xx1,xx2,B);
figure(3)
surf(xx1,xx2,err)
hold on
contour(xx1,xx2,err,'linewidth',LINEWIDTH)
hold off
hz=zlabel('||Ax-y_{\delta}||');
set(hz,'fontsize',FONTSIZE);
hx1=xlabel('x_1');
set(hx1,'fontsize',FONTSIZE);
hx2=ylabel('x_2');
set(hx2,'fontsize',FONTSIZE);
colormap(jet)
view([48.672, 20.972])
hold on
scatter3(Xo(1),Xo(2),fune(Xo(1),Xo(2),B),240,'MarkerFaceColor',[1 0 0],'filled','linewidth',LINEWIDTH)
TEXTO=['x_{o}'];%=[' num2str(round(Xo(1)*100)/100) ';' num2str(round(Xo(2)*100)/100)  ']'];
ht2=text(   Xo(1),Xo(2), 5.0, TEXTO);
set(ht2,'fontsize',FONTSIZE);
set(ht2, 'Color', 'red');
line([0;2],[2;0],[0;0],'linewidth',LINEWIDTH)
hold off
set(gca,'fontsize',FONTSIZE);
%set(gca,'linewidth',LINEWIDTH)
print(gcf,'surfcaxyd.eps','-depsc',['-F:' num2str(FONTSIZE)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AMPx1=1.0;
AMPx2=1.0;
tx1 = linspace (0,1+AMPx1, 10)';
tx2 = linspace (0,1+AMPx2, 10)';
[xx1, xx2] = meshgrid (tx1, tx2);
err=fune(xx1,xx2,B)+xx1.^2+xx2.^2;
figure(4)
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
view([48.672, 20.972])
hold on
scatter3(Xo(1),Xo(2),fune(Xo(1),Xo(2),B)+Xo(1)^2+Xo(2)^2,240,'MarkerFaceColor',[1 0 0],'filled','linewidth',LINEWIDTH)
TEXTO=['x_{o}'];%=[' num2str(round(Xo(1)*100)/100) ';' num2str(round(Xo(2)*100)/100)  ']'];
ht2=text(   Xo(1),Xo(2)-0.25, 10.0, TEXTO);
set(ht2,'fontsize',FONTSIZE);
set(ht2, 'Color', 'red');
hold off
set(gca,'fontsize',FONTSIZE);
%set(gca,'linewidth',LINEWIDTH)
print(gcf,'surfcex.eps','-depsc',['-F:' num2str(FONTSIZE)])
