function X=DFTfor(xn)
%����for ѭ���������� DFT
% xnΪ��������x(n);
%XΪX=DFT[x(n)];
%-----------------------------------------------
N=length(xn);
X=zeros(1,N);
for k=0:N-1
	for n=0:N-1
		X(k+1)=X(k+1)+xn(n+1)*exp(-j*2*pi*n*k/N);	  %������ʽ����Ƶ��
	end
end
