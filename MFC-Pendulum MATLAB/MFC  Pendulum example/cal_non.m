function [exp_F]=cal_non(outputs)
global a b 

exp_F=-a*sin(outputs(1,1))-b*(outputs(2,1));

end