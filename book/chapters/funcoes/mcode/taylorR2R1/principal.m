%
DAT.MARKERSIZE=10;
DAT.FONTSIZE=20;
DAT.LINEWIDTH=1.5;

AMP=2;

tx = ty = linspace (-AMP, AMP, 25)';
[XX, YY] = meshgrid (tx, ty);
FF=funcF(XX,YY);

tx = ty = linspace (-1,1, 25)';
[xx, yy] = meshgrid (tx, ty);
zz2=func_taylor2approx(xx,yy);

h1=figure(1);
mesh(XX,YY,FF);
view([-13.4 25.6])
colormap(jet)
hl=legend('f(x)');
set(hl,'location', 'eastoutside');
set(hl,'fontsize',DAT.FONTSIZE);

hold on 
surf(xx,yy,zz2);
hx=xlabel('x_1');
set(hx,'fontsize',DAT.FONTSIZE);
hy=ylabel('x_2');
set(hy,'fontsize',DAT.FONTSIZE);
hl2=legend('f(x)','f_2(x)');
set(hl2,'location', 'eastoutside');
set(hl2,'fontsize',DAT.FONTSIZE);
hold off


%ylim([-1.5 1.5])
%daspect([2 0.8 1])
set(gca,'fontsize',DAT.FONTSIZE)

print(h1,'taylorf.eps','-depsc','-tight',['-F:' num2str(DAT.FONTSIZE)])
