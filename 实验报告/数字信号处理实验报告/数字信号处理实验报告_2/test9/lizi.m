clear;clc;close all
N=21;wc= pi/4;
n=0:N-1;a=(N-1)/2;
na=n-a+eps*((n-a)==0);
hdn=sin(wc * na)/pi./na;

if rem(N,2)~=0
    hdn(a+1)=wc/pi;
end

wnl= boxcar(N);
hn1=hdn.*wnl';
figure(1); stem(n,hn1,'.');line([0,20],[0,0]);grid on; xlabel('n'),ylabel('h(n)'), title('���δ���Ƶ�h(n)');
hw1=fft(hn1,512);wl=2*[0:511]/512;
figure(2);
subplot(2,1,1);plot(wl,20 * log10(abs(hw1)));grid on;ylabel('����(dB)'); title('��������');
subplot(2,1,2);plot(wl,unwrap(angle(hw1)));grid on;
xlabel('\omega/pi');ylabel('��λ(��)');title('��λ����');
