% h(x)=x*x
% e(x)=(h(x)-a)^2

DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;


x1=-0.3;
ITERS=8;
alpha=1.5;
hf=func_minimizando_hx_a(x1,ITERS,alpha,DAT);
print(hf,'minimizando_hx_a_1.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
close all


x1=-2.0;
ITERS=5;
alpha=0.5;
hf=func_minimizando_hx_a(x1,ITERS,alpha,DAT);
print(hf,'minimizando_hx_a_2.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
close all

