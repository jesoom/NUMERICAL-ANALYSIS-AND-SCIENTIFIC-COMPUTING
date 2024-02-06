clear
clc
n=1:20 ;
A=cell(1,20)
Dominant=zeros(20,1) ;
Symmetric=zeros(20,1) ;
Eigs=zeros(20,1) ;
for i=1:length(n)
    A{i}=hilb(n(i)) ;
    y=A{i}
    %diagonally dominant?
    a=0 ;
    for w=1:size(y,1)
        if abs(y(w,w))>(sum(abs(y(w,:)))-abs(y(w,w)))
            a=a+1 ;
        end    
    end
    a
    if a==n(i) 
        Dominant(i)=1 ;
    end
    %Symmetricity
    if y==y'
            Symmetric(i)=1 ;
    end
    %Are Eigenvalues positive?
    Eigy=eig(y) ;
    if Eigy>0
        Eigs(i)=1
    end
end
Dominant
Symmetric
Eigs
%a computing b
x_ex=cell(length(n),1) ;
    for i=1:length(n)
     x_ex{i}=2*ones(n(i),1) ;
    end
b=cell(length(n),1) ;
    for i=1:length(n)
     b{i}=A{i}*x_ex{i} ;
    end
%b Solving the equations cholesky
U=cell(length(n),1) ;
for i=1:12
    U{i}=chol(A{i}) ;
end
q=cell(12,1) ;
for i=1:12
    q{i}=U{i}'\b{i} ;
end
x=cell(12,1) ;
for i=1:12
    x{i}=U{i}\q{i} ;
end
%c Errors
Rel_err_two=zeros(12,1) ;
for i=1:12
    Rel_err_two(i)=norm(x_ex{i}-x{i})/norm(x_ex{i});
end
Rel_err_inf=zeros(12,1) ;
for i=1:12
    Rel_err_inf(i)=norm(x_ex{i}-x{i},"inf")/norm(x_ex{i},"inf") ;
end
Rel_err_two
Rel_err_inf
%Why at n=12, error is a lot??
figure()
semilogy(Rel_err_two)
figure()
semilogy(Rel_err_inf)
