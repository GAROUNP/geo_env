# This script will be used to analyze weather data

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import pdb
import xarray as xr
import tools

df_isd = tools.read_isd_csv(r'c:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Assignment_3/41024099999.csv')

plot = df_isd.plot(title = "ISD data for Jeddah")
plt.savefig("ISD_data_Jeddah")
plt.show()

# Heat Index Calculation

df_isd['RH'] = tools.dewpoint_to_rh(df_isd['DEW'].values, df_isd['TMP'].values) # adding another column named 'RH' to df_isd dataframe

df_isd['HI'] = tools.gen_heat_index(df_isd['TMP'].values, df_isd['RH'].values)

# Obtain max value from HI variable
max = df_isd.max()
print(f"The highest HI observed in 2023 is {max.HI} degrees Celsius")

# Obtain time and day when the highest HI was observed
td_max_HI = df_isd.idxmax()
print(f"The highest HI was observed on {td_max_HI.HI}")

# Convert UTC time to Local time (Jeddah) UTC+3
t = pd.Timestamp(td_max_HI.HI)
test = t.hour + 3
t = t.replace(hour = test, minute = 0, second = 0)
print(f"The local time of the highest HI is {t}")

# Air Temperature and Relative Humidity at this moment
RC = df_isd.loc[[pd.Timestamp(td_max_HI.HI)]]
# Convert to array to obtain necessary values
RC_ar = RC.to_numpy()
print(f"At the same time, Air Temperature = {RC_ar[0][0]} and Relative Humidity = {RC_ar[0][3]}%")

# Resample from hourly to daily
df2_isd = tools.read_isd_csv(r'c:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Assignment_3/41024099999.csv')
df2 = df2_isd.resample('D').mean() # resample calculating mean for each day's values
df2['RH'] = tools.dewpoint_to_rh(df2['DEW'].values, df2['TMP'].values)
df2['HI'] = tools.gen_heat_index(df2['TMP'].values, df2['RH'].values)

# Produce a figure of the HI time series for 2023
plt.figure()
plt.title("Jeddah's HI for 2023")
ax1 = df_isd['HI'].plot(color = 'blue',label="HI from hourly weather data")
ax2 = df2['HI'].plot(color = 'red', label="HI from resampled daily weather data")
h1, l1 = ax1.get_legend_handles_labels()
h2, l2 = ax2.get_legend_handles_labels()
plt.legend(l1+l2)
plt.savefig('heat_index_time_series')
plt.show()

# Calculation of Potential Impact of Climate Change
df3 = tools.read_isd_csv(r'c:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Assignment_3/41024099999.csv')
df3['TMP'] = df3['TMP'] + 3
df3['RH'] = tools.dewpoint_to_rh(df3['DEW'].values, df3['TMP'].values)
df3['HI'] = tools.gen_heat_index(df3['TMP'].values, df3['RH'].values)
max1 = df3.max()
HI_diff = round(abs(max.HI-max1.HI), 2)
print(f"The highest HI values when additional warming is considered (SSP245) is {max1.HI} degrees Celsius")
print(f'The increase in the highest HI value when additional warming is considered (SSP245) is equal to {HI_diff} degrees Celsius.')

pdb.set_trace()






