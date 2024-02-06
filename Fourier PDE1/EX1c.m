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

% c01=@(x) exp(-((x-(L/2))/(L/10)).^2);
c02=@(x) (exp(100*sin(x-2))-1)./(exp(100*sin(x-2))+1);

u=0.5;
gama=0
nu=0;

y0=c02(x);
c0hat=fft(y0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi.*k)./L;
alfak=-u*(j)*omegak;
chatk=exp(alfak.*T).*c0hat;
y_exact=ifft(chatk);

