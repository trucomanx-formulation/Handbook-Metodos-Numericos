function f=cos_taylor(x,n)
    f=zeros(size(x));
    for II=0:n
        f=f+((-1)^(II))*x.^(2*II)/factorial(2*II);
    end
end
