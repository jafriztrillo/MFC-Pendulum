function [u_mfc,prev_dif_1]=MFC_cal(cal_F,ref,u,t,prev_dif,beta)
global tau


%Try adding in a saturation limit 

%Also do a PI controller / PD controller
dif_t1=(ref(:,t)-ref(:,t-1))./tau;
dif_t2=(dif_t1-prev_dif)./tau;
prev_dif_1=dif_t1;


%The model free control implementation 
% u = F - ref - PID_term) / Beta
u_mfc=(dif_t2 - u - cal_F)/beta;


end