clc
clear all

errChol = zeros(1, 49);
errGauss = zeros(1, 49);

for n=2:50
    B = rand(n);

    A = B' * B;
    xEsatta = (1:n)';
    b = A * xEsatta;

    [L, flag] = chol(A, "lower");
    [yChol, flagChol] = Lsolve(L, b);
    [xChol, flagChol] = Usolve(L', yChol);

    [L, U, flagGauss] = LUnopivot(A);
    [xGauss, flagGauss] = LUsolve(L, U, eye(n), b);

%     xChol
%     xGauss
    errChol(n-1) = norm(xChol - xEsatta)/norm(xEsatta);
    errGauss(n-1) = norm(xGauss - xEsatta)/norm(xEsatta);
end


figure
semilogy(1:n-1, errChol, 'r-', 1:n-1, errGauss, 'b:')
legend('Erel Cholensky', 'Erel Gauss', 'Location', 'northwest')


