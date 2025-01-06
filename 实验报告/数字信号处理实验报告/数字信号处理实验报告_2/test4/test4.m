clear;clc;close all;   
x1=[2,1,1,2];
x2=[1,-1,-1,1];
ylin=conv(x1,x2);   %线性卷积
y1=circonvtim(x1,x2,4);   %4点圆周卷积
y2=circonvtim(x1,x2,7);   %7点圆周卷积
y3=circonvtim(x1,x2,8);   %8点圆周卷积

subplot(4,1,1);
stem(y1);
axis([0,8,-5,5]);title('y_1(n)=x_1(n)④x_2(n)');

subplot(4,1,2);
stem(y2);
axis([0,8,-5,5]);title('y_2(n)=x_1(n)⑦x_2(n)');

subplot(4,1,3);
stem(y3);
axis([0,8,-5,5]);title('y_3(n)=x_1(n)⑧x_2(n)');

subplot(4,1,4);
stem(ylin);
axis([0,8,-5,5]);title('ylin(n)=x_1(n)*x_2(n)');