%%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;


MINX=0;
MAXX=10;
N=16;
NITER=6;
alpha=0.1;
C0=[1;1;1];

rand("seed", 8.4880e-311);
X=(MAXX-MINX)*rand(N,1)+MINX;
X=sort(X);

randn("seed", 2.1842e+237);
Y=hfunc([8;3;2],X)+0.15*randn(size(X));

X'
Y'
[C ERROR RCON]=funcC(X,Y,alpha,C0,NITER);
ERROR
RCON

func_plot_and_print(MINX,MAXX,X,Y,C{end},DAT,'minimizando_hx.eps');

CC=C{1};
for II=2:NITER
	CC=[ CC C{II}];
endfor
CC
