close all;
clear all;

[AccelNoise,MagNoise,AccelDist,MagDist] = CreateTumbleData(500);

% scaling the data into engineering units
AScaled = AccelNoise./16384;
MScaled = (MagNoise.*0.15)./47.507;

% calibrating data
[AtildeAccel, BtildeAccel] = CalibrateEllipsoidData3D(AScaled(:,1), AScaled(:,2), AScaled(:,3), 10, 0);
[AtildeMag, BtildeMag] = CalibrateEllipsoidData3D(MScaled(:,1), MScaled(:,2), MScaled(:,3), 10, 0);

% correcting data
[XAccCor, YAccCor, ZAccCor] = CorrectEllipsoidData3D(AScaled(:,1), AScaled(:,2), AScaled(:,3), AtildeAccel, BtildeAccel);
[XMagCor, YMagCor, ZMagCor] = CorrectEllipsoidData3D(MScaled(:,1), MScaled(:,2), MScaled(:,3), AtildeMag, BtildeMag);

% standard deviation
StDevAcc = std(sqrt(XAccCor.^2 + YAccCor(:,2).^2 + ZAccCor(:,3).^2))
StDevMag = std(sqrt(XMagCor.^2 + YMagCor(:,2).^2 + ZMagCor(:,3).^2))

% plotting
figure(1)
hold on
plot3(AScaled(:,1), AScaled(:,2), AScaled(:,3), '.')
%plot3(XAccCor, YAccCor, ZAccCor, '.')
xlabel('X Accel (G)')
ylabel('Y Accel (G)')
zlabel('Z Accel (G)')
title('Accelerometer Pre-Calibration')
%legend('Pre-Calibration', 'Post-Calibration')

figure(2)
hold on
%plot3(AScaled(:,1), AScaled(:,2), AScaled(:,3), '-')
plot3(XAccCor, YAccCor, ZAccCor, '.')
xlabel('X Accel (G)')
ylabel('Y Accel (G)')
zlabel('Z Accel (G)')
title('Accelerometer Post-Calibration')

figure(3)
hold on
plot3(MScaled(:,1), MScaled(:,2), MScaled(:,3), '.')
%plot3(XMagCor, YMagCor, ZMagCor, '.')
xlabel('X Mag (Earths Magnetic Field)')
ylabel('Y Mag (Earths Magnetic Field)')
zlabel('Z Mag (Earths Magnetic Field)')
title('Magnetometer Pre-Calibration')
%legend('Pre-Calibration', 'Post-Calibration')

figure(4)
hold on
%plot3(MScaled(:,1), MScaled(:,2), MScaled(:,3), '.')
plot3(XMagCor, YMagCor, ZMagCor, '.')
xlabel('X Mag (Earths Magnetic Field)')
ylabel('Y Mag (Earths Magnetic Field)')
zlabel('Z Mag (Earths Magnetic Field)')
title('Magnetometer Post-Calibration')

figure(5)
hold on
plot(sqrt(AScaled(:,1).^2 + AScaled(:,2).^2 + AScaled(:,3).^2), '.')
plot(sqrt(XAccCor.^2 + YAccCor(:,2).^2 + ZAccCor(:,3).^2), '.')
title('Accelerometer Norm Pre and Post-Calibration')
legend('Pre-Calibration', 'Post-Calibration')

figure(6)
hold on
plot(sqrt(MScaled(:,1).^2 + MScaled(:,2).^2 + MScaled(:,3).^2), '.')
plot(sqrt(XMagCor.^2 + YMagCor(:,2).^2 + ZMagCor(:,3).^2), '.')
title('Magnetometer Norm Pre and Post-Calibration')
legend('Pre-Calibration', 'Post-Calibration')