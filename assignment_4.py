# This script will be used to analyze Remote Sensing data for Environmental Monitoring

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import pdb
import xarray as xr
import tools

ts1 = pd.read_csv(r'C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Assignment_4/time_series_clds.csv')

ts2 = pd.read_csv(r'C:/Users/GPascual/Desktop/KAUST/Geo-Environmental Modeling & Analysis/Assignment_4/time_series_nclds.csv')

#pdb.set_trace()

plot = ts1['C0/mean'].plot(title = "NDWI time series over Wadi Murwani Dam (minimal cloud coverage)")
plt.savefig("NDWI_cld")
plt.show()

pdb.set_trace()

plot = ts2.plot(title = "NDWI time series over Wadi Murwani Dam (cloud coverage adjusted to zero)")
plt.savefig("NDWI.ncld")
plt.show()

