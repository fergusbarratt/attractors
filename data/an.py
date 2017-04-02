#import os
import matplotlib
matplotlib.use("pdf")
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from mpl_toolkits.mplot3d import Axes3D
sns.set()

datapath = '/Users/fergusbarratt/Dropbox/Projects/fra/data/'

fig1, ax = plt.subplots(1, 1)
data = pd.read_csv(datapath+'h.csv', header=None)
data.plot(kind='scatter', x=0, y=1, marker='.', ax=ax)
plt.xlabel("x")
plt.ylabel("y")
fig1.savefig("h.pdf")

fig2 = plt.figure().gca(projection='3d')
data = pd.read_csv(datapath+'l.csv', header=None)
fig2.set_xlabel('x')
fig2.set_ylabel('y')
fig2.set_zlabel('z')
fig2.scatter(data[0], data[1], data[2])
plt.savefig("l.pdf")

fig3, ax = plt.subplots(1, 1)
data =pd.read_csv(datapath+'d.csv', header=None)
data.plot(kind='scatter', x=0, y=1, marker='.', ax=ax)
plt.xlabel("x")
plt.ylabel("y")
fig3.savefig('d.pdf')
