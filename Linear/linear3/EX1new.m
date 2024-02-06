clear all
close all
clc
format long

A1=6*ones(1,400);
A2=-1*ones(1,399);
A3=ones(1,396);
A=diag(A1,0)+diag(A2,1)+diag(A2,-1)+diag(A3,4)+diag(A3,-4);

%%a
for i=1:400
  w(i)=abs(A(i,i));
  z(i)=sum(abs(A(i,:)))-abs(A(i,i));
end
if w(i)>z(i)
    disp 'row diagonally dominant'
else disp 'not row diagonally dominant'
end

%%b
if A==A'
    disp 'symmetric'
else disp 'not symmetric'
end

if min(eig(A))>0
    disp 'positive definite'
else disp 'not positive definite'
end

%%c
Xex=[];
for i=1:2:400
    Xex(i)=1;
    for j=2:2:400
        Xex(j)=-1;
    end
end
x_exact=Xex'
b=A*x_exact;

%%d
U=chol(A);
L=U';
y=L\b;
x_chol=U\y;

%%e
abs_err_inf=norm(x_exact-x_chol,inf)
rel_err_inf=norm(x_exact-x_chol,inf)./norm(x_exact,inf)

abs_err_2=norm(x_exact-x_chol,2)
rel_err_2=norm(x_exact-x_chol,2)./norm(x_exact,2)

%%priori
rel_err_2<=cond(A)*eps
rel_err_inf<=cond(A,inf)*eps

%%posteriori
b_chol=A*x_chol;
r=b-b_chol;
rel_err_2<=cond(A)*(norm(r)./norm(b))



