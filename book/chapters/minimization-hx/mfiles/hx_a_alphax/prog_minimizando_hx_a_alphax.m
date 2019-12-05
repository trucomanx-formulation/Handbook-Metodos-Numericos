% h(x)=x*x
% e(x)=(h(x)-a)^2

a=1;
x1=-1.4;
M=8;
hf=func_minimizando_hx_a_alphax(x1,a,M,+1,1.2);
print(hf,'minimizando_hx_a_alphax_1.eps','-depsc')
close all

a=-1;
x1=-1.4;
M=8;
hf=func_minimizando_hx_a_alphax(x1,a,M,+1,1.2);
print(hf,'minimizando_hx_a_alphax_2.eps','-depsc')
close all

