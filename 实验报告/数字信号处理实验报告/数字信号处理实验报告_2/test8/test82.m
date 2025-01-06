clear; clc; close all

fc = 1000;
ap = 1; as = 25; fp = 100; fs = 300;

wp = 2 * pi * fp / fc;
ws = 2 * pi * fs / fc;

Wanp = wp * fc;
Wans = ws * fc;
[N, Wanc] = buttord(Wanp, Wans, ap, as, 's');
[b, a] = butter(N, Wanc, 's');
[B1, A1] = impinvar(b, a, fc);
[H1, w] = freqz(B1, A1, 'whole');
subplot(2, 1, 1);
plot(w * fc / (2 * pi), 20 * log10(abs(H1))); grid on;
axis([0, 1000, -40, 0]); ylabel('H1幅值 dB');
title('冲激响应不变法设计的数字低通IIR滤波器');

anp = 2 * fc * tan(wp / 2);
ans = 2 * fc * tan(ws / 2);
[N, anc] = buttord(anp, ans, ap, as, 's');
[b, a] = butter(N, anc, 's');
[B2, A2] = bilinear(b, a, fc);
[H2, w] = freqz(B2, A2, 'whole');
subplot(2, 1, 2);
plot(w * fc / (2 * pi), 20 * log10(abs(H2))); grid on;
axis([0, 1000, -100, 0]); ylabel('H2幅值 dB');
title('双线性变换法设计的数字低通IIR滤波器');
