clear all
close all
clc
format long

L=10;
N=100;
h=L/N;
x=[0:h:L-h]';
f=@(x) exp(-((x-(L/2))/(L/10)).^2);

y_exact=f(x);
fhat=fft(y_exact)
spec=(abs(fhat/N)).^2;
plot([1:N],spec,'ro');

y_app=[];
for m=[10 20 40 50]
    mask=ones(N,1);
    mask(m+2:N-m,1)=0
    y_app=[y_app ifft(fhat.*mask)]
end

y_app_10=y_app(1:N,1)
y_app_20=y_app(1:N,2)
y_app_40=y_app(1:N,3)
y_app_50=y_app(1:N,4)
y_app_100=ifft(fhat)

abs_err_inf_100=norm(y_exact-y_app_100,inf)
abs_err_2_100=norm(y_exact-y_app_100,2)

abs_err_inf_50=norm(y_exact-y_app_50,inf)
abs_err_2_50=norm(y_exact-y_app_50,2)

abs_err_inf_40=norm(y_exact-y_app_40,inf)
abs_err_2_40=norm(y_exact-y_app_40,2)

abs_err_inf_20=norm(y_exact-y_app_20,inf)
abs_err_2_20=norm(y_exact-y_app_20,2)

abs_err_inf_10=norm(y_exact-y_app_10,inf)
abs_err_2_10=norm(y_exact-y_app_10,2)

p_emp_inf_100_50=-log2((abs_err_inf_100)/(abs_err_inf_50))
p_emp_2_100_50=-log2((abs_err_2_100)/(abs_err_2_50))

