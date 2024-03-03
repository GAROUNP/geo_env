import numpy as np
import pandas as pd
import xarray as xr
import matplotlib.pyplot as plt
import pdb
from scipy import stats

dset = xr.open_dataset(r'C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/ERA5_Data/download.nc')

# Extract variables
t2m = np.array(dset.variables['t2m'])
tp = np.array(dset.variables['tp'])
latitude = np.array(dset.variables['latitude'])
longitude = np.array(dset.variables['longitude'])
time_dt = np.array(dset.variables['time'])
# Convert air temperature (degrees K to C) and precipitation (m*h^-1 to mm*h^-1)
t2m = t2m - 273.15
tp = tp * 1000

if t2m.ndim == 4:
    t2m = np.nanmean(t2m, axis=1)
    tp = np.nanmean(tp, axis=1)

# Create dataframe containing time series for both variables.
# Grid cell closest to the reservoir (row=3, column=2)
df_era5 = pd.DataFrame(index=time_dt)
df_era5['t2m'] = t2m[:,3,2]
df_era5['tp'] = tp[:,3,2]

df_era5.plot()
plt.title('Air Temperature at 2m and Precipitation time series\n at Wadi Murwani Reservoir')
plt.savefig('T-P_time_series_Murwani_Reservoir_v2.png')
plt.show()

annual_precip = df_era5['tp'].resample('YE').mean()*24*365.25
mean_annual_precip = np.nanmean(annual_precip)


# Calculate trendline
slope, intercept, r_value, p_value, std_err = stats.linregress(range(len(annual_precip)), annual_precip)

# Plot
plt.plot(annual_precip.index, annual_precip, label='Mean Annual Precipitation')
plt.plot(annual_precip.index, intercept + slope * np.arange(len(annual_precip)), 'r', label='Trendline')
plt.title('Mean Annual Precipitation with Trendline')
plt.xlabel('Year')
plt.ylabel('Mean Annual Precipitation (mm)')
plt.legend()
plt.savefig('Mean_Annual_Precipitation_Trendline.png')
plt.show()

tmin = df_era5['t2m'].resample('D').min().values
tmax = df_era5['t2m'].resample('D').max().values
tmean = df_era5['t2m'].resample('D').mean().values
lat = 21.25
doy = df_era5['t2m'].resample('D').mean().index.dayofyear

import tools
pe = tools.hargreaves_samani_1982(tmin, tmax, tmean, lat, doy)
ts_index = df_era5['t2m'].resample('D').mean().index
plt.figure()
plt.plot(ts_index, pe, label='Potential Evaporation')
plt.title('Potential Evaporation\n using the Hargreaves-Samani function')
plt.xlabel('Time')
plt.ylabel('Potential evaporation (mm d−1)')
plt.savefig('Potential_Evaporation_Calculated_from_Hargreaves-Samani_fuction_v2.png')
plt.show()

# Calculate mean annual potential evaporation without resampling
mean_annual_pe = pe.mean() * 365

print("Mean Annual Potential Evaporation:", mean_annual_pe)

# Surface area of the reservoir (in square meters)
reservoir_area = 1.6 * 10**6  # 1 square kilometer = 1,000,000 square meters

# Convert mean annual potential evaporation to cubic meters per year
mean_annual_pe_m3 = mean_annual_pe / 1000  # 1 mm = 0.001 meter

# Calculate the volume of water potentially lost from the reservoir through evaporation annually
volume_lost_annually = mean_annual_pe_m3 * reservoir_area

print("Volume of water potentially lost from the reservoir through evaporation annually:", volume_lost_annually, "cubic meters")
