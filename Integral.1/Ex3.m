clear all
close all
clc
format long

f=@(x) x.^3+x.^2-1;
a1=0;
b1=1;
xm=(a1+b1)/2;
I_exact1=-5/12;
I_simp1=(b1-a1)*((f(a1)+4*f(xm)+f(b1))/6);
x_plus1=((b1+a1)/2)+((b1-a1)/(2*sqrt(3)));
x_minus1=((b1+a1)/2)-((b1-a1)/(2*sqrt(3)));
I_gaus1=(b1-a1)*((f(x_plus1)+f(x_minus1))/2);
I_mp1=(b1-a1)*f((a1+b1)/2);
I_tr1=(b1-a1)*((f(a1)+f(b1))/2);

err_abs_simp1=abs(I_exact1-I_simp1)
err_rel_simp1=abs(I_exact1-I_simp1)/abs(I_exact1)

err_abs_gaus1=abs(I_exact1-I_gaus1)
err_rel_gaus1=abs(I_exact1-I_gaus1)/abs(I_exact1)

err_abs_mp1=abs(I_exact1-I_mp1)
err_rel_mp1=abs(I_exact1-I_mp1)/abs(I_exact1)

err_abs_tr1=abs(I_exact1-I_tr1)
err_rel_tr1=abs(I_exact1-I_tr1)/abs(I_exact1)
%%
f=@(x) x.^3+x.^2-1;
a2=0;
b2=1/2;
xm2=(a2+b2)/2;
I_exact2=integral(f,0,1/2);
I_simp2=(b2-a2)*((f(a2)+4*f(xm2)+f(b2))/6);
x_plus2=((b2+a2)/2)+((b2-a2)/(2*sqrt(3)));
x_minus2=((b2+a2)/2)-((b2-a2)/(2*sqrt(3)));
I_gaus2=(b2-a2)*((f(x_plus2)+f(x_minus2))/2);
I_mp2=(b2-a2)*f((a2+b2)/2);
I_tr2=(b2-a2)*((f(a2)+f(b2))/2);

disp('simp2')
err_abs_simp2=abs(I_exact2-I_simp2)
err_rel_simp2=abs(I_exact2-I_simp2)/abs(I_exact2)

disp('gaus2')
err_abs_gaus2=abs(I_exact2-I_gaus2)
err_rel_gaus2=abs(I_exact2-I_gaus2)/abs(I_exact2)

disp('mp2')
err_abs_mp2=abs(I_exact2-I_mp2)
err_rel_mp2=abs(I_exact2-I_mp2)/abs(I_exact2)

disp('tr2')
err_abs_tr2=abs(I_exact2-I_tr2)
err_rel_tr2=abs(I_exact2-I_tr2)/abs(I_exact2)

f_0_1=[err_abs_simp1;err_rel_simp1;err_abs_gaus1;err_rel_gaus1;err_abs_mp1;err_rel_mp1;err_abs_tr1;err_rel_tr1];
f_0_1_2=[err_abs_simp2;err_rel_simp2;err_abs_gaus2;err_rel_gaus2;err_abs_mp2;err_rel_mp2;err_abs_tr2;err_rel_tr2];
type_err=['abs_simp';'rel_simp';'abs_gaus';'rel_gaus';'abs_midp';'rel_midp';'abs_trap';'rel_trap'];
T=table(type_err,f_0_1,f_0_1_2)