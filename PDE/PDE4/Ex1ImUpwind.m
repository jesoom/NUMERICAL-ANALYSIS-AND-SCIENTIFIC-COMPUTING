clear all
close all
clc
format long

%%%%%%%%%%%%%%%%%%%%%%%%%'Implicit upwind method'%%%%%%%%%%%%%%%%%%%%%%%%

disp '===========N=100,M=100============='
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

figure(1)
plot(x,y_exact)

landa=a*(dt/dx);
A1=(1+landa)*ones(1,length(x));
A2=-(landa)*ones(1,length(x)-1);
A=diag(A1,0)+diag(A2,-1);

y0=c0(x);
c_old=y0;

for i=1:length(t)-1
    [L U P]=lu(A);
    y=L\(P*c_old);
    c_new=U\y
    c_old=c_new;
end

figure(2)
plot(x,y_exact,'r',x,c_new,'k')

rel_err_inf=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)
rel_err_2=sqrt(dx)*norm(abs(y_exact-c_new))./norm(abs(y_exact))

disp '===========N=200,M=200============='
L1=10;
N1=200;
dx1=L1/N1;
x1=[0:dx1:L1-dx1]';
T1=2;
M1=200;
% M=50;
% M=10;
dt1=T1/M1;
t1=[0:dt1:T1];
a1=1;

c01=@(x) 10*exp(-((x-L1/2)./(L1/10)).^2);
y1=@(x,t) c01(x-a1*t);

y_exact1=y1(x1,T1);

figure(3)
plot(x1,y_exact1)

landa1=a1*(dt1/dx1);
A3=(1+landa1)*ones(1,length(x1));
A4=-(landa1)*ones(1,length(x1)-1);
A5=diag(A3,0)+diag(A4,-1);

y01=c01(x1);
c_old1=y01;

for i=1:length(t1)-1
    [L U P]=lu(A5);
    y=L\(P*c_old1);
    c_new1=U\y;
    c_old1=c_new1;
end

figure(4)
plot(x1,y_exact1,'r',x1,c_new1,'k')


rel_err_inf1=norm(abs(y_exact1-c_new1),inf)./norm(abs(y_exact1),inf)
rel_err_21=sqrt(dx1)*norm(abs(y_exact1-c_new1))./norm(abs(y_exact1))

p_emp1=-log2(rel_err_inf1/rel_err_inf)
p_emp2=-log2(rel_err_21/rel_err_2)

