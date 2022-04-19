import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import gudhi as gd
from sklearn.decomposition import PCA
from tqdm.notebook import tqdm
from scipy.io import savemat
from scipy.stats import zscore

# settings for numerical simulations
s = 101  # number of simulations
dN = 0.05/100
# noiseL = 0.50  # noise level

# Burgers
import scipy.io as sio
U = sio.loadmat('Data/U_Burgers.mat')
U0_ = U.get('U0')
U0 = []

for i in range(s):
    Ui = np.squeeze(U0_[0,:,:])
    sigmaUi = np.std(Ui)
    noiseL = i*dN
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U0.append(Ui+noise)

# function returns an euler characteristic curve for a given image
def getEC(data):
    cubeplex = gd.CubicalComplex(dimensions  = [np.shape(data)[0],np.shape(data)[1]],top_dimensional_cells=np.ndarray.flatten(data));
    cubeplex.persistence();
    b = np.zeros( (numPoints,3) ) ;
    ec = np.zeros(numPoints);
    for (i,fval) in enumerate(np.flip(filtrations)):
        betti = cubeplex.persistent_betti_numbers(fval,fval);
        b[i] = [betti[0], betti[1], betti[2]];
        ec[i] = betti[0] - betti[1] + betti[2];
    return ec;

# define filtration range and increments
numPoints = 100;#1000;
# Reaction-diffusion
filtrationStart = -2;
filtrationEnd = 2;
filtrations = np.linspace(filtrationStart,filtrationEnd,numPoints);
# calculate ECs for each scenario
ec0 = []
print('ec0')
for k in range(s):
    ec0.append(getEC(U0[k]))
    if k%10==0: print(k)
A = np.vstack([ec0])
np.save('B1_EC_Noise.npy',A)
data={'A':A}
savemat("B1_EC_Noise.mat", data)
