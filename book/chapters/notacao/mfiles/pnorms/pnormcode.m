%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=3;
function y=yfrompnorma(p,x)
    y=(1-abs(x).^(p)).^(1/p);

endfunction

L=128;
X=linspace(-1,1,L);
Xr=linspace(1,-1,L);
Y1=yfrompnorma(1,X);
Y2=yfrompnorma(2,X);
Y4=yfrompnorma(4,X);
YI=yfrompnorma(inf,X);

plot(   [X Xr],[Y1 -Y1],"-.","markersize", MARKERSIZE,'linewidth',LINEWIDTH,
        [X Xr],[Y2 -Y2],":","markersize", MARKERSIZE,'linewidth',LINEWIDTH,
        [X Xr],[Y4 -Y4],"--","markersize", MARKERSIZE,'linewidth',LINEWIDTH,
        [X Xr -ones(size(X))],[YI -YI linspace(-1,1,L)],'linewidth',LINEWIDTH)
daspect([1 1 1 ])
hl=legend('||x||_1=1','||x||_2=1','||x||_4=1','||x||_\infty=1','location','eastoutside');
set(hl,'fontsize',FONTSIZE)
set(gca, "fontsize", FONTSIZE);
print(gcf,'pnormcode.eps','-depsc','-tight',['-F:' num2str(FONTSIZE)])
