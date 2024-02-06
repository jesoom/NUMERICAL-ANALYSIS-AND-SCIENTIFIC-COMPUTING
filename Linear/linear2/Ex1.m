clear all
close all
clc
format long

a=5*ones(200,1);
B=diag(a);

c=-1*ones(199,1);
C=diag(c,1)+diag(c,-1)

d=-1*ones(198,1);
D=diag(d,2)+diag(d,-2);

A=B+C+D;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=200;
for i=1:N
    w(i)=abs(A(i,i));
    z(i)=sum(abs(A(i,:)))-abs(A(i,i));
end
    if w(i)>z(i)
        disp('row diagonally dominant');
    else disp('no row diagonally dominant'); 
    end
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if A==A'
    disp 'symmetric'
else disp 'not symmetric'
end

if eig(A)>0
    disp 'positive definite'
else disp 'not positive definite'
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Xer=ones(200,1);
b=A*Xer;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[L,U,P]=lu(A);
y=L\(P*b);
x=U\y;

if P==eye(200)
   disp 'pivoting is not performed'
else disp 'pivoting is performed'
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

abs_err_norm=norm(abs(Xer-x),inf)
rel_err_norm=norm(abs(Xer-x),inf)./norm(abs(Xer),inf)

abs_err_2=norm(abs(Xer-x),2)
rel_err_2=norm(abs(Xer-x),2)./norm(abs(Xer),2)
