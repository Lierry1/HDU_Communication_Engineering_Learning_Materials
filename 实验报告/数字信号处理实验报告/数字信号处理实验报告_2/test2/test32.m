clear all;close all;clc
a=[1,-0.9];
b=[1];
figure(1);
subplot(2,1,1);
zplane(b,a);
title('�㼫��ͼ');

h=impz(b,a);
subplot(2,1,2);
stem(h);
title('ϵͳ��λ�弤��Ӧ');
xlabel('n');
ylabel('h(n)');

[H,W]=freqz(b,a);
figure(2);
subplot(2,1,1);
plot(W/pi,abs(H));
title('������Ӧ����');
grid on;
xlabel('\omega x\pi');
ylabel('|H(e^j^\omega)|');

subplot(2,1,2);
plot(W/pi,angle(H));
title('��λ��Ӧ����');
xlabel('\omega x\pi');
ylabel('���');
grid on;