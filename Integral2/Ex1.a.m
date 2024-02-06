clear all
close all
clc
format long

f=@(x) 2.*x+1;
a=0;
b=10;
m=20;

I_exact=integral(f,0,10);
int_mp=int_mp(f,a,b,m);

err_abs_mp=abs(I_exact-int_mp)

int_tra=int_tra(f,a,b,m);

err_abs_tra=abs(I_exact-int_tra)
%% 
g=@(x)  3.*x.^3+2.*x.^2+x+1;
a=0;
b=10;
m=20;

I_exact=integral(g,0,10);
int_simp=int_simp(g,a,b,m);

err_abs_simp=abs(I_exact-int_simp)
int_Gaous=int_Gaous(g,a,b,m)

err_abs_Gaous=abs(I_exact-int_Gaous)


