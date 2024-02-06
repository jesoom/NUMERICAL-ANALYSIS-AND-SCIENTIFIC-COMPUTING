clear all
close all
clc
format long

A=[50 2 3;1 6 2;1 0 1];
B=[50 1;3 20; 10 4];
C=[1 2 3;2 4 5];

D=eye(3)+B*C;

A==A';
As=(A+A')/2;
Aas=(A-A')/2;
As==As';
Aas==-Aas';

A*D==D*A;
commutator=A*D-D*A

E=eye(3)+2*A'*A+3*A^3
det_E=det(E) %agar determinan mokhalef sefr bod,matrix invertible hast.
inverse_E=inv(E)

abs_err=(abs((E^-1)-inverse_E))
