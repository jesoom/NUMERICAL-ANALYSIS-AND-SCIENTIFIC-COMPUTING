clear all
close all
clc
format long

v=[1.e-4,2:10]';
A=vander(v);

Xer=[10:-1:1]';
b=A*Xer;

[L,U,P]=lu(A);
if P==eye(10)
    disp 'pivoting is not performed'
else disp 'pivoting is performed'
end

y=L\(P*b);
x=U\y;

abs_err_inf=norm(abs(Xer-x),inf)
rel_er_rinf=norm(abs(Xer-x),inf)./norm(abs(Xer),inf)

abs_err_2=norm(abs(Xer-x),2)
rel_err_2=norm(abs(Xer-x),2)./norm(abs(Xer),2)

