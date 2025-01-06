clear;clc;close all;
n=0:200;x=n;
h=[1,0,3,7];
L=5;
ya=overaddfft(h,x,L);
yc=conv(x,h);
ym=fftfilt(h,x,L+length(h)-1);

subplot(3,1,1);
stem(0:length(ya)-1,ya);
title('重叠相加法overaddfft()计算线性卷积');
axis([0,205,0,3000]);

subplot(3,1,2);
stem(0:length(yc)-1,yc);
title('conv()函数计算的线性卷积');
axis([0,205,0,3000]);

subplot(3,1,3);
stem(0:length(ym)-1,ym);
title('重叠相加法fftfilt()计算线性卷积');
axis([0,205,0,3000]);
xlabel('n');