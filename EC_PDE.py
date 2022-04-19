import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import gudhi as gd
from sklearn.decomposition import PCA
from tqdm.notebook import tqdm
from scipy.stats import zscore
from EC_PDE_functions import*

# settings for numerical simulations
size = 50  # size of the 2D grid
dx = 2./ size  # space step
T = 10.0  # total time
dt = .1  # time step
n = int(T / dt)  # number of iterations
D = 3e-4  # diffusion coefficient
R = .8  # reaction coefficient  
noiseL = 0.50  # noise level

# Numerical simulations
U0 = []  # D != 0, R != 0
for i in range(s):
    coeff1 = randSign()*(0.1+1.9*np.random.rand(1,1))
    coeff2 = randSign()*(0.1+1.9*np.random.rand(1,1))
    Ui = RD_Model(coeff1*D,coeff2*R)
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U0.append(Ui+noise)
U1 = []  # D = 0, R != 0
for i in range(s):
    coeff1 = 0
    coeff2 = randSign()*(0.1+1.9*np.random.rand(1,1))
    Ui = RD_Model(coeff1*D,coeff2*R)
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U1.append(Ui+noise)
U2 = []  # D != 0, R = 0
for i in range(s):
    coeff1 = randSign()*(0.1+1.9*np.random.rand(1,1))
    coeff2 = 0
    Ui = RD_Model(coeff1*D,coeff2*R)
    sigmaUi = np.std(Ui)
    sigmaN = noiseL*sigmaUi
    noise = np.random.normal(0, sigmaN, Ui.shape) 
    U2.append(Ui+noise)

# define filtration range and increments
numPoints = 100;
filtrationStart = -0.5;
filtrationEnd = 1.5;
filtrations = np.linspace(filtrationStart,filtrationEnd,numPoints);
# calculate ECs for each scenario
ec0 = []
for k in tqdm(range(s)):
    ec0.append(getEC(U0[k]))
ec1 = []
for k in tqdm(range(s)):
    ec1.append(getEC(U1[k]))    
ec2 = []
for k in tqdm(range(s)):
    ec2.append(getEC(U2[k]))

# visualize via PCA
A = np.vstack([ec0,ec1,ec2])
pca = PCA()
X = pca.fit_transform(np.nan_to_num(zscore(A)))
fig = plt.figure(figsize=(8, 6), dpi=80)
ax = plt.subplot(111)
ax.scatter(X[0:100,0],X[0:100,1],90,marker = 'o', label = "$D!=0,A!=0$",facecolor = 'k',edgecolor = 'k')
ax.scatter(X[100:200,0],X[100:200,1],90,marker = 'o', label = "$D=0,A!=0$",facecolor = 'b',edgecolor = 'k')
ax.scatter(X[200:300,0],X[200:300,1],90,marker = 'o', label = "$D!=0,A=0$",facecolor = 'g',edgecolor = 'k')
plt.xlabel('Principal Component 1')
plt.ylabel('Principal Component 2')
plt.tight_layout()
plt.legend(loc='center left', bbox_to_anchor=(1, 0.5))
# plt.savefig('RDECpca.png',transparent = True)

# visualize via UMAP
import umap
import umap.plot
import numpy as np
target = np.concatenate((np.ones((100,)), 2*np.ones((100,)), 3*np.ones((100,))), axis=0)
mapper = umap.UMAP(n_neighbors=15,
                      min_dist=0.3,
                      metric='manhattan').fit(A)
umap.plot.points(mapper, labels=target)