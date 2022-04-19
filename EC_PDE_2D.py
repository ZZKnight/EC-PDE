import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import gudhi as gd
from sklearn.decomposition import PCA
from tqdm.notebook import tqdm
from scipy.stats import zscore

# settings for numerical simulations
s = 384  # number of simulations
noiseL = 0.40  # noise level

import scipy.io as sio
U = sio.loadmat('PDE2D.mat')
U1_ = U.get('U1')
U2_ = U.get('U2')
U3_ = U.get('U3')
U4_ = U.get('U4')
U5_ = U.get('U5')
U6_ = U.get('U6')
U1 = []
U2 = []
U3 = []
U4 = []
U5 = []
U6 = []

for i in range(s):
    Ui = np.squeeze(U1_[i,:,:,:])
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U1.append(Ui+noise)

    Ui = np.squeeze(U2_[i,:,:,:])
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U2.append(Ui+noise)

    Ui = np.squeeze(U3_[i,:,:,:])
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U3.append(Ui+noise)

    Ui = np.squeeze(U4_[i,:,:,:])
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U4.append(Ui+noise)

    Ui = np.squeeze(U5_[i,:,:,:])
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U5.append(Ui+noise)

    Ui = np.squeeze(U6_[i,:,:,:])
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U6.append(Ui+noise)



# function returns an euler characteristic curve for a given image
def getEC(data):
    cubeplex = gd.CubicalComplex(dimensions  = [np.shape(data)[0],np.shape(data)[1],np.shape(data)[2]],top_dimensional_cells=np.ndarray.flatten(data));
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
filtrationStart = 0;
filtrationEnd = 1.0;
# 2D Burgers
# filtrationStart = -0.1;
# filtrationEnd = 0.1;
filtrations = np.linspace(filtrationStart,filtrationEnd,numPoints);
# calculate ECs for each scenario
ec1 = []
print('ec1')
for k in range(s):
    ec1.append(getEC(U1[k]))  
    if k%10==0: print(k)
ec2 = []
print('ec2')
for k in range(s):
    ec2.append(getEC(U2[k]))
    if k%10==0: print(k)
ec3 = []
print('ec3')
for k in range(s):
    ec3.append(getEC(U3[k]))
    if k%10==0: print(k)
ec4 = []
print('ec4')
for k in range(s):
    ec4.append(getEC(U4[k]))
    if k%10==0: print(k)
ec5 = []
print('ec5')
for k in range(s):
    ec5.append(getEC(U5[k]))
    if k%10==0: print(k)
ec6 = []
print('ec6')
for k in range(s):
    ec6.append(getEC(U6[k]))
    if k%10==0: print(k)
# visualize via PCA
A = np.vstack([ec1,ec2,ec3,ec4,ec5,ec6])
np.save('PDE2D_EC_N40.npy',A)
