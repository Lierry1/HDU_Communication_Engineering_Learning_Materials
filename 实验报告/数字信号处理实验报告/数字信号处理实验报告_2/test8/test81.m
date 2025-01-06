clear;clc;close all
%****采用冲激响应不变法****
fc=1000;    %抽样频率
ap=1;as=30;fp=200;fs=400;
%数字滤波器的技术指标要求
wp=2*pi*fp/fc;
ws=2*pi*fs/fc;
%要求数字滤波器技术指标转化成模拟滤波器技术指标
Wanp=wp*fc;                              %通带截止频率
Wans=ws*fc;                              %阻带截止频率
[N,Wanc]= buttord( Wanp,Wans,ap,as,'s'); %设计模拟滤波器
[b,a]=butter(N,Wanc,'s');                %设计模拟滤波器系统函数Ha(s)
[B1,A1]=impinvar(b,a,fc)                 %用冲激响应不变法函数设计数字滤波器系统函数H(z)
[H1,w]=freqz(B1,A1,'whole');             %求数字滤波器的频率响应
%绘制数字滤波器频率响应幅度谱
subplot(2,1,1);
plot(w * fc/2/pi,20 * log10(abs(H1)));grid on;
axis([0,1000,-50,1]);ylabel('H1幅值 dB');
title('冲激响应不变法设计的数字低通IIR滤波器');

%要求数字滤波器技术指标转化成模拟滤波器技术指标
anp=2*fc*tan(wp/2);                     %通带截止频率
ans=2*fc*tan(ws/2);                     %阻带截止频率
[N,anc]= buttord(anp,ans,ap,as,'s');    %设计模拟滤波器
[b,a]=butter(N,anc,'s');                %设计模拟滤波器系统函数Ha(s)
[B2,A2]=bilinear(b,a,fc)                %用冲激响应不变法函数设计数字滤波器系统函数H(z)
[H2,w]=freqz(B2,A2,'whole');            %求数字滤波器的频率响应
%绘制数字滤波器频率响应幅度谱
subplot(2,1,2);
plot(w * fc/2/pi,20 * log10(abs(H2)));grid on;
axis([0,1000,-320,0]);ylabel('H2幅值 dB');
title('双线性变换法设计的数字低通IIR滤波器');