import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import pdb
import xarray as xr


#dset = xr.open_dataset('C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/Climate_Model_data/tas_Amon_GFDL-ESM4_historical_r1i1p1f1_gr1_195001-201412.nc')

# The following line is used to answer Part2-question11. Uncomment if necessary. CAUTION -> Same variable in previous line.
#dset = xr.open_dataset('C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/Climate_Model_data/tas_Amon_GFDL-ESM4_ssp119_r1i1p1f1_gr1_201501-210012.nc')

# The following line is used to answer Part3-question1. Uncomment if necessary. CAUTION -> Same variable in previous line.
dset = xr.open_dataset('C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/Climate_Model_data/tas_Amon_GFDL-ESM4_historical_r1i1p1f1_gr1_185001-194912.nc')

pdb.set_trace()
print('To continue press c:')

MAT=0.0
MAT=np.mean(dset['tas'].sel(time=slice('18500101', '19001231')), axis=0)

pdb.set_trace()

# Plot and save mean air temperature map for pre-industrial period

plt.imshow(MAT) 
plt.xlabel('Longitude')
plt.ylabel('Latitude')
plt.suptitle('Mean Air Temperature for the pre-Industrial period (1850-1900)')
cbar = plt.colorbar(orientation='horizontal') # change orientation from default to horizontal
cbar.set_label('Mean Air Temperature (degrees K)')
plt.savefig('mean_air_T_pre-ind.png', dpi=300)
plt.show()

# Part3-question2. Plot and save mean air temperature maps for 2071-2100 for each climate scenario.

MAT_SSP119=0.0
MAT_SSP245=0.0
MAT_SSP585=0.0

dset_ssp119 = xr.open_dataset('C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/Climate_Model_Data/tas_Amon_GFDL-ESM4_ssp119_r1i1p1f1_gr1_201501-210012.nc')
dset_ssp245 = xr.open_dataset('C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/Climate_Model_Data/tas_Amon_GFDL-ESM4_ssp245_r1i1p1f1_gr1_201501-210012.nc')
dset_ssp585 = xr.open_dataset('C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/Climate_Model_Data/tas_Amon_GFDL-ESM4_ssp585_r1i1p1f1_gr1_201501-210012.nc')


MAT_SSP119=np.mean(dset_ssp119['tas'].sel(time=slice('20710101', '21001231')), axis=0)
MAT_SSP245=np.mean(dset_ssp245['tas'].sel(time=slice('20710101', '21001231')), axis=0)
MAT_SSP585=np.mean(dset_ssp585['tas'].sel(time=slice('20710101', '21001231')), axis=0)

# Plot section
plt.suptitle('Mean Air Temperature for 2071-2100 \n for climate scenarios SSP119 | SSP245 | SSP585',fontsize=32)
plt.subplot(1,3,1)
plt.title('SSP_119')
plt.imshow(MAT_SSP119)
plt.xlabel('Longitude (0.625..359.4)')
plt.ylabel('Latitude (-89.5..89.5)')
plt.clim(200,320)
cbar=plt.colorbar(orientation='horizontal')
cbar.set_label('Mean Air Temperature (degrees K)')
plt.subplot(1,3,2)
plt.title('SSP_245')
plt.imshow(MAT_SSP245)
plt.xlabel('Longitude (0.625..359.4)')
plt.ylabel('Latitude (-89.5..89.5)')
plt.clim(200,320)
cbar=plt.colorbar(orientation='horizontal')
cbar.set_label('Mean Air Temperature (degrees K)')
plt.subplot(1,3,3)
plt.title('SSP_585')
plt.imshow(MAT_SSP585)
plt.xlabel('Longitude (0.625..359.4)')
plt.ylabel('Latitude (-89.5..89.5)')
plt.clim(200,320)
cbar=plt.colorbar(orientation='horizontal')
cbar.set_label('Mean Air Temperature (degrees K)')
#fig=plt.gcf() # change handle
mng=plt.get_current_fig_manager()
mng.window.state('zoomed')
# The following line will remain as comment since it does not produce the expected outcome
# The figure needs to be saved in fullscreen resolution in order to be acceptable as an outcome. The code at this point can only display in fullscreen mode. The saving will be done manually.
#plt.savefig('MAT_all_SSP_2071-2100.png')
plt.show()

pdb.set_trace()


# Part3-question3. Compute and visualize T differences between 2071-2100 and 1850-1900 for each scenario.

diff1 = MAT_SSP119 - MAT
bnd11 = [min([diff1]), max([diff1])] #obtain boundaries for uniform colorbar limits
bnd1 = [min(bnd11[0][0]), max(bnd11[0][1])]
diff2 = MAT_SSP245 - MAT
bnd22 = [min([diff2]), max([diff2])]
bnd2 = [min(bnd22[0][0]), max(bnd22[0][1])]
diff3 = MAT_SSP585 - MAT
bnd33 = [min([diff3]), max([diff3])]
bnd3 = [min(bnd33[0][0]), max(bnd33[0][1])]       
pdb.set_trace()

# Set colorbar limits
cb_bnd = [min(bnd1[0], bnd2[0], bnd3[0]), max(bnd1[1], bnd2[1], bnd3[1])]

pdb.set_trace()

# Plot section
plt.suptitle('Differences of Mean Air Temperature between 1850-1900 and 2071-2100 \n for climate scenarios SSP119 | SSP245 | SSP585', fontsize=32)
plt.subplot(1,3,1)
plt.title('Difference of Mean Air Temperature \n between 1850-1900 and 2071-2100 (SSP119)')
plt.imshow(diff1)
plt.xlabel('Longitude (0.625..359.4)')
plt.ylabel('Latitude (-89.5..89.5)')
plt.clim(cb_bnd[0], cb_bnd[1])
cbar=plt.colorbar(orientation='horizontal')
cbar.set_label('Mean Air Temperature (degrees K)')
plt.subplot(1,3,2)
plt.title('SSP_245')
plt.title('Difference of Mean Air Temperature \n between 1850-1900 and 2071-2100 (SSP245)')
plt.imshow(diff2)
plt.xlabel('Longitude (0.625..359.4)')
plt.ylabel('Latitude (-89.5..89.5)')
plt.clim(cb_bnd[0], cb_bnd[1])
cbar=plt.colorbar(orientation='horizontal')
cbar.set_label('Mean Air Temperature (degrees K)')
plt.subplot(1,3,3)
plt.title('SSP_585')
plt.title('Difference of Mean Air Temperature \n between 1850-1900 and 2071-2100 (SSP585)')
plt.imshow(diff3)
plt.xlabel('Longitude (0.625..359.4)')
plt.ylabel('Latitude (-89.5..89.5)')
plt.clim(cb_bnd[0], cb_bnd[1])
cbar=plt.colorbar(orientation='horizontal')
cbar.set_label('Mean Air Temperature (degrees K)')
#fig=plt.gcf() # change handle
mng=plt.get_current_fig_manager()
mng.window.state('zoomed')
plt.show()
# As mentioned previously, saving will be done manually

