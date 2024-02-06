close all
clear all
clc
format long

f=@(x)    exp(-x.^2);

xnodes=[-0.7,-0.2,0,0.05,0.5,.6,2,3.5,4];
ynodes=f(xnodes);

p=polyfit(xnodes,ynodes,size(xnodes,2)-1);
x=[-0.7:0.001:4];

y_poly=polyval(p,x);
y_exact=f(x);

err_rel_inf=norm(abs(y_exact-y_poly),inf)/norm(y_exact,inf)
err_rel_2=norm(abs(y_exact-y_poly),2)/norm(y_exact,2)

%%

f=@(x)    exp(-(abs(x)).^(1/7));

xnodes1=[-0.7,-0.2,0,0.05,0.5,.6,2,3.5,4];
ynodes1=f(xnodes1);

p1=polyfit(xnodes1,ynodes1,size(xnodes1,2)-1);
x1=[-0.7:0.001:4];

y_poly1=polyval(p1,x1);
y_exact1=f(x1);

err_rel_inf1=norm(abs(y_exact1-y_poly1),inf)/norm(y_exact1,inf)
err_rel_21=norm(abs(y_exact1-y_poly1),2)/norm(y_exact1,2)

figure(1)
plot(x1,y_exact1,'b',x1,y_poly,'r')

% % % chon tabe dar x=0 moshtagh pazir nist pas javabhayi ke midahad ghabel
% % % etemad nist.