clc;
clear all;
close all;
fs=10;
Ts=1/fs;
n=0:1024;
x=sin(2*pi*2*n*Ts)+sin(2*pi*2.02*n*Ts)+sin(2*pi*2.07*n*Ts);
X=fft(x);
magX=abs(X);    %幅度
angX=angle(X);  %相位
N=length(x);
stem(n*Ts/N,magX);
ylabel('频谱幅度');
xlabel('f/Hz');
title('频谱图');
grid on;