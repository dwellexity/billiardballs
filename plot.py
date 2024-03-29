import matplotlib.pyplot as plt
import numpy as np
import scipy.stats as stats
plt.switch_backend('wxAgg')
params=np.loadtxt("distparams.dat")
vel=np.loadtxt("vel.dat")
energy=np.loadtxt("energy.dat")
kelvin=np.loadtxt("kelvin.dat")
a=params[0,0]
nop=params[4,0]
nob=min(nop/10,50)
if nob<50:
    nob=50
m=np.linspace(0,np.sqrt(np.amin(params[1:3,0])**2 + np.amax(params[1:3,1])**2),50)
n=np.linspace(np.amin(params[1:3,0]),np.amax(params[1:3,1]),50)
plt.subplot(2,3,1)
fitparams=stats.norm.fit(vel[:,0],floc=0)
plt.hist(vel[:,0],bins=nob,normed=1)
plt.plot(n,stats.norm.pdf(n,*fitparams))
plt.subplot(2,3,2)
fitparams=stats.norm.fit(vel[:,1],floc=0)
plt.hist(vel[:,1],bins=nob,normed=1)
plt.plot(n,stats.norm.pdf(n,*fitparams))
plt.subplot(2,3,3)
fitparams=stats.norm.fit(vel[:,2],floc=0)
plt.hist(vel[:,2],bins=nob,normed=1)
plt.plot(n,stats.norm.pdf(n,*fitparams))
plt.subplot(2,3,4)
fitparams=stats.maxwell.fit(vel[:,3],fscale=a)
plt.hist(vel[:,3],bins=nob,normed=1)
plt.plot(m,stats.maxwell.pdf(m,*fitparams))
plt.subplot(2,3,5)
plt.plot(energy[:,0],energy[:,1])
plt.subplot(2,3,6)
plt.plot(kelvin[:,0],kelvin[:,1])
mng = plt.get_current_fig_manager()
mng.frame.Maximize(True)
plt.show()
