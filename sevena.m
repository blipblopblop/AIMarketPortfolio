clear;clc;


%%% mathematical optimization of problem
x_bar = [1.1, 1.35, 1.25, 1.05];
one = ones(1,4);
sigma = [0.2, -0.2, -.12, .02; -.2, 1.4, 0.02, 0; -.12, 0.02, 1, -.4;0.02,0,-.4, 0.2];

R_min = 1.05:0.05:1.35;
risk = zeros(length(R_min),1);

for i=1:length(R_min)
    r_min = R_min(i);

n =4;
cvx_begin quiet
    variable p(n)
    
    minimize(p'*sigma*p)
    
    subject to
    x_bar*p >= r_min;
    one*p == 1;
    p >= 0;

cvx_end

risk(i) = p'*sigma*p;
end


plot(R_min, risk)


