%
MARKERSIZE=12;
FONTSIZE=24;
LINEWIDTH=3;
B=[1;1;2];

AMP=3.0;

tx = ty = linspace (0, AMP, 50)';
[xx, yy] = meshgrid (tx, ty);
err=fune(xx,yy,B);
figure(1)
surfc(xx,yy,err)
colormap(jet)
view([-10, 20])
print(gcf,'surfcfx4.eps','-depsc',['-F:' num2str(FONTSIZE)])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=zeros(2,32);

II=1;


%P=[11.0999/5;11.0999/5]; %minimo relativo
%P=[11/5;11/5]; %% No existe inversa
%P=[9/5;9/5]; %% No existe inversa
%P=[7/5;7/5]; %% No existe inversa
P=[7.032993/5;7.032993/5];
PEND=2*funj(P)'*(funf(P)-B)
JJ=funj(P)

ERR=fune(P(1,end),P(2,end),B);
while ((ERR(end)>0.001^2)&&(length(ERR)<8))
	JJ=funj(P(:,end));
	[INVERSA RCOND]=inv(JJ'*JJ);
	if(RCOND==0)
		error(['Not exist inverse matrix to P:[' num2str(P(1,end)) ',' num2str(P(2,end)) ']']);
	endif
	P(:,end+1)=P(:,end)+INVERSA*JJ'*(B-funf(P(:,end)));
	
	ERR=[ERR fune(P(1,end),P(2,end),B)];
endwhile

P
ERR
PENDEND=2*funj(P(:,end))'*(funf(P(:,end))-B)
JJ=funj(P(:,end))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=[linspace(0,AMP,601);linspace(0,AMP,601)];
E=fune(D(1,:),D(2,:),B);
DT=sqrt(D(1,:).^2 + D(2,:).^2);

PT=sqrt(P(1,:).^2 + P(2,:).^2);

figure(2)
plot(DT,E,'linewidth',LINEWIDTH)
hold on
plot(PT,ERR,"-o","markersize", MARKERSIZE,'linewidth',LINEWIDTH)
%hl=legend("X_k");
%set(hl,"fontsize", FONTSIZE);
set(gca, "fontsize", FONTSIZE);
xlabel('r=||x||')
ylabel('e(r)')
xlim([0 AMP*sqrt(2)]);
ylim([0 1.25*max(ERR)]);
hold off
print(gcf,'plotfx4.eps','-depsc',['-F:' num2str(FONTSIZE)])
