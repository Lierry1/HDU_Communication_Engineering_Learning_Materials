clc;clear all;close all;
xn = [2, 1, 3, 9, 0, 5, 7, 8];
n=length(xn);
y1 = DIF(xn,n);
y2 = fft(xn);
y3 = y1 - y2;
disp('输出结果:');
disp(y1);
disp('Matlab内置fft函数输出结果:');
disp(y2);
disp('差异:');
disp(y3);