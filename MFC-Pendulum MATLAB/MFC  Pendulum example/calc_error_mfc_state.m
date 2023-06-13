function [e,e_dot]=calc_error_mfc_state(output,ref,t,e_prev)
global tau

e=ref(1,t)-output(1,t);
e_dot=(e-e_prev)/tau;


end