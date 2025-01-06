clc; clear all; close all;
Xk = [36.0000, -4.0000+9.6569i, -4.0000+4.0000i, -4.0000+1.6569i, -4.0000, -4.0000-1.6569i, -4.0000-4.0000i, -4.0000-9.6569i];
N = length(Xk);
Xk1 = Xk.';
xn1 = ifft(conj(Xk1));
xn1 = xn1 / N;

xn2 = ifft(Xk);
xn2 = xn2 / N;

disp("xn1 = ");
disp(xn1);

disp("xn2 = ");
disp(xn2);