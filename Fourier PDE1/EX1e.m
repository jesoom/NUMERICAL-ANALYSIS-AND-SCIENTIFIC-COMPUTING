clear all
close all
clc
format long

L=10;
T=5;
N=200;
m=100;
dx=L/N;
x=[0:dx:L-dx]';
dt=T/m;
t=[0:dt:T-dt]';

c01=@(x) 0*exp(-((x-(L/2))/(L/10)).^2);
% c02=@(x) (exp(100*sin(t-2))-1)./(exp(100*sin(t-2))+1);
s=@(x) exp(-((x-(L/3))./(L/20)).^2);
u=0.5;
y0=c01(x);
c0hat=fft(y0);
s0=s(x);
s0hat=fft(s0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi*k)./L;
alfak=-u*(j)*omegak;
sThat=s0hat;
sThat(1,1)=sThat(1,1)*T;
sThat(2:N,1)=sThat(2:N,1).*(exp(alfak(2:N,1)*T)-1)./alfak(2:N,1);
chatk=exp(alfak*T).*c0hat+sThat;
y_exact=ifft(chatk);

