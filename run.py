import numpy as np
import control as ct

#Makes the most sense to keep most of the controller inside run since it is 1-2 lines of code per function

#Intializations
Ts = 1E-3 #[s]
run_time = 30 #[s]

states = np.zeros(3,1)
outputs = np.zeros(3,1)
u = np.zeros(1,1)
u_mfc = np.zeros(1,1)
int_value = 0
final_value = np.pi/4
step_start = (10/Ts)

#Reference Call?


for t in range(int(run_time/Ts)):
    

#MFC Linear Controller

#MFC Control Output

#EKF Call