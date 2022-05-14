%clear all;
%close all;

AccelMagXYZData;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% ACCELEROMETER CALIBRATION BELOW %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% some constants we will need
Gravity = 16384;
HorizInt = 23.3328;
VertInt = 41.3831;

% Calculate the Accelerometer scale factor and null shift in X-direction
AveXPos = mean(xpos); 
AveXNeg = mean(xneg);
AccelNullShiftX = (AveXPos + AveXNeg) / 2;
XnegShift = AveXNeg - AccelNullShiftX;
XposShift = AveXPos - AccelNullShiftX;
SFX = Gravity / XposShift;
xNegCorrect = XnegShift * SFX;
xPosCorrect = XposShift * SFX;
AccelNegCorrectX = (xneg - AccelNullShiftX) * SFX;
AccelPosCorrectX = (xpos - AccelNullShiftX) * SFX;
AccelCorrectX = cat(2, AccelNegCorrectX / Gravity, AccelPosCorrectX / Gravity);

figure(1)
plot(AccelCorrectX, '.')
title('Accelerometer X-Calibrated')

% Calculate the Accelerometer scale factor and null shift in Y-direction
AveYPos = mean(ypos, 'all');
AveYNeg = mean(yneg, 'all');
AccelNullShiftY = (AveYPos + AveYNeg) / 2;
YnegShift = AveYNeg - AccelNullShiftY;
YposShift = AveYPos - AccelNullShiftY;
SFY = Gravity / YposShift;
yNegCorrect = YnegShift * SFY;
yPosCorrect = YposShift * SFY;
AccelNegCorrectY = (yneg - AccelNullShiftY) * SFY;
AccelPosCorrectY = (ypos - AccelNullShiftY) * SFY;
AccelCorrectY = cat(2, AccelNegCorrectY / Gravity, AccelPosCorrectY / Gravity);

figure(2)
plot(AccelCorrectY, '.')
title('Accelerometer Y-Calibrated')

% Calculate the Accelerometer scale factor and null shift in Z-direction
AveZPos = mean(zAccelUp); % average the values when IMU is facing up
AveZNeg = mean(zAccelDwn); % average the values when IMU is facing down
AccelNullShiftZ = (AveZPos + AveZNeg) / 2; % null-shift is the average of both positive and negative readings
ZnegShift = AveZNeg - AccelNullShiftZ;
ZposShift = AveZPos - AccelNullShiftZ;
SFZ = Gravity / ZposShift; % scale factor = expected/actual
zNegCorrect = ZnegShift * SFZ;
zPosCorrect = ZposShift * SFZ;
AccelNegCorrectZ = (zAccelDwn - AccelNullShiftZ) * SFZ; % apply shift and scale factor to negative readings
AccelPosCorrectZ = (zAccelUp - AccelNullShiftZ) * SFZ; % apply shift and scale factor to positive readings
AccelCorrectZ = cat(2, AccelNegCorrectZ / Gravity, AccelPosCorrectZ / Gravity); % concatinate result in a 2xN matrix

figure(3)
plot(AccelCorrectZ, 'r.')
title('Accelerometer Z-Calibrated')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% MAGNETOMETER CALIBRATION BELOW %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Essentially the same steps as Accelerometer...

% Calculate Magnetometer scale factor and null shift in X-direction
AveMagXPos = mean(magXPos);
AveMagXNeg = mean(magXNeg);
MagNullShiftX = (AveMagXPos + AveMagXNeg) / 2;
XMagNegShift = AveMagXNeg + MagNullShiftX;
XMagPosShift = AveMagXPos - MagNullShiftX;
magSFX = HorizInt / XMagPosShift;
magNegXCorrect = (magXNeg - MagNullShiftX) * magSFX;
magPosXCorrect = (magXPos - MagNullShiftX) * magSFX;
MagXCorrect = cat(2, magNegXCorrect, magPosXCorrect);

figure(4)
plot(MagXCorrect, '.')
title('Magnetometer X-Calibrated')

% Calculate Magnetometer scale factor and null shift in Y-direction
AveMagYPos = mean(magYPos);
AveMagYNeg = mean(magYNeg);
MagNullShiftY = (AveMagYPos + AveMagYNeg) / 2;
YMagNegShift = AveMagYNeg + MagNullShiftY;
YMagPosShift = AveMagYPos - MagNullShiftY;
magSFY = HorizInt / YMagPosShift;
magNegYCorrect = (magYNeg - MagNullShiftY) * magSFY;
magPosYCorrect = (magYPos - MagNullShiftY) * magSFY;
MagYCorrect = cat(2, magNegYCorrect, magPosYCorrect);

figure(5)
plot(MagYCorrect, '.')
title('Magnetometer Y-Calibrated')

% Calculate Magnetometer scale factor and null shift in Z-direction
AveMagZPos = mean(magZPos);
AveMagZNeg = mean(magZNeg);
MagNullShiftZ = (AveMagZPos + AveMagZNeg) / 2;
ZMagNegShift = AveMagZNeg + MagNullShiftZ;
ZMagPosShift = AveMagZPos - MagNullShiftZ;
magSFZ = VertInt / ZMagPosShift
magNegZCorrect = (magZNeg - MagNullShiftZ) * magSFZ;
magPosZCorrect = (magZPos - MagNullShiftZ) * magSFZ;
MagZCorrect = cat(2, magNegZCorrect, magPosZCorrect);

figure(6)
plot(MagZCorrect, '.')
title('Magnetometer Z-Calibrated')

