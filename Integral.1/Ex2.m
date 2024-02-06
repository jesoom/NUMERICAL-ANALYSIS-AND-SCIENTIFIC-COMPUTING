clear all
close all
clc
format long
f=@(x) sqrt(x);
a=0;
b=2;
I_exact=4*sqrt(2)/3;
I_mp=(b-a)*f((a+b)/2);
I_tr=(b-a)*(f(a)+f(b))/2;

err_abs_mp=abs(I_exact-I_mp)
err_rel_mp=abs(I_exact-I_mp)/I_exact

err_abs_tr=abs(I_exact-I_tr)
err_rel_tr=abs(I_exact-I_tr)/I_exact
%%
f=@(x) sqrt(x);
a1=0;
b1=1;
I_exact1=2/3;
I_mp1=(b1-a1)*f((a1+b1)/2);
I_tr1=(b1-a1)*(f(a1)+f(b1))/2;

err_abs_mp1=abs(I_exact1-I_mp1)
err_rel_mp1=abs(I_exact1-I_mp1)/I_exact1

err_abs_tr1=abs(I_exact1-I_tr1)
err_rel_tr1=abs(I_exact1-I_tr1)/I_exact1
%%
f=@(x) sqrt(x);
a2=0;
b2=1/2;
I_exact2=1/(3*sqrt(2));
I_mp2=(b2-a2)*f((a2+b2)/2);
I_tr2=(b2-a2)*(f(a2)+f(b2))/2;

err_abs_mp2=abs(I_exact2-I_mp2)
err_rel_mp2=abs(I_exact2-I_mp2)/I_exact2

err_abs_tr2=abs(I_exact2-I_tr2)
err_rel_tr2=abs(I_exact2-I_tr2)/I_exact2

f_0_2=[err_abs_mp;err_rel_mp;err_abs_tr;err_rel_tr]
f_0_1=[err_abs_mp1;err_rel_mp1;err_abs_tr1;err_rel_tr1]
f_0_1_2=[err_abs_mp2;err_rel_mp2;err_abs_tr2;err_rel_tr2]
type_err=['err_abs_mp';'err_rel_mp';'err_abs_tr';'err_rel_tr']
T=table(type_err,f_0_2,f_0_1,f_0_1_2)

% be dalil inke moshtagh dovom tabe dar noghte javab nadarad, 
% be maghadir khata ha far in ravesh etemadi nist
% va be onvan yek rahe hal mitavan be jaye baze 0 ta 2 az 
% baze 0.1 ta 2 estefade kard.