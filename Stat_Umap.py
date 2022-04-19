import umap
import umap.plot
import numpy as np
from scipy.io import savemat

A = np.load('../FEATURES/Time_signal_stats.npy')
A = np.delete(A, slice(384*2, 384*4), 0)

# target = np.concatenate((np.ones((100,)), 2*np.ones((100,)), 3*np.ones((100,))), axis=0)
target = np.concatenate((np.ones((384,)), 2*np.ones((384,)), 3*np.ones((384,)), 4*np.ones((384,)), 5*np.ones((384,)), 6*np.ones((384,))), axis=0)
print(A.shape)
print(target.shape)
mapper = umap.UMAP(n_neighbors=15,
                      min_dist=0.3,
                      metric='manhattan').fit(A)
data={'embedA':mapper.embedding_}
# savemat("PDE2D_EC_N10_Umap.mat", data)
p = umap.plot.points(mapper, labels=target)
umap.plot.show(p)