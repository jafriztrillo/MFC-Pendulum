function ref=ref_genrate(step_start,int_value,final_value)
global run_time tau
ref=ones(1,step_start)*(int_value);
l_temp=length(ref);
end_t=run_time/tau;


ref(1,(l_temp+1:end_t))=ones(1,end_t-l_temp)*final_value;

end