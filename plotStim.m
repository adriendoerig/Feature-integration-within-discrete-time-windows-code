% plots each memory box from a stimulus (which is created by the
% createStimulus function)

simulationTime = 1;  % [s]
readoutTime = 0.425; % [s]
dt = .001;
stimuli = createStimuli(dt, 'E18'); % second argument determines which experimental stimulus set is created (see createStimuli.m for stimulus names)
stimIDs = 1:length(stimuli); % stimuli contains all the stimuli from the chosen experiment. stimID chooses which of these to plot


for stimID = stimIDs
    stimulus = stimuli{stimID};
    nBoxes = length(stimulus);

    boxLength = zeros(1,nBoxes);
    for i = 1:nBoxes
        boxLength(i) = length(stimulus{i})*dt;        % [s]
    end
    stimTraces = zeros(nBoxes, simulationTime/dt);    % will store stimulus trace for each box

    for i = 1:nBoxes
        if i == 1
            stimTraces(i,1:boxLength(1)/dt) = stimulus{i};
        else
            stimTraces(i,round(sum(boxLength(1:i-1))/dt+1):round(sum(boxLength(1:i))/dt)) = stimulus{i};
        end  
    end

    donePlots = 0;
    for i = 1:nBoxes
        filledBoxes = find(mean(stimTraces, 2));
        nonEmptyBoxes = length(filledBoxes);
        if any(filledBoxes(:) == i)
            donePlots = donePlots + 1;
            subplot(nonEmptyBoxes,1,donePlots)
            plot(stimTraces(i,:))
            ylim([-1.1 1.1])
            line([readoutTime/dt, readoutTime/dt], [-1.1 1.1], 'Color', 'g');
            mtit('Stimulus traces for each non-empty memory box in temporal order. Vertical line=readoutTime')
        end
    end
    pause(1)
end