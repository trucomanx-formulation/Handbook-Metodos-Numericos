%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=30;
DAT.LINEWIDTH=3;


function Y=func3(X)
    Y=0.5*(-0.2*(X+1).*(X-1).*(X-2).*(X-3)+3).^2;
endfunction

XX=linspace(0,4.0,100);
YY=func3(XX);

plot(	XX,YY,'-.',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH)
xlim([0 4])
ylim([0 10])
hold on
bar(	XX(1:4:end),YY(1:4:end))%, 'linewidth',DAT.LINEWIDTH)
%
X0=[XX(75)];Y0=[8.5];
%
XF=[XX(93)];YF=[YY(93)];
hq=quiver(X0,Y0,XF-X0,YF-Y0,'linewidth',DAT.LINEWIDTH);
set (hq, "maxheadsize", 0.03);
%
XF=[XX(65)];YF=[YY(65)];
hq=quiver(X0,Y0,XF-X0,YF-Y0,'linewidth',DAT.LINEWIDTH);
set (hq, "maxheadsize", 0.08);
%
XF=[XX(37)];YF=[YY(37)];
hq=quiver(X0,Y0,XF-X0,YF-Y0,'linewidth',DAT.LINEWIDTH);
set (hq, "maxheadsize", 0.08);
%
text (X0, Y0+0.8, "h'(x)=0","horizontalalignment","center", "fontsize", DAT.FONTSIZE);
hold off

hx=xlabel('x');
set (hx, "fontsize", DAT.FONTSIZE);
hy=ylabel('h(x)');
set (hy, "fontsize", DAT.FONTSIZE);

set (gca, "fontsize", DAT.FONTSIZE);
set (gca, 'linewidth',DAT.LINEWIDTH);

print(gcf,'logotipo.eps','-deps',['-F:' num2str(DAT.FONTSIZE)])
