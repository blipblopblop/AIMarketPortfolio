clear;clc;

% define variables
% intial set up from 4.5
A = [1 1; 0 1];
b = [1/2; 1];
C =[];
for i=1:10
    C_per_step = (A^(i-1))*b;
    C = [C_per_step,C];
end 

n = 10;
cvx_begin quiet

    variables p(n) y(n)
    
    minimize(sum(y))   
    subject to
    C*p == [1;0];
    -y <= p <= y;
cvx_end

P_opt_1 = p;

X_old = [0;0];
X = [0;0];
for i = 1:10
   X_new = A*X_old + b*p(i);
   X = [X, X_new];
   X_old = X_new;
end

Position = X(1,:); Velocity = X(2,:);

figure,
bar(p, 'k'), title('Force vs time'),
figure,
plot(0:1:10,Position, 'r'), title ('Position vs time');
figure;
plot(0:1:10, Velocity, 'g'), title('Velocity vs time');