clear all
close all
clc
format long

N=300;
B1=4*ones(1,N);
B2=-1*ones(1,N-1);
B3=ones(1,N-1);
B4=0.5*ones(1,N-10);
B5=-0.3*ones(1,N-9);
B=diag(B1)+diag(B2,-1)+diag(B3,1)+diag(B4,-10)+diag(B5,9);

C=B(:,1:100);
A=C'*C;

%%a
if A==A'
    disp 'symmetric'
else disp 'not symmetric'
end

if min(eig(A))>0
    disp 'positive definite'
else disp 'not positive definite'
end

%%b
x_exact=[1:100]';
b=A*x_exact;

%%c
U=chol(A);
L=U';
y=L\b;
x_chol=U\y;

%%d
abs_err_inf=norm(x_exact-x_chol,inf)
rel_err_inf=norm(x_exact-x_chol,inf)./norm(x_exact,inf)

abs_err_2=norm(x_exact-x_chol,2)
rel_err_2=norm(x_exact-x_chol,2)./norm(x_exact,2)

rel_err_inf<=cond(A,inf)*eps
rel_err_2<=cond(A)*eps

b_chol=A*x_chol;
r=b-b_chol;
rel_err_2<=cond(A)*(norm(r)/norm(b))

