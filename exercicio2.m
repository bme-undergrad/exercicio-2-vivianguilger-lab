function [blendA, blendB] = exercicio2(NG)

NG = 1

% nao alterar: inicio
es = 1;
imax = 20;
pkg load optim
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%


% C = 10*blendA + 12*blendB       %custo
f = [10, NG*2]'

%0.30*blendA + 0.20*blendB = 15  %condição do polietileno
%0.20*blendA + 0.25*blendB = 10  %condição de PLA
%0.25*blendA + 0.30*blendB = 12  %condição de polipropileno

x0 = [1, 1]

% A.x = b
A = [-0.30, -0.20;
     -0.20, -0.25;     
     -0.25, -0.30];
b = [-15;
     -10;
     -12];

% Aeq.x = beq
Aeq = [];
beq = [];

ub = [20; 50];
lb = [0; 0];

x = linprog(f, A, b, Aeq, beq, lb, ub)
x = x'

% mantenha essas duas linhas finais
blendA = x(1);
blendB = x(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
