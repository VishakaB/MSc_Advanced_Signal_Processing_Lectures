%% PDF of an ECG signal 
%last update: 4th Nov 2023


%% initialization
% Clear the workspace, command window, and close all figures
clear;
clc;
close all;

% Prompt the user to select a .dat file (only image Bitmap)
[filename, pathname] = uigetfile('*.dat', 'Open .dat file');

if isequal(filename, 0) || isequal(pathname, 0)
    disp('File input canceled.');
    ECG_Data = [];
else
    % Open the selected file for reading
    fid = fopen(fullfile(pathname, filename), 'r');

    % Check if the file was opened successfully
    if fid == -1
        error('Failed to open the selected file.');
    end
end

%% sampling, normalizing, the mean & variance
time=10;
f=fread(fid,2*360*time,'ubit12');
Orig_Sig=f(1:2:length(f));
plot(Orig_Sig)

y_normalized = sort(Orig_Sig) / max(abs(Orig_Sig));

% Compute mean and variance
mu = mean(y_normalized);
vari = var(y_normalized);

% Estimate the PDF using the normal distribution
y_pdf = pdf('normal', y_normalized, mu, sqrt(vari));

%% Visualization
% Plot the estimated PDF
figure (2);
plot(y_normalized, y_pdf, 'LineWidth', 2);
title('Estimated PDF Using Normal Distribution');
xlabel('Amplitude');
ylabel('Probability Density');
