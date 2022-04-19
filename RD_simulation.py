import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import gudhi as gd
from sklearn.decomposition import PCA
from tqdm.notebook import tqdm
from scipy.stats import zscore
from scipy.io import savemat

# settings for numerical simulations
size = 25#50  # size of the 2D grid
dx = 2./ size  # space step
T = 10.0  # total time
dt = .2#.1  # time step
n = int(T / dt)  # number of iterations
D = 3e-4  # diffusion coefficient
R = .8  # reaction coefficient  
s = 1  # number of simulations
noiseL = 0.00  # noise level

# Laplacian: Zxx+Zyy
def laplacian(Z):
    Ztop = Z[0:-2, 1:-1]
    Zleft = Z[1:-1, 0:-2]
    Zbottom = Z[2:, 1:-1]
    Zright = Z[1:-1, 2:]
    Zcenter = Z[1:-1, 1:-1]
    return (Ztop + Zleft + Zbottom + Zright -
            4 * Zcenter) / dx**2

# Reaction-diffusion model, D and R are the diffusion and reaction coefficients
def RD_Model(D,R):
    U = np.random.rand(size, size)
    V = np.random.rand(size, size)
    Us = []
    for i in range(n):
        # We compute the Laplacian of u and v.
        deltaU = laplacian(U)
        deltaV = laplacian(V)
        # We take the values of u and v inside the grid.
        Uc = U[1:-1, 1:-1]
        Vc = V[1:-1, 1:-1]
        # We update the variables.
        U[1:-1, 1:-1], V[1:-1, 1:-1] = \
            Uc + dt * (D*deltaU + R*(Vc - Uc)),\
            Vc + dt * (D*deltaV + R*(Uc - Vc))
        # Neumann conditions
        for Z in (U, V):
            Z[0, :] = Z[1, :]
            Z[-1, :] = Z[-2, :]
            Z[:, 0] = Z[:, 1]
            Z[:, -1] = Z[:, -2]
        Uz = np.array(U)
        Us.append(Uz)
    return np.stack(Us)

    
# Numerical simulations: Reaction-diffusion system
U0 = []  # D > 0, R > 0
for i in range(s):
    coeff1 = 1
    coeff2 = 1
    Ui = RD_Model(coeff1*D,coeff2*R)
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U0.append(Ui+noise)
U1 = []  # D = 0, R > 0
for i in range(s):
    coeff1 = 0
    coeff2 = 1
    Ui = RD_Model(coeff1*D,coeff2*R)
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U1.append(Ui+noise)
U2 = []  # D > 0, R = 0
for i in range(s):
    coeff1 = 1
    coeff2 = 0
    Ui = RD_Model(coeff1*D,coeff2*R)
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U2.append(Ui+noise)


np.save('U_RD.npy',U0,U1,U2)

data_U={'U0':U0,'U1':U1,'U2':U2}
savemat("U_RD.mat",data_U)