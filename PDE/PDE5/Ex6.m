clear all
close all
clc
format long

%%exact solution
L=4;
N=50;
dx=L/N;
x=[0:dx:L-dx]';
T=5;
% M=100;
M=200;
dt=T/M;
t=[0:dt:T];
a=2;
c0=@(x) 0*x;
ni=1/100;
s=@(x) exp(-((x-L/4)/(L/20)).^2);
y0=c0(x);
c0hat=fft(y0);
s0=s(x);
s0hat=fft(s0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi*k)./L;
alfaka=-a*(j)*omegak+ni*(j)^2*omegak.^2;
sThat=s0hat;
sThat(1)=sThat(1)*T;
sThat(2:N)=sThat(2:N).*((exp(alfaka(2:N)*T)-1)./alfaka(2:N));
chatk=exp(alfaka*T).*c0hat+sThat;
y_exact=ifft(chatk);

figure(1)
plot(x,real(y_exact));

%%numerical solution
mi=ni*(dt/dx.^2);
A1=(1-2*mi)*ones(1,length(x));
A2=mi*ones(1,length(x)-1);
A_EE=diag(A1)+diag(A2,1)+diag(A2,-1);
A_EE(1,end)=mi;
A_EE(end,1)=mi;
lambda=a*(dt/dx);
A3=(1-lambda)*ones(1,length(x));
A4=lambda*ones(1,length(x)-1);
A_UP=diag(A3)+diag(A4,-1);
A_UP(1,end)=lambda;
c_old=y0;

for i=1:length(t)-1
    c_new=A_EE*c_old+A_UP*c_old+dt*s0;
    c_new=c_new-c_old;
    c_old=c_new
end

figure(2)
plot(x,real(y_exact),'ro',x,c_new,'k')

if lambda/2+ni<=0.5
    disp 'stable'
else disp 'unstable'
end

% mibinim ke ba M=100 tabe ma unstable mshe
% va nemodarha dorost rasm nmishan, vali
% zamani ke M=200 entekhab mkonim tabe unstable
% mshe va nemodarha dorost rasm mishan