close all
clear all
clc
format long

f=@(x)        10*exp(-2.*x.^2);
xnodes=[-2,-1,-1.3,-pi/4,-0.2,0,1,pi/2,2,2.5,3,3.5,4];
ynodes=f(xnodes);

p=polyfit(xnodes,ynodes,size(xnodes,2)-1);
x=[-2:0.01:4];

y_poly=polyval(p,x);
y_exact=f(x);

err_abs_inf=norm(abs(y_exact-y_poly),inf)
err_rel_inf=norm(abs(y_exact-y_poly),inf)/norm(y_exact,inf)

err_abs_2=norm(abs(y_exact-y_poly),2)
err_rel_2=norm(abs(y_exact-y_poly),2)/norm(y_exact,2)

figure(1)
plot(xnodes,ynodes,'ro',x,y_exact,'r',x,y_poly,'b')

y_poly_b=interp1(xnodes,ynodes,x);
y_exact=f(x);

err_abs_inf_b=norm(abs(y_exact-y_poly_b),inf)
err_rel_inf_b=norm(abs(y_exact-y_poly_b),inf)/norm(y_exact,inf)

err_abs_2_b=norm(abs(y_exact-y_poly_b),2)
err_rel_2_b=norm(abs(y_exact-y_poly_b),2)/norm(y_exact,2)

figure(2)
plot(xnodes,ynodes,'ro',x,y_exact,'r',x,y_poly_b,'b')

y_poly_c=interp1(xnodes,ynodes,x,'pchip');
y_exact=f(x);

err_abs_inf_c=norm(abs(y_exact-y_poly_c),inf)
err_rel_inf_c=norm(abs(y_exact-y_poly_c),inf)/norm(y_exact,inf)

err_abs_2_c=norm(abs(y_exact-y_poly_c),2)
err_rel_2_c=norm(abs(y_exact-y_poly_c),2)/norm(y_exact,2)

figure(3)
plot(xnodes,ynodes,'ro',x,y_exact,'r',x,y_poly_c,'b')

y_poly_d=interp1(xnodes,ynodes,x,'spline');
y_exact=f(x);

err_abs_inf_d=norm(abs(y_exact-y_poly_d),inf)
err_rel_inf_d=norm(abs(y_exact-y_poly_d),inf)/norm(y_exact,inf)

err_abs_2_d=norm(abs(y_exact-y_poly_d),2)
err_rel_2_d=norm(abs(y_exact-y_poly_d),2)/norm(y_exact,2)

figure(4)
plot(xnodes,ynodes,'ro',x,y_exact,'r',x,y_poly_d,'b')