% Authors ~
    % Suyash Sardar
    
% This function Calculates the minimum of a multivariable 
% mathematical function using Lagrange's Multipliers. 

% Inputs ~
    %[z ~ Function to minimize]
    %[s ~ Function wrt]

% Outputs ~
    %[ Z_min ~ Minimum value of the function]
    %[X ~ Vector with optimum values of variables]

% Trial run for function
% syms x y
% z(x,y) = 3*x^2 + 4*y^2 , s.t s(x,y) = 2*x-3*y-10
% [Z_min,X]= lagrangeMultiplier(z,s)

function[Z_min,X]= lagrangeMultiplier(z,s)
    
syms x y lambda
z(x,y) = z;
s(x,y) = s;

l = z + lambda * s; 

e1 = diff(l,x);
e2 = diff(l,y);
e3 = diff(l,lambda);

[A,b] = equationsToMatrix(e1,e2,e3);

X = vpa(inv(A)*b);
Z_min = z(X(2),X(3));
disp('---------------------------------------------')
fprintf('x:');
disp(X(2));
fprintf('\n');
disp('---------------------------------------------')
fprintf('y:');
disp(X(3));
fprintf('\n');
disp('---------------------------------------------')
fprintf('lambda:');
disp(X(1));
fprintf('\n');
disp('---------------------------------------------')
fprintf('Minimum of Function:');
disp(Z_min);
fprintf('\n');
disp('---------------------------------------------')
fsurf(z);
hold on;
plot3(X(2),X(3),Z_min, 'o');

end