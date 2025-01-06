%求输入信号与两系统输出波形
clf;
n=0:299;
x=cos(20*pi*n/256)+cos(200*pi*n/256);
x3=[0 0 x 0 0]; %x2=x(n)
x4=[0 0 0 x 0];
x5=[0 0 0 0 x];
y1=0.5.*x3+0.27.*x4+0.77.*x5;

num=[0.45 0.5 0.45];
den=[1 -0.53 0.46];
y2=filter(num,den,x);

subplot(3,1,1);
stem(n,x);
xlabel('时间信号n');
ylabel('信号幅度');
title('输入信号');

subplot(3,1,2);
stem(y1);
xlabel('时间信号n');
title('系统1输出');

subplot(3,1,3);
stem(y2);
xlabel('时间信号n');
title('系统2输出');


