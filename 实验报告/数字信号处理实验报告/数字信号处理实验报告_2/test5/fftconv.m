function y=fftconv(x1,x2,N)
%快速傅里叶变换计算线性卷积
Xk1=fft(x1,N);
Xk2=fft(x2,N);
YK=Xk1.*Xk2;
y=ifft(YK);