clear;clc;close all
fc=1000;
ap=1;as=10;
wp=0.2*pi;
ws=0.3*pi;
Wanp=wp*fc;
Wans=ws*fc;
[N,Wanc]=buttord(Wanp,Wans,ap,as,'s');
[b,a]=butter(N,Wanc,'s');
[B1,A1]=impinvar(b,a,fc)
[H1,w]=freqz(B1,A1,'whole');
plot(w*fc/2/pi,20*log10(abs(H1)));grid on;
axis([0,1000,-60,1]);ylabel('H1·ùÖµdB');
title('Êý×ÖµÍÍ¨IIRÂË²¨Æ÷');