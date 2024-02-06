clear all
close all
clc
format long

I1=[1 1 1 1 1];
I2=[1 1 1 1];
I3=[1 1 1];
I4=[1 1];
I5=[1];
A=diag(I1)+2*diag(I2,1)+2*diag(I2,-1)+3*diag(I3,2)+3*diag(I3,-2)+4*diag(I4,3)+4*diag(I4,-3)+5*diag(I5,4)+5*diag(I5,-4);

r=[1 2 3 4 5];
toeplitz=toeplitz(r);

U=triu(A,-2)
L=tril(A,2)

UU=triu(A)
LL=tril(A)

Det_UU=det(UU)
Det_LL=det(LL)
eigen_UU=eig(UU)
eigen_LL=eig(LL)