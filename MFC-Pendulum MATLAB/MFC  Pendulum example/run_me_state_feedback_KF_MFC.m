clear all
close all
clc

%% Load Pendulum variabels
run('Pendulum_variabels');

%% Load State space control variabels
run('Pendulum_control_var_MFC.m')

%% Load KF variabels
run('Pendulum_KF_var')

%% run systems
% Intial values
states=zeros(3,1);
outputs=zeros(3,1);
u=zeros(1,1);
u_mfc=zeros(1,1);
int_value=0;
final_value=pi/4;
step_start=(10/tau);
% ref=ref_genrate(step_start,int_value,final_value,run_time);
ref=ref_genrate(step_start,int_value,final_value);
x_hat=zeros(3,1);
SigmaV=0;
P_plus_k=P1;
prev_dif=0;

e = 0;
e_dot = 0;
u_i = 0;
global k1 k2 k3



for t=2:1:run_time/tau
    
    [outputs(:,t),states(:,t)]=Pend_sys_non_linear(outputs(:,t-1),u_mfc(:,t-1),ref(:,t)); %Adding noise to the system would be at outputs

    [e(:,t),e_dot(:,t)] = calc_error_mfc_state(outputs,ref,t,e(:,t-1));

    u_i = u_i + e(:,t)*tau;  
    u(:,t) = k2*e_dot(:,t) + k1*e(:,t);

   % u(:,t)=Pend_control_cal_MFC(e(:,t),e_dot(:,t),u_i);
    
    % Calculate expected F(non-linearities)
    exp_F(:,t)=cal_non(outputs(:,t));
    
    % Standard EKF implementation
    [x_hat(1,t),x_hat(2,t),x_hat(3,t),P_plus_k(:,:,t),L] = EKF(outputs(1,t),outputs(2,t),x_hat(3,t-1),u_mfc(:,t-1),P_plus_k(:,:,t-1),Q1,SigmaV,tau,beta);
    
    % MFC implementation
    [u_mfc(:,t),prev_dif(:,t)]=MFC_cal(x_hat(3,t),ref,u(:,t),t,prev_dif(:,t-1),beta);
   
end

run('plot_me.m')
