import numpy as np
import pandas as pd
import xarray as xr
import matplotlib.pyplot as plt
import pdb
from scipy import stats

dset = xr.open_dataset(r'C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Course_Data/ERA5_Data/download.nc')

dset['t2m'] = dset['t2m'] - 273.15 # covert air temp from degrees K to degrees C
dset['tp'] = dset['tp'] * 1000 # convert precipitation from m/h to mm/h

selected_location = dset.sel(latitude = 22, longitude = 39.5, method = 'nearest')
plt.figure(figsize = (10,6))
selected_location['t2m'].plot.line(x = 'time',color = 'blue',label = 'Temperature [degrees C]')
plt.ylabel('Temperature [degrees C]')
plt.legend('',frameon=False)
plt.twinx()
selected_location['tp'].plot.line(x = 'time',color = 'red',label = 'Precipitation [mm]')
plt.ylabel('Precipitation [mm]')
plt.suptitle('Temperature and Precipitation Time Series at Wadi Murwani Reservoir')
plt.legend('',frameon=False)
plt.savefig('T-P_time_series_Murwani_Reservoir.png')
plt.show()


# Extract year from time dimension
years = selected_location['time.year']

# Group by year and calculate mean precipitation
annual_precipitation = selected_location.groupby(years).mean(dim='time')['tp']

# Extracting years and precipitation values
years = annual_precipitation.year.values
precipitation_values = annual_precipitation.values

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(years, precipitation_values, color='green')
plt.xlabel('Year')
plt.ylabel('Mean Annual Precipitation [mm]')
plt.title('Mean Annual Precipitation at Wadi Murwani Reservoir')
plt.grid(True)
plt.legend()
plt.savefig('Mean_Annual_Precipitation_Murwani_Reservoir.png')
plt.show()

tmin = dset['t2m'].resample(time='D').min().values
tmax = dset['t2m'].resample(time='D').max().values
tmean = dset['t2m'].resample(time='D').mean().values
lat = 21.25
doy = (dset['t2m'].resample(time='D').mean().time).dt.dayofyear.values

# Reshape doy to match the shape of other temperature variables
doy_reshaped = doy[:, np.newaxis, np.newaxis, np.newaxis]
doy = doy_reshaped

import hargreaves_samani

# Calculate Potential Evaporation (PE)
pe = hargreaves_samani.hargreaves_samani(tmin, tmax, tmean, lat, doy)

# Create time series plot
plt.figure(figsize=(10, 6))
plt.plot(pe[:, 0, 0, 0], label=f'Latitude: {lat}')
plt.xlabel('Days')
plt.ylabel('Potential Evaporation (mm/day)')
plt.title('Time Series of Potential Evaporation using the Hargreaves-Samani function')
#plt.legend()
plt.grid(True)
plt.savefig('Potential Evaporation Calculated from Hargreaves-Samani function')
plt.show()

# Calculate daily potential evaporation
pe_daily = pe[:, 0, 0, 0]  # Extracting potential evaporation values for the specified latitude

# Calculate mean daily potential evaporation
mean_daily_pe_mm_day = np.nanmean(pe_daily)

# Assuming each year has 365 days, calculate mean annual potential evaporation
mean_annual_pe_mm_year = mean_daily_pe_mm_day * 365

print("Mean Annual Potential Evaporation (PE) in mm/year:", mean_annual_pe_mm_year)

reservoir_surface_area_sq_km = 1.6  # square kilometers

# Convert surface area from square kilometers to square meters
reservoir_surface_area_sq_m = reservoir_surface_area_sq_km * 1e6  # 1 km^2 = 1,000,000 m^2

# Convert mean annual potential evaporation from mm/year to m/year
mean_annual_pe_m_year = mean_annual_pe_mm_year * 0.001  # 1 mm = 0.001 m

# Calculate the volume of water lost annually
volume_lost_annually = mean_annual_pe_m_year * reservoir_surface_area_sq_m  # in cubic meters

print("Volume of water lost from the reservoir through evaporation annually:", volume_lost_annually, "cubic meters")





