% Authors ~
    % Suyash Sardar
    
% This function calculates the minimum/maximum of a single 
% variable mathematical function using Newton Raphson Method

% Inputs ~
    %[z ~ Fuction to minimize]
    %[x1 ~ Starting Point]
    %[e ~ threshold value of error]
% Outputs ~
    %[ x2 ~ point corresponding to minimum/maximum]

% Trial run for function
% syms x 
% z(x) = x^2 + -5*x + 4
% [x2] = newtonRaphson(z,1,0.001)

function[x2] = newtonRaphson(z,x1,e)
syms x;
z(x) = z;
p=[];
iter = 0;

dz = diff(z,x);
dz_2 = diff(z,x,2);
d =dz/dz_2;
er = 100;
disp('---------------------------------------------')
while(er > e)
iter = iter +1;
x2 = double(x1 - d(x1));
p = [p x2];
er = (x2-x1)/x1;
x1 = x2;
fprintf('After Iteration: %d', iter);
fprintf('\n')
fprintf('x:');
disp(x2);
fprintf('\n');
fprintf('Error:');
disp(er);
fprintf('\n');
disp('---------------------------------------------')
end

plot(p,'-o');
fprintf('\n');
fprintf('\n');
fprintf('Solution is: ');
disp(x2);
end
