function xn = ifft(Xk)
% ��������XkΪDFT[x(n)]
% xnΪ�������x(n)
% ��������������������������������������������������������
M = nextpow2(length(Xk));
N = 2^M;
WN = exp(-j*2*pi/N); % �����������
A = [Xk, zeros(1, N-length(Xk))]; % ��������
disp('���뵽���洢��Ԫ�����ݣ�');
disp(A); % ����
J = 0; % �����򸳳�ʼֵ
for I = 0:N-1 % ���򽻻����ݺ��㵹����
    if I < J % �����жϼ����ݽ���
        T = A(I+1);
        A(I+1) = A(J+1);
        A(J+1) = T;
    end
    % ����һ������
    K = N/2;
    while J >= K
        J = J - K;
        K = K/2;
    end
    J = J + K;
end
disp('���������洢��Ԫ�����ݣ�');
disp(A);
% �ּ��������ν��е�������
for L = 1:M
    disp('���㼶��');
    disp(L);
    B = 2^(L-1);
    for R = 0:B-1 % ����������е�������
        P = 2^(M-L)*R;
        for K = R:2^L:N-2
            T = A(K+1) + A(K+B+1) * WN; % ÿ�����μ���
            A(K+B+1) = A(K+1) - A(K+B+1) * WN;
            A(K+1) = T;
        end
    end
    disp('�����������洢��Ԫ�����ݣ�');
    disp(A);
end
disp('������洢��Ԫ�����ݣ�');
xn = A;