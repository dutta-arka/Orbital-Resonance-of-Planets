function [fitresult, gof] = createFit(y, y1)
%CREATEFIT(Y,Y1)
%  Create a fit.
%
%  Data for 'Orbital Period Vs Semi-Major Axis' fit:
%      X Input: y
%      Y Output: y1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 03-Mar-2024 12:21:15


%% Fit: 'Orbital Period Vs Semi-Major Axis'.
[xData, yData] = prepareCurveData( y, y1 );

% Set up fittype and options.
ft = fittype( 'a*x^b+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.162182308193243 0.794284540683907 0.311215042044805];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Orbital Period Vs Semi-Major Axis' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult, xData, yData );
legend( h, 'y1 vs. y', 'Orbital Period Vs Semi-Major Axis', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'y', 'Interpreter', 'none' );
ylabel( 'y1', 'Interpreter', 'none' );
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult, xData, yData, 'residuals' );
legend( h, 'Orbital Period Vs Semi-Major Axis - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'y', 'Interpreter', 'none' );
ylabel( 'y1', 'Interpreter', 'none' );
grid on

