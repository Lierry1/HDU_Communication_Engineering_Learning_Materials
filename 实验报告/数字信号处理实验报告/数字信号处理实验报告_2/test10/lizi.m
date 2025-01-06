clc;clear all;close all;
%����Ƶ�ʳ�������Ƶ�ͨ�˲���
N=33;
a=(N-1)/2;
Hrs=[ones(1,9),zeros(1,16),ones(1,8)];
k1=0:floor((N-1)/2);k2= floor((N-1)/2)+1:N-1;
angH=[-a*(2*pi)/N* k1,a* (2* pi)/N*(N-k2)];
H=Hrs.*exp(j * angH);
%����FFT���˲����ĵ�λ�弤��Ӧh(n)=DFT[H(k)]
h=real(ifft(H,N));
[H,w]=freqz(h,1,1000);
mag= abs(H);Hdb=20*log10(mag)
%���ɴ��Ż�,����һ�����ɵ�
H1=0.5;
Hrsl=[ones(1,9),H1,zeros(1,15),ones(1,8)];
Hb1=Hrsl.*exp(j*angH);
%���� FFT���˲����ĵ�λ�弤��Ӧh(n)=DFT[HI(k)]
hb1=real(ifft(Hb1,N));
[Hb1,w1]=freqz(hb1,1,1000);
magl=abs(Hb1);Hdb1=20*log10(magl);
%��ͼ�����˲�����Ƶ��Ӧ
figure(1) ;plot(w/pi,Hdb,'--k','LineWidth',1.5);grid on;hold on;
plot(w1/pi,Hdb1,'b','LineWidth',1.5);hold off;
xlabel('\omega/\pi');ylabel('����(dB)');legend('N=33','N=33�Ż�');
%��ͼ�����˲�����λ��Ӧ
figure(2);plot(w/pi,w,'--k','LineWidth',1.5);grid on;hold on;
plot(w1/pi,w1,'b','LineWidth',1.5);hold off;
xlabel('\omega/\pi');ylabel('��λ');legend('N=33','N=33�Ż�');
