%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=1.5;

AMP=2;

[XX,YY] = meshgrid(linspace(-AMP,AMP,32));
ZZ = XX.*exp(-XX.^2 - YY.^2);

[X,Y] = meshgrid(linspace(-AMP,AMP,16));
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,4,4);


contour(XX,YY,ZZ,'linewidth',DAT.LINEWIDTH);
colormap(jet)
hold on
h1=quiver(X,Y,DX,DY,'linewidth',1.5*DAT.LINEWIDTH);
set(h1,'AutoScale','on', 'AutoScaleFactor', 1)
hold off
colormap(jet)
hx=xlabel('x_1');
set(hx,'fontsize',DAT.FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',DAT.FONTSIZE);
colormap(jet)
%view([30, 20])
set(gca,'fontsize',DAT.FONTSIZE)
print(gcf,'gradient.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
%% subplot(1,2,1);
%% surface(X,Y,Z);
%% view(-20,10);
%% subplot(1,2,2);
%% contour(X,Y,Z);
%% hold on
%% quiver(X,Y,DX,DY);
%% colormap hsv
%% hold off
