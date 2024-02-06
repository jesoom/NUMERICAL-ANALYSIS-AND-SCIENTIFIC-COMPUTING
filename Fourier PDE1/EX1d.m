clear all
close all
clc
format long

L=10;
N=200;
dx=L/N;
x=[0:dx:L-dx]';
T=5;
m=100;
dt=T/m;
t=[0:dt:T]';

c02=@(x) (exp(100*sin(x-2))-1)./(exp(100*sin(x-2))+1);
nu=0.01;
y0=c02(x);
c0hat=fft(y0);
k=[0,1:N/2,-N/2+1:-1]';
omegak=(2*pi.*k)./L;
alfak=nu*(j)^2*omegak.^2;
chatk=exp(alfak.*T).*c0hat;
y_exact=ifft(chatk);
