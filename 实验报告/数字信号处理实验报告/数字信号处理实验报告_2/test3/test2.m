clc;
clear all;
close all;
fs=10;
Ts=1/fs;
n=0:1024;
x=sin(2*pi*2*n*Ts)+sin(2*pi*2.02*n*Ts)+sin(2*pi*2.07*n*Ts);
X=fft(x);
magX=abs(X);    %����
angX=angle(X);  %��λ
N=length(x);
stem(n*Ts/N,magX);
ylabel('Ƶ�׷���');
xlabel('f/Hz');
title('Ƶ��ͼ');
grid on;