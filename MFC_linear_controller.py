# Linear Feedback Controller of a PD MFC Structure

def linearController(e, e_dot, K1, K2, K3):
    u = K2*e_dot + K1*e
    return u
