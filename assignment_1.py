import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import pdb
import xarray as xr

dset = xr.open_dataset(r'C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/SRTMGL1_NC.003_Data/N21E039.SRTMGL1_NC.nc')

print("Type 'continue' to allow the code to move on")
pdb.set_trace() # allow examination of variables and objects

DEM = np.array(dset.variables['SRTMGL1_DEM'])

dset.close()

pdb.set_trace() # allow examination of variables and objects

print('The data dimensions for DEM variable are', DEM.shape)

plt.imshow(DEM) # initiate figure 
cbar = plt.colorbar() # show colorbar
cbar.set_label('Elevation (m asl)') # set colorbar label
plt.show() #show figure
plt.savefig('assignment_1.png', dpi=300) # save figure
