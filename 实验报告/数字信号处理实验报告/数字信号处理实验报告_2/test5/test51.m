clear all;clc;close all;
nx=0:7;xn=2*nx+3;
nh=0:15;hn=sin(2*pi*nh/16);
N1=length(xn);N2=length(hn);
N=N1+N2-1;
xn=[xn zeros(1,N-N1)];
hn=[hn zeros(1,N-N2)];
yn=fftconv(xn,hn,N);
nn=0:N-1;

subplot(3,1,1);stem(nn,xn);
title('����x(n)');

subplot(3,1,2);stem(nn,hn);
title('����h(n)');

subplot(3,1,3);stem(nn,hn);
title('����x(n)��h(n)�����Ծ��y(n)');
xlabel('n');