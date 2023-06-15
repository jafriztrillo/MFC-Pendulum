#MFC Calculation
def controlOutput(calc_F,ref,u,t,prev_diff,beta,Ts):
    t1_diff = [ref[:,t] - ref[:,t-1]]/Ts
    F = [t1_diff - prev_diff]/Ts
    prev_diff = t1_diff

    #Model Free Controller
    #u = (F - ref - PID Term) / Beta
    u = (F - u - calc_F) / beta
    return u