global R R2 Q1 Q2
var_Q=1e-6; % processes noise
var_R=1e-6; % measurement noise
numb_sensor=2;
% Initial covariance
% P = 0.1*eye(4);
% Q= piecewise_white_noise(4,var_Q,tau);
Q1= var_Q*eye(3);
Q2 =var_Q*eye(2);
P1= var_R*eye(3);

R=var_R*eye(2*numb_sensor,2*numb_sensor);
R2=var_R*eye(2,2);

% MFC KF
A_k=[1 tau tau^2*0.5;
    0 1 tau;
    0 0 1];
beta=c;
B_k=[0.5*(tau^2)*beta;
    tau*beta;
    0];
C_k=[1 0 0];
D_k=0;