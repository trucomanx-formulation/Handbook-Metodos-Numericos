%%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=24;
DAT.LINEWIDTH=3;


MINX=0;
MAXX=10;
N=16;
M=2;

rand("seed", 8.4880e-311);
X=(MAXX-MINX)*rand(N,1)+MINX;
X=sort(X);

randn("seed", 2.1842e+237);
Y=X.^2+2*randn(size(X));

X'
Y'
[C RCON]=funcC(X,Y,M)

func_plot_and_print(MINX,MAXX,X,Y,C,DAT,'minimizando_hx.eps');

