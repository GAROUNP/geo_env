% This script is intended for the purposes of assignment 10 as part of the
% course "Geo-Environmental Modeling & Analysis" ErSE 394B.
% Author: Paschalis Garouniatis, PhD Student ErSE Department
% Email: paschalis.garouniatis@kaust.edu.sa


% We will read all data available

%% -------------------- INPUT DATA SECTION --------------------
cd output_simulation0/;
ncid = netcdf.open('discharge_daily.nc','NC_NOWRITE');
% The nc file is structured as :
% lon (pos = 0), lat (pos = 1), time (pos = 2) and discharge (pos = 3)
lon = netcdf.getVar(ncid,0); % 0 corresponds to longitude
lat = netcdf.getVar(ncid,1); % 1 corresponds to latitude
time = netcdf.getVar(ncid,2); % 2 corresponds to time (years, months, or days)
netcdf.close(ncid);
clear ncid;
cd ../;

cd output_simulation_snow0/;
Snow_simulation0{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Snow_simulation0{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Snow_simulation0{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Snow_simulation0{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Snow_simulation0{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Snow_simulation0{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Snow_simulation0{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Snow_simulation0{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Snow_simulation0{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Snow_simulation0{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Snow_simulation0{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Snow_simulation0{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_TempMelt096/;
TempMelt_simulation096{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
TempMelt_simulation096{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
TempMelt_simulation096{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
TempMelt_simulation096{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
TempMelt_simulation096{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
TempMelt_simulation096{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
TempMelt_simulation096{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
TempMelt_simulation096{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
TempMelt_simulation096{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
TempMelt_simulation096{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
TempMelt_simulation096{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
TempMelt_simulation096{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_TempMelt102/;
TempMelt_simulation102{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
TempMelt_simulation102{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
TempMelt_simulation102{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
TempMelt_simulation102{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
TempMelt_simulation102{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
TempMelt_simulation102{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
TempMelt_simulation102{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
TempMelt_simulation102{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
TempMelt_simulation102{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
TempMelt_simulation102{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
TempMelt_simulation102{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
TempMelt_simulation102{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_TempSnow096/;
TempSnow_simulation096{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
TempSnow_simulation096{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
TempSnow_simulation096{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
TempSnow_simulation096{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
TempSnow_simulation096{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
TempSnow_simulation096{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
TempSnow_simulation096{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
TempSnow_simulation096{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
TempSnow_simulation096{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
TempSnow_simulation096{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
TempSnow_simulation096{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
TempSnow_simulation096{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_TempSnow102/;
TempSnow_simulation102{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
TempSnow_simulation102{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
TempSnow_simulation102{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
TempSnow_simulation102{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
TempSnow_simulation102{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
TempSnow_simulation102{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
TempSnow_simulation102{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
TempSnow_simulation102{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
TempSnow_simulation102{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
TempSnow_simulation102{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
TempSnow_simulation102{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
TempSnow_simulation102{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;

% -------------------- END OF INPUT DATA SECTION --------------------
%% -------------------- POST PROCESSING SECTION --------------------
% ------------------------------------------------------------------
% -------------------- Discharge - Monthly Average --------------------

% --- Calculate and visualize differences
for i = 1:120
    for j = 1:size(lon,1)
        for k = 1:size(lat,1)
            % difference between undisturbed and TempMelt_simulation096
            discharge_monthavg_diff{1,1}(j,k,i) = 100 * ((TempMelt_simulation096{12,1}(j,k,i) - Snow_simulation0{12,1}(j,k,i))/Snow_simulation0{12,1}(j,k,i));
            % difference between undisturbed and TempMelt_simulation102
            discharge_monthavg_diff{2,1}(j,k,i) = 100 * ((TempMelt_simulation102{12,1}(j,k,i) - Snow_simulation0{12,1}(j,k,i))/Snow_simulation0{12,1}(j,k,i));
            % difference between undisturbed and TempSnow_simulation096
            discharge_monthavg_diff{3,1}(j,k,i) = 100 * ((TempSnow_simulation096{12,1}(j,k,i) - Snow_simulation0{12,1}(j,k,i))/Snow_simulation0{12,1}(j,k,i));
            % difference between undisturbed and TempSnow_simulation102
            discharge_monthavg_diff{4,1}(j,k,i) = 100 * ((TempSnow_simulation102{12,1}(j,k,i) - Snow_simulation0{12,1}(j,k,i))/Snow_simulation0{12,1}(j,k,i));
        end
    end
end

% Plot Discharge influenced by TempMelt sensitivity
% Average temperature at which snow melts.
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([discharge_monthavg_diff{1,1}(:,:,count+1);discharge_monthavg_diff{1,1}(:,:,count+2);discharge_monthavg_diff{1,1}(:,:,count+12);...
        discharge_monthavg_diff{2,1}(:,:,count+1);discharge_monthavg_diff{2,1}(:,:,count+2);discharge_monthavg_diff{2,1}(:,:,count+12);]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+1);discharge_monthavg_diff{1,1}(:,:,count+2);discharge_monthavg_diff{1,1}(:,:,count+12);...
        discharge_monthavg_diff{2,1}(:,:,count+1);discharge_monthavg_diff{2,1}(:,:,count+2);discharge_monthavg_diff{2,1}(:,:,count+12);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Temperature Melting Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+1));
    title('January - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+2));
    title('February - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+12));
    title('December - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+1));
    title('January - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+2));
    title('February - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+12));
    title('December - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end
clear count i j k year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Spring season 
    cmin = min(min([discharge_monthavg_diff{1,1}(:,:,count+3);discharge_monthavg_diff{1,1}(:,:,count+4);discharge_monthavg_diff{1,1}(:,:,count+5);...
        discharge_monthavg_diff{2,1}(:,:,count+3);discharge_monthavg_diff{2,1}(:,:,count+4);discharge_monthavg_diff{2,1}(:,:,count+5);]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+3);discharge_monthavg_diff{1,1}(:,:,count+4);discharge_monthavg_diff{1,1}(:,:,count+5);...
        discharge_monthavg_diff{2,1}(:,:,count+3);discharge_monthavg_diff{2,1}(:,:,count+4);discharge_monthavg_diff{2,1}(:,:,count+5);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Temperature Melting Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+3));
    title('March- Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+4));
    title('April - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+5));
    title('May - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+3));
    title('March - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+4));
    title('April - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+5));
    title('May - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Summer season 
    cmin = min(min([discharge_monthavg_diff{1,1}(:,:,count+6);discharge_monthavg_diff{1,1}(:,:,count+7);discharge_monthavg_diff{1,1}(:,:,count+8);...
        discharge_monthavg_diff{2,1}(:,:,count+6);discharge_monthavg_diff{2,1}(:,:,count+7);discharge_monthavg_diff{2,1}(:,:,count+8);]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+6);discharge_monthavg_diff{1,1}(:,:,count+7);discharge_monthavg_diff{1,1}(:,:,count+8);...
        discharge_monthavg_diff{2,1}(:,:,count+6);discharge_monthavg_diff{2,1}(:,:,count+7);discharge_monthavg_diff{2,1}(:,:,count+8);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Temperature Melting Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+6));
    title('June - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+7));
    title('July - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+8));
    title('August - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+6));
    title('June - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+7));
    title('July - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+8));
    title('August - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Autumn season 
 cmin = min(min([discharge_monthavg_diff{1,1}(:,:,count+9);discharge_monthavg_diff{1,1}(:,:,count+10);discharge_monthavg_diff{1,1}(:,:,count+11);...
        discharge_monthavg_diff{2,1}(:,:,count+9);discharge_monthavg_diff{2,1}(:,:,count+10);discharge_monthavg_diff{2,1}(:,:,count+11);]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+9);discharge_monthavg_diff{1,1}(:,:,count+10);discharge_monthavg_diff{1,1}(:,:,count+11);...
        discharge_monthavg_diff{2,1}(:,:,count+9);discharge_monthavg_diff{2,1}(:,:,count+10);discharge_monthavg_diff{2,1}(:,:,count+11);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Temperature Melting Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+9));
    title('September - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+10));
    title('October - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+11));
    title('November - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+9));
    title('September - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+10));
    title('October - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+11));
    title('November - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

% Plot Discharge influenced by TempSnow sensitivity
% Precipitation is assumed to be snow if daily average temperature is below
% the threshold (TempSnow, default is 1.0 deg Celsius).
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([discharge_monthavg_diff{3,1}(:,:,count+1);discharge_monthavg_diff{3,1}(:,:,count+2);discharge_monthavg_diff{3,1}(:,:,count+12);...
        discharge_monthavg_diff{4,1}(:,:,count+1);discharge_monthavg_diff{4,1}(:,:,count+2);discharge_monthavg_diff{4,1}(:,:,count+12);]));
    cmax = max(max([discharge_monthavg_diff{3,1}(:,:,count+1);discharge_monthavg_diff{3,1}(:,:,count+2);discharge_monthavg_diff{3,1}(:,:,count+12);...
        discharge_monthavg_diff{4,1}(:,:,count+1);discharge_monthavg_diff{4,1}(:,:,count+2);discharge_monthavg_diff{4,1}(:,:,count+12);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+1));
    title('January - Undisturbed vs TempSnow096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+2));
    title('February - Undisturbed vs TempSnow096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+12));
    title('December - Undisturbed vs TempSnow096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+1));
    title('January - Undisturbed vs TempSnow102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+2));
    title('February - Undisturbed vs TempSnow102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+12));
    title('December - Undisturbed vs TempSnow102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end
clear count i j k year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Spring season 
    cmin = min(min([discharge_monthavg_diff{3,1}(:,:,count+3);discharge_monthavg_diff{3,1}(:,:,count+4);discharge_monthavg_diff{3,1}(:,:,count+5);...
        discharge_monthavg_diff{4,1}(:,:,count+3);discharge_monthavg_diff{4,1}(:,:,count+4);discharge_monthavg_diff{4,1}(:,:,count+5);]));
    cmax = max(max([discharge_monthavg_diff{3,1}(:,:,count+3);discharge_monthavg_diff{3,1}(:,:,count+4);discharge_monthavg_diff{3,1}(:,:,count+5);...
        discharge_monthavg_diff{4,1}(:,:,count+3);discharge_monthavg_diff{4,1}(:,:,count+4);discharge_monthavg_diff{4,1}(:,:,count+5);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+3));
    title('March- Undisturbed vs TempSnow096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+4));
    title('April - Undisturbed vs TempSnow096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+5));
    title('May - Undisturbed vs TempSnow096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+3));
    title('March - Undisturbed vs TempSnow102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+4));
    title('April - Undisturbed vs TempSnow102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+5));
    title('May - Undisturbed vs TempSnow102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Summer season 
    cmin = min(min([discharge_monthavg_diff{3,1}(:,:,count+6);discharge_monthavg_diff{3,1}(:,:,count+7);discharge_monthavg_diff{3,1}(:,:,count+8);...
        discharge_monthavg_diff{4,1}(:,:,count+6);discharge_monthavg_diff{4,1}(:,:,count+7);discharge_monthavg_diff{4,1}(:,:,count+8);]));
    cmax = max(max([discharge_monthavg_diff{3,1}(:,:,count+6);discharge_monthavg_diff{3,1}(:,:,count+7);discharge_monthavg_diff{3,1}(:,:,count+8);...
        discharge_monthavg_diff{4,1}(:,:,count+6);discharge_monthavg_diff{4,1}(:,:,count+7);discharge_monthavg_diff{4,1}(:,:,count+8);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Temperature Melting Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+6));
    title('June - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+7));
    title('July - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+8));
    title('August - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+6));
    title('June - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+7));
    title('July - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+8));
    title('August - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Autumn season 
 cmin = min(min([discharge_monthavg_diff{3,1}(:,:,count+9);discharge_monthavg_diff{3,1}(:,:,count+10);discharge_monthavg_diff{3,1}(:,:,count+11);...
        discharge_monthavg_diff{4,1}(:,:,count+9);discharge_monthavg_diff{4,1}(:,:,count+10);discharge_monthavg_diff{4,1}(:,:,count+11);]));
    cmax = max(max([discharge_monthavg_diff{3,1}(:,:,count+9);discharge_monthavg_diff{3,1}(:,:,count+10);discharge_monthavg_diff{3,1}(:,:,count+11);...
        discharge_monthavg_diff{4,1}(:,:,count+9);discharge_monthavg_diff{4,1}(:,:,count+10);discharge_monthavg_diff{4,1}(:,:,count+11);]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Temperature Melting Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(2,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+9));
    title('September - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+10));
    title('October - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+11));
    title('November - Undisturbed vs TempMelt096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+9));
    title('September - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+10));
    title('October - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(2,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+11));
    title('November - Undisturbed vs TempMelt102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;
