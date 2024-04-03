% This script is intended for the purposes of assignment 10 as part of the
% course "Geo-Environmental Modeling & Analysis" ErSE 394B.
% Author: Paschalis Garouniatis, PhD Student ErSE Department
% Email: paschalis.garouniatis@kaust.edu.sa


% We will read all data available

% ---- The following section needs further improvement.
% Cannot overcome for now the issue of reading variable in position 3 (eg
% 'discharge') 
% % ncid = netcdf.open('totalET_annualavg.nc','NC_NOWRITE');
% ncid = netcdf.open('discharge_daily.nc','NC_NOWRITE');
% % The nc file is structured as :
% % lon (pos = 0), lat (pos = 1), time (pos = 2) and discharge (pos = 3)
% lon = netcdf.getVar(ncid,0); % 0 corresponds to longitude
% lat = netcdf.getVar(ncid,1); % 1 corresponds to latitude
% time = netcdf.getVar(ncid,2); % 2 corresponds to time (years, months, or days)
% varid = netcdf.inqVarID(ncid,'discharge'); 
% % Precipitation_monthavg = netcdf.getVar(ncid,varid);
% [noFillMode,fillValue] = netcdf.inqVarFill(ncid,varid);
% % new_mode = 'NC_NOFILL';
% % old_mode = netcdf.setFill(ncid,new_mode);
% discharge2 = ncread('discharge_daily.nc','discharge');
% % Precipitation_monthavg = netcdf.getVar(ncid,3); % 3 corresponds to totalET
% netcdf.close(ncid);

addpath(genpath('/Users/garounp/Desktop/11_SensitivityAnalysis_Climate'));
clear; clc;

% --- Another apporach
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
Prec_simulation0{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Prec_simulation0{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Prec_simulation0{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Prec_simulation0{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Prec_simulation0{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Prec_simulation0{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Prec_simulation0{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Prec_simulation0{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Prec_simulation0{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Prec_simulation0{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Prec_simulation0{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Prec_simulation0{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Prec095/;
Prec_simulation095{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Prec_simulation095{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Prec_simulation095{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Prec_simulation095{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Prec_simulation095{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Prec_simulation095{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Prec_simulation095{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Prec_simulation095{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Prec_simulation095{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Prec_simulation095{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Prec_simulation095{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Prec_simulation095{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Prec097/;
Prec_simulation097{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Prec_simulation097{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Prec_simulation097{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Prec_simulation097{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Prec_simulation097{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Prec_simulation097{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Prec_simulation097{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Prec_simulation097{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Prec_simulation097{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Prec_simulation097{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Prec_simulation097{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Prec_simulation097{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Prec101/;
Prec_simulation101{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Prec_simulation101{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Prec_simulation101{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Prec_simulation101{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Prec_simulation101{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Prec_simulation101{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Prec_simulation101{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Prec_simulation101{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Prec_simulation101{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Prec_simulation101{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Prec_simulation101{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Prec_simulation101{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Prec103/;
Prec_simulation103{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Prec_simulation103{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Prec_simulation103{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Prec_simulation103{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Prec_simulation103{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Prec_simulation103{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Prec_simulation103{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Prec_simulation103{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Prec_simulation103{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Prec_simulation103{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Prec_simulation103{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Prec_simulation103{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Tavg096/;
Tavg_simulation096{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Tavg_simulation096{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Tavg_simulation096{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Tavg_simulation096{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Tavg_simulation096{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Tavg_simulation096{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Tavg_simulation096{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Tavg_simulation096{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Tavg_simulation096{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Tavg_simulation096{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Tavg_simulation096{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Tavg_simulation096{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Tavg098/;
Tavg_simulation098{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Tavg_simulation098{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Tavg_simulation098{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Tavg_simulation098{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Tavg_simulation098{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Tavg_simulation098{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Tavg_simulation098{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Tavg_simulation098{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Tavg_simulation098{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Tavg_simulation098{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Tavg_simulation098{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Tavg_simulation098{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Tavg102/;
Tavg_simulation102{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Tavg_simulation102{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Tavg_simulation102{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Tavg_simulation102{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Tavg_simulation102{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Tavg_simulation102{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Tavg_simulation102{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Tavg_simulation102{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Tavg_simulation102{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Tavg_simulation102{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Tavg_simulation102{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Tavg_simulation102{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;
cd output_simulation_Tavg103/;
Tavg_simulation103{1,1} = ncread('discharge_daily.nc','discharge'); % discharge_daily - units in m3/s
Tavg_simulation103{2,1} = ncread('Precipitation_daily.nc','Precipitation'); % Precipitation_daily - units in m
Tavg_simulation103{3,1} = ncread('Precipitation_monthavg.nc','Precipitation_monthavg'); % Precipitation_monthavg - units in m
Tavg_simulation103{4,1} = ncread('Precipitation_annualtot.nc','Precipitation_annualtot'); % Precipitation_annualtot - units in m
Tavg_simulation103{5,1} = ncread('runoff_monthavg.nc','runoff_monthavg'); % runoff_monthavg - dimensionless quantity
Tavg_simulation103{6,1} = ncread('runoff_annualtot.nc','runoff_annualtot'); % runoff_annualtot - dimensionless quantity
Tavg_simulation103{7,1} = ncread('sum_directRunoff_monthavg.nc','sum_directRunoff_monthavg'); % sum_directRunoff_monthavg - dimensionless quantity
Tavg_simulation103{8,1} = ncread('sum_directRunoff_annualtot.nc','sum_directRunoff_annualtot'); % sum_directRunoff_annualtot - dimensionless quantity
Tavg_simulation103{9,1} = ncread('Tavg_daily.nc','Tavg'); % Tavg_daily - units in K
Tavg_simulation103{10,1} = ncread('totalET_monthavg.nc','totalET_monthavg'); % totalET_monthavg - units in m
Tavg_simulation103{11,1} = ncread('totalET_annualtot.nc','totalET_annualtot'); % totalET_annualtot - units in m
Tavg_simulation103{12,1} = ncread('discharge_monthavg.nc','discharge_monthavg'); % discharge_monthavg - units in m3/s
cd ../;

% -------------------- END OF INPUT DATA SECTION --------------------
%% -------------------- POST PROCESSING SECTION --------------------
% ------------------------------------------------------------------
% -------------------- Total ET - Monthly Average --------------------
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([Prec_simulation0{10,1}(:,:,count+1);Prec_simulation0{10,1}(:,:,count+2);Prec_simulation0{10,1}(:,:,count+12);Prec_simulation095{10,1}(:,:,count+1);Prec_simulation095{10,1}(:,:,count+2);Prec_simulation095{10,1}(:,:,count+12);...
        Prec_simulation097{10,1}(:,:,count+1);Prec_simulation097{10,1}(:,:,count+2);Prec_simulation097{10,1}(:,:,count+12);Prec_simulation101{10,1}(:,:,count+1);Prec_simulation101{10,1}(:,:,count+2);Prec_simulation101{10,1}(:,:,count+12);...
        Prec_simulation103{10,1}(:,:,count+1);Prec_simulation103{10,1}(:,:,count+2);Prec_simulation103{10,1}(:,:,count+12)]));
    cmax = max(max([Prec_simulation0{10,1}(:,:,count+1);Prec_simulation0{10,1}(:,:,count+2);Prec_simulation0{10,1}(:,:,count+12);Prec_simulation095{10,1}(:,:,count+1);Prec_simulation095{10,1}(:,:,count+2);Prec_simulation095{10,1}(:,:,count+12);...
        Prec_simulation097{10,1}(:,:,count+1);Prec_simulation097{10,1}(:,:,count+2);Prec_simulation097{10,1}(:,:,count+12);Prec_simulation101{10,1}(:,:,count+1);Prec_simulation101{10,1}(:,:,count+2);Prec_simulation101{10,1}(:,:,count+12);...
        Prec_simulation103{10,1}(:,:,count+1);Prec_simulation103{10,1}(:,:,count+2);Prec_simulation103{10,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Precipitation Scenarios for " + year + " - Winter Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+1));
    title('January - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+2));
    title('February - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+12));
    title('December - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+1));
    title('January  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+2));
    title('February - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+12));
    title('December - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+1));
    title('January - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+2));
    title('February - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+12));
    title('December - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+1));
    title('January - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+2));
    title('February - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+12));
    title('December - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+1));
    title('January - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+2));
    title('February - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+12));
    title('December - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end
clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Spring season 
    cmin = min(min([Prec_simulation0{10,1}(:,:,count+3);Prec_simulation0{10,1}(:,:,count+4);Prec_simulation0{10,1}(:,:,count+5);Prec_simulation095{10,1}(:,:,count+3);Prec_simulation095{10,1}(:,:,count+4);Prec_simulation095{10,1}(:,:,count+5);...
        Prec_simulation097{10,1}(:,:,count+3);Prec_simulation097{10,1}(:,:,count+4);Prec_simulation097{10,1}(:,:,count+5);Prec_simulation101{10,1}(:,:,count+3);Prec_simulation101{10,1}(:,:,count+4);Prec_simulation101{10,1}(:,:,count+5);...
        Prec_simulation103{10,1}(:,:,count+3);Prec_simulation103{10,1}(:,:,count+4);Prec_simulation103{10,1}(:,:,count+5)]));
    cmax = max(max([Prec_simulation0{10,1}(:,:,count+3);Prec_simulation0{10,1}(:,:,count+4);Prec_simulation0{10,1}(:,:,count+5);Prec_simulation095{10,1}(:,:,count+3);Prec_simulation095{10,1}(:,:,count+4);Prec_simulation095{10,1}(:,:,count+5);...
        Prec_simulation097{10,1}(:,:,count+3);Prec_simulation097{10,1}(:,:,count+4);Prec_simulation097{10,1}(:,:,count+5);Prec_simulation101{10,1}(:,:,count+3);Prec_simulation101{10,1}(:,:,count+4);Prec_simulation101{10,1}(:,:,count+5);...
        Prec_simulation103{10,1}(:,:,count+3);Prec_simulation103{10,1}(:,:,count+4);Prec_simulation103{10,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Precipitation Scenarios for " + year + " - Spring Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+3));
    title('March - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+4));
    title('April - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+5));
    title('May - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+3));
    title('March  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+4));
    title('April - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+5));
    title('May - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+3));
    title('March - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+4));
    title('April - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+5));
    title('May - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+3));
    title('March - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+4));
    title('April - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+5));
    title('May - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+3));
    title('March - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+4));
    title('April - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+5));
    title('May - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Summer season 
    cmin = min(min([Prec_simulation0{10,1}(:,:,count+6);Prec_simulation0{10,1}(:,:,count+7);Prec_simulation0{10,1}(:,:,count+8);Prec_simulation095{10,1}(:,:,count+6);Prec_simulation095{10,1}(:,:,count+7);Prec_simulation095{10,1}(:,:,count+8);...
        Prec_simulation097{10,1}(:,:,count+6);Prec_simulation097{10,1}(:,:,count+7);Prec_simulation097{10,1}(:,:,count+8);Prec_simulation101{10,1}(:,:,count+6);Prec_simulation101{10,1}(:,:,count+7);Prec_simulation101{10,1}(:,:,count+8);...
        Prec_simulation103{10,1}(:,:,count+6);Prec_simulation103{10,1}(:,:,count+7);Prec_simulation103{10,1}(:,:,count+8)]));
    cmax = max(max([Prec_simulation0{10,1}(:,:,count+6);Prec_simulation0{10,1}(:,:,count+7);Prec_simulation0{10,1}(:,:,count+8);Prec_simulation095{10,1}(:,:,count+6);Prec_simulation095{10,1}(:,:,count+7);Prec_simulation095{10,1}(:,:,count+8);...
        Prec_simulation097{10,1}(:,:,count+6);Prec_simulation097{10,1}(:,:,count+7);Prec_simulation097{10,1}(:,:,count+8);Prec_simulation101{10,1}(:,:,count+6);Prec_simulation101{10,1}(:,:,count+7);Prec_simulation101{10,1}(:,:,count+8);...
        Prec_simulation103{10,1}(:,:,count+6);Prec_simulation103{10,1}(:,:,count+7);Prec_simulation103{10,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Precipitation Scenarios for " + year + " - Summer Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+6));
    title('June - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+7));
    title('July - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+8));
    title('August - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+6));
    title('June  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+7));
    title('July - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+8));
    title('August - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+6));
    title('June - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+7));
    title('July - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+8));
    title('August - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+6));
    title('June - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+7));
    title('July - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+8));
    title('August - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+6));
    title('June - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+7));
    title('July - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+8));
    title('August - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Autumn season 
    cmin = min(min([Prec_simulation0{10,1}(:,:,count+9);Prec_simulation0{10,1}(:,:,count+10);Prec_simulation0{10,1}(:,:,count+11);Prec_simulation095{10,1}(:,:,count+9);Prec_simulation095{10,1}(:,:,count+10);Prec_simulation095{10,1}(:,:,count+11);...
        Prec_simulation097{10,1}(:,:,count+9);Prec_simulation097{10,1}(:,:,count+10);Prec_simulation097{10,1}(:,:,count+11);Prec_simulation101{10,1}(:,:,count+9);Prec_simulation101{10,1}(:,:,count+10);Prec_simulation101{10,1}(:,:,count+11);...
        Prec_simulation103{10,1}(:,:,count+9);Prec_simulation103{10,1}(:,:,count+10);Prec_simulation103{10,1}(:,:,count+11)]));
    cmax = max(max([Prec_simulation0{10,1}(:,:,count+9);Prec_simulation0{10,1}(:,:,count+10);Prec_simulation0{10,1}(:,:,count+11);Prec_simulation095{10,1}(:,:,count+9);Prec_simulation095{10,1}(:,:,count+10);Prec_simulation095{10,1}(:,:,count+11);...
        Prec_simulation097{10,1}(:,:,count+9);Prec_simulation097{10,1}(:,:,count+10);Prec_simulation097{10,1}(:,:,count+11);Prec_simulation101{10,1}(:,:,count+9);Prec_simulation101{10,1}(:,:,count+10);Prec_simulation101{10,1}(:,:,count+11);...
        Prec_simulation103{10,1}(:,:,count+9);Prec_simulation103{10,1}(:,:,count+10);Prec_simulation103{10,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Precipitation Scenarios for " + year + " - Autumn Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+9));
    title('September - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+10));
    title('October - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{10,1}(:,:,count+11));
    title('November - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+9));
    title('September  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+10));
    title('October - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{10,1}(:,:,count+11));
    title('November - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+9));
    title('September - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+10));
    title('October - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{10,1}(:,:,count+11));
    title('November - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+9));
    title('September - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+10));
    title('October - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{10,1}(:,:,count+11));
    title('November - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+9));
    title('September - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+10));
    title('October - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{10,1}(:,:,count+11));
    title('November - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

% -------------------- Calculate and visualize differences ----------------
for i = 1:120
    for j = 1:size(lon,1)
        for k = 1:size(lat,1)
            % difference between undisturbed and Prec_simulation095
            totalET_monthavg_diff{1,1}(j,k,i) = 100 * ((Prec_simulation095{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
            % difference between undisturbed and Prec_simulation097
            totalET_monthavg_diff{2,1}(j,k,i) = 100 * ((Prec_simulation097{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
            % difference between undisturbed and Prec_simulation101
            totalET_monthavg_diff{3,1}(j,k,i) = 100 * ((Prec_simulation101{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
            % difference between undisturbed and Prec_simulation103
            totalET_monthavg_diff{4,1}(j,k,i) = 100 * ((Prec_simulation103{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation096
            totalET_monthavg_diff{5,1}(j,k,i) = 100 * ((Tavg_simulation096{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation098
            totalET_monthavg_diff{6,1}(j,k,i) = 100 * ((Tavg_simulation098{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation102
            totalET_monthavg_diff{7,1}(j,k,i) = 100 * ((Tavg_simulation102{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation103
            totalET_monthavg_diff{8,1}(j,k,i) = 100 * ((Tavg_simulation103{10,1}(j,k,i) - Prec_simulation0{10,1}(j,k,i))/Prec_simulation0{10,1}(j,k,i));
        end
    end
end
clear i j k;
% Plot totalET influenced by Precipitation sensitivity
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([totalET_monthavg_diff{1,1}(:,:,count+1);totalET_monthavg_diff{1,1}(:,:,count+2);totalET_monthavg_diff{1,1}(:,:,count+12);...
        totalET_monthavg_diff{2,1}(:,:,count+1);totalET_monthavg_diff{2,1}(:,:,count+2);totalET_monthavg_diff{2,1}(:,:,count+12);...
        totalET_monthavg_diff{3,1}(:,:,count+1);totalET_monthavg_diff{3,1}(:,:,count+2);totalET_monthavg_diff{3,1}(:,:,count+12);...
        totalET_monthavg_diff{4,1}(:,:,count+1);totalET_monthavg_diff{4,1}(:,:,count+2);totalET_monthavg_diff{4,1}(:,:,count+12)]));
    cmax = max(max([totalET_monthavg_diff{1,1}(:,:,count+1);totalET_monthavg_diff{1,1}(:,:,count+2);totalET_monthavg_diff{1,1}(:,:,count+12);...
        totalET_monthavg_diff{2,1}(:,:,count+1);totalET_monthavg_diff{2,1}(:,:,count+2);totalET_monthavg_diff{2,1}(:,:,count+12);...
        totalET_monthavg_diff{3,1}(:,:,count+1);totalET_monthavg_diff{3,1}(:,:,count+2);totalET_monthavg_diff{3,1}(:,:,count+12);...
        totalET_monthavg_diff{4,1}(:,:,count+1);totalET_monthavg_diff{4,1}(:,:,count+2);totalET_monthavg_diff{4,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+1));
    title('January - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+2));
    title('February - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+12));
    title('December - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+1));
    title('January - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+2));
    title('February - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+12));
    title('December - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+1));
    title('January - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+2));
    title('February - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+12));
    title('December - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+1));
    title('January - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+2));
    title('February - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+12));
    title('December - Undisturbed vs Prec103');
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
     cmin = min(min([totalET_monthavg_diff{1,1}(:,:,count+3);totalET_monthavg_diff{1,1}(:,:,count+4);totalET_monthavg_diff{1,1}(:,:,count+5);...
        totalET_monthavg_diff{2,1}(:,:,count+3);totalET_monthavg_diff{2,1}(:,:,count+4);totalET_monthavg_diff{2,1}(:,:,count+5);...
        totalET_monthavg_diff{3,1}(:,:,count+3);totalET_monthavg_diff{3,1}(:,:,count+4);totalET_monthavg_diff{3,1}(:,:,count+5);...
        totalET_monthavg_diff{4,1}(:,:,count+3);totalET_monthavg_diff{4,1}(:,:,count+4);totalET_monthavg_diff{4,1}(:,:,count+5)]));
    cmax = max(max([totalET_monthavg_diff{1,1}(:,:,count+3);totalET_monthavg_diff{1,1}(:,:,count+4);totalET_monthavg_diff{1,1}(:,:,count+5);...
        totalET_monthavg_diff{2,1}(:,:,count+3);totalET_monthavg_diff{2,1}(:,:,count+4);totalET_monthavg_diff{2,1}(:,:,count+5);...
        totalET_monthavg_diff{3,1}(:,:,count+3);totalET_monthavg_diff{3,1}(:,:,count+4);totalET_monthavg_diff{3,1}(:,:,count+5);...
        totalET_monthavg_diff{4,1}(:,:,count+3);totalET_monthavg_diff{4,1}(:,:,count+4);totalET_monthavg_diff{4,1}(:,:,count+5)]));    
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+3));
    title('March - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+4));
    title('April - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+5));
    title('May - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+3));
    title('March - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+4));
    title('April - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+5));
    title('May - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+3));
    title('March - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+4));
    title('April - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+5));
    title('May - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+3));
    title('March - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+4));
    title('April - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+5));
    title('May - Undisturbed vs Prec103');
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
     cmin = min(min([totalET_monthavg_diff{1,1}(:,:,count+6);totalET_monthavg_diff{1,1}(:,:,count+7);totalET_monthavg_diff{1,1}(:,:,count+8);...
        totalET_monthavg_diff{2,1}(:,:,count+6);totalET_monthavg_diff{2,1}(:,:,count+7);totalET_monthavg_diff{2,1}(:,:,count+8);...
        totalET_monthavg_diff{3,1}(:,:,count+6);totalET_monthavg_diff{3,1}(:,:,count+7);totalET_monthavg_diff{3,1}(:,:,count+8);...
        totalET_monthavg_diff{4,1}(:,:,count+6);totalET_monthavg_diff{4,1}(:,:,count+7);totalET_monthavg_diff{4,1}(:,:,count+8)]));
    cmax = max(max([totalET_monthavg_diff{1,1}(:,:,count+6);totalET_monthavg_diff{1,1}(:,:,count+7);totalET_monthavg_diff{1,1}(:,:,count+8);...
        totalET_monthavg_diff{2,1}(:,:,count+6);totalET_monthavg_diff{2,1}(:,:,count+7);totalET_monthavg_diff{2,1}(:,:,count+8);...
        totalET_monthavg_diff{3,1}(:,:,count+6);totalET_monthavg_diff{3,1}(:,:,count+7);totalET_monthavg_diff{3,1}(:,:,count+8);...
        totalET_monthavg_diff{4,1}(:,:,count+6);totalET_monthavg_diff{4,1}(:,:,count+7);totalET_monthavg_diff{4,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences in Precipitation Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+6));
    title('June - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+7));
    title('July - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+8));
    title('August - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+6));
    title('June - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+7));
    title('July - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+8));
    title('August - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+6));
    title('June - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+7));
    title('July - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+8));
    title('August - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+6));
    title('June - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+7));
    title('July - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+8));
    title('August - Undisturbed vs Prec103');
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
     cmin = min(min([totalET_monthavg_diff{1,1}(:,:,count+9);totalET_monthavg_diff{1,1}(:,:,count+10);totalET_monthavg_diff{1,1}(:,:,count+11);...
        totalET_monthavg_diff{2,1}(:,:,count+9);totalET_monthavg_diff{2,1}(:,:,count+10);totalET_monthavg_diff{2,1}(:,:,count+11);...
        totalET_monthavg_diff{3,1}(:,:,count+9);totalET_monthavg_diff{3,1}(:,:,count+10);totalET_monthavg_diff{3,1}(:,:,count+11);...
        totalET_monthavg_diff{4,1}(:,:,count+9);totalET_monthavg_diff{4,1}(:,:,count+10);totalET_monthavg_diff{4,1}(:,:,count+11)]));
    cmax = max(max([totalET_monthavg_diff{1,1}(:,:,count+9);totalET_monthavg_diff{1,1}(:,:,count+10);totalET_monthavg_diff{1,1}(:,:,count+11);...
        totalET_monthavg_diff{2,1}(:,:,count+9);totalET_monthavg_diff{2,1}(:,:,count+10);totalET_monthavg_diff{2,1}(:,:,count+11);...
        totalET_monthavg_diff{3,1}(:,:,count+9);totalET_monthavg_diff{3,1}(:,:,count+10);totalET_monthavg_diff{3,1}(:,:,count+11);...
        totalET_monthavg_diff{4,1}(:,:,count+9);totalET_monthavg_diff{4,1}(:,:,count+10);totalET_monthavg_diff{4,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences in Precipitation Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+9));
    title('September - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+10));
    title('October - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{1,1}(:,:,count+11));
    title('November - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+9));
    title('September - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+10));
    title('October - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{2,1}(:,:,count+11));
    title('November - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+9));
    title('September - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+10));
    title('October - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{3,1}(:,:,count+11));
    title('November - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+9));
    title('September - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+10));
    title('October - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{4,1}(:,:,count+11));
    title('November - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

% Plot totalET influenced by Tavg sensitivity
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
     cmin = min(min([totalET_monthavg_diff{5,1}(:,:,count+1);totalET_monthavg_diff{5,1}(:,:,count+2);totalET_monthavg_diff{5,1}(:,:,count+12);...
        totalET_monthavg_diff{6,1}(:,:,count+1);totalET_monthavg_diff{6,1}(:,:,count+2);totalET_monthavg_diff{6,1}(:,:,count+12);...
        totalET_monthavg_diff{7,1}(:,:,count+1);totalET_monthavg_diff{7,1}(:,:,count+2);totalET_monthavg_diff{7,1}(:,:,count+12);...
        totalET_monthavg_diff{8,1}(:,:,count+1);totalET_monthavg_diff{8,1}(:,:,count+2);totalET_monthavg_diff{8,1}(:,:,count+12)]));
    cmax = max(max([totalET_monthavg_diff{5,1}(:,:,count+1);totalET_monthavg_diff{5,1}(:,:,count+2);totalET_monthavg_diff{5,1}(:,:,count+12);...
        totalET_monthavg_diff{6,1}(:,:,count+1);totalET_monthavg_diff{6,1}(:,:,count+2);totalET_monthavg_diff{6,1}(:,:,count+12);...
        totalET_monthavg_diff{7,1}(:,:,count+1);totalET_monthavg_diff{7,1}(:,:,count+2);totalET_monthavg_diff{7,1}(:,:,count+12);...
        totalET_monthavg_diff{8,1}(:,:,count+1);totalET_monthavg_diff{8,1}(:,:,count+2);totalET_monthavg_diff{8,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences (%) in Tavg Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg103');
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
    cmin = min(min([totalET_monthavg_diff{5,1}(:,:,count+3);totalET_monthavg_diff{5,1}(:,:,count+4);totalET_monthavg_diff{5,1}(:,:,count+5);...
        totalET_monthavg_diff{6,1}(:,:,count+3);totalET_monthavg_diff{6,1}(:,:,count+4);totalET_monthavg_diff{6,1}(:,:,count+5);...
        totalET_monthavg_diff{7,1}(:,:,count+3);totalET_monthavg_diff{7,1}(:,:,count+4);totalET_monthavg_diff{7,1}(:,:,count+5);...
        totalET_monthavg_diff{8,1}(:,:,count+3);totalET_monthavg_diff{8,1}(:,:,count+4);totalET_monthavg_diff{8,1}(:,:,count+5)]));
    cmax = max(max([totalET_monthavg_diff{5,1}(:,:,count+3);totalET_monthavg_diff{5,1}(:,:,count+4);totalET_monthavg_diff{5,1}(:,:,count+5);...
        totalET_monthavg_diff{6,1}(:,:,count+3);totalET_monthavg_diff{6,1}(:,:,count+4);totalET_monthavg_diff{6,1}(:,:,count+5);...
        totalET_monthavg_diff{7,1}(:,:,count+3);totalET_monthavg_diff{7,1}(:,:,count+4);totalET_monthavg_diff{7,1}(:,:,count+5);...
        totalET_monthavg_diff{8,1}(:,:,count+3);totalET_monthavg_diff{8,1}(:,:,count+4);totalET_monthavg_diff{8,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences (%) in Tavg Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg103');
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
    cmin = min(min([totalET_monthavg_diff{5,1}(:,:,count+6);totalET_monthavg_diff{5,1}(:,:,count+7);totalET_monthavg_diff{5,1}(:,:,count+8);...
        totalET_monthavg_diff{6,1}(:,:,count+6);totalET_monthavg_diff{6,1}(:,:,count+7);totalET_monthavg_diff{6,1}(:,:,count+8);...
        totalET_monthavg_diff{7,1}(:,:,count+6);totalET_monthavg_diff{7,1}(:,:,count+7);totalET_monthavg_diff{7,1}(:,:,count+8);...
        totalET_monthavg_diff{8,1}(:,:,count+6);totalET_monthavg_diff{8,1}(:,:,count+7);totalET_monthavg_diff{8,1}(:,:,count+8)]));
    cmax = max(max([totalET_monthavg_diff{5,1}(:,:,count+6);totalET_monthavg_diff{5,1}(:,:,count+7);totalET_monthavg_diff{5,1}(:,:,count+8);...
        totalET_monthavg_diff{6,1}(:,:,count+6);totalET_monthavg_diff{6,1}(:,:,count+7);totalET_monthavg_diff{6,1}(:,:,count+8);...
        totalET_monthavg_diff{7,1}(:,:,count+6);totalET_monthavg_diff{7,1}(:,:,count+7);totalET_monthavg_diff{7,1}(:,:,count+8);...
        totalET_monthavg_diff{8,1}(:,:,count+6);totalET_monthavg_diff{8,1}(:,:,count+7);totalET_monthavg_diff{8,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences in Tavg Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg103');
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
    cmin = min(min([totalET_monthavg_diff{5,1}(:,:,count+9);totalET_monthavg_diff{5,1}(:,:,count+10);totalET_monthavg_diff{5,1}(:,:,count+11);...
        totalET_monthavg_diff{6,1}(:,:,count+9);totalET_monthavg_diff{6,1}(:,:,count+10);totalET_monthavg_diff{6,1}(:,:,count+11);...
        totalET_monthavg_diff{7,1}(:,:,count+9);totalET_monthavg_diff{7,1}(:,:,count+10);totalET_monthavg_diff{7,1}(:,:,count+11);...
        totalET_monthavg_diff{8,1}(:,:,count+9);totalET_monthavg_diff{8,1}(:,:,count+10);totalET_monthavg_diff{8,1}(:,:,count+11)]));
    cmax = max(max([totalET_monthavg_diff{5,1}(:,:,count+9);totalET_monthavg_diff{5,1}(:,:,count+10);totalET_monthavg_diff{5,1}(:,:,count+11);...
        totalET_monthavg_diff{6,1}(:,:,count+9);totalET_monthavg_diff{6,1}(:,:,count+10);totalET_monthavg_diff{6,1}(:,:,count+11);...
        totalET_monthavg_diff{7,1}(:,:,count+9);totalET_monthavg_diff{7,1}(:,:,count+10);totalET_monthavg_diff{7,1}(:,:,count+11);...
        totalET_monthavg_diff{8,1}(:,:,count+9);totalET_monthavg_diff{8,1}(:,:,count+10);totalET_monthavg_diff{8,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average total ET Differences in Tavg Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(4,3,1);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,totalET_monthavg_diff{5,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,totalET_monthavg_diff{6,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,totalET_monthavg_diff{7,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,totalET_monthavg_diff{8,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

% -------------------- Runoff - Monthly Average --------------------
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([Prec_simulation0{7,1}(:,:,count+1);Prec_simulation0{7,1}(:,:,count+2);Prec_simulation0{7,1}(:,:,count+12);Prec_simulation095{7,1}(:,:,count+1);Prec_simulation095{7,1}(:,:,count+2);Prec_simulation095{7,1}(:,:,count+12);...
        Prec_simulation097{7,1}(:,:,count+1);Prec_simulation097{7,1}(:,:,count+2);Prec_simulation097{7,1}(:,:,count+12);Prec_simulation101{7,1}(:,:,count+1);Prec_simulation101{7,1}(:,:,count+2);Prec_simulation101{7,1}(:,:,count+12);...
        Prec_simulation103{7,1}(:,:,count+1);Prec_simulation103{7,1}(:,:,count+2);Prec_simulation103{7,1}(:,:,count+12)]));
    cmax = max(max([Prec_simulation0{7,1}(:,:,count+1);Prec_simulation0{7,1}(:,:,count+2);Prec_simulation0{7,1}(:,:,count+12);Prec_simulation095{7,1}(:,:,count+1);Prec_simulation095{7,1}(:,:,count+2);Prec_simulation095{7,1}(:,:,count+12);...
        Prec_simulation097{7,1}(:,:,count+1);Prec_simulation097{7,1}(:,:,count+2);Prec_simulation097{7,1}(:,:,count+12);Prec_simulation101{7,1}(:,:,count+1);Prec_simulation101{7,1}(:,:,count+2);Prec_simulation101{7,1}(:,:,count+12);...
        Prec_simulation103{7,1}(:,:,count+1);Prec_simulation103{7,1}(:,:,count+2);Prec_simulation103{7,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Scenarios for " + year + " - Winter Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+1));
    title('January - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+2));
    title('February - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+12));
    title('December - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+1));
    title('January  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+2));
    title('February - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+12));
    title('December - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+1));
    title('January - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+2));
    title('February - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+12));
    title('December - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+1));
    title('January - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+2));
    title('February - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+12));
    title('December - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+1));
    title('January - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+2));
    title('February - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+12));
    title('December - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end
clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Spring season 
    cmin = min(min([Prec_simulation0{7,1}(:,:,count+3);Prec_simulation0{7,1}(:,:,count+4);Prec_simulation0{7,1}(:,:,count+5);Prec_simulation095{7,1}(:,:,count+3);Prec_simulation095{7,1}(:,:,count+4);Prec_simulation095{7,1}(:,:,count+5);...
        Prec_simulation097{7,1}(:,:,count+3);Prec_simulation097{7,1}(:,:,count+4);Prec_simulation097{7,1}(:,:,count+5);Prec_simulation101{7,1}(:,:,count+3);Prec_simulation101{7,1}(:,:,count+4);Prec_simulation101{7,1}(:,:,count+5);...
        Prec_simulation103{7,1}(:,:,count+3);Prec_simulation103{7,1}(:,:,count+4);Prec_simulation103{7,1}(:,:,count+5)]));
    cmax = max(max([Prec_simulation0{7,1}(:,:,count+3);Prec_simulation0{7,1}(:,:,count+4);Prec_simulation0{7,1}(:,:,count+5);Prec_simulation095{7,1}(:,:,count+3);Prec_simulation095{7,1}(:,:,count+4);Prec_simulation095{7,1}(:,:,count+5);...
        Prec_simulation097{7,1}(:,:,count+3);Prec_simulation097{7,1}(:,:,count+4);Prec_simulation097{7,1}(:,:,count+5);Prec_simulation101{7,1}(:,:,count+3);Prec_simulation101{7,1}(:,:,count+4);Prec_simulation101{7,1}(:,:,count+5);...
        Prec_simulation103{7,1}(:,:,count+3);Prec_simulation103{7,1}(:,:,count+4);Prec_simulation103{7,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Scenarios for " + year + " - Spring Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+3));
    title('March - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+4));
    title('April - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+5));
    title('May - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+3));
    title('March  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+4));
    title('April - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+5));
    title('May - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+3));
    title('March - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+4));
    title('April - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+5));
    title('May - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+3));
    title('March - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+4));
    title('April - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+5));
    title('May - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+3));
    title('March - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+4));
    title('April - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+5));
    title('May - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Summer season 
    cmin = min(min([Prec_simulation0{7,1}(:,:,count+6);Prec_simulation0{7,1}(:,:,count+7);Prec_simulation0{7,1}(:,:,count+8);Prec_simulation095{7,1}(:,:,count+6);Prec_simulation095{7,1}(:,:,count+7);Prec_simulation095{7,1}(:,:,count+8);...
        Prec_simulation097{7,1}(:,:,count+6);Prec_simulation097{7,1}(:,:,count+7);Prec_simulation097{7,1}(:,:,count+8);Prec_simulation101{7,1}(:,:,count+6);Prec_simulation101{7,1}(:,:,count+7);Prec_simulation101{7,1}(:,:,count+8);...
        Prec_simulation103{7,1}(:,:,count+6);Prec_simulation103{7,1}(:,:,count+7);Prec_simulation103{7,1}(:,:,count+8)]));
    cmax = max(max([Prec_simulation0{7,1}(:,:,count+6);Prec_simulation0{7,1}(:,:,count+7);Prec_simulation0{7,1}(:,:,count+8);Prec_simulation095{7,1}(:,:,count+6);Prec_simulation095{7,1}(:,:,count+7);Prec_simulation095{7,1}(:,:,count+8);...
        Prec_simulation097{7,1}(:,:,count+6);Prec_simulation097{7,1}(:,:,count+7);Prec_simulation097{7,1}(:,:,count+8);Prec_simulation101{7,1}(:,:,count+6);Prec_simulation101{7,1}(:,:,count+7);Prec_simulation101{7,1}(:,:,count+8);...
        Prec_simulation103{7,1}(:,:,count+6);Prec_simulation103{7,1}(:,:,count+7);Prec_simulation103{7,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Scenarios for " + year + " - Summer Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+6));
    title('June - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+7));
    title('July - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+8));
    title('August - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+6));
    title('June  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+7));
    title('July - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+8));
    title('August - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+6));
    title('June - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+7));
    title('July - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+8));
    title('August - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+6));
    title('June - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+7));
    title('July - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+8));
    title('August - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+6));
    title('June - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+7));
    title('July - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+8));
    title('August - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Autumn season 
    cmin = min(min([Prec_simulation0{7,1}(:,:,count+9);Prec_simulation0{7,1}(:,:,count+10);Prec_simulation0{7,1}(:,:,count+11);Prec_simulation095{7,1}(:,:,count+9);Prec_simulation095{7,1}(:,:,count+10);Prec_simulation095{7,1}(:,:,count+11);...
        Prec_simulation097{7,1}(:,:,count+9);Prec_simulation097{7,1}(:,:,count+10);Prec_simulation097{7,1}(:,:,count+11);Prec_simulation101{7,1}(:,:,count+9);Prec_simulation101{7,1}(:,:,count+10);Prec_simulation101{7,1}(:,:,count+11);...
        Prec_simulation103{7,1}(:,:,count+9);Prec_simulation103{7,1}(:,:,count+10);Prec_simulation103{7,1}(:,:,count+11)]));
    cmax = max(max([Prec_simulation0{7,1}(:,:,count+9);Prec_simulation0{7,1}(:,:,count+10);Prec_simulation0{7,1}(:,:,count+11);Prec_simulation095{7,1}(:,:,count+9);Prec_simulation095{7,1}(:,:,count+10);Prec_simulation095{7,1}(:,:,count+11);...
        Prec_simulation097{7,1}(:,:,count+9);Prec_simulation097{7,1}(:,:,count+10);Prec_simulation097{7,1}(:,:,count+11);Prec_simulation101{7,1}(:,:,count+9);Prec_simulation101{7,1}(:,:,count+10);Prec_simulation101{7,1}(:,:,count+11);...
        Prec_simulation103{7,1}(:,:,count+9);Prec_simulation103{7,1}(:,:,count+10);Prec_simulation103{7,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Scenarios for " + year + " - Autumn Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+9));
    title('September - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+10));
    title('October - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{7,1}(:,:,count+11));
    title('November - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+9));
    title('September  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+10));
    title('October - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{7,1}(:,:,count+11));
    title('November - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+9));
    title('September - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+10));
    title('October - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{7,1}(:,:,count+11));
    title('November - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+9));
    title('September - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+10));
    title('October - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{7,1}(:,:,count+11));
    title('November - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+9));
    title('September - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+10));
    title('October - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{7,1}(:,:,count+11));
    title('November - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    % ylabel(cb,'totalET [m]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

% --- Calculate and visualize differences
for i = 1:120
    for j = 1:size(lon,1)
        for k = 1:size(lat,1)
            % difference between undisturbed and Prec_simulation095
            runoff_monthavg_diff{1,1}(j,k,i) = 100 * ((Prec_simulation095{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
            % difference between undisturbed and Prec_simulation097
            runoff_monthavg_diff{2,1}(j,k,i) = 100 * ((Prec_simulation097{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
            % difference between undisturbed and Prec_simulation101
            runoff_monthavg_diff{3,1}(j,k,i) = 100 * ((Prec_simulation101{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
            % difference between undisturbed and Prec_simulation103
            runoff_monthavg_diff{4,1}(j,k,i) = 100 * ((Prec_simulation103{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation096
            runoff_monthavg_diff{5,1}(j,k,i) = 100 * ((Tavg_simulation096{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation098
            runoff_monthavg_diff{6,1}(j,k,i) = 100 * ((Tavg_simulation098{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation102
            runoff_monthavg_diff{7,1}(j,k,i) = 100 * ((Tavg_simulation102{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation103
            runoff_monthavg_diff{8,1}(j,k,i) = 100 * ((Tavg_simulation103{7,1}(j,k,i) - Prec_simulation0{7,1}(j,k,i))/Prec_simulation0{7,1}(j,k,i));
        end
    end
end

% Plot Runoff influenced by Precipitation sensitivity
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([runoff_monthavg_diff{1,1}(:,:,count+1);runoff_monthavg_diff{1,1}(:,:,count+2);runoff_monthavg_diff{1,1}(:,:,count+12);...
        runoff_monthavg_diff{2,1}(:,:,count+1);runoff_monthavg_diff{2,1}(:,:,count+2);runoff_monthavg_diff{2,1}(:,:,count+12);...
        runoff_monthavg_diff{3,1}(:,:,count+1);runoff_monthavg_diff{3,1}(:,:,count+2);runoff_monthavg_diff{3,1}(:,:,count+12);...
        runoff_monthavg_diff{4,1}(:,:,count+1);runoff_monthavg_diff{4,1}(:,:,count+2);runoff_monthavg_diff{4,1}(:,:,count+12)]));
    cmax = max(max([runoff_monthavg_diff{1,1}(:,:,count+1);runoff_monthavg_diff{1,1}(:,:,count+2);runoff_monthavg_diff{1,1}(:,:,count+12);...
        runoff_monthavg_diff{2,1}(:,:,count+1);runoff_monthavg_diff{2,1}(:,:,count+2);runoff_monthavg_diff{2,1}(:,:,count+12);...
        runoff_monthavg_diff{3,1}(:,:,count+1);runoff_monthavg_diff{3,1}(:,:,count+2);runoff_monthavg_diff{3,1}(:,:,count+12);...
        runoff_monthavg_diff{4,1}(:,:,count+1);runoff_monthavg_diff{4,1}(:,:,count+2);runoff_monthavg_diff{4,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+1));
    title('January - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+2));
    title('February - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+12));
    title('December - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+1));
    title('January - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+2));
    title('February - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+12));
    title('December - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+1));
    title('January - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+2));
    title('February - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+12));
    title('December - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+1));
    title('January - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+2));
    title('February - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+12));
    title('December - Undisturbed vs Prec103');
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
    cmin = min(min([runoff_monthavg_diff{1,1}(:,:,count+3);runoff_monthavg_diff{1,1}(:,:,count+4);runoff_monthavg_diff{1,1}(:,:,count+5);...
        runoff_monthavg_diff{2,1}(:,:,count+3);runoff_monthavg_diff{2,1}(:,:,count+4);runoff_monthavg_diff{2,1}(:,:,count+5);...
        runoff_monthavg_diff{3,1}(:,:,count+3);runoff_monthavg_diff{3,1}(:,:,count+4);runoff_monthavg_diff{3,1}(:,:,count+5);...
        runoff_monthavg_diff{4,1}(:,:,count+3);runoff_monthavg_diff{4,1}(:,:,count+4);runoff_monthavg_diff{4,1}(:,:,count+5)]));
    cmax = max(max([runoff_monthavg_diff{1,1}(:,:,count+3);runoff_monthavg_diff{1,1}(:,:,count+4);runoff_monthavg_diff{1,1}(:,:,count+5);...
        runoff_monthavg_diff{2,1}(:,:,count+3);runoff_monthavg_diff{2,1}(:,:,count+4);runoff_monthavg_diff{2,1}(:,:,count+5);...
        runoff_monthavg_diff{3,1}(:,:,count+3);runoff_monthavg_diff{3,1}(:,:,count+4);runoff_monthavg_diff{3,1}(:,:,count+5);...
        runoff_monthavg_diff{4,1}(:,:,count+3);runoff_monthavg_diff{4,1}(:,:,count+4);runoff_monthavg_diff{4,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+3));
    title('March - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+4));
    title('April - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+5));
    title('May - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+3));
    title('March - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+4));
    title('April - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+5));
    title('May - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+3));
    title('March - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+4));
    title('April - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+5));
    title('May - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+3));
    title('March - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+4));
    title('April - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+5));
    title('May - Undisturbed vs Prec103');
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
    cmin = min(min([runoff_monthavg_diff{1,1}(:,:,count+6);runoff_monthavg_diff{1,1}(:,:,count+7);runoff_monthavg_diff{1,1}(:,:,count+8);...
        runoff_monthavg_diff{2,1}(:,:,count+6);runoff_monthavg_diff{2,1}(:,:,count+7);runoff_monthavg_diff{2,1}(:,:,count+8);...
        runoff_monthavg_diff{3,1}(:,:,count+6);runoff_monthavg_diff{3,1}(:,:,count+7);runoff_monthavg_diff{3,1}(:,:,count+8);...
        runoff_monthavg_diff{4,1}(:,:,count+6);runoff_monthavg_diff{4,1}(:,:,count+7);runoff_monthavg_diff{4,1}(:,:,count+8)]));
    cmax = max(max([runoff_monthavg_diff{1,1}(:,:,count+6);runoff_monthavg_diff{1,1}(:,:,count+7);runoff_monthavg_diff{1,1}(:,:,count+8);...
        runoff_monthavg_diff{2,1}(:,:,count+6);runoff_monthavg_diff{2,1}(:,:,count+7);runoff_monthavg_diff{2,1}(:,:,count+8);...
        runoff_monthavg_diff{3,1}(:,:,count+6);runoff_monthavg_diff{3,1}(:,:,count+7);runoff_monthavg_diff{3,1}(:,:,count+8);...
        runoff_monthavg_diff{4,1}(:,:,count+6);runoff_monthavg_diff{4,1}(:,:,count+7);runoff_monthavg_diff{4,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences in Precipitation Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+6));
    title('June - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+7));
    title('July - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+8));
    title('August - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+6));
    title('June - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+7));
    title('July - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+8));
    title('August - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+6));
    title('June - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+7));
    title('July - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+8));
    title('August - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+6));
    title('June - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+7));
    title('July - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+8));
    title('August - Undisturbed vs Prec103');
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
    cmin = min(min([runoff_monthavg_diff{1,1}(:,:,count+9);runoff_monthavg_diff{1,1}(:,:,count+10);runoff_monthavg_diff{1,1}(:,:,count+11);...
        runoff_monthavg_diff{2,1}(:,:,count+9);runoff_monthavg_diff{2,1}(:,:,count+10);runoff_monthavg_diff{2,1}(:,:,count+11);...
        runoff_monthavg_diff{3,1}(:,:,count+9);runoff_monthavg_diff{3,1}(:,:,count+10);runoff_monthavg_diff{3,1}(:,:,count+11);...
        runoff_monthavg_diff{4,1}(:,:,count+9);runoff_monthavg_diff{4,1}(:,:,count+10);runoff_monthavg_diff{4,1}(:,:,count+11)]));
    cmax = max(max([runoff_monthavg_diff{1,1}(:,:,count+9);runoff_monthavg_diff{1,1}(:,:,count+10);runoff_monthavg_diff{1,1}(:,:,count+11);...
        runoff_monthavg_diff{2,1}(:,:,count+9);runoff_monthavg_diff{2,1}(:,:,count+10);runoff_monthavg_diff{2,1}(:,:,count+11);...
        runoff_monthavg_diff{3,1}(:,:,count+9);runoff_monthavg_diff{3,1}(:,:,count+10);runoff_monthavg_diff{3,1}(:,:,count+11);...
        runoff_monthavg_diff{4,1}(:,:,count+9);runoff_monthavg_diff{4,1}(:,:,count+10);runoff_monthavg_diff{4,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences in Precipitation Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+9));
    title('September - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+10));
    title('October - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{1,1}(:,:,count+11));
    title('November - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+9));
    title('September - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+10));
    title('October - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{2,1}(:,:,count+11));
    title('November - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+9));
    title('September - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+10));
    title('October - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{3,1}(:,:,count+11));
    title('November - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+9));
    title('September - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+10));
    title('October - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{4,1}(:,:,count+11));
    title('November - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

% Plot Runoff influenced by Tavg sensitivity
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([runoff_monthavg_diff{5,1}(:,:,count+1);runoff_monthavg_diff{5,1}(:,:,count+2);runoff_monthavg_diff{5,1}(:,:,count+12);...
        runoff_monthavg_diff{6,1}(:,:,count+1);runoff_monthavg_diff{6,1}(:,:,count+2);runoff_monthavg_diff{6,1}(:,:,count+12);...
        runoff_monthavg_diff{7,1}(:,:,count+1);runoff_monthavg_diff{7,1}(:,:,count+2);runoff_monthavg_diff{7,1}(:,:,count+12);...
        runoff_monthavg_diff{8,1}(:,:,count+1);runoff_monthavg_diff{8,1}(:,:,count+2);runoff_monthavg_diff{8,1}(:,:,count+12)]));
    cmax = max(max([runoff_monthavg_diff{5,1}(:,:,count+1);runoff_monthavg_diff{5,1}(:,:,count+2);runoff_monthavg_diff{5,1}(:,:,count+12);...
        runoff_monthavg_diff{6,1}(:,:,count+1);runoff_monthavg_diff{6,1}(:,:,count+2);runoff_monthavg_diff{6,1}(:,:,count+12);...
        runoff_monthavg_diff{7,1}(:,:,count+1);runoff_monthavg_diff{7,1}(:,:,count+2);runoff_monthavg_diff{7,1}(:,:,count+12);...
        runoff_monthavg_diff{8,1}(:,:,count+1);runoff_monthavg_diff{8,1}(:,:,count+2);runoff_monthavg_diff{8,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences (%) in Tavg Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg103');
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
    cmin = min(min([runoff_monthavg_diff{5,1}(:,:,count+3);runoff_monthavg_diff{5,1}(:,:,count+4);runoff_monthavg_diff{5,1}(:,:,count+5);...
        runoff_monthavg_diff{6,1}(:,:,count+3);runoff_monthavg_diff{6,1}(:,:,count+4);runoff_monthavg_diff{6,1}(:,:,count+5);...
        runoff_monthavg_diff{7,1}(:,:,count+3);runoff_monthavg_diff{7,1}(:,:,count+4);runoff_monthavg_diff{7,1}(:,:,count+5);...
        runoff_monthavg_diff{8,1}(:,:,count+3);runoff_monthavg_diff{8,1}(:,:,count+4);runoff_monthavg_diff{8,1}(:,:,count+5)]));
    cmax = max(max([runoff_monthavg_diff{5,1}(:,:,count+3);runoff_monthavg_diff{5,1}(:,:,count+4);runoff_monthavg_diff{5,1}(:,:,count+5);...
        runoff_monthavg_diff{6,1}(:,:,count+3);runoff_monthavg_diff{6,1}(:,:,count+4);runoff_monthavg_diff{6,1}(:,:,count+5);...
        runoff_monthavg_diff{7,1}(:,:,count+3);runoff_monthavg_diff{7,1}(:,:,count+4);runoff_monthavg_diff{7,1}(:,:,count+5);...
        runoff_monthavg_diff{8,1}(:,:,count+3);runoff_monthavg_diff{8,1}(:,:,count+4);runoff_monthavg_diff{8,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences (%) in Tavg Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg103');
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
    cmin = min(min([runoff_monthavg_diff{5,1}(:,:,count+6);runoff_monthavg_diff{5,1}(:,:,count+7);runoff_monthavg_diff{5,1}(:,:,count+8);...
        runoff_monthavg_diff{6,1}(:,:,count+6);runoff_monthavg_diff{6,1}(:,:,count+7);runoff_monthavg_diff{6,1}(:,:,count+8);...
        runoff_monthavg_diff{7,1}(:,:,count+6);runoff_monthavg_diff{7,1}(:,:,count+7);runoff_monthavg_diff{7,1}(:,:,count+8);...
        runoff_monthavg_diff{8,1}(:,:,count+6);runoff_monthavg_diff{8,1}(:,:,count+7);runoff_monthavg_diff{8,1}(:,:,count+8)]));
    cmax = max(max([runoff_monthavg_diff{5,1}(:,:,count+6);runoff_monthavg_diff{5,1}(:,:,count+7);runoff_monthavg_diff{5,1}(:,:,count+8);...
        runoff_monthavg_diff{6,1}(:,:,count+6);runoff_monthavg_diff{6,1}(:,:,count+7);runoff_monthavg_diff{6,1}(:,:,count+8);...
        runoff_monthavg_diff{7,1}(:,:,count+6);runoff_monthavg_diff{7,1}(:,:,count+7);runoff_monthavg_diff{7,1}(:,:,count+8);...
        runoff_monthavg_diff{8,1}(:,:,count+6);runoff_monthavg_diff{8,1}(:,:,count+7);runoff_monthavg_diff{8,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences in Tavg Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg103');
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
    cmin = min(min([runoff_monthavg_diff{5,1}(:,:,count+9);runoff_monthavg_diff{5,1}(:,:,count+10);runoff_monthavg_diff{5,1}(:,:,count+11);...
        runoff_monthavg_diff{6,1}(:,:,count+9);runoff_monthavg_diff{6,1}(:,:,count+10);runoff_monthavg_diff{6,1}(:,:,count+11);...
        runoff_monthavg_diff{7,1}(:,:,count+9);runoff_monthavg_diff{7,1}(:,:,count+10);runoff_monthavg_diff{7,1}(:,:,count+11);...
        runoff_monthavg_diff{8,1}(:,:,count+9);runoff_monthavg_diff{8,1}(:,:,count+10);runoff_monthavg_diff{8,1}(:,:,count+11)]));
    cmax = max(max([runoff_monthavg_diff{5,1}(:,:,count+9);runoff_monthavg_diff{5,1}(:,:,count+10);runoff_monthavg_diff{5,1}(:,:,count+11);...
        runoff_monthavg_diff{6,1}(:,:,count+9);runoff_monthavg_diff{6,1}(:,:,count+10);runoff_monthavg_diff{6,1}(:,:,count+11);...
        runoff_monthavg_diff{7,1}(:,:,count+9);runoff_monthavg_diff{7,1}(:,:,count+10);runoff_monthavg_diff{7,1}(:,:,count+11);...
        runoff_monthavg_diff{8,1}(:,:,count+9);runoff_monthavg_diff{8,1}(:,:,count+10);runoff_monthavg_diff{8,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Runoff Differences in Tavg Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(4,3,1);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,runoff_monthavg_diff{5,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,runoff_monthavg_diff{6,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,runoff_monthavg_diff{7,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,runoff_monthavg_diff{8,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

% -------------------- Discharge - Monthly Average --------------------
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([Prec_simulation0{12,1}(:,:,count+1);Prec_simulation0{12,1}(:,:,count+2);Prec_simulation0{12,1}(:,:,count+12);Prec_simulation095{12,1}(:,:,count+1);Prec_simulation095{12,1}(:,:,count+2);Prec_simulation095{12,1}(:,:,count+12);...
        Prec_simulation097{12,1}(:,:,count+1);Prec_simulation097{12,1}(:,:,count+2);Prec_simulation097{12,1}(:,:,count+12);Prec_simulation101{12,1}(:,:,count+1);Prec_simulation101{12,1}(:,:,count+2);Prec_simulation101{12,1}(:,:,count+12);...
        Prec_simulation103{12,1}(:,:,count+1);Prec_simulation103{12,1}(:,:,count+2);Prec_simulation103{12,1}(:,:,count+12)]));
    cmax = max(max([Prec_simulation0{12,1}(:,:,count+1);Prec_simulation0{12,1}(:,:,count+2);Prec_simulation0{12,1}(:,:,count+12);Prec_simulation095{12,1}(:,:,count+1);Prec_simulation095{12,1}(:,:,count+2);Prec_simulation095{12,1}(:,:,count+12);...
        Prec_simulation097{12,1}(:,:,count+1);Prec_simulation097{12,1}(:,:,count+2);Prec_simulation097{12,1}(:,:,count+12);Prec_simulation101{12,1}(:,:,count+1);Prec_simulation101{12,1}(:,:,count+2);Prec_simulation101{12,1}(:,:,count+12);...
        Prec_simulation103{12,1}(:,:,count+1);Prec_simulation103{12,1}(:,:,count+2);Prec_simulation103{12,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Scenarios for " + year + " - Winter Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+1));
    title('January - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+2));
    title('February - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+12));
    title('December - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+1));
    title('January  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+2));
    title('February - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+12));
    title('December - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+1));
    title('January - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+2));
    title('February - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+12));
    title('December - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+1));
    title('January - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+2));
    title('February - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+12));
    title('December - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+1));
    title('January - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+2));
    title('February - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+12));
    title('December - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end
clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Spring season 
    cmin = min(min([Prec_simulation0{12,1}(:,:,count+3);Prec_simulation0{12,1}(:,:,count+4);Prec_simulation0{12,1}(:,:,count+5);Prec_simulation095{12,1}(:,:,count+3);Prec_simulation095{12,1}(:,:,count+4);Prec_simulation095{12,1}(:,:,count+5);...
        Prec_simulation097{12,1}(:,:,count+3);Prec_simulation097{12,1}(:,:,count+4);Prec_simulation097{12,1}(:,:,count+5);Prec_simulation101{12,1}(:,:,count+3);Prec_simulation101{12,1}(:,:,count+4);Prec_simulation101{12,1}(:,:,count+5);...
        Prec_simulation103{12,1}(:,:,count+3);Prec_simulation103{12,1}(:,:,count+4);Prec_simulation103{12,1}(:,:,count+5)]));
    cmax = max(max([Prec_simulation0{12,1}(:,:,count+3);Prec_simulation0{12,1}(:,:,count+4);Prec_simulation0{12,1}(:,:,count+5);Prec_simulation095{12,1}(:,:,count+3);Prec_simulation095{12,1}(:,:,count+4);Prec_simulation095{12,1}(:,:,count+5);...
        Prec_simulation097{12,1}(:,:,count+3);Prec_simulation097{12,1}(:,:,count+4);Prec_simulation097{12,1}(:,:,count+5);Prec_simulation101{12,1}(:,:,count+3);Prec_simulation101{12,1}(:,:,count+4);Prec_simulation101{12,1}(:,:,count+5);...
        Prec_simulation103{12,1}(:,:,count+3);Prec_simulation103{12,1}(:,:,count+4);Prec_simulation103{12,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Scenarios for " + year + " - Spring Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+3));
    title('March - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+4));
    title('April - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+5));
    title('May - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+3));
    title('March  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+4));
    title('April - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+5));
    title('May - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+3));
    title('March - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+4));
    title('April - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+5));
    title('May - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+3));
    title('March - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+4));
    title('April - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+5));
    title('May - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+3));
    title('March - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+4));
    title('April - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+5));
    title('May - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Summer season 
    cmin = min(min([Prec_simulation0{7,1}(:,:,count+6);Prec_simulation0{7,1}(:,:,count+7);Prec_simulation0{7,1}(:,:,count+8);Prec_simulation095{7,1}(:,:,count+6);Prec_simulation095{7,1}(:,:,count+7);Prec_simulation095{7,1}(:,:,count+8);...
        Prec_simulation097{7,1}(:,:,count+6);Prec_simulation097{7,1}(:,:,count+7);Prec_simulation097{7,1}(:,:,count+8);Prec_simulation101{7,1}(:,:,count+6);Prec_simulation101{7,1}(:,:,count+7);Prec_simulation101{7,1}(:,:,count+8);...
        Prec_simulation103{7,1}(:,:,count+6);Prec_simulation103{7,1}(:,:,count+7);Prec_simulation103{7,1}(:,:,count+8)]));
    cmax = max(max([Prec_simulation0{7,1}(:,:,count+6);Prec_simulation0{7,1}(:,:,count+7);Prec_simulation0{7,1}(:,:,count+8);Prec_simulation095{7,1}(:,:,count+6);Prec_simulation095{7,1}(:,:,count+7);Prec_simulation095{7,1}(:,:,count+8);...
        Prec_simulation097{7,1}(:,:,count+6);Prec_simulation097{7,1}(:,:,count+7);Prec_simulation097{7,1}(:,:,count+8);Prec_simulation101{7,1}(:,:,count+6);Prec_simulation101{7,1}(:,:,count+7);Prec_simulation101{7,1}(:,:,count+8);...
        Prec_simulation103{7,1}(:,:,count+6);Prec_simulation103{7,1}(:,:,count+7);Prec_simulation103{7,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Scenarios for " + year + " - Summer Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+6));
    title('June - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+7));
    title('July - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+8));
    title('August - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+6));
    title('June  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+7));
    title('July - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+8));
    title('August - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+6));
    title('June - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+7));
    title('July - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+8));
    title('August - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+6));
    title('June - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+7));
    title('July - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+8));
    title('August - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+6));
    title('June - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+7));
    title('July - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+8));
    title('August - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

count = 0;
y = 1999;
for i = 1:10
    % Visualize Autumn season 
    cmin = min(min([Prec_simulation0{12,1}(:,:,count+9);Prec_simulation0{12,1}(:,:,count+10);Prec_simulation0{12,1}(:,:,count+11);Prec_simulation095{12,1}(:,:,count+9);Prec_simulation095{12,1}(:,:,count+10);Prec_simulation095{12,1}(:,:,count+11);...
        Prec_simulation097{12,1}(:,:,count+9);Prec_simulation097{12,1}(:,:,count+10);Prec_simulation097{12,1}(:,:,count+11);Prec_simulation101{12,1}(:,:,count+9);Prec_simulation101{12,1}(:,:,count+10);Prec_simulation101{12,1}(:,:,count+11);...
        Prec_simulation103{12,1}(:,:,count+9);Prec_simulation103{12,1}(:,:,count+10);Prec_simulation103{12,1}(:,:,count+11)]));
    cmax = max(max([Prec_simulation0{12,1}(:,:,count+9);Prec_simulation0{12,1}(:,:,count+10);Prec_simulation0{12,1}(:,:,count+11);Prec_simulation095{12,1}(:,:,count+9);Prec_simulation095{12,1}(:,:,count+10);Prec_simulation095{12,1}(:,:,count+11);...
        Prec_simulation097{12,1}(:,:,count+9);Prec_simulation097{12,1}(:,:,count+10);Prec_simulation097{12,1}(:,:,count+11);Prec_simulation101{12,1}(:,:,count+9);Prec_simulation101{12,1}(:,:,count+10);Prec_simulation101{12,1}(:,:,count+11);...
        Prec_simulation103{12,1}(:,:,count+9);Prec_simulation103{12,1}(:,:,count+10);Prec_simulation103{12,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Scenarios for " + year + " - Autumn Season");
    subplot(5,3,1);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+9));
    title('September - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,2);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+10));
    title('October - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,3);
    imagesc(lon,lat,Prec_simulation0{12,1}(:,:,count+11));
    title('November - undisturbed');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,4);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+9));
    title('September  - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,5);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+10));
    title('October - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,6);
    imagesc(lon,lat,Prec_simulation095{12,1}(:,:,count+11));
    title('November - 5% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,7);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+9));
    title('September - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,8);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+10));
    title('October - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,9);
    imagesc(lon,lat,Prec_simulation097{12,1}(:,:,count+11));
    title('November - 3% decrease');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,10);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+9));
    title('September - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,11);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+10));
    title('October - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,12);
    imagesc(lon,lat,Prec_simulation101{12,1}(:,:,count+11));
    title('November - 1% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,13);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+9));
    title('September - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,14);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+10));
    title('October - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    subplot(5,3,15);
    imagesc(lon,lat,Prec_simulation103{12,1}(:,:,count+11));
    title('November - 3% increase');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    cb = colorbar;
    ylabel(cb,'Discharge [m^{3}/sec]','Rotation',90);
    clim([cmin,cmax]);
    count = count+12;
end

clear count i year y cmin cmax;

% --- Calculate and visualize differences
for i = 1:120
    for j = 1:size(lon,1)
        for k = 1:size(lat,1)
            % difference between undisturbed and Prec_simulation095
            discharge_monthavg_diff{1,1}(j,k,i) = 100 * ((Prec_simulation095{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
            % difference between undisturbed and Prec_simulation097
            discharge_monthavg_diff{2,1}(j,k,i) = 100 * ((Prec_simulation097{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
            % difference between undisturbed and Prec_simulation101
            discharge_monthavg_diff{3,1}(j,k,i) = 100 * ((Prec_simulation101{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
            % difference between undisturbed and Prec_simulation103
            discharge_monthavg_diff{4,1}(j,k,i) = 100 * ((Prec_simulation103{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation096
            discharge_monthavg_diff{5,1}(j,k,i) = 100 * ((Tavg_simulation096{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation098
            discharge_monthavg_diff{6,1}(j,k,i) = 100 * ((Tavg_simulation098{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation102
            discharge_monthavg_diff{7,1}(j,k,i) = 100 * ((Tavg_simulation102{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
            % difference between undisturbed and Tavg_simulation103
            discharge_monthavg_diff{8,1}(j,k,i) = 100 * ((Tavg_simulation103{12,1}(j,k,i) - Prec_simulation0{12,1}(j,k,i))/Prec_simulation0{12,1}(j,k,i));
        end
    end
end

% Plot Discharge influenced by Precipitation sensitivity
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([discharge_monthavg_diff{1,1}(:,:,count+1);discharge_monthavg_diff{1,1}(:,:,count+2);discharge_monthavg_diff{1,1}(:,:,count+12);...
        discharge_monthavg_diff{2,1}(:,:,count+1);discharge_monthavg_diff{2,1}(:,:,count+2);discharge_monthavg_diff{2,1}(:,:,count+12);...
        discharge_monthavg_diff{3,1}(:,:,count+1);discharge_monthavg_diff{3,1}(:,:,count+2);discharge_monthavg_diff{3,1}(:,:,count+12);...
        discharge_monthavg_diff{4,1}(:,:,count+1);discharge_monthavg_diff{4,1}(:,:,count+2);discharge_monthavg_diff{4,1}(:,:,count+12)]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+1);discharge_monthavg_diff{1,1}(:,:,count+2);discharge_monthavg_diff{1,1}(:,:,count+12);...
        discharge_monthavg_diff{2,1}(:,:,count+1);discharge_monthavg_diff{2,1}(:,:,count+2);discharge_monthavg_diff{2,1}(:,:,count+12);...
        discharge_monthavg_diff{3,1}(:,:,count+1);discharge_monthavg_diff{3,1}(:,:,count+2);discharge_monthavg_diff{3,1}(:,:,count+12);...
        discharge_monthavg_diff{4,1}(:,:,count+1);discharge_monthavg_diff{4,1}(:,:,count+2);discharge_monthavg_diff{4,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+1));
    title('January - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+2));
    title('February - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+12));
    title('December - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+1));
    title('January - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+2));
    title('February - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+12));
    title('December - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+1));
    title('January - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+2));
    title('February - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+12));
    title('December - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+1));
    title('January - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+2));
    title('February - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+12));
    title('December - Undisturbed vs Prec103');
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
        discharge_monthavg_diff{2,1}(:,:,count+3);discharge_monthavg_diff{2,1}(:,:,count+4);discharge_monthavg_diff{2,1}(:,:,count+5);...
        discharge_monthavg_diff{3,1}(:,:,count+3);discharge_monthavg_diff{3,1}(:,:,count+4);discharge_monthavg_diff{3,1}(:,:,count+5);...
        discharge_monthavg_diff{4,1}(:,:,count+3);discharge_monthavg_diff{4,1}(:,:,count+4);discharge_monthavg_diff{4,1}(:,:,count+5)]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+3);discharge_monthavg_diff{1,1}(:,:,count+4);discharge_monthavg_diff{1,1}(:,:,count+5);...
        discharge_monthavg_diff{2,1}(:,:,count+3);discharge_monthavg_diff{2,1}(:,:,count+4);discharge_monthavg_diff{2,1}(:,:,count+5);...
        discharge_monthavg_diff{3,1}(:,:,count+3);discharge_monthavg_diff{3,1}(:,:,count+4);discharge_monthavg_diff{3,1}(:,:,count+5);...
        discharge_monthavg_diff{4,1}(:,:,count+3);discharge_monthavg_diff{4,1}(:,:,count+4);discharge_monthavg_diff{4,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Precipitation Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+3));
    title('March - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+4));
    title('April - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+5));
    title('May - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+3));
    title('March - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+4));
    title('April - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+5));
    title('May - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+3));
    title('March - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+4));
    title('April - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+5));
    title('May - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+3));
    title('March - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+4));
    title('April - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+5));
    title('May - Undisturbed vs Prec103');
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
        discharge_monthavg_diff{2,1}(:,:,count+6);discharge_monthavg_diff{2,1}(:,:,count+7);discharge_monthavg_diff{2,1}(:,:,count+8);...
        discharge_monthavg_diff{3,1}(:,:,count+6);discharge_monthavg_diff{3,1}(:,:,count+7);discharge_monthavg_diff{3,1}(:,:,count+8);...
        discharge_monthavg_diff{4,1}(:,:,count+6);discharge_monthavg_diff{4,1}(:,:,count+7);discharge_monthavg_diff{4,1}(:,:,count+8)]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+6);discharge_monthavg_diff{1,1}(:,:,count+7);discharge_monthavg_diff{1,1}(:,:,count+8);...
        discharge_monthavg_diff{2,1}(:,:,count+6);discharge_monthavg_diff{2,1}(:,:,count+7);discharge_monthavg_diff{2,1}(:,:,count+8);...
        discharge_monthavg_diff{3,1}(:,:,count+6);discharge_monthavg_diff{3,1}(:,:,count+7);discharge_monthavg_diff{3,1}(:,:,count+8);...
        discharge_monthavg_diff{4,1}(:,:,count+6);discharge_monthavg_diff{4,1}(:,:,count+7);discharge_monthavg_diff{4,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences in Precipitation Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+6));
    title('June - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+7));
    title('July - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+8));
    title('August - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+6));
    title('June - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+7));
    title('July - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+8));
    title('August - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+6));
    title('June - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+7));
    title('July - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+8));
    title('August - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+6));
    title('June - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+7));
    title('July - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+8));
    title('August - Undisturbed vs Prec103');
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
        discharge_monthavg_diff{2,1}(:,:,count+9);discharge_monthavg_diff{2,1}(:,:,count+10);discharge_monthavg_diff{2,1}(:,:,count+11);...
        discharge_monthavg_diff{3,1}(:,:,count+9);discharge_monthavg_diff{3,1}(:,:,count+10);discharge_monthavg_diff{3,1}(:,:,count+11);...
        discharge_monthavg_diff{4,1}(:,:,count+9);discharge_monthavg_diff{4,1}(:,:,count+10);discharge_monthavg_diff{4,1}(:,:,count+11)]));
    cmax = max(max([discharge_monthavg_diff{1,1}(:,:,count+9);discharge_monthavg_diff{1,1}(:,:,count+10);discharge_monthavg_diff{1,1}(:,:,count+11);...
        discharge_monthavg_diff{2,1}(:,:,count+9);discharge_monthavg_diff{2,1}(:,:,count+10);discharge_monthavg_diff{2,1}(:,:,count+11);...
        discharge_monthavg_diff{3,1}(:,:,count+9);discharge_monthavg_diff{3,1}(:,:,count+10);discharge_monthavg_diff{3,1}(:,:,count+11);...
        discharge_monthavg_diff{4,1}(:,:,count+9);discharge_monthavg_diff{4,1}(:,:,count+10);discharge_monthavg_diff{4,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences in Precipitation Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+9));
    title('September - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+10));
    title('October - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{1,1}(:,:,count+11));
    title('November - Undisturbed vs Prec095');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+9));
    title('September - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+10));
    title('October - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{2,1}(:,:,count+11));
    title('November - Undisturbed vs Prec097');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+9));
    title('September - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+10));
    title('October - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{3,1}(:,:,count+11));
    title('November - Undisturbed vs Prec101');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+9));
    title('September - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+10));
    title('October - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{4,1}(:,:,count+11));
    title('November - Undisturbed vs Prec103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;

% Plot Discharge influenced by Tavg sensitivity
count = 0;
y = 1999;
for i = 1:10
    % Visualize Winter season 
    cmin = min(min([discharge_monthavg_diff{5,1}(:,:,count+1);discharge_monthavg_diff{5,1}(:,:,count+2);discharge_monthavg_diff{5,1}(:,:,count+12);...
        discharge_monthavg_diff{6,1}(:,:,count+1);discharge_monthavg_diff{6,1}(:,:,count+2);discharge_monthavg_diff{6,1}(:,:,count+12);...
        discharge_monthavg_diff{7,1}(:,:,count+1);discharge_monthavg_diff{7,1}(:,:,count+2);discharge_monthavg_diff{7,1}(:,:,count+12);...
        discharge_monthavg_diff{8,1}(:,:,count+1);discharge_monthavg_diff{8,1}(:,:,count+2);discharge_monthavg_diff{8,1}(:,:,count+12)]));
    cmax = max(max([discharge_monthavg_diff{5,1}(:,:,count+1);discharge_monthavg_diff{5,1}(:,:,count+2);discharge_monthavg_diff{5,1}(:,:,count+12);...
        discharge_monthavg_diff{6,1}(:,:,count+1);discharge_monthavg_diff{6,1}(:,:,count+2);discharge_monthavg_diff{6,1}(:,:,count+12);...
        discharge_monthavg_diff{7,1}(:,:,count+1);discharge_monthavg_diff{7,1}(:,:,count+2);discharge_monthavg_diff{7,1}(:,:,count+12);...
        discharge_monthavg_diff{8,1}(:,:,count+1);discharge_monthavg_diff{8,1}(:,:,count+2);discharge_monthavg_diff{8,1}(:,:,count+12)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Tavg Scenarios vs Undisturbed for " + year + " - Winter Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+1));
    title('January - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+2));
    title('February - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+12));
    title('December - Undisturbed vs Tavg103');
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
    cmin = min(min([discharge_monthavg_diff{5,1}(:,:,count+3);discharge_monthavg_diff{5,1}(:,:,count+4);discharge_monthavg_diff{5,1}(:,:,count+5);...
        discharge_monthavg_diff{6,1}(:,:,count+3);discharge_monthavg_diff{6,1}(:,:,count+4);discharge_monthavg_diff{6,1}(:,:,count+5);...
        discharge_monthavg_diff{7,1}(:,:,count+3);discharge_monthavg_diff{7,1}(:,:,count+4);discharge_monthavg_diff{7,1}(:,:,count+5);...
        discharge_monthavg_diff{8,1}(:,:,count+3);discharge_monthavg_diff{8,1}(:,:,count+4);discharge_monthavg_diff{8,1}(:,:,count+5)]));
    cmax = max(max([discharge_monthavg_diff{5,1}(:,:,count+3);discharge_monthavg_diff{5,1}(:,:,count+4);discharge_monthavg_diff{5,1}(:,:,count+5);...
        discharge_monthavg_diff{6,1}(:,:,count+3);discharge_monthavg_diff{6,1}(:,:,count+4);discharge_monthavg_diff{6,1}(:,:,count+5);...
        discharge_monthavg_diff{7,1}(:,:,count+3);discharge_monthavg_diff{7,1}(:,:,count+4);discharge_monthavg_diff{7,1}(:,:,count+5);...
        discharge_monthavg_diff{8,1}(:,:,count+3);discharge_monthavg_diff{8,1}(:,:,count+4);discharge_monthavg_diff{8,1}(:,:,count+5)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences (%) in Tavg Scenarios vs Undisturbed for " + year + " - Spring Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+3));
    title('March - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+4));
    title('April - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+5));
    title('May - Undisturbed vs Tavg103');
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
    cmin = min(min([discharge_monthavg_diff{5,1}(:,:,count+6);discharge_monthavg_diff{5,1}(:,:,count+7);discharge_monthavg_diff{5,1}(:,:,count+8);...
        discharge_monthavg_diff{6,1}(:,:,count+6);discharge_monthavg_diff{6,1}(:,:,count+7);discharge_monthavg_diff{6,1}(:,:,count+8);...
        discharge_monthavg_diff{7,1}(:,:,count+6);discharge_monthavg_diff{7,1}(:,:,count+7);discharge_monthavg_diff{7,1}(:,:,count+8);...
        discharge_monthavg_diff{8,1}(:,:,count+6);discharge_monthavg_diff{8,1}(:,:,count+7);discharge_monthavg_diff{8,1}(:,:,count+8)]));
    cmax = max(max([discharge_monthavg_diff{5,1}(:,:,count+6);discharge_monthavg_diff{5,1}(:,:,count+7);discharge_monthavg_diff{5,1}(:,:,count+8);...
        discharge_monthavg_diff{6,1}(:,:,count+6);discharge_monthavg_diff{6,1}(:,:,count+7);discharge_monthavg_diff{6,1}(:,:,count+8);...
        discharge_monthavg_diff{7,1}(:,:,count+6);discharge_monthavg_diff{7,1}(:,:,count+7);discharge_monthavg_diff{7,1}(:,:,count+8);...
        discharge_monthavg_diff{8,1}(:,:,count+6);discharge_monthavg_diff{8,1}(:,:,count+7);discharge_monthavg_diff{8,1}(:,:,count+8)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences in Tavg Scenarios vs Undisturbed for " + year + " - Summer Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+6));
    title('June - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+7));
    title('July - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+8));
    title('August - Undisturbed vs Tavg103');
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
    cmin = min(min([discharge_monthavg_diff{5,1}(:,:,count+9);discharge_monthavg_diff{5,1}(:,:,count+10);discharge_monthavg_diff{5,1}(:,:,count+11);...
        discharge_monthavg_diff{6,1}(:,:,count+9);discharge_monthavg_diff{6,1}(:,:,count+10);discharge_monthavg_diff{6,1}(:,:,count+11);...
        discharge_monthavg_diff{7,1}(:,:,count+9);discharge_monthavg_diff{7,1}(:,:,count+10);discharge_monthavg_diff{7,1}(:,:,count+11);...
        discharge_monthavg_diff{8,1}(:,:,count+9);discharge_monthavg_diff{8,1}(:,:,count+10);discharge_monthavg_diff{8,1}(:,:,count+11)]));
    cmax = max(max([discharge_monthavg_diff{5,1}(:,:,count+9);discharge_monthavg_diff{5,1}(:,:,count+10);discharge_monthavg_diff{5,1}(:,:,count+11);...
        discharge_monthavg_diff{6,1}(:,:,count+9);discharge_monthavg_diff{6,1}(:,:,count+10);discharge_monthavg_diff{6,1}(:,:,count+11);...
        discharge_monthavg_diff{7,1}(:,:,count+9);discharge_monthavg_diff{7,1}(:,:,count+10);discharge_monthavg_diff{7,1}(:,:,count+11);...
        discharge_monthavg_diff{8,1}(:,:,count+9);discharge_monthavg_diff{8,1}(:,:,count+10);discharge_monthavg_diff{8,1}(:,:,count+11)]));
    year = y+i;
    figure;
    sgtitle("Monthly Average Discharge Differences in Tavg Scenarios vs Undisturbed for " + year + " - Autumn Season");
    subplot(4,3,1);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,2);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,3);
    imagesc(lon,lat,discharge_monthavg_diff{5,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg096');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,4);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,5);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,6);
    imagesc(lon,lat,discharge_monthavg_diff{6,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg098');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,7);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,8);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,9);
    imagesc(lon,lat,discharge_monthavg_diff{7,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg102');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,10);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+9));
    title('September - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,11);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+10));
    title('October - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    subplot(4,3,12);
    imagesc(lon,lat,discharge_monthavg_diff{8,1}(:,:,count+11));
    title('November - Undisturbed vs Tavg103');
    grid on;
    xlabel('Longitude');
    ylabel('Latitude');
    colorbar;
    clim([cmin,cmax]);
    count = count+12;
end

clear count i j k year y cmin cmax;