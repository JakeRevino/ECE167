%clear all;
close all;

Raw2AngleConversion = 131; % This value came from a Piazza post
Min2SecConversion = 3600;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% 10 SECOND GYROSCOPE DATA BELOW %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% open csv file
fileSec10s = fopen('Gyro10sec_data.csv');

% Read data
readData10s = textscan(fileSec10s, '%f %f %f','HeaderLines',1,'Delimiter',',');

% Extract data from readData
raw10X = readData10s{1,1}(:,1); % all rows 1st column
raw10Y = readData10s{1,2}(:,1); % all rows 2nd column
raw10Z = readData10s{1,3}(:,1); % all rows 3rd column

fixed10X = rmmissing(raw10X); % this is removing all the bad "NaN" data
fixed10Y = rmmissing(raw10Y);
fixed10Z = rmmissing(raw10Z);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% 1 HOUR GYROSCOPE DATA BELOW %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% open csv file
fileSec1hr = fopen('Gyro1hr_data.csv');

% Read data
readData1hr = textscan(fileSec1hr, '%f %f %f','HeaderLines',1,'Delimiter',',');

% Extract data from readData
raw1hX = readData1hr{1,1}(:,1); % all rows 1st column
raw1hY = readData1hr{1,2}(:,1); % all rows 2nd column
raw1hZ = readData1hr{1,3}(:,1); % all rows 3rd column

fixed1hX = rmmissing(raw1hX); % this is removing all the bad "NaN" data
fixed1hY = rmmissing(raw1hY);
fixed1hZ = rmmissing(raw1hZ);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

offset10X = mean(fixed10X) % this is the offset for 10s data X-direction
offset10Y = mean(fixed10Y) % this is the offset for 10s data Y-direction
offset10Z = mean(fixed10Z) % this is the offset for 10s data Z-direction

% convert raw reading to angular rate
angle1hX = (fixed1hX - offset10X) ./ Raw2AngleConversion;
angle1hY = (fixed1hY - offset10Y) ./ Raw2AngleConversion;
angle1hZ = (fixed1hZ - offset10Z) ./ Raw2AngleConversion;

% This is splitting up the data to get an average of the data for 6
% different intervals
index = {[1:30008],[30009:60015],[60016:90022],[90023:120029],[120030:150036],[150037:180045]};
aveBiasX = cellfun(@(x) mean(angle1hX(x)),index)
aveBiasY = cellfun(@(x) mean(angle1hY(x)),index)
aveBiasZ = cellfun(@(x) mean(angle1hZ(x)),index)

% setup some time to plot over
Time = linspace(0, 60, 180045); % used for plotting drift
Time2 = linspace(0, 1, 6); % used for plotting bias

% integrate the angles to get drift
driftX = cumtrapz(angle1hX) / Min2SecConversion;
driftY = cumtrapz(angle1hY) / Min2SecConversion;
driftZ = cumtrapz(angle1hZ) / Min2SecConversion;

% plot driftX
figure(1);
subplot(2,2,1)
cla; hold on; grid on;
plot(Time, driftX, 'b.');
xlabel('Time (minutes)');
ylabel('Drift (degrees)');
title('X drift (degrees / 1 Hr)');

%plot driftY
subplot(2,2,2)
cla; hold on; grid on;
plot(Time, driftY, 'r.');
xlabel('Time (minutes)');
ylabel('Drift (degrees)');
title('Y drift (degrees / 1 Hr)');

%plot driftZ
subplot(2,1,2)
cla; hold on; grid on;
plot(Time, driftZ, 'g.');
xlabel('Time (minutes)');
ylabel('Drift (degrees)');
title('Z drift (degrees / 1 Hr)');

%plot bias over time
figure(2);
subplot(2,2,1)
plot(Time2, aveBiasX, 'g-');
xlabel('Time (1 hour)');
ylabel('Bias');
title('BiasX over time');

subplot(2,2,2)
plot(Time2, aveBiasY, 'b-');
xlabel('Time (1 hour)');
ylabel('Bias');
title('BiasY over time');

subplot(2,1,2)
plot(Time2, aveBiasZ, 'r-');
xlabel('Time (1 hour)');
ylabel('Bias');
title('BiasZ over time');

