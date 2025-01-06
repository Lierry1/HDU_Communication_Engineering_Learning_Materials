%检验是否为线性系统
clf;
n=0:20;
x=cos(20*pi*n/256)+cos(200*pi*n/256);
a=2;
b=-3;
x1=cos(20*pi*n/256);
x2=cos(200*pi*n/256);
x3=a*x1+b*x2;

num=[0.45 0.5 0.45];
den=[1 -0.53 0.46];

y1=filter(num,den,x1);
y2=filter(num,den,x2);
y=filter(num,den,x3);
yt=a*y1+b*y2;

subplot(3,1,1);
stem(n,y);
ylabel('信号幅度');

subplot(3,1,2);
stem(n,yt);
ylabel('信号幅度');

subplot(3,1,3);
stem(n,y-yt);
ylabel('信号幅度');


