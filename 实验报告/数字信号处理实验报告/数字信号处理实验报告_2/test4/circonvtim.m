function y= circonvtim( x1,x2,N)
%时域计算N点圆周卷积y(nfunction y= circonvtim( x1,x2,N)
%时域计算N点圆周卷积y(n)=sum(x1(m)* x2((n-m))N ;
%x1(n), x2(n)分别为输入序列
%y(n)为输出所求的圆周卷积序列
%—————————————————————————
n=0:N-1;
x1=[x1,zeros(1,N-length(x1))];    %对xl(n)补零,使其长度为N
x2=[x2,zeros(1,N-length(x2))];     %对x2(n)补零,使长度为N
x3=x2(mod(-n,N)+1);			%求圆周翻褶序列x(-n))N
for m=0:N-1
    x4=cirshftt(x3,m,N);			%求圆周移位序列x3((n-m))N
    x5=x1.* x4;					%序列相乘
    y(m+1)=sum(x5);			%序列求和
end