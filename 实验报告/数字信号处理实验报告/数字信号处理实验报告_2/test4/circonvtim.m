function y= circonvtim( x1,x2,N)
%ʱ�����N��Բ�ܾ��y(nfunction y= circonvtim( x1,x2,N)
%ʱ�����N��Բ�ܾ��y(n)=sum(x1(m)* x2((n-m))N ;
%x1(n), x2(n)�ֱ�Ϊ��������
%y(n)Ϊ��������Բ�ܾ������
%��������������������������������������������������
n=0:N-1;
x1=[x1,zeros(1,N-length(x1))];    %��xl(n)����,ʹ�䳤��ΪN
x2=[x2,zeros(1,N-length(x2))];     %��x2(n)����,ʹ����ΪN
x3=x2(mod(-n,N)+1);			%��Բ�ܷ�������x(-n))N
for m=0:N-1
    x4=cirshftt(x3,m,N);			%��Բ����λ����x3((n-m))N
    x5=x1.* x4;					%�������
    y(m+1)=sum(x5);			%�������
end