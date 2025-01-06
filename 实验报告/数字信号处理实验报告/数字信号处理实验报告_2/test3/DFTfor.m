function X=DFTfor(xn)
%利用for 循环方法计算 DFT
% xn为输入序列x(n);
%X为X=DFT[x(n)];
%-----------------------------------------------
N=length(xn);
X=zeros(1,N);
for k=0:N-1
	for n=0:N-1
		X(k+1)=X(k+1)+xn(n+1)*exp(-j*2*pi*n*k/N);	  %按定义式计算频谱
	end
end
