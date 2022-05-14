close all;
clear all;

[AccelNoise,MagNoise,AccelDist,MagDist] = CreateTumbleData(500);

% scaling Accel and Mag data to engineering units
AScaled = AccelNoise ./ 16384;
MScaled = MagNoise .* 0.15;

% apply shifts and scale factor to X, Y, & Z based on calibration
ANaive = [(AScaled(:,1) - 0.1).*1, (AScaled(:,2) - 0.1).*1, (AScaled(:,3) - 0).*1];
MNaive = [(MScaled(:,1) - 3.5).*1.033, (MScaled(:,2) - 4).*1.022, (MScaled(:,3) - 3).*0.887];

% Calculate standard deviation
StDevAcc = std(sqrt(ANaive(:,1).^2 + ANaive(:,2).^2 + ANaive(:,3).^2))
StDevMag = std(sqrt(MNaive(:,1).^2 + MNaive(:,2).^2 + MNaive(:,3).^2))

% plotting
figure(1)
hold on
plot3(AScaled(:,1), AScaled(:,2), AScaled(:,3), '.')
%plot3(ANaive(:,1), ANaive(:,2), ANaive(:,3), '.')
xlabel('X Accel (G)')
ylabel('Y Accel (G)')
zlabel('Z Accel (G)')
title('Pre-Calibration of Accelerometer')
%axis([-1.2 1.2 -1.2 1.2 -1.2 1.2])
%legend('Pre-Calibration', 'Post-Calibration')

figure(2)
hold on
%plot3(AScaled(:,1), AScaled(:,2), AScaled(:,3), '.')
plot3(ANaive(:,1), ANaive(:,2), ANaive(:,3), '.')
xlabel('X Accel (G)')
ylabel('Y Accel (G)')
zlabel('Z Accel (G)')
title('Naive Post-Calibration of Accelerometer')

figure(3)
hold on
plot3(MScaled(:,1), MScaled(:,2), MScaled(:,3), '.')
%plot3(MNaive(:,1), MNaive(:,2), MNaive(:,3), '.')
xlabel('X Mag (uT)')
ylabel('Y Mag (uT)')
zlabel('Z Mag (uT)')
title('Naive Pre-Calibration of Magnetometer')
%legend('Pre-Calibration', 'Post-Calibration')

figure(4)
hold on
%plot3(MScaled(:,1), MScaled(:,2), MScaled(:,3), '.')
plot3(MNaive(:,1), MNaive(:,2), MNaive(:,3), '.')
xlabel('X Mag (uT)')
ylabel('Y Mag (uT)')
zlabel('Z Mag (uT)')
title('Naive Post-Calibration of Magnetometer')

figure(5)
plot(sqrt(MNaive(:,1).^2 + MNaive(:,2).^2 + MNaive(:,3).^2), '.')
title('Magnetometer Norm Pre-Calibration')
hold on

figure(6)
plot(sqrt(MScaled(:,1).^2 + MScaled(:,2).^2 + MScaled(:,3).^2), '.')
title('Magnetometer Norm Post-Calibration')
%legend('Post-Calibration', 'Pre-Calibration')

% figure(6)
% hold on
% plot(sqrt(ANaive(:,1).^2 + ANaive(:,2).^2 + ANaive(:,3).^2), '.')
% title('Accelerometer Norm')
% plot(sqrt(AScaled(:,1).^2 + AScaled(:,2).^2 + AScaled(:,3).^2), '.')
% legend('Post-Calibration', 'Pre-Calibration')


