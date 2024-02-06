clear all
close all
clc
format long

B=10
f=@(x)  B*x.^3.*sin(B*x)-3*x.^2.*cos(B*x)-B*sin(B*x);
a=0;
b=1;
int_exact=-1;

int_gauss=[];

for m=[20,40]
    int_gauss=[int_gauss int_Gaous(f,a,b,m)]
end

rell_err_gauss=[];
for i=[1,2]
    rell_err_gauss=[rell_err_gauss abs((int_exact)-(int_gauss(i)))/abs(int_exact)]
end

p_emp_gauss=-log2((rell_err_gauss(2))/(rell_err_gauss(1)))