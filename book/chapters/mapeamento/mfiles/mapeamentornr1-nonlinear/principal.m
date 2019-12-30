%%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;


MINX=0;
MAXX=6;
N=16;
NITER=6;
alpha=0.1;
C0=[3;2;1];

rand("seed", 8.4880e-311);
P=(MAXX-MINX)*rand(N,2)+MINX;


randn("seed", 2.1842e+237);
Z=hfunc([8;3;2],P)+0.15*randn(size(P,1),1);

P'
Z'
[C ERROR RCON]=funcC(P,Z,alpha,C0,NITER);
ERROR
RCON

func_plot_and_print(MINX,MAXX,P,Z,C{end},DAT,'minimizando_hx.eps');

CC=C{1};
for II=2:NITER
	CC=[ CC C{II}];
endfor
CC
