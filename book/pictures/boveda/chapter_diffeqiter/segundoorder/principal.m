%
DAT.MARKERSIZE=12;
DAT.FONTSIZE=28;
DAT.LINEWIDTH=3;


P=[3 -2 0;-2 3 -1; 0 -1 1];

x1=[0;0;1];
dx1=[0;0;0];

[w V d1  d2]=func_params(P,x1,dx1,0)

VD1=V*diag(d1)

T=linspace(0,10,30);
X=funcdifsorder2(w,V,d1,d2,T);

plot(	T(1:2:end),X(1,1:2:end),'-^',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	T(1:2:end),X(2,1:2:end),'k-o',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
	T(1:2:end),X(3,1:2:end),'r-s',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH);
daspect([2.45 1 1])
    %set (gca, "ygrid", "on");
    hx=xlabel('t');
    set (hx, "fontsize", DAT.FONTSIZE);
    hl=legend(' x_1(t)',' x_2(t)',' x_3(t)','location','eastoutside');
    INFO=get(hl,'position');
    set (hl,'position',[1.9*INFO(1) 1.3*INFO(2) 1.5*INFO(3) INFO(4)]);
    set (hl, "fontsize", DAT.FONTSIZE, 'linewidth',DAT.LINEWIDTH);
    set (gca, "fontsize", DAT.FONTSIZE);
    set (gca, 'linewidth',DAT.LINEWIDTH);
print(gcf,'segundoroder1','-deps','-tight',['-F:' num2str(DAT.FONTSIZE)])
