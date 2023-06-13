function [output,states]=Pend_sys_non_linear(in_states,u,ref)

global a b c tau

states(1,1)=in_states(2,1); %x1
states(2,1)=-a*sin(in_states(1,1)) -b*in_states(2,1) +c*u;   %x2
states(3,1)=ref-in_states(1,1);  %z3

output=(states*tau)+in_states;

end