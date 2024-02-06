close all
clear all
clc
format long

f=@(x)     abs(sin(x));
xnodes=[-2,-1.3,-pi/4,0,1,pi/2,2,3,4];
ynodes=f(xnodes);

x=[-2:0.01:4];

% y_poly=spline(xnodes,ynodes,x);
y_poly=interp1(xnodes,ynodes,x,'spline');
% az har 2 dastor bala baraye mohasebe
% y_poly mitavan estefade kard
y_exact=f(x);

err_abs_inf=norm(abs(y_exact-y_poly),inf)
err_rel_inf=norm(abs(y_exact-y_poly),inf)/norm(y_exact,inf)

err_abs_2=norm(abs(y_exact-y_poly),2)
err_rel_2=norm(abs(y_exact-y_poly),2)/norm(y_exact,2)

plot(xnodes,ynodes,'ro',x,y_exact,'r',x,y_poly,'b')

% ba moghayese err_abs_inf dar in tamrin va tamrin ghabl mitavan fahmid ke
% cubic interpolation daghigh tar az linear interpolation ast.