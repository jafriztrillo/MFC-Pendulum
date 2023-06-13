function [x1_hat,x2_hat,x3_hat,P_plus_k,L] = EKF(x1,x2,x3,u,P_plus_k,Q,SigmaV,dt,beta)

% Process noise covariance
%  Q = Q;
% SigmaW = diag([Q 0 0]);

% Measurement noise covariance
% R = 5e-8;
% SigmaV=R;
xbar = zeros(3,1);

%% Initial Function Creation for Prediction
   
f ={@(y1,y2,y3,t) ((y1+y2*t +y3*(t^2)*0.5 + 0.5*beta*(t^2)*u));
        @(y1,y2,y3,t) (y2+(y3)*t+beta*t*u);
        @(y1,y2,y3,t) (y3);};

xbar = [f{1}(x1,x2,x3,dt);
        f{2}(x1,x2,x3,dt);
        f{3}(x1,x2,x3,dt);];

Aa = [1 dt (dt^2)/2;
        0 1 dt; 
        0 0 1];

%    z1[k+1] = z1[k] + Ts*x2[k] + 1/2 * Ts^2 * (F[k] + Beta * u[k])
%    z2[k+1] = z2[k] + Ts*(F[k] + Beta * u[k])
%    z3[k+1] = z3[k]
%    Here z3[k] = F[k] because we need to estimate F[k] which requires a
%    new state to be introduced

%% Step A: State prediction
  
%A_hat = eye(3,3)+Aa*dt+(Aa^2*dt^2)/factorial(2)+(Aa^3*dt^3)/factorial(3);%+...
        %(Aa^4*h^4)/factorial(4)+(Aa^5*h^5)/factorial(5) +...
        %(Aa^6*h^6)/factorial(6);

%Jake Note: Not sure why Danial included up to order 6 if the regular version works

A_hat=Aa; %Initialize the system state estimate. Here the best guess is the intialized A vector
%% EKF Step B: Error covariance time update

P_minus_k = A_hat * P_plus_k * A_hat' + Q; %P[k](-) = A * P[k-1](+) * A' + Cw
% P_minus_k= A_hat*P_plus_k*A_hat' + B_hat*SigmaW*B_hat';

%% EKF Step C: Output Prediction
% Note: You need to insert your system's h(...) = x1+  x2^3 + v equation here
%  Chat = [1 0 0;0 1 0;0 0 1]; % derivative of h wrt x
%  Dhat = [1 0 0;0 1 0;0 0 1]; % derivative of h wrt v
%  C_temp=[0 0 0;-xbar(2)*T -xbar(2)*T -xbar(2)*T; 1 1 1]+A_hat*delta;
%  C_temp=[0 -x2*T 1;0 -x2*T 1;0 -x2*T 1]+A_hat*delta;
%  C_temp=[0;-x2*T; 1]+A_hat*delta;
%  C_temp=delta;   
%  Chat = [1 0 0;0 1 0;0 0 1]; % derivative of h wrt x

% y[k](hat) = C * x[k](hat)(-) + D * u[k] 
% Jake Note: We rarely use a feedforward controller so D can be set to zero

Chat = [1 0 0;
        0 1 0]; 


%  Dhat = [1 0 0;0 1 0]; % derivative of h wrt v
Dhat = 0;
% yhat = Chat*xhat;
yhat = Chat*xbar + Dhat*u;

 
%% CORRECTIONS

%% EKF Step D: Compute Kalman gain matrix

% L[k] = P[k](-) * C(hat)' * (C(hat) * P[k](-) * C(hat)' + R
% Note: R is the measurement covariance matrix
L =  P_minus_k*Chat' / (Chat*P_minus_k*Chat' + Dhat*SigmaV*Dhat');
  
%% EKF Step E: State estimate measurement update

% x[k](hat)(+) = x[k](hat)(-) - L[k]*(y[k] - Cx[k](-) - D*u[k])
ytrue=[x1;
       x2];
x_plus_hat = xbar + L*(ytrue - yhat);

%% EKF Step F: Error covariance measurement update

%Not sure about last step
P_plus_k = P_minus_k - L*Chat*P_minus_k;

x1_hat=x_plus_hat(1,1);
x2_hat=x_plus_hat(2,1);
x3_hat=x_plus_hat(3,1);
  
   

 


