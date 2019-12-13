% h(x)=x*x
% e(x)=(h(x)-a)^2

DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;

a=1;
x1=-1.5;
M=5;
hf=func_minimizando_hx_a(x1,a,M,+1,DAT);
print(hf,'minimizando_hx_a_1.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
close all

a=-1;
x1=-1.5;
M=5;
hf=func_minimizando_hx_a(x1,a,M,+1,DAT);
print(hf,'minimizando_hx_a_2.eps','-depsc',['-F:' num2str(DAT.FONTSIZE)])
close all

