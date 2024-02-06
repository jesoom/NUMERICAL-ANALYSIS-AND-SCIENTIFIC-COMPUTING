clear all
close all
clc
format long

a=1;
n=20;
H=hilb(n);
A=a*eye(20)+H;

for i=1:n
    h(i)=abs(A(i,i));
    z(i)=sum(abs(A(i,:)))-abs(A(i,i));
end
if h(i)>z(i)
    disp 'row diagonally dominant'
else disp 'no row diagonally dominant'
end

if A==A'
    disp 'symmetric'
else disp 'not symmetric'
end

if min(eig(A))>0
    disp 'positive defenite'
else disp 'not positive definite'
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:2:20
    Xer(i)=-1;
    for i=2:2:20
        Xer(i)=1;
    end
end

b=A*Xer';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[L,U,P]=lu(A);

if P==eye(20)
    disp 'pivoting is not performed'
else disp 'pivoting is performed'
end
y=L\(P*b);
x=U\y;

abs_err_inf=norm(abs(Xer'-x),inf)
rel_er_rinf=norm(abs(Xer'-x),inf)./norm(abs(Xer'),inf)

abs_err_2=norm(abs(Xer'-x),2)
rel_err_2=norm(abs(Xer'-x),2)./norm(abs(Xer'),2)