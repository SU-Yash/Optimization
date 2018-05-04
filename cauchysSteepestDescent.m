% Authors ~
    % Suyash Sardar
    
% This function Calculates the minimum of a multi-variable 
% mathematical function using Cauchy's Steepest Descent method.

% Inputs ~
    %[z ~ Fuction to minimize]
    %[s ~ Starting Point]

% Outputs ~
    %[ x2 ~ point corresponding to minimum]

% Trial run for function
% syms x y
% z(x,y) = 4*x^2 + 3*y^2 - 5*x*y - 8*x
% [x2] = cauchysSteepestDescent(z,[0,0])

function [x2] = cauchysSteepestDescent(z,s)

syms x y 
z(x,y)=z;
x1=s;
iter =0;

dfx = diff(z,x);
dfy = diff(z,y);
df=[dfx dfy];
df_check = [1 1];

%while((df_check(1) ~= 0 || df_check(2) ~=0))
while(iter~=20)
iter = iter + 1;
syms x y lambda
%sprintf("Iter: %d", iter);
x2 = x1 - lambda*df(x1(1),x1(2));

eqn_lambda = z(x2(1),x2(2));
deqn_lambda = diff(eqn_lambda);
lambda = solve (deqn_lambda,lambda);

x2 = x1 - lambda*df(x1(1),x1(2));
%disp(x2);
df_check = df(x2(1),x2(2));
%disp(df_check);


disp('---------------------------------------------')
fprintf('Iteration: %d', iter);
fprintf('\n')
fprintf('Lambda: %f',lambda);
fprintf('\n')
fprintf('X:');
disp(double(x2));
fprintf('df_check:');
disp(df_check)
fprintf('\n')
fprintf('\n')

x1=x2;
clear lambda x y;

end
z_min = z(x2(1),x2(2));
fsurf(z);
hold on;
plot3(x2(1),x2(2),z_min, 'o');
fprintf('Z minimum : %f' , double(z_min));
end

