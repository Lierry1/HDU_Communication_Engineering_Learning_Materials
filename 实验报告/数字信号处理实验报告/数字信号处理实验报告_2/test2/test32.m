clear all;close all;clc
a=[1,-0.9];
b=[1];
figure(1);
subplot(2,1,1);
zplane(b,a);
title('零极点图');

h=impz(b,a);
subplot(2,1,2);
stem(h);
title('系统单位冲激响应');
xlabel('n');
ylabel('h(n)');

[H,W]=freqz(b,a);
figure(2);
subplot(2,1,1);
plot(W/pi,abs(H));
title('幅度响应曲线');
grid on;
xlabel('\omega x\pi');
ylabel('|H(e^j^\omega)|');

subplot(2,1,2);
plot(W/pi,angle(H));
title('相位响应曲线');
xlabel('\omega x\pi');
ylabel('相角');
grid on;