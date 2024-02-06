clear all
close all
clc
format long

L=4;
N=50;
dx=L/N;
x=[0:dx:L-dx]';
T=5;
M=100;
dt=T/M;
t=[0:dt:T];
a=1;

c0=@(x) 0*x;
s=@(x) exp(-((x-L/3)./(L/20)).^2);
y0=c0(x);
c0hat=fft(y0);
s0=s(x);
s0hat=fft(s0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi*k)./L;
alfak=-a*(j)*omegak;
sThat=s0hat;
sThat(1)=sThat(1)*T;
sThat(2:N)=sThat(2:N).*((exp(alfak(2:N)*T)-1)./alfak(2:N));
chatk=exp(alfak*T).*c0hat+sThat;
y_exact=ifft(chatk);

figure(1)
plot(x,real(y_exact),'r')

lambda=a*(dt/dx);
A1=(1-lambda)*ones(1,length(x));
A2=(lambda)*ones(1,length(x)-1);
A=diag(A1)+diag(A2,-1);
A(1,end)=lambda;

c_old=c0(x);

for i=1:length(t)-1
    c_new=A*c_old+dt*s0;
    c_old=c_new;
end

figure(2)
plot(x,c_new,'ro',x,real(y_exact),'k')

disp '============explicit upwind N=5 M=100==========='
abs_err_inf=norm(abs(y_exact-c_new),inf)
rel_err_inf=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)

abs_err_2=norm(abs(y_exact-c_new),2)
rel_err_2=norm(abs(y_exact-c_new),2)./norm(abs(y_exact),2)

disp '============explicit upwind N=100 M=200==========='
L=4;
N=100;
dx=L/N;
x=[0:dx:L-dx]';
T=5;
M=200;
dt=T/M;
t=[0:dt:T];
a=1;

c0=@(x) 0*x;
s=@(x) exp(-((x-L/3)./(L/20)).^2);
y0=c0(x);
c0hat=fft(y0);
s0=s(x);
s0hat=fft(s0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi*k)./L;
alfak=-a*(j)*omegak;
sThat=s0hat;
sThat(1)=sThat(1)*T;
sThat(2:N)=sThat(2:N).*((exp(alfak(2:N)*T)-1)./alfak(2:N));
chatk=exp(alfak*T).*c0hat+sThat;
y_exact=ifft(chatk);

figure(1)
plot(x,real(y_exact),'r')

lambda=a*(dt/dx);
A1=(1-lambda)*ones(1,length(x));
A2=(lambda)*ones(1,length(x)-1);
A=diag(A1)+diag(A2,-1);
A(1,end)=lambda;

c_old=c0(x);

for i=1:length(t)-1
    c_new=A*c_old+dt*s0;
    c_old=c_new;
end

figure(2)
plot(x,c_new,'ro',x,real(y_exact),'k')


abs_err_inf1=norm(abs(y_exact-c_new),inf)
rel_err_inf1=norm(abs(y_exact-c_new),inf)./norm(abs(y_exact),inf)

abs_err_21=norm(abs(y_exact-c_new),2)
rel_err_21=norm(abs(y_exact-c_new),2)./norm(abs(y_exact),2)

p_emp=-log2((rel_err_21)/(rel_err_2))