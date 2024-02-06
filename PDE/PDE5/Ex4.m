clear all
close all
clc
format long

% ===='advection:explicit upwind'====
% ===='defusion:explicit euler'====
L=5;
N=50;
dx=L/N;
x=[0:dx:L-dx]';
T=5;
M=100;
dt=T/M;
t=[0:dt:T]';

%%exact solution
c0=@(x) exp(-((x-L/5)/(L/20)).^2);
ni=0.05;
a=1;
y0=c0(x);
c0hat=fft(y0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=2*pi*k./L;
alfak=-a.*(j).*omegak+ni.*(j).^2.*omegak.^2;
chatk=exp(alfak*T).*c0hat;
y_exact=ifft(chatk);

figure(1)
plot(x,real(y_exact))

%%numerical solution
mi=ni*(dt/dx^2);
A1=(1-2*mi)*ones(1,length(x));
A2=mi*ones(1,length(x)-1);
A_EE=diag(A1)+diag(A2,1)+diag(A2,-1);
A_EE(1,end)=mi;
A_EE(end,1)=mi;
lambda=a*(dt/dx);
A3=(1-lambda)*ones(1,length(x));
A4=(lambda)*ones(1,length(x)-1);
A_Up=diag(A3)+diag(A4,-1);
A_Up(1,end)=lambda;
c_old=y0;
for i=1:length(t)-1
    c_new=A_EE*c_old+A_Up*A_Up*c_old;
    c_new=c_new-c_old;
    c_old=c_new;
end

figure(2)
plot(x,real(y_exact),'ro',x,c_new,'k')
  
