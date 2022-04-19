## Import features


import xgboost as xgb
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from xgboost import plot_importance
from sklearn.model_selection import KFold
from pylab import * 


############### LOAD FEATURES 
stat = np.load('../FEATURES/Time_signal_stats.npy' , allow_pickle=True)
stat = np.delete(stat, slice(384*2, 384*4), 0)

#---------------------------------------------------------------



from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay, classification_report
from sklearn.svm import SVC

import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.font_manager
plt.rcParams['font.family'] = 'DeJavu Serif'
plt.rcParams['font.serif'] = ['Arial']


# A = np.load('Data/PDE2D_EC_N0.npy')
A = stat
# target = np.concatenate((np.ones((100,)), 2*np.ones((100,)), 3*np.ones((100,))), axis=0)
target = np.concatenate((np.ones((384,)), 2*np.ones((384,)), 3*np.ones((384,)), 4*np.ones((384,)), 5*np.ones((384,)), 6*np.ones((384,))), axis=0)
X_train, X_test, y_train, y_test = train_test_split(
    A, target, test_size=0.5, random_state=0)

# Set the parameters by cross-validation
tuned_parameters = [{'kernel': ['rbf'], 'gamma': [1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9],
                     'C': [0.1, 1, 10, 100, 1000, 10000]},
                    {'kernel': ['linear'], 'C': [1, 10, 100, 1000, 10000]}]


# settings for RD
# tuned_parameters = [{'kernel': ['rbf'], 'gamma': [3e-7, 5e-7, 7e-7,], 'C': [5, 10, 50]}]

# settings for 2D PDEs
# tuned_parameters = [{'kernel': ['rbf'], 'gamma': [2e-8], 'C': [10]}]

# scores = ['precision', 'recall']
scores = ['f1']

for score in scores:
    print("# Tuning hyper-parameters for %s" % score)
    print()

    clf = GridSearchCV(
        SVC(), tuned_parameters, scoring='%s_macro' % score
    )
    clf.fit(X_train, y_train)

print("Best parameters set found on development set:")
print()
print(clf.best_params_)
print()
print("Grid scores on development set:")
print()
means = clf.cv_results_['mean_test_score']
stds = clf.cv_results_['std_test_score']
for mean, std, params in zip(means, stds, clf.cv_results_['params']):
    print("%0.3f (+/-%0.03f) for %r"
          % (mean, std * 2, params))
print()

print("Detailed classification report:")
print()
print("The model is trained on the full development set.")
print("The scores are computed on the full evaluation set.")
print()
y_true, y_pred = y_test, clf.predict(X_test)
print(classification_report(y_true, y_pred))
print()
cm = confusion_matrix(y_true,y_pred,labels=[1, 2, 3, 4, 5, 6])
print("Confusion matrix")
print(cm)
# np.savetxt("cm_PDE2D_EC_N0.csv", cm, delimiter=",")
cm_display = ConfusionMatrixDisplay(confusion_matrix=cm,display_labels=clf.classes_).plot()
plt.show()

