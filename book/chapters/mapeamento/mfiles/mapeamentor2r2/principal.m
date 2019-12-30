%
%% X=round((rand(15,1)-0.5)*2*100)/100
%% Y=round((rand(15,1)-0.5)*2*100)/100
%% 
%% L=10;
%% C=(rand(L,1)-0.5)*2;
%% D=(rand(L,1)-0.5)*2;
%% 
%% [U V]=polinomiom(X,Y,C,D);
%% 
%% U=round(U*100)/100
%% V=round(V*100)/100
%% 

DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;


X = ...
[
  -0.81
   0.75
   0.47
   0.66
  -0.76
   0.10
  -0.43
   0.91
   0.64
  -0.79
   1.00
   0.84
   0.79
   0.65
   0.76
]

Y = ...
[
  -0.69
   0.02
   0.67
  -0.25
   0.73
  -0.72
  -0.85
  -0.92
  -0.76
  -0.28
  -0.27
  -0.11
   0.95
  -0.90
  -0.95
]
U = ...
[
  -0.44
   0.20
   0.73
  -0.07
  -0.91
  -0.50
  -0.55
  -0.78
  -0.61
  -0.35
   0.08
   0.13
   1.79
  -0.82
  -0.88
]

V = ...
[
   1.09
  -0.76
  -0.46
  -0.66
  -0.63
   0.20
   0.84
  -0.16
  -0.12
   0.46
  -0.75
  -0.75
   0.79
   0.06
   0.03
]

M=3;
[C D]=solve_polinomiom(X,Y,U,V,M)
[Uc Vc]=polinomiom(X,Y,C,D);

PU=norm(U-Uc)^2
PV=norm(V-Vc)^2

MINX=min([min(X) min(Y)]);
MAXX=max([max(X) max(Y)]);
func_plot_and_print(MINX,MAXX,X,Y,U,C,DAT,'U','minimizando_hxc.eps');
func_plot_and_print(MINX,MAXX,X,Y,V,D,DAT,'V','minimizando_hxd.eps');
