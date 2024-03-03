function [fitresult, gof] = createFit(x1, y1)
%CREATEFIT(X1,Y1)
%  Create a fit.
%
%  Data for 'Ratio of Semi-Major axis' fit:
%      X Input: x1
%      Y Output: y1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 03-Mar-2024 12:16:32


%% Fit: 'Ratio of Semi-Major axis'.
[xData, yData] = prepareCurveData( x1, y1 );

% Set up fittype and options.
ft = fittype( 'a*x^d*(exp(-b*x))+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.814284826068816 0.243524968724989 0.929263623187228 0.706046088019609];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Ratio of Semi-Major axis' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult, xData, yData );
legend( h, 'y1 vs. x1', 'Ratio of Semi-Major axis', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x1', 'Interpreter', 'none' );
ylabel( 'y1', 'Interpreter', 'none' );
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult, xData, yData, 'residuals' );
legend( h, 'Ratio of Semi-Major axis - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x1', 'Interpreter', 'none' );
ylabel( 'y1', 'Interpreter', 'none' );
grid on


