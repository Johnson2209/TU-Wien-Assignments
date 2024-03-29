n = 500;     %change n to get different matrices
max_iter = n;   
A = gallery('tridiag',n,-1,2,-1);
b = ones(n,1);
[x1,flag,relres,iter,resvec] = pcg(A,b,[],max_iter);
assert(flag==0)
%% Plot for n
figure(1)
clf
loglog(resvec,'c-','LineWidth',2)
xlabel('Iterations')
ylabel('Residuals')
title('PCG of Model Problem 1')

%% Plots for different n
res = [];
for n = 2.^(10:13) %[1024 2048 4096 8192]
    max_iter = 1; 
    A = gallery('tridiag',n,-1,2,-1);
    b = ones(n,1);
    [x2,flag,relres,iter,resvec] = pcg(A,b,[],max_iter);
%     assert(flag==0)
    res(end+1) = relres;
end
figure(2)
clf
semilogy(2.^(10:13),res,'LineWidth',1.5)
xlabel('Iterations')
ylabel('Relative Residuals')
title('Relative residual plots')`a