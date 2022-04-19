import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from skimage.transform import resize
from numpy.lib.stride_tricks import as_strided
from scipy.stats import skew
import scipy.signal
from scipy.signal import savgol_filter
from tqdm import tqdm
from pylab import * 
from scipy.fftpack import fft
import copy
from scipy.interpolate import interp1d
from scipy.stats import skew 
import seaborn as sns
import matplotlib.patches as patches
import warnings
warnings.filterwarnings('ignore')




### Process Data from COMSOL outputs to the arrays of (time, x, y) 
def process(data):
    g = int(np.sqrt(len(data))) # Number of Grids in X,Y directions
    Time = len(data[1])-2
    t = np.zeros((Time , len(data)))
    value = np.zeros((len(t),g,g), dtype= float)
    for i in range(len(data[1])-2):
        t[i] = data[:,i+2]
        for j in range(g):
            for k in range(g):
                value[i][j][k] = t[i][g*j+k]
    value = (value - np.min(value)) / (np.max(value) - np.min(value)) # Normalization
    if len(value) == 1:
        sequence = np.tile(value,(501,1,1)) ## Steady Solution
    else:
        sequence = value[:Time]
    return sequence

#### Compute the average change (in space) over time (TIME SIGNAL)
def sub(sequence):
    mean_two_sequence = np.zeros(len(sequence))
    for frame in range(len(sequence)):
        if frame == len(sequence)-1:
            two_frame_sub = sequence[frame] - sequence[frame-1]
        elif frame ==0:
            two_frame_sub = sequence[frame+1] - sequence[frame]
        else:
            two_frame_sub = sequence[frame+1] - sequence[frame]
        mean_two_frame_sub = np.mean(two_frame_sub)
        mean_two_sequence[frame] = mean_two_frame_sub
    return mean_two_sequence




######## DATA SIZE: 384 equations for 8 PDEs
noiseL = 0.50
Curves = np.zeros((8*384,400))
for eq in range(8): 
    print('this is for equation ',eq, 'out of 8')
    for iter in range(384):
        df = pd.read_csv ('../DATA/'+str(eq+1)+'/' + str(iter+1) + '.csv' , header=None)
        data = df.to_numpy()
        sigma_data = np.std(data)
        sigmaN = noiseL*sigma_data
        noise = np.random.normal(0, sigmaN, data.shape) 
        data = data+noise
        sequence = process(data)
        temp = sub(sequence)[51:-50]
        temp = np.abs(temp)
        if np.max(temp) == np.min(temp):
            two_mean = temp
        else:
            two_mean = (temp - np.min(temp)) / (np.max(temp) - np.min(temp)) ######## NORMALIZE 
        Curves[eq*384 + iter] = two_mean

###### RAW SIGNALS 
# np.save('./FEATURES/Time_signal.npy',Curves)
print("TIME SIGNAL FEATURE SHAPE: ",Curves.shape)
## Normalized Vectors
mean_t = np.mean(Curves, axis=1).reshape(-1,1)
std_t = np.std(Curves, axis=1).reshape(-1,1)
min_l = np.min(Curves[:,350:] , axis=1).reshape(-1,1)
max_l = np.max(Curves[:,350:] , axis=1).reshape(-1,1)
mean_l = np.mean(Curves[:,350:] , axis=1).reshape(-1,1)
std_l = np.std(Curves[:,350:] , axis=1).reshape(-1,1)
skew_t = skew(Curves, axis=1).reshape(-1,1)

data_features = np.concatenate((mean_t,std_t,
                                min_l,max_l,mean_l,std_l,
                                skew_t) , axis = 1)

print(data_features.shape)
np.save('../FEATURES/Time_signal_stats_N50.npy',data_features)
