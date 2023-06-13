global k1 k2 k3
% State sapce models

%Making a PID controller as a state space problem
A_p=[0 1 0;0 0 0;1 0 0];
B_p=[0;1;0];
C_p=[1 0];
D_p=0;
% controlability test
r=rank(ctrb(A_p,B_p));

% Specs
Mp = 0.10;
ts = 1.0;
%
v = log(Mp);
zeta = -v/sqrt(pi^2+v^2);
wn = 4/(zeta*ts);

% desired poles
P2 = roots([1 2*zeta*wn  wn^2]);
P = [P2(1)  P2(2) -10*real(P2(1))];%

% P=[-10 -12 -8]; % Arbitary poles
K=acker(A_p,B_p,P);
k1=K(1,1);
k2=K(1,2);
k3=K(1,3);
