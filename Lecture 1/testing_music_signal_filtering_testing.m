%% Example: Extract Voices from Music Signal
%referece: https://in.mathworks.com/help/signal/ug/extract-voices-from-music-signal.html
%last update: 6th Nov 2023

%sampling frequency
fs = 2e3;
t = 0:1/fs:0.3-1/fs;

load music

%power spectrum of the filtered signals
pspectrum(low)
hold on
pspectrum(medium)
hold on
pspectrum(high)
hold off

% To hear the different voices
sound(low.low,fs), pause(5)
% sound(medium.medium,fs), pause(5)
% sound(high.high,fs)