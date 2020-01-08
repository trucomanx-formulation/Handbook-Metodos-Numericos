function func_plot_and_print(MINX,MAXX,X,Y,C,DAT,NAMEFILE)
    XX=linspace(MINX,MAXX,100);
    YY=funcF(C,XX);
    plot(	X,Y,'go',"markersize", DAT.MARKERSIZE,'linewidth',DAT.LINEWIDTH, ...
		XX,YY,'k-',"markersize", DAT.MARKERSIZE,'linewidth',1.5*DAT.LINEWIDTH )
    ylim([min([0 min(YY)]) 1.3*max(YY)])
    hx=xlabel('X');
    set (hx, "fontsize", DAT.FONTSIZE);
    hy=ylabel('Y');
    set (hy, "fontsize", DAT.FONTSIZE);
    %hl=legend(' h(c_5,x)',' \{x_n,y_n\}','location','northeast');
    %pos = get(hl,'Position'); pos(1) = pos(1)*1.2; set(hl,'Position',pos)
    %set (hl, "fontsize", DAT.FONTSIZE);
    set (gca, "fontsize", DAT.FONTSIZE);
    set (gca, 'linewidth',DAT.LINEWIDTH);
    print(gcf,NAMEFILE,'-deps',['-F:' num2str(DAT.FONTSIZE)])
endfunction
