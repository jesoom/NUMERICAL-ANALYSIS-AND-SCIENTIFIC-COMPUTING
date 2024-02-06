clear all
close all
clc
format long

f=@(x) cos(4.*x).*exp(-x);
a=0;
b=5;
int_exact=integral(f,a,b);

% integral
mp_int=[];
tr_int=[];
simp_int=[];
Gaous_int=[];

for m=[20 40 80 160]
    mp_int=[mp_int int_mp(f,a,b,m)]
    tr_int=[tr_int int_tra(f,a,b,m)]
    simp_int=[simp_int int_simp(f,a,b,m)]
    Gaous_int=[Gaous_int int_Gaous(f,a,b,m)]
end

% relative error
rell_mp=[];
rell_tr=[];
rell_simp=[];
rell_Gaous=[];

for i=[1:4]
    rell_mp=[rell_mp abs((int_exact-mp_int(i))/int_exact)]
    rell_tr=[rell_tr abs((int_exact-tr_int(i))/int_exact)]
    rell_simp=[rell_simp abs((int_exact-simp_int(i))/int_exact)]
    rell_Gaous=[rell_Gaous abs((int_exact-Gaous_int(i))/int_exact)]
end

% convergence order
p_emp_mp=[];
p_emp_tr=[];
p_emp_simp=[];
p_emp_Gaous=[];

for i=[1:3]
    p_emp_mp=[p_emp_mp  -log2(rell_mp(i+1)/rell_mp(i))]
    p_emp_tr=[p_emp_tr  -log2(rell_tr(i+1)/rell_tr(i))]
    p_emp_simp=[p_emp_simp  -log2(rell_simp(i+1)/rell_simp(i))]
    p_emp_Gaous=[p_emp_Gaous  -log2(rell_Gaous(i+1)/rell_Gaous(i))]
end