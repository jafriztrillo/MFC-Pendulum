function u = Pend_control_cal_MFC(e,e_dot,u_i)
global k1 k2 k3

%PD Controller so v = 2, iPID and PD controllers work for this application
u=k2*e_dot + u_i*k1 + k1*e ;


end