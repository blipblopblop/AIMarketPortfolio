clear;clc;
C = [0.15 0.25 0.05];
D = [107 45 70; 500 40 121; 0 60 65]';

% mathematical optimization of problem
cvx_begin 

% defining variables
variable x(3)
cost = C*x;
vitamin = D(1, :)*x;
sugar = D(2, :)*x;
calories = D(3, :)*x;

% objective function
minimize(cost)
% constraints
subject to
5000 <= vitamin <= 10000;
2000 <= calories <= 2250;
sugar <= 1000;
0 <= x <= 10;

cvx_end




