%%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;


MINX=0;
MAXX=6;
N=16;
M=2;



rand("seed", 8.4880e-311);
P=(MAXX-MINX)*rand(N,2)+MINX;


randn("seed", 2.1842e+237);
Z=hfunc([1;1;1;1;1;1],P(:,1),P(:,2))+0.15*randn(N,1);

P'
Z'
[C ERROR RCON]=funcC(P(:,1),P(:,2),Z,M)

func_plot_and_print(MINX,MAXX,P,Z,C,DAT,'minimizando_hx.eps');

