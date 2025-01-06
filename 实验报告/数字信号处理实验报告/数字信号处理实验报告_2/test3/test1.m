clc;
clear all;
close all;
fs=10;
Ts=1/fs;
n=0:255;
x=sin(2*pi*2*n*Ts)+sin(2*pi*2.02*n*Ts)+sin(2*pi*2.07*n*Ts);
X=fft(x);
magX=abs(X);    %幅度
angX=angle(X);  %相位
N=length(x);
k=n;
w=2*pi*k/N;

stem(w/pi,magX);
ylabel('频谱幅度');
xlabel('\omega x \pi');
title('频谱图');
grid on;