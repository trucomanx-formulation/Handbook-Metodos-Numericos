%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=28;
DAT.LINEWIDTH=2.5;

AMP=2;

[XX,YY] = meshgrid(linspace(-AMP,AMP,48));
ZZ = XX.*exp(-XX.^2 - YY.^2);

[X,Y] = meshgrid(linspace(-AMP,AMP,12));
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,4,4);


contour(XX,YY,ZZ,-0.5:0.025:0.5,'linewidth',DAT.LINEWIDTH);
colormap(jet)
hold on
h1=quiver(X,Y,DX,DY,'linewidth',DAT.LINEWIDTH);
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
set(gca,'linewidth',DAT.LINEWIDTH)
print(gcf,'gradient.eps','-deps',['-F:' num2str(DAT.FONTSIZE)])

