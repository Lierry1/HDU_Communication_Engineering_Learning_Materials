function [Xk]=DIF(xn,N)
M=log2(N);
for m=0:M-1
    num=2^m;
    a=N/2^m;
    b=N/2^(m+1);
    cycle=N/2^(m+1)-1;
    Wn=exp(-j*2*pi/a);
    for g=1:num
        x=(g-1)*a;
        y=(g-1)*a+b;
        for r=0:cycle;
            k=r+1;
            xn(k+x)=xn(k+x)+xn(k+y);
            xn(k+y)=[xn(k+x)-xn(k+y)-xn(k+y)]*Wn^r;
        end
    end
end
n1 = zeros(1, N);
for i = 0:(N-1)
    b = zeros(1, ceil(log2(N)));
    n = i;
    idx = 1;
    while n > 0
        b(idx) = mod(n, 2);
        n = floor(n/2);
        idx = idx + 1;
    end
    n1(i+1, 1:length(b)) = fliplr(b);
end
n2 = bi2de(n1);
Xk = xn(n2+1);
