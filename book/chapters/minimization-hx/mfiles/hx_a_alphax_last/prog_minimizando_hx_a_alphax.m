% h(x)=x*x
% e(x)=(h(x)-a)^2

DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;

a=1;
x1=-1.4;
M=4;
alpha=1.2;
hf=func_minimizando_hx_a_alphax(x1,a,M,alpha,DAT);
print(hf,'minimizando_hx_a_alphax_1.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
close all

a=-1;
x1=-1.4;
M=4;
alpha=1.2;
hf=func_minimizando_hx_a_alphax(x1,a,M,alpha,DAT);
print(hf,'minimizando_hx_a_alphax_2.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
close all

