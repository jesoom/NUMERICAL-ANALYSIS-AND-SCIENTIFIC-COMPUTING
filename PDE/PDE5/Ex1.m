clear all
close all
clc
format long

%%==============implict upwind=======
disp 'Implicit Upwind'
L=10;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
T=2;
M=100;
% M=50;
% M=10;
dt=T/M;
t=[0:dt:T];
a=1;

c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
y=@(x,t) c0(x-a*t);

y_exact=y(x,T);
y0=c0(x);

figure(1)
plot(x,y_exact,'r')

lambda=a*(dt/dx);
A1=(1+lambda)*ones(1,length(x));
A2=(-lambda)*ones(1,length(x)-1);
A=diag(A1)+diag(A2,-1);
A(1,end)=-lambda;
c_old=y0;

for i=1:length(t)-1
    [L U P]=lu(A);
    y=L\(P*c_old);
    c_new=U\y;
    c_old=c_new;
end

figure(2)
plot(x,c_new,'ro',x,y_exact,'k')

rel_err_inf=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)
rel_err_2=sqrt(dx)*norm(abs(y_exact-c_new))./norm(abs(y_exact))

%%=============crank nicolson============
disp 'crank nicolson'

L=10;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
T=2;
M=100;
% M=50;
% M=10;
dt=T/M;
t=[0:dt:T];
a=1;

c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
y=@(x,t) c0(x-a*t);

y_exact=y(x,T);
y0=c0(x);

figure(3)
plot(x,y_exact,'r')

lambda=a*(dt/dx);
A1=ones(1,length(x));
A2=(lambda)/4*ones(1,length(x)-1);
A3=-(lambda)/4*ones(1,length(x)-1);
A_left=diag(A1)+diag(A3,-1)+diag(A2,1);
A_left(1,end)=-(lambda/4);
A_left(end,1)=(lambda/4);
A_right=diag(A1)+diag(A3,1)+diag(A2,-1);
A_right(1,end)=(lambda/4);
A_right(end,1)=-(lambda/4);
c_old=A_right*y0;

for i=1:length(t)-1
    [L U P]=lu(A_left);
    y=L\(P*c_old);
    c_new=U\y;
    c_old=A_right*c_new;
end

figure(4)
plot(x,c_new,'ro',x,y_exact,'k')

rel_err_inf=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)
rel_err_2=sqrt(dx)*norm(abs(y_exact-c_new))./norm(abs(y_exact))
