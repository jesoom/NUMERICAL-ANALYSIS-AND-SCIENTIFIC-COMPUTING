clear all
close all
clc
format long

a=6*ones(400,1);
A1=diag(a);

a1=-1*ones(399,1);
A2=diag(a1,1)+diag(a1,-1);

a2=ones(396,1);
A3=diag(a2,4)+diag(a2,-4);

A=A1+A2+A3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:400
    w(i)=abs(A(i,i));
    z(i)=sum(abs(A(i,:)))-abs(A(i,i));
end
if w(i)>z(i)
    disp 'diagonally dominant by row'
else disp 'not diagonally dominant by row'
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if A==A'
    disp 'symmetric'
else disp 'not symmetric'
end

if min(eig(A))>0
    disp 'positive definite'
else disp 'not positive definite'
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:2:400
    Xer(i)=1;
    for j=2:2:400
        Xer(j)=-1;
    end
end
b=A*Xer';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
U=chol(A);
L=U';
y=L\b;
x=U\y;

abs_err_inf=norm(abs(Xer'-x),inf)
rel_err_inf=norm(abs(Xer'-x),inf)./norm(abs(Xer'),inf)

abs_err_2=norm(abs(Xer'-x),2)
rel_err_2=norm(abs(Xer'-x),2)./norm(abs(Xer'),2)