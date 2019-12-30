function func_plot_and_print(MINX,MAXX,X,Y,Z,C,DAT,ZLABEL,NAMEFILE)
    XX=YY=linspace(MINX,MAXX,25);
    [XXX, YYY] = meshgrid (XX, YY);
    ZZZ=zeros(size(XXX));
    ZZZ(:)=hfunc(XXX(:),YYY(:),C);
    surf(XXX,YYY,ZZZ)
    view([65.945 28.829]);
    colormap(jet);
    hold on 
    scatter3(X,Y,Z,200,min(Z)+max(Z)-Z,'filled')
    hold off

    hx=xlabel('X');
    set (hx, "fontsize", DAT.FONTSIZE);
    hy=ylabel('Y');
    set (hy, "fontsize", DAT.FONTSIZE);
    hz=zlabel(ZLABEL);
    set (hz, "fontsize", DAT.FONTSIZE);

    print(gcf,NAMEFILE,'-depsc',['-F:' num2str(DAT.FONTSIZE)])
endfunction
