clc;clear all;close all;
fp=800;fs=1000;
fc=4000;
ap=0.5;as=40;

ws=2*pi*fs/fc;
wp=2*pi*fp/fc;
wc=(wp+ws)/2;
gd=ws-wp;
N=2*pi/gd;
a=(N-1)/2;
k=0:N-1;

Hr=[ones(1,5),zeros(1,11),-ones(1,4)];
angH=[-2*pi*a*k/N];
H=Hr.*exp(j*angH);
h=real(ifft(H,N));
[H1,w1]=freqz(h,1,1000);
mag1=abs(H1);Hdb1=20*log10(mag1);
figure(1);
plot(w1/pi,Hdb1);hold on;

H1=0.5;
Hr=[ones(1,5),H1,zeros(1,9),-H1,-ones(1,4)];
angH=[-2*pi*a*k/N];
H=Hr.*exp(j*angH);
h=real(ifft(H,N));
[H2,w2]=freqz(h,1,1000);
mag1=abs(H2);Hdb2=20*log10(mag1);
plot(w2/pi,Hdb2);hold on;

H1=2/3;H2=1/3;
Hr=[ones(1,5),H1,H2,zeros(1,7),-H2,-H1,-ones(1,4)];
angH=[-2*pi*a*k/N];
H=Hr.*exp(j*angH);
h=real(ifft(H,N));
[H3,w3]=freqz(h,1,1000);
mag1=abs(H3);Hdb3=20*log10(mag1);
plot(w3/pi,Hdb3);hold on;

legend('0点过渡带','1点过渡带','2点过渡带' )
ylabel('H幅值(dB)');xlabel('\omega/pi');

figure(2);
plot(w1/pi,w1);hold on;
plot(w2/pi,w2);hold on;
plot(w3/pi,w3);hold on;
legend('0点过渡带','1点过渡带','2点过渡带' )
ylabel('相位');xlabel('\omega/pi');