%% Whale song 
%Testing the example in mathworks: Extract Regions of Interest from Whale Song 
%reference = https://in.mathworks.com/help/signal/ug/extract-regions-of-interest-from-whale-song.html
%Last update: 4th Nov 2023 

%% original signal
whaleFile = fullfile(matlabroot,'examples','matlab','data','bluewhale.au');
[w,fs] = audioread(whaleFile);

whale = timetable(seconds((0:length(w)-1)'/fs),w);
% soundsc(w,fs)

%% analyzing the regions of interests
load region_v3

% To hear the different regions
%trill region sound
sound(table2array(whale_w_high),fs), pause(5)

%moan region 1
sound(table2array(whale_w_ROI),fs), pause(5)

%moan region 2
sound(table2array(whale_w_ROI_1),fs), pause(5)

%moan region 3 
sound(table2array(whale_w_ROI_2),fs), pause(5)

%combination of moan region signals
sound(table2array(whale_w_ROI(1:7640,:))+...
    table2array(whale_w_ROI_2(1:7640,:))+...
    table2array(whale_w_ROI_2(1:7640,:)),fs)

%combination of trill and moan region signals
sound(table2array(whale_w_high(1:7640,:))+...
    table2array(whale_w_ROI_2(1:7640,:)),fs)

%new moan region signals
sound(table2array(whale_w_ROI),fs)

%combination of new moan and trill signals
sound(table2array(whale_w_high(1:30836,:))+...
    table2array(whale_w_ROI(1:30836,:)),fs)