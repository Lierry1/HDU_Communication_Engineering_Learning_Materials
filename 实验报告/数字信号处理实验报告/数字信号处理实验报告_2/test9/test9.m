clc;clear all;close all;
fc=4000;
ap=0.5;as=40;fs=1000;fp=800;
ws=2*pi*fs/fc;
wp=2*pi*fp/fc;
wc=(wp+ws)/2;
zb=ws-wp;
N=6.2*pi/zb;
h=fir1(N,wc/pi,hanning(N+1));

[H,w]=freqz(h,0.5,4000);
mag=abs(H);
db=20*log10(mag/max(mag));

plot(w/pi,db);
legend('ººÄþ´°');
ylabel('H·ù¶È£¨dB£©');xlabel('\omega/pi');