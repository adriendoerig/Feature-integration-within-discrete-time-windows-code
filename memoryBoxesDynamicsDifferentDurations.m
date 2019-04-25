function [ summedBoxOutputs ] = memoryBoxesDynamicsDifferentDurations( stimulus, tauIntegrate, readoutTime, simulationTime, dt, readoutWindow)
%MEMORYBOXESDYNAMICS Manages the memory box dynamics and returns their output
% Parameters: See runTrial.m

plottingMemoryTraces = 0;                           % plots box traces if set to 1.

nBoxes = length(stimulus);
boxLength = zeros(1,nBoxes);
for i = 1:nBoxes
    boxLength(i) = length(stimulus{i})*dt;          % [s]
end
memoryTraces = zeros(nBoxes, simulationTime/dt);    % will store memory traces in each box
summedBoxOutputs = 0;                               % will store final result

% all boxes go (all the round() functions are to avoid matlab changing n to
% n.00000 when dividing by dt). 
for i = 1:nBoxes

    if readoutWindow == 1 || round(sum(boxLength(1:i))/dt+1) > readoutTime/dt  % only consider what is going on in window 1 if requested to readout from window 1. Otherwise, we just need to consider the stimuli in window 2 (i.e., the stimuli coming after 1 x readoutTime)
        if i == 1
            % integration
            [~, memoryTraces(i,1:boxLength(1)/dt)] = boxIntegrate(stimulus{i},tauIntegrate,dt);
            % buffering
            memoryTraces(i,boxLength(1)/dt+1:end) = memoryTraces(i,boxLength(1)/dt)*ones(1, length(memoryTraces(i,boxLength(1)/dt+1:end)));
        else
            % integration
            [~, memoryTraces(i,round(sum(boxLength(1:i-1))/dt+1):round(sum(boxLength(1:i))/dt))] = boxIntegrate(stimulus{i},tauIntegrate,dt);
            % buffering
            memoryTraces(i,round(sum(boxLength(1:i))/dt+1):end) = memoryTraces(i,round(sum(boxLength(1:i))/dt))*ones(1, length(memoryTraces(i,round(sum(boxLength(1:i))/dt+1):end)));
        end
    end
        
    % summing box states at readout time.
    if readoutWindow == 1
        summedBoxOutputs = summedBoxOutputs+memoryTraces(i,round(1*readoutTime/dt));
    elseif readoutWindow == 2
    	summedBoxOutputs = summedBoxOutputs+memoryTraces(i,round(2*readoutTime/dt));
    else
        error('Invalid readoutWindow')
    end
end

if plottingMemoryTraces
    figure(1000)
    for i = 1:nBoxes
        subplot(nBoxes,1,i)
        plot(1:length(memoryTraces(i,:)), memoryTraces(i,:))
        line([readoutTime/dt, readoutTime/dt], [-.05 .05], 'Color', 'g');
        mtit(['Memory boxes in temporal order. Summed value for decision stage = ', num2str(summedBoxOutputs)])
    end
end

