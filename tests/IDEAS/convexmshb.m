%
X1=[-1.5;
    +1;
    +2;
    +3];

X0=[+1.5;
    -1;
    -2;
    -3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X=[X0;X1];
y=[zeros(size(X0,1),1);ones(size(X1,1),1)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function G=Sigmoid(z)
    G=1.0./(1+exp(-z));
endfunction


function z=Logit(G)
    z=log(G./(1-G));
endfunction

function E=CostFuncMS(Theta,X,y)
    A=[ones(size(y)) X];
    E=(Sigmoid(A*Theta)-y)'*(Sigmoid(A*Theta)-y);
endfunction

function E=CostFuncLogitMS(Theta,X,y)
    d=0.0001;
    A=[ones(size(y)) X];
    Y=(1-2*d)*y+d;
    E=(A*Theta-Logit(Y))'*(A*Theta-Logit(Y));
endfunction

function E=CostFuncHb(Theta,X,y)
    A=[ones(size(y)) X];
    H=-y.*log(Sigmoid(A*Theta))-(1-y).*log(1-Sigmoid(A*Theta));
    E=sum(H);
endfunction

function plotCostFunc(CostFunc,X,y)
    theta1=theta2 = linspace (-16, 16, 100);
    [THETA1, THETA2] = meshgrid (theta1,theta2);
    C =zeros(size(THETA1));
    for II=1:numel(C)
        C(II)=CostFunc([THETA1(II);THETA2(II)],X,y);
    endfor

    surf (THETA1, THETA2, C);
    colormap(jet)
endfunction

figure(1)
plotCostFunc(@CostFuncMS,X,y)
title('Mean square')

figure(2)
plotCostFunc(@CostFuncLogitMS,X,y)
title('Logit and Mean square')

figure(3)
plotCostFunc(@CostFuncHb,X,y)
title('Entropy')
