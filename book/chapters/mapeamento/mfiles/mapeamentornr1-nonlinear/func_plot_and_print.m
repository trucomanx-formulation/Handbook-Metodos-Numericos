function func_plot_and_print(MINX,MAXX,P,Z,C,DAT,NAMEFILE)
    XX=YY=linspace(MINX,MAXX,25);
    [XXX, YYY] = meshgrid (XX, YY);
    ZZZ=zeros(size(XXX));
    ZZZ(:)=funcF(C,[XXX(:) YYY(:)]);
    surf(XXX,YYY,ZZZ)
    view([65.945 28.829]);
    colormap(jet);
    hold on 
    scatter3(P(:,1),P(:,2),Z,200,min(Z)+max(Z)-Z,'filled')
    hold off

    hx=xlabel('X_1');
    set (hx, "fontsize", DAT.FONTSIZE);
    hy=ylabel('X_2');
    set (hy, "fontsize", DAT.FONTSIZE);
    hz=zlabel('Z');
    set (hz, "fontsize", DAT.FONTSIZE);

    print(gcf,NAMEFILE,'-depsc',['-F:' num2str(DAT.FONTSIZE)])
endfunction
