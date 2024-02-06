clear all
close all
clc
format long

for i=1:2:100
    v(i)=2
    for j=2:2:100
        v(j)=4
    end
end

f=-1*ones(99,1);
g=ones(99,1);
A=diag(v)+diag(f,1)+diag(g,-1);
B=(-3*A+2*A^2)/(eye(100)+4*A-A^4);
det_B=det(B) %baraye inke matrix B invertible bashe bayad
% determinanesh mokhakef sefr bashe
inv_B=inv(B)

Xer=-1*ones(100,1)
d=B*Xer

x=inv(B)*d
xx=B^-1*d
xxx=B\d
