clear;clc;close all
%****���ó弤��Ӧ���䷨****
fc=1000;
%����Ƶ��
ap=1;as=25;fp=100;fs=300;
%�����˲����ļ���ָ��Ҫ��
wp=2* pi * fp/fc;
ws=2* pi* fs/fc;
%Ҫ�������˲�������ָ��ת����ģ���˲�������ָ��
Wanp=wp * fc;                             %ͨ����ֹƵ��
Wans=ws * fc;                             %�����ֹƵ��
[N,Wanc]= buttord( Wanp,Wans,ap,as,'s'); %���ģ���˲���
[b,a]=butter(N,Wanc,'s');                %���ģ���˲���ϵͳ����Ha(s)
[B1,A1]=impinvar(b,a,fc)                  %�ó弤��Ӧ���䷨������������˲���ϵͳ����H(z)
[H1,w]=freqz(B1,A1,'whole');              %�������˲�����Ƶ����Ӧ
%���������˲���Ƶ����Ӧ������
plot(w * fc/2/pi,20 * log10(abs(H1)));grid on;
axis([0,1000,-40,0]);ylabel('H1��ֵ dB');
title('�弤��Ӧ���䷨��Ƶ����ֵ�ͨIIR�˲���');