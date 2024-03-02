import numpy as np

def hargreaves_samani(tmin, tmax, tmean, lat, doy):
        """
        Calculate Potential Evaporation (PE) using the Hargreaves and Samani method.
        Parameters:
        tmin: array-like, minimum temperature in °C (shape: [days])
        tmax: array-like, maximum temperature in °C (shape: [days])
        tmean: array-like, mean temperature in °C (shape: [days])
        lat: float, latitude in decimal degrees
        doy: array-like, day of the year (1-365)
        Returns:
        pe: array-like, Potential Evaporation in mm/day (shape: [days])
        """
        
        # Calculate delta: slope of saturation vapor pressure-temperature curve (kPa/°C)
        saturation_vapor_pressure = 0.6108 * np.exp((17.27 * tmean) / (tmean + 237.3))
        delta = 4098 * saturation_vapor_pressure / ((tmean + 237.3) ** 2)
        # Convert latitude to radians
        phi = np.radians(lat)
        # Calculate inverse relative distance Earth-Sun
        dr = 1 + 0.033 * np.cos(2 * np.pi * doy / 365)
        # Calculate extraterrestrial radiation (MJ/m^2/day)
        et_rad = 0.409 * np.sin(2 * np.pi * doy / 365 - 1.39)
        et_rad = np.maximum(et_rad, 0)  # Ensure non-negative values
        # Hargreaves and Samani method
        pe = (0.0023 * dr * np.sqrt(tmax - tmin) * (tmean + 17.8) * delta * et_rad) / (tmean + 17.8)

        return pe
                                                                                                                        
