clear all
close all
clc
format long

L=2*pi;
N=50;
dx=L/N;
x=[dx:dx:L-dx];
x1=[dx/2:dx:L-dx/2];
T=1;
M=4000;
dt=T/M;
t=[0:dt:T];
nu=@(x,t) (1+x)./(1+t);
c0=@(x) sin(8*x);
s=@(x,t) -sin(8*x).*exp(-t)-8.*(cos(8*x).*exp(-t))./(t+1)+64.*(sin(8*x).*exp(-t).*(x+1))./(t+1);
y=@(x,t) exp(-t).*sin(8*x);

y_exact=y(x,T);

figure(1)
plot(x,y_exact)

y0=c0(x);
c_old=y0';

% EXPLICIT EULER
% for i=1:length(t)-1
%     Nu=nu(x1,t(i));
%     mi=Nu.*(dt/dx.^2);
%     S=s(x,t(i));
%     S=S';
%     A1=(1-mi(1:end-1)-mi(2:end));
%     A2=mi(2:end-1);
%     A=diag(A1,0)+diag(A2,1)+diag(A2,-1);
%     c_new=A*c_old+dt.*S;
%     c_old=c_new;
% end

% figure(2)
% plot(x,c_new,'ro',x,y_exact,'k')

% % IMPLISIT EULER
    for i=1:length(t)-1
        Nu=nu(x1,t(i));
        mi=Nu.*(dt/dx.^2);
        S=s(x,t(i));
        S=S';
        A1=(1+mi(2:end)+mi(1:end-1));
        A2=-mi(2:end-1);
        A=diag(A1)+diag(A2,1)+diag(A2,-1);
        c_new=A\c_old+dt.*S;
        c_old=c_new;
    end
    
figure(3)
plot(x,c_new,'ro',x,y_exact,'k')