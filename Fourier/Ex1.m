clear all
close all
clc
format long

L=10;
N=100;
% N=10;
% N=20;
% N=40;
% N=50;
h=L/N;
x=[0:h:L-h];
f=@(x)  sin((4*pi*x)/L);
y_exact=f(x);
fhat=fft(y_exact);
spec=(abs(fhat/N)).^2
plot([1:N],spec,'ro')

y