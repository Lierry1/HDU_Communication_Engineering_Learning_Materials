%�����Ƿ�Ϊʱ����ϵͳ
clf;
n=0:40;
D=10;
a=3;
b=-2;

x=cos(20*pi*n/256)+cos(200*pi*n/256);

x1=cos(20*pi*n/256);
x2=cos(200*pi*n/256);
x3=a*x1+b*x2;

xd=[zeros(1,D) x3];

num=[0.45 0.5 0.45];
den=[1 -0.53 0.46];
ic=[0 0];

y=filter(num,den,x3,ic);
yd=filter(num,den,xd,ic);
N=length(y);
d=y-yd(1+D:N+D);

subplot(3,1,1);
stem(n,y);
ylabel('�źŷ���');
title('���y[n]');
grid;

subplot(3,1,2);
stem(yd(1:length(yd)));
ylabel('�źŷ���');

subplot(3,1,3);
stem(n,d);
xlabel('ʱ���ź�n');
ylabel('�źŷ���');
title('��ֵ�ź�');
grid;