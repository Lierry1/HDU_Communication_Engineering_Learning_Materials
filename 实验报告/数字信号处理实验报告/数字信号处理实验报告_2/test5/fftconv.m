function y=fftconv(x1,x2,N)
%���ٸ���Ҷ�任�������Ծ��
Xk1=fft(x1,N);
Xk2=fft(x2,N);
YK=Xk1.*Xk2;
y=ifft(YK);