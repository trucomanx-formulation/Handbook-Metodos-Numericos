%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=5;

tx = ty = linspace (-3, 3, 25)';
[xx, yy] = meshgrid (tx, ty);
zz=peaks(xx,yy);
figure(1)
surfc(xx,yy,zz)
hz=zlabel('e(x)');
set(hz,'fontsize',FONTSIZE);
hx=xlabel('x_1');
set(hx,'fontsize',FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',FONTSIZE);
colormap(jet)
view([30, 20])
set(gca,'fontsize',FONTSIZE)
print(gcf,'peaks.svg','-dsvg',['-F:' num2str(FONTSIZE)])
