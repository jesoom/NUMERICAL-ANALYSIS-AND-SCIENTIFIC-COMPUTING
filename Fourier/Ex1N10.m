clear all
close all
clc
format long

L=10;
N=100;
h=L/N;
x=[0:h:L-h];
f=@(x) exp(-((x-(L/2))/(L/10)).^2);

y_exact=f(x);
fhat=fft(y_exact);
spec=(abs(fhat/N)).^2;
plot([1:N],spec,'ro')

y_app=[];
for nmodes=[10 20 40 50]
    mask=ones(N,1);
    mask(nmodes+2:N-nmodes,1)=0;
    y_app=[y_app ifft(fhat.*mask)
end



