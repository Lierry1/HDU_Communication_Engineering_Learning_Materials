clc;clear all;close all;
%采用频率抽样法设计低通滤波器
N=33;
a=(N-1)/2;
Hrs=[ones(1,9),zeros(1,16),ones(1,8)];
k1=0:floor((N-1)/2);k2= floor((N-1)/2)+1:N-1;
angH=[-a*(2*pi)/N* k1,a* (2* pi)/N*(N-k2)];
H=Hrs.*exp(j * angH);
%利用FFT求滤波器的单位冲激响应h(n)=DFT[H(k)]
h=real(ifft(H,N));
[H,w]=freqz(h,1,1000);
mag= abs(H);Hdb=20*log10(mag)
%过渡带优化,增加一个过渡点
H1=0.5;
Hrsl=[ones(1,9),H1,zeros(1,15),ones(1,8)];
Hb1=Hrsl.*exp(j*angH);
%利用 FFT求滤波器的单位冲激响应h(n)=DFT[HI(k)]
hb1=real(ifft(Hb1,N));
[Hb1,w1]=freqz(hb1,1,1000);
magl=abs(Hb1);Hdb1=20*log10(magl);
%画图给出滤波器幅频响应
figure(1) ;plot(w/pi,Hdb,'--k','LineWidth',1.5);grid on;hold on;
plot(w1/pi,Hdb1,'b','LineWidth',1.5);hold off;
xlabel('\omega/\pi');ylabel('幅度(dB)');legend('N=33','N=33优化');
%画图给出滤波器相位响应
figure(2);plot(w/pi,w,'--k','LineWidth',1.5);grid on;hold on;
plot(w1/pi,w1,'b','LineWidth',1.5);hold off;
xlabel('\omega/\pi');ylabel('相位');legend('N=33','N=33优化');
