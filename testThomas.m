clc
clear all

a = [4 4 4 4 4];
b = [1 1 1 1];
c = [1 1 1 1];
d = [10 12 12 12 10];

A = [4 1 0 0 0; 1 4 1 0 0; 0 1 4 1 0; 0 0 1 4 1; 0 0 0 1 4];

[x] = thomas(a, b, c, d)
% [L, U, flag] = LUparziale(A)