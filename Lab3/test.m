clear all;

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

offset10X = mean(fixed10X); % this is the offset for 10s data X-direction
offset10Y = mean(fixed10Y); % this is the offset for 10s data Y-direction
offset10Z = mean(fixed10Z); % this is the offset for 10s data Z-direction