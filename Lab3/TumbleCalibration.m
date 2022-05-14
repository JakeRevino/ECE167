%close all;
%clear all;

% open Accel & Mag csv file
AccelFile = fopen('AccelTumbleData.csv');
MagFile = fopen('MagTumbleData.csv');

% Read Accel & Mag data
ReadDataAccel = textscan(AccelFile, '%f %f %f','HeaderLines',1,'Delimiter',',');
ReadDataMag = textscan(MagFile, '%f %f %f','HeaderLines',1,'Delimiter',',');

% Extract Accel & Mag data
rawAccelX = ReadDataAccel{1,1}(:,1); % all rows 1st column
rawAccelY = ReadDataAccel{1,2}(:,1); % all rows 2nd column
rawAccelZ = ReadDataAccel{1,3}(:,1); % all rows 3rd column

rawMagX = ReadDataMag{1,1}(:,1); % all rows 1st column
rawMagY = ReadDataMag{1,2}(:,1); % all rows 2nd column
rawMagZ = ReadDataMag{1,3}(:,1); % all rows 3rd column

% get the mean / offset on each axis
AccelOffX = mean(rawAccelX);
AccelOffY = mean(rawAccelY);
AccelOffZ = mean(rawAccelZ);

MagOffX = mean(rawMagX);
MagOffY = mean(rawMagY);
MagOffZ = mean(rawMagZ);

% scaling the data into engineering units
AccelScaledX = (rawAccelX ./ 16384) ./ 1000;
AccelScaledY = (rawAccelY ./ 16384) ./ 1000;
AccelScaledZ = (rawAccelZ ./ 16384) ./ 1000;

MagScaledX = ((rawMagX.*0.15) ./ 47.507) .* 1000;
MagScaledY = ((rawMagY.*0.15) ./ 47.507) .* 1000;
MagScaledZ = ((rawMagZ.*0.15) ./ 47.507) .* 1000;

% plotting pre-calibrated norm
figure(1)
hold on
plot(sqrt(AccelScaledX.^2 + AccelScaledY.^2 + AccelScaledZ.^2), 'b.')
%plot(sqrt(rawAccelX.^2 + rawAccelY.^2 + rawAccelZ.^2), 'b.')
title('Pre- vs. Post-Calibrated Norm of Accelerometer')

figure(2)
hold on
plot(sqrt(MagScaledX.^2 + MagScaledY.^2 + MagScaledZ.^2), 'r.')
%plot(sqrt(rawMagX.^2 + rawMagY.^2 + rawMagZ.^2), 'r.')
title('Pre- vs. Post-Calibrated Norm of Magnetometer')

% uncallibrated standard deviation
StDevAcc = std(sqrt(AccelScaledX.^2 + AccelScaledY.^2 + AccelScaledZ.^2))
%StDevAcc = std(sqrt(rawAccelX.^2 + rawAccelY.^2 + rawAccelZ.^2))
StDevMag = std(sqrt(MagScaledX.^2 + MagScaledY.^2 + MagScaledZ.^2))
%StDevMag = std(sqrt(rawMagX.^2 + rawMagY.^2 + rawMagZ.^2))


% calibration using previous section
XACal = ((rawAccelX - 10.264) .* 1.0002) ./ 16384;
YACal = ((rawAccelY + 83.788) .* 0.9977) ./ 16384;
ZACal = ((rawAccelZ + 60.572) .* 0.9867) ./ 16384;
XMCal = (((rawMagX .* 0.15) + 4.30440) .* 1.5199) ./ 47.507;
YMCal = (((rawMagY .* 0.15)) - 10.5920) .* 1.5192 ./ 47.507;
ZMCal = (((rawMagZ .* 0.15) + 21.6105) .* 1.2142) ./ 47.507;

% calibrated standard deviation 
STDevAccCal = std(sqrt(XACal.^2 + YACal.^2 + ZACal.^2))
STDevMagCal = std(sqrt(XMCal.^2 + YMCal.^2 + ZMCal.^2))

% plotting calibrated norm
figure(1)
hold on
plot(sqrt(XACal.^2 + YACal.^2 + ZACal.^2), 'g.')
%title('Post-Calibrated Norm of Accelerometer')
legend('Pre-Calibration', 'Post-Calibration')

figure(2)
hold on
plot(sqrt(XMCal.^2 + YMCal.^2 + ZMCal.^2), 'b.')
%title('Post-Calibrated Norm of Magnetometer')
legend('Pre-Calibration', 'Post-Calibration')

% plotting 3D
figure(5)
hold on
%plot3(rawAccelX, rawAccelY, rawAccelZ, 'b.')
plot3(AccelScaledX, AccelScaledY, AccelScaledZ, 'b.')
xlabel('X Accel (G)')
ylabel('Y Accel (G)')
zlabel('Z Accel (G)')
title('Pre-Calibration of Accelerometer')
%legend('Pre-Calibration')

figure(6)
plot3(XACal, YACal, ZACal, 'r.')
xlabel('X Accel (G)')
ylabel('Y Accel (G)')
zlabel('Z Accel (G)')
title('Post-Calibration of Accelerometer')
%legend('Post-Calibration')

figure(7)
hold on
plot3(MagScaledX, MagScaledY, MagScaledZ, 'b.')
%figure(9)
%plot3(XMCal, YMCal, ZMCal, 'r.')
xlabel('X Mag (Earths Magnetic Field)')
ylabel('Y Mag (Earths Magnetic Field)')
zlabel('Z Mag (Earths Magnetic Field)')
title('Pre-Calibration of Magnetometer')
%legend('Pre-Calibration')

figure(8)
plot3(XMCal, YMCal, ZMCal, 'r.')
xlabel('X Mag (Earths Magnetic Field)')
ylabel('Y Mag (Earths Magnetic Field)')
zlabel('Z Mag (Earths Magnetic Field)')
title('Post-Calibration of Magnetometer')
%legend('Post-Calibration')



% calibrating data
[AtildeAccel, BtildeAccel] = CalibrateEllipsoidData3D(AccelScaledX, AccelScaledY, AccelScaledZ, 20, 0);
[AtildeMag, BtildeMag] = CalibrateEllipsoidData3D(MagScaledX, MagScaledY, MagScaledZ, 20, 0);

% correcting data
[XAccCor, YAccCor, ZAccCor] = CorrectEllipsoidData3D(AccelScaledX, AccelScaledY, AccelScaledZ, AtildeAccel, BtildeAccel);
[XMagCor, YMagCor, ZMagCor] = CorrectEllipsoidData3D(MagScaledX, MagScaledY, MagScaledZ, AtildeMag, BtildeMag);

% plotting 3D of matlab calibration
figure(9)
hold on
plot3(AccelScaledX, AccelScaledY, AccelScaledZ, '.')
plot3(XAccCor, YAccCor, ZAccCor, '.')
xlabel('X Accel (G)')
ylabel('Y Accel (G)')
zlabel('Z Accel (G)')
title('Calibration of Accelerometer With MatLab Files')
legend('Pre-Calibration', 'Post-Calibration')

figure(10)
hold on
plot3(MagScaledX, MagScaledY, MagScaledZ, '.')
plot3(XMagCor, YMagCor, ZMagCor, '.')
xlabel('X Mag (Earths Magnetic Field)')
ylabel('Y Mag (Earths Magnetic Field)')
zlabel('Z Mag (Earths Magnetic Field)')
title('Calibration of Magnetometer With MatLab Files')
legend('Pre-Calibration', 'Post-Calibration')

% plotting norms of matlab calibration
figure(11)
hold on
plot(sqrt(AccelScaledX.^2 + AccelScaledY.^2 + AccelScaledZ.^2), '.')
plot(sqrt(XAccCor.^2 + YAccCor.^2 + ZAccCor.^2), '.')
title('Norm of Matlab Calibration Accelerometer')
legend('Pre-Calibration', 'Post-Calibration')

figure(12)
hold on
plot(sqrt(MagScaledX.^2 + MagScaledY.^2 + MagScaledZ.^2), '.')
plot(sqrt(XMagCor.^2 + YMagCor.^2 + ZMagCor.^2), '.')
title('Norm of MatLab Calibration Magnetometer')
legend('Pre-Calibration', 'Post-Calibration')
















