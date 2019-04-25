% This script runs the model on all data in the paper "Feature integration
% within discrete time windows". Stimuli are created in createStimuli.m,
% but you can also create your own based on the same principles. For this,
% create the stimuli you want in the same way as in createStimuli.m, then
% put all the stimuli you want to run in a stimSequence cell. The
% modelSequence variable determines if model outputs are read out of the
% first or the second discrete time window, for each stimulus. Parameters
% are fixed for all experiments, except readoutTime, which is changed to
% account for individual differences in suppFig1.

clear; close all; clc;

%% Choose your experiment

expts= {'E4', 'E4_informed', ... % for suppFig2a
        'E8', 'E8_informed', ... % for suppFig2b
        'E18', 'E18_informed_longWindow', 'E18_informed_shortWindow', ... % for fig 1 & suppFig1
        'Fig2b', 'Fig2c',  ...   % for Fig2b&c
        'suppFig3', ...          % for suppFig3
        'Fig3'};                 % for Fig3
dt = .001;
nTrials = 1000;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup: model parameters.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

readoutTime = 0.475;      % [s] stage 2 kicks in at t=readoutTime

tauIntegrate = 0.3;       % [s]
wongWang_gain = 22;       % gain from boxes stage to decision stage
wongWang_sigma = 0.4;     % noise from boxes stage to decision stage
wongWang_mu0 = 24;        % wongWang "reactivity" -> high mu = "jumpy" network

%% loop over all experiments you want to plot
for expt = expts
    
    exptName = expt{1};
    disp(['Plotting model results for experiment ', exptName])
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Setup: create stimuli sequence and model sequence for the expt
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %% Experiment 1
    if strcmpi(exptName, 'E4')
        dataType = 'E4';
        data = [78.2166666666667,25.5916666666667,24.8666666666667,24.3500000000000,57.9250000000000,51.6750000000000,55.2083333333333,92.5000000000000,90.8333333333333,88.3333333333333];
        stdem = [3.362703938, 0.836103728, 1.910046538, 1.264120247, 2.342888175, 1.907343266, 3.320351805, 2.415229458, 2.00693243, 3.632415786];
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = stimuli;

        modelSequence = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    end

    if strcmpi(exptName, 'E4_informed')
        dataType = 'E4_informed';
        data = [78.2166666666667,25.5916666666667,24.8666666666667,24.3500000000000,59.3500000000000,55.7333333333333,55.9416666666667,77.9166666666667,80.0000000000000,77.0833333333333];
        stdem = [3.362703938, 0.836103728, 1.910046538, 1.264120247, 2.901149198, 2.50112197, 1.629029193, 4.53765113, 3.415650255, 4.103690751];
        stimuli = createStimuli(dt, dataType);
        stimSequence = stimuli;

        modelSequence = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    end

    if strcmpi(exptName, 'E8')
        dataType = 'E8';
        data = [72.4083333333334,29.5500000000000,29.7833333333333,33.4333333333333,50.7500000000000,48.0416666666667,46.0616666666667,80.0000000000000,78.3333333333333,72.5000000000000];
        stdem = [2.54173224, 1.753995439, 2.297885501, 2.000111108, 2.701203436, 3.679660688, 4.832304776, 5.0, 4.265494631, 2.813657169];
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = stimuli;

        modelSequence = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    end

    if strcmpi(exptName, 'E8_informed')
        dataType = 'E8_informed';
        data = [72.4083333333334,29.5500000000000,29.7833333333333,33.4333333333333,52.5250000000000,56.3750000000000,55.7500000000000,73.7500000000000,71.2500000000000,68.7833333333333];
        stdem = [2.54173224, 1.753995439, 2.297885501, 2.000111108, 2.489569909, 4.230302393, 2.679178979, 5.429472043, 5.467708234, 3.336207095];
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = stimuli;

        modelSequence = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    end

    if strcmpi(exptName, 'E18')
        dataType = 'E18';
        data = [72.3250000000000,28.5166666666667,25.8000000000000,30.8500000000000,52.9916666666667,53.1333333333333,28.6833333333333,71.6666666666667,72.0833333333333,84.1666666666667];
        stdem = [1.718902266, 2.678608677, 2.24291477, 2.189330187, 3.926733517, 4.692203936, 3.420518154, 2.00693243, 3.254270698, 2.554951619];
        
        readoutTime = .475; % observers not trying to shrink their window have a long window
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = stimuli;
        
        modelSequence = [1, 1, 1, 2, 1, 1, 2, 1, 1, 2];

    end

    if strcmpi(exptName, 'E18_informed_longWindow')
        dataType = 'E18_informed';
        data = [72.3250000000000,28.5166666666667,25.8000000000000,30.8500000000000,59.2916666666667,67.6250000000000,67.8416666666667,73.3333333333333,72.5000000000000,69.1666666666667];
        stdem = [1.718902266, 2.678608677, 2.24291477, 2.189330187, 6.624002021, 5.43863877, 4.178604565, 4.772607021, 3.291402943, 3.456073559];
        
        readoutTime = .475; % for observers unable to shrink their window in expt 1
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = stimuli;
        
        modelSequence = [1, 1, 1, 2, 1, 1, 1, 1, 1, 1];
        
    end
    
    if strcmpi(exptName, 'E18_informed_shortWindow')
        dataType = 'E18_informed';
        data = [72.3250000000000,28.5166666666667,25.8000000000000,30.8500000000000,59.2916666666667,67.6250000000000,67.8416666666667,73.3333333333333,72.5000000000000,69.1666666666667];
        stdem = [1.718902266, 2.678608677, 2.24291477, 2.189330187, 6.624002021, 5.43863877, 4.178604565, 4.772607021, 3.291402943, 3.456073559];
        
        readoutTime = .425; % for observers able to shrink their window in expt 1
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = stimuli;
        
        modelSequence = [1, 1, 2, 2, 1, 1, 1, 1, 1, 1];
        
    end

    %% Experiment 2
    if strcmpi(exptName, 'Fig2b')
        dataType = 'Expt2a';
        data = [72.73888889, 26.1, 22.63333333, 52.21666667, 27.37777778, 57.55555556, 73.20555556];
        stdem = [1.134225623, 0.865954123, 1.547758235, 2.963658483, 2.988394332, 2.539568891, 2.818780102];
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = cell(1,7);
        stimSequence(1:6) = stimuli;
        stimSequence(7) = stimuli(6);
        
        modelSequence = [1, 1, 2, 1, 2, 1, 2];

    end

    %% Experiment 3
    if strcmpi(exptName, 'Fig2c')
        dataType = 'Expt2b';
        data = [75.65, 24.56875, 63.359375, 29.765625, 72.265625, 84.765625];
        stdem = [1.231433543, 1.274927782, 3.221582275, 2.174507013, 2.552292114, 1.314929193];
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = cell(1,6);
        stimSequence(1:3) = stimuli(1:3);
        stimSequence(4) = stimuli(3);
        stimSequence(5) = stimuli(4);
        stimSequence(6) = stimuli(4);
        
        modelSequence = [1, 2, 1, 2, 1, 2];
        
    end

%% Experiment 3 supplementary
    if strcmpi(exptName, 'suppFig3')
        dataType = 'Expt3control';
        data = [76.1625, 24.6375, 52.34375, 45.3125, 79.21875, 77.734375];
        stdem = [1.100401906, 1.001869002, 1.184508854, 1.908014336, 2.145335868, 3.83547707];
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = cell(1,6);
        stimSequence(1:3) = stimuli(1:3);
        stimSequence(4) = stimuli(3);
        stimSequence(5) = stimuli(4);
        stimSequence(6) = stimuli(4);
        
        modelSequence = [1, 1, 1, 1, 1, 1];

    end

    %% Experiment 4
    if strcmpi(exptName, 'Fig3')
        dataType = 'Expt3';
        data = [45.159375, 52.415625, 51.24375, 55.709375, 48.66875, 68.41875, 33.275, 48.128125, 48.753125, 48.665625];
        stdem = [2.39755706, 3.024136305, 2.777037339, 2.076058989, 5.184176539, 3.12142921, 3.298751793, 4.044770206, 2.039976789, 1.710706422];
        
        stimuli = createStimuli(dt, dataType);
        stimSequence = cell(1,10);
        stimSequence(1:2) = stimuli(5);
        stimSequence(3:4) = stimuli(6);
        stimSequence(5:6) = stimuli(7);
        stimSequence(7:8) = stimuli(8);
        stimSequence(9:10) = stimuli(9);
        
        modelSequence = [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2];

    end

    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Setup: directory management
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %% directory management
    progPath = fileparts(which(mfilename)); % The program directory
    cd(progPath) % go there just in case we are far away
    addpath(genpath(progPath)); % add the folder and subfolders to path

    % if there's no results directory, create one
    if exist([progPath, '\results\'], 'dir') == 0
        mkdir('results');
    end

    if exist([progPath, '\results\__paperFigures'], 'dir') == 0
        cd('./results')
        mkdir('__paperFigures');
        cd(progPath)
    end

    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Loop through conditions to get results
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % model outputs
    conds = length(stimSequence);
    decisions = cell(1,conds);
    avgModelDecisions = zeros(1,conds);
    stdemModelDecisions = zeros(1,conds);  % will be zero since we run the model only once. but we'll need it for plotting later on.
    successSum = 0;

    for cond = 1:conds

        decisions{cond} = zeros(1,nTrials);

        for n = 1:nTrials
            [decisions{cond}(n), success, ~] = runTrial(1, stimSequence{cond}, dt, readoutTime, modelSequence(cond), tauIntegrate, wongWang_gain, wongWang_sigma, wongWang_mu0);
            successSum = successSum + success;
        end
        avgModelDecisions(cond) = mean(decisions{cond})*100;

    end

    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Plot and save
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    figure(1)
    ctrs = 1:conds;
    hBar = bar(ctrs, [data;avgModelDecisions]');
    ctr = [];
    ydt = [];
    for k1 = 1:size([data;avgModelDecisions]',2)
        ctr(k1,:) = bsxfun(@plus, hBar(1).XData, [hBar(k1).XOffset]');
        ydt(k1,:) = hBar(k1).YData;
    end
    hold on
    errorbar(ctr, ydt, [stdem;stdemModelDecisions], '.k')
    hold off
    title(dataType,'Interpreter','none')
    xlabel('condition')
    ylabel('Dominance %')
    ylim([0, 100])
    legend('humans', 'model')
    saveas(gcf,[progPath, '\results\__paperFigures\', exptName, '_fig.png'])
    save([progPath, '\results\__paperFigures\', exptName, '_data'], 'avgModelDecisions')

end