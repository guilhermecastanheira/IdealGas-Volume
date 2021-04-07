clear all
clc

% Dioxido de carbono
% ---------------------------------------------------
p = 50.0;   % atm
T = 373.0;  % K
n = 1.0;    % mol
a = 3.61;   % atm (L/mol)^2
b = 0.0428; % L/mol

% volune van der Waals
v1 = vanderwaals(p,T,n,a,b);

% Helio
% ---------------------------------------------------
p = 120.0;  % atm
T = 696.0;  % K
n = 20.0;   % moles
a = 0.0341; % atm (L/mol)^2
b = 0.0237; % L/mol

% volune van der Waals
v2 = vanderwaals(p,T,n,a,b);


% Acetileno
% ---------------------------------------------------
p = 1.2;     % atm
T = 298.15;  % K
n = 1.25;    % moles
a = 4.4569;  % atm (L/mol)^2


% volune van der Waals
v3 = vanderwaals(p,T,n,a,b);



% Nitrometano
% ---------------------------------------------------
p = 0.4868;  % atm
T = 300.15;  % K
n = 4.0;     % moles
a = 16.9553; % atm (L/mol)^2
b = 0.1041;  % L/mol

% volune van der Waals
v4 = vanderwaals(p,T,n,a,b);




% Forma reduzida
% ---------------------------------------------------
R = 0.0821;
p = 1.0;   % atm
T = 1.0;  % K
n = 8/(3*R);    % mol
a = 3/(n^2);   % atm (L/mol)^2
b = 1/(3*n); % L/mol

% volune van der Waals
v5 = vanderwaals(p,T,n,a,b);