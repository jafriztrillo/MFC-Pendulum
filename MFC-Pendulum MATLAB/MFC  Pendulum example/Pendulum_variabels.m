global g m a b c tau l run_time

% Gravity
g = 9.81; % [m/s^2]
% Pendulum mass
m = 1; % [kg]
% Pendulum length
l = 0.5; % [m]


% Friction coeffiecinet 
k=0.5;

a=g/l;
b=k/m;
c=1/(m*l^2);

% desired set point
delta=pi/4;


tau=0.01; % 3 milliseconds
run_time=30;
