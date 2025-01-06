function Xk=ditfft(xn)
%离散傅里叶变换(DFT)的快速算法2-FFT
%x(n)为输入序列
%Xk为输出序列X(k)=DFT[x(n)]
%————————————————————————————
M=nextpow2(length(xn));
N=2^M;
for m=0:N/2-1                    %蝶形因子指数范围
    WN(m+1)=exp(-j*2*pi/N)^m;    %计算蝶形因子
end
A=[xn,zeros(1,N-length(xn))];    %数据输入
disp('输入到各存储单元的数据:');
disp(A);                         %倒序
J=0;                             %给倒序赋初始值
for I=0:N-1                      %按序交换数据和算倒序数
    if I<J                       %条件判断及数据交换
        T=A(I+1);
        A(I+1)=A(J+1);
        A(J+1)=T;
    end
    %算下一个倒序
    K=N/2;
    while J>=K
    J=J-K;
    K=K/2;
    end
    J=J+K;
end
disp('倒序后各个存储单元的数据:');
disp( A);
%分级按序依次进行蝶形运算
for L=1:M
    disp('运算级次');
    disp(L);
    B=2^(L-1);
    for R=0:B-1                  %各级按序进行蝶形运算
        P=2^(M-L)*R;
        for K=R:2^L:N-2
            T=A(K+1)+A(K+B+1)*WN(P+1);  %每序依次计算
            A(K+B+1)=A(K+1)-A(K+B+1) * WN(P+1);
            A(K+1)=T;
        end
    end
    disp('本级运算后各存储单元的数据:');
    disp(A);
end
disp('输出各存储单元的数据:');
Xk=A;

