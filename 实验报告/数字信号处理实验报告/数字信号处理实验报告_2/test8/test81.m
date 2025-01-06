clear;clc;close all
%****���ó弤��Ӧ���䷨****
fc=1000;    %����Ƶ��
ap=1;as=30;fp=200;fs=400;
%�����˲����ļ���ָ��Ҫ��
wp=2*pi*fp/fc;
ws=2*pi*fs/fc;
%Ҫ�������˲�������ָ��ת����ģ���˲�������ָ��
Wanp=wp*fc;                              %ͨ����ֹƵ��
Wans=ws*fc;                              %�����ֹƵ��
[N,Wanc]= buttord( Wanp,Wans,ap,as,'s'); %���ģ���˲���
[b,a]=butter(N,Wanc,'s');                %���ģ���˲���ϵͳ����Ha(s)
[B1,A1]=impinvar(b,a,fc)                 %�ó弤��Ӧ���䷨������������˲���ϵͳ����H(z)
[H1,w]=freqz(B1,A1,'whole');             %�������˲�����Ƶ����Ӧ
%���������˲���Ƶ����Ӧ������
subplot(2,1,1);
plot(w * fc/2/pi,20 * log10(abs(H1)));grid on;
axis([0,1000,-50,1]);ylabel('H1��ֵ dB');
title('�弤��Ӧ���䷨��Ƶ����ֵ�ͨIIR�˲���');

%Ҫ�������˲�������ָ��ת����ģ���˲�������ָ��
anp=2*fc*tan(wp/2);                     %ͨ����ֹƵ��
ans=2*fc*tan(ws/2);                     %�����ֹƵ��
[N,anc]= buttord(anp,ans,ap,as,'s');    %���ģ���˲���
[b,a]=butter(N,anc,'s');                %���ģ���˲���ϵͳ����Ha(s)
[B2,A2]=bilinear(b,a,fc)                %�ó弤��Ӧ���䷨������������˲���ϵͳ����H(z)
[H2,w]=freqz(B2,A2,'whole');            %�������˲�����Ƶ����Ӧ
%���������˲���Ƶ����Ӧ������
subplot(2,1,2);
plot(w * fc/2/pi,20 * log10(abs(H2)));grid on;
axis([0,1000,-320,0]);ylabel('H2��ֵ dB');
title('˫���Ա任����Ƶ����ֵ�ͨIIR�˲���');