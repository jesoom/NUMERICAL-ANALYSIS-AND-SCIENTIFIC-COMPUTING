clear all
close all
clc
format long

%======== explicit upwind N=100,M=100=======
L=2*pi;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
T=1;
M=100;
dt=T/M;
t=[0:dt:T];
a=-1;

c0=@(x) (1-exp(100.*cos(x)))./(1+exp(100.*cos(x)));
y=@(x,t) c0(x-a*t);

y_exact=y(x,T);
figure(1)
plot(x,y_exact,'r--');

y0=c0(x);
c_old=y0;

lambda=a*(dt/dx);
A1=(1+lambda)*ones(1,length(x));
A2=-(lambda)*ones(1,length(x)-1);
A=diag(A1)+diag(A2,1);
A(end,1)=-lambda;
for i=1:length(t)-1
    c_new=A*c_old;
    c_old=c_new;
end

figure(2)
plot(x,y_exact,'r',x,c_new,'k')

disp 'explicit upwind N=100,M=100'

abs_err_inf=norm(abs(y_exact-c_new),inf)
rel_err_inf=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)

abs_err_2=sqrt(dx)*norm(abs(y_exact-c_new))
rel_err_2=sqrt(dx)*norm(abs(y_exact-c_new))./norm(abs(y_exact))

%======== explicit upwind N=200,M=200=======
L=2*pi;
N=200;
dx=L/N;
x=[0:dx:L-dx]';
T=1;
M=200;
dt=T/M;
t=[0:dt:T];
a=-1;

c0=@(x) (1-exp(100.*cos(x)))./(1+exp(100.*cos(x)));
y=@(x,t) c0(x-a*t);

y_exact=y(x,T);
figure(1)
plot(x,y_exact,'r--');

y0=c0(x);
c_old=y0;

lambda=a*(dt/dx);
A1=(1+lambda)*ones(1,length(x));
A2=-(lambda)*ones(1,length(x)-1);
A=diag(A1)+diag(A2,1);
A(end,1)=-lambda;
for i=1:length(t)-1
    c_new=A*c_old;
    c_old=c_new;
end

figure(2)
plot(x,y_exact,'r',x,c_new,'k')

disp 'explicit upwind N=200,M=200'

abs_err_inf1=norm(abs(y_exact-c_new),inf)
rel_err_inf1=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)

abs_err_21=sqrt(dx)*norm(abs(y_exact-c_new))
rel_err_21=sqrt(dx)*norm(abs(y_exact-c_new))./norm(abs(y_exact))


p_emp=-log2((rel_err_21)/(rel_err_2))
p_emp_inf=-log2((rel_err_inf1)/(rel_err_inf))