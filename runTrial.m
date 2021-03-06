% Written by Adrien Doerig at the Laboratory of Psychophysics, EPFL, 2019

function [decision, success, wongWang_input] = runTrial(simulationTime, stimulus, dt, readoutTime, readoutWindow, tauIntegrate, wongWang_gain, wongWang_sigma, wongWang_mu0)
% RUNTRIAL simulates performance on one trial and returns the answer and
% RT.
%
% Note: to plot memory traces and wongWangBoxes output, go to these
% functions and set plotting to 1.
%
% simulationTime: total time to simulate [s]
% stimulus: specifies the stimulus (a sequence of -1 = AV, 0 = no vernier and 
%     1 = V. One number per dt.
% dt: time step [s]
% NDtime: non-decisional time (one per trial)
% readoutTime: time of readout [s]
% tauIntegrate: timescale for integration in boxes (when box is 'open')
% tauDecay: timescale for decay in boxes (box is 'close', i m in the next
% one)
% wangWang_gain: gain from summed box activity to wongWang input
% wongWang_sigma: noise from summed box activity to wongWang input
% wongWang_mu0: reactivity of the wongWang stage. high mu0 means that
%     small differences in initial conditions lead to quick, random decisions

     
% compute dynamics of the memory boxes 
summedBoxOutputs = memoryBoxesDynamicsDifferentDurations(stimulus, tauIntegrate, readoutTime, simulationTime, dt, readoutWindow);

% take boxes stage output and add gain and noise ('normalize' data for
% wongWang range)
wongWang_input = normrnd(wongWang_gain*summedBoxOutputs, wongWang_sigma);
wongWang_input = 2*(atan(2*wongWang_input))/pi; %maps [-Inf,Inf] to [0,1] (because wongWangBoxes expects v in [0,1])


% feed this to wongWang
[decision, ~, success] = WongWangBoxes(wongWang_input, wongWang_mu0);
