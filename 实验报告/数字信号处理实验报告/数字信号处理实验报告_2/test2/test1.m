clear all;close all;clc
a=[1,-0.9];
b=[1,0.9];

figure(1);
h=impz(b,a);
stem(h);
title('ϵͳ��λ�弤��Ӧ');
xlabel('n');
ylabel('h(n)');

[H,W]=freqz(b,a);
figure(2);
plot(W/pi,abs(H));
title('������������');
grid on;
xlabel('\omega x\pi');
ylabel('|H(e^j^\omega)|');
