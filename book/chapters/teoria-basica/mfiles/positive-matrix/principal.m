%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;

AMP=2;

tx = ty = linspace (-AMP, AMP, 25)';
[xx, yy] = meshgrid (tx, ty);

A=[1  -8; 0   2];

zz=zeros(size(xx));
zz(:)=fun_positive_matrix2(xx(:),yy(:),A);


surfc(xx,yy,zz);
hz=zlabel('x^{T}Ax');
set(hz,'fontsize',DAT.FONTSIZE);
hx=xlabel('x_1');
set(hx,'fontsize',DAT.FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',DAT.FONTSIZE);
colormap(jet)
view([30, 20])
set(gca,'fontsize',DAT.FONTSIZE)
print(gcf,'surfcexAx.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
