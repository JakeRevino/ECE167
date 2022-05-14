% clear all;
% close all;

EllipseXYData;

Abetter = [-Ymeas.^2 2.*Ymeas 2.*Xmeas ones(size(Xmeas))];
Rbetter = Xmeas.^2;

results = Abetter\Rbetter; % results = 0.2658, -0.0900, 0.3962, 1.0349

x0 = 0.3962;
y0 = -0.3386;
a = 1.1056;
b = 2.1445;

figure(1)
hold on
plot(sqrt(Xmeas.^2 + Ymeas.^2), 'b.')
[X,Y] = CalibrateEllipseData2D(Xmeas,Ymeas,20,0);
plot(sqrt(X.^2 + Y.^2), 'r.')
legend('Pre-Calibration', 'Post-Calibration', 'FontSize',14)
title('Norm of data pre- and post-Calibration');

figure(2)
hold on
plot(Xmeas, Ymeas, 'b.');
plot(X, Y, 'r.');
legend('Pre-Calibration', 'Post-Calibration', 'FontSize',14)
axis([-3 3 -3 3]);
title('Elipse pre- and post-Calibration')
