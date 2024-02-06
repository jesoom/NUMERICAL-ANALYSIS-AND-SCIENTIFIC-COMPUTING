clear all
close all
clc
format long

A=[50 1 3;1 6 2;1 0 1];
B=[50 1;3 20; 10 4];
C=[1 2 3;2 4 5];

D=eye(3)+B*C;
% Inv_D=inv(D)

E=eye(3)+2*A'*A+3*A^3

A1=[D E;-E' D^-1];
I=eye(6);
O=zeros(6);
A2=[I O A1;2*I -A1 I;A1' O 3*I];

size_A1=size(A1);
size_A2=size(A2);
   