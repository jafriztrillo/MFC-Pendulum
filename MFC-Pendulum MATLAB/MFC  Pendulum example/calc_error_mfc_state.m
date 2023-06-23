function [e,e_dot]=calc_error_mfc_state(output,ref,t,e_prev)
global tau

e=ref-output;
e_dot=(e-e_prev)/tau;


end