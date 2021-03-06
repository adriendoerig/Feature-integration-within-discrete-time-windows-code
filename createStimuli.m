% Written By Adrien Doerig at the Laboratory of Psychophysics, EPFL, 2019

function [ stimuli ] = createStimuli( dt, stimType )
%CREATESTIMULI returns a cell of cells containing stimuli from the family
%stimType (see human data excel sheet). 
%   elementDuration is the duration of one "element" (e.g. a vernier) [s]
%   isiDuration is the duration of inter-element interval [s]
%   dt is the timeStep of your simulation
%   stimType is 'E4', 'E8' or 'E18'

if contains(stimType, 'E4')

    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt);
    longISI = zeros(1,1.5*isiDuration/dt);
    vernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    antivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 10;
    stimuli = cell(1,nStimuli);
    stimuli{1}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4)]; % V alone
    stimuli{2}  = [{grating}, {longISI}, {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % AV1
    stimuli{3}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,1), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,2)]; % AV2
    stimuli{4}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % AV3
    stimuli{5}  = [{vernier}, {longISI}, {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VAV1
    stimuli{6}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,1), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,2)]; % VAV2
    stimuli{7}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VAV3
    stimuli{8}  = [{vernier}, {longISI}, {vernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VPV1
    stimuli{9}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,1), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,2)]; % VPV2
    stimuli{10} = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VPV3

elseif contains(stimType, 'E8')

    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt); % between elements, 20ms (except after first vernier)
    longISI = zeros(1,1.5*isiDuration/dt); %after 1st Vernier, 30ms
    vernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    antivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 10;
    stimuli = cell(1,nStimuli);
    stimuli{1}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,8)]; % V alone
    stimuli{2}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,5)]; % AV3
    stimuli{3}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,4), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % AV5
    stimuli{4}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % AV7
    stimuli{5}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,5)]; % VAV3
    stimuli{6}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VAV5
    stimuli{7}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VAV7
    stimuli{8}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,5)]; % VPV3
    stimuli{9}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VPV5
    stimuli{10} = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VPV7

elseif contains(stimType, 'E18')
    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt);
    longISI = zeros(1,1.5*isiDuration/dt);
    vernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    antivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 10;
    stimuli = cell(1,nStimuli);
    stimuli{1}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,18)]; % V alone
    stimuli{2}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,11)]; % AV7
    stimuli{3}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,10), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,7)]; % AV11
    stimuli{4}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,13), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,4)]; % AV14
    stimuli{5}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,11)]; % VAV7
    stimuli{6}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,10), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,7)]; % VAV11
    stimuli{7}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,13), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,4)]; % VAV14
    stimuli{8}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,11)]; % VPV7
    stimuli{9}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,10), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,7)]; % VPV11
    stimuli{10} = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,13), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,4)]; % VPV14

elseif contains(stimType, 'All')  % all stimuli in expt1 (mandatory integration expt)
    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt);
    longISI = zeros(1,1.5*isiDuration/dt);
    vernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    antivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 28;
    stimuli = cell(1,nStimuli);
    stimuli{1}   = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4)]; % V alone
    stimuli{2}   = [{grating}, {longISI}, {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % AV1 E4
    stimuli{3}   = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,1), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,2)]; % AV2 E4
    stimuli{4}   = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % AV3 E4
    stimuli{5}   = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,5)]; % AV3 E8
    stimuli{6}   = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,4), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % AV5 E8
    stimuli{7}   = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % AV7 E8
    stimuli{8}   = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,11)]; % AV7 E18
    stimuli{9}   = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,10), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,7)]; % AV11 E18
    stimuli{10}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,13), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,4)]; % AV14 E18
    stimuli{11}  = [{vernier}, {longISI}, {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VAV1 E4
    stimuli{12}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,1), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,2)]; % VAV2 E4
    stimuli{13}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VAV3 E4
    stimuli{14}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,5)]; % VAV3 E8
    stimuli{15}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VAV5 E8
    stimuli{16}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VAV7 E8
    stimuli{17}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,11)]; % VAV7 E18
    stimuli{18}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,10), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,7)]; % VAV11 E18
    stimuli{19}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,13), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,4)]; % VAV14 E18
    stimuli{20}  = [{vernier}, {longISI}, {vernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VPV1 E4
    stimuli{21}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,1), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,2)]; % VPV2 E4
    stimuli{22}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VPV3 E4
    stimuli{23}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,2), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,5)]; % VPV3 E8
    stimuli{24}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,3)]; % VPV5 E8
    stimuli{25}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % VPV7 E8
    stimuli{26}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,6), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,11)]; % VPV7 E18
    stimuli{27}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,10), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,7)]; % VPV11 E18
    stimuli{28}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,13), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,4)]; % VPV14 E18

elseif contains(stimType, 'Expt2a')
    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt);
    longISI = zeros(1,1.5*isiDuration/dt);
    vernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    antivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 6;
    stimuli = cell(1,nStimuli);
    stimuli{1}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,18)]; % V alone
    stimuli{2}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,7), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,10)]; % AV8
    stimuli{3}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,11), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,6)]; % AV12
    stimuli{4}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,7), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,10)]; % VAV8
    stimuli{5}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,11), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,6)]; % VAV12
    stimuli{6}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,7), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,6)]; % VAV8PV12

elseif contains(stimType, 'Expt2b')
    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt);
    longISI = zeros(1,1.5*isiDuration/dt);
    vernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    antivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 4;
    stimuli = cell(1,nStimuli);
    stimuli{1}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,7), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,10)]; % PV8
    stimuli{2}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,11), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,6)]; % AV12
    stimuli{3}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,7), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,6)]; % PV8AV12
    stimuli{4}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,7), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {vernier}, {ISI}, repmat([{grating}, {ISI}],1,6)]; % PV8PV12

elseif contains(stimType, 'Expt3control')
    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt);
    longISI = zeros(1,1.5*isiDuration/dt);
    vernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    antivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 4;
    stimuli = cell(1,nStimuli);
    stimuli{1}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,18)]; % V
    stimuli{2}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,4), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,13)]; % AV5
    stimuli{3}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4), {antivernier}, {ISI}, repmat([{grating}, {ISI}],1,13)]; % VAV5
    stimuli{4}  = [{vernier}, {longISI}, repmat([{grating}, {ISI}],1,4), {vernier},     {ISI}, repmat([{grating}, {ISI}],1,13)]; % VPV5

elseif contains(stimType, 'Expt3')
    elementDuration = .02;
    isiDuration = .02;

    % stimulus components
    ISI = zeros(1,isiDuration/dt);
    longISI = zeros(1,1.5*isiDuration/dt);
    weakVernier = .5*ones(1,elementDuration/dt);
    strongVernier = ones(1,elementDuration/dt);
    grating = zeros(1,elementDuration/dt);
    weakAntivernier = -.5*ones(1,elementDuration/dt);
    strongAntivernier = -1*ones(1,elementDuration/dt);

    nStimuli = 9;
    stimuli = cell(1,nStimuli);
    stimuli{1}  = [{grating}, {longISI}, {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,6), {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,12)]; % PV1PV8
    stimuli{2}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,4), {strongAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,15)]; %PV5
    stimuli{3}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,11), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,6), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)];% PV12PV19
    stimuli{4}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,14), {strongVernier}, {ISI}, repmat([{grating}, {ISI}],1,5)];% PV15
    stimuli{5}  = [{grating}, {longISI}, {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {strongAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,2), {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,12)]; % PV1AV5PV8 (condition 1)
    stimuli{6}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,11), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,2), {strongVernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % AV12PV15AV19 (condition 2)
    stimuli{7}  = [{grating}, {longISI}, {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {strongAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,2), {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,6), {strongVernier}, {ISI}, repmat([{grating}, {ISI}],1,5)]; % PV1AV5PV8PV15 (condition 3)
    stimuli{8}  = [{grating}, {longISI}, repmat([{grating}, {ISI}],1,4), {strongAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,6), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,2), {strongVernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % AV5AV12PV15AV19 (condition 4)
    stimuli{9}  = [{grating}, {longISI}, {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {strongAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,2), {weakVernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,2), {strongVernier}, {ISI}, repmat([{grating}, {ISI}],1,3), {weakAntivernier}, {ISI}, repmat([{grating}, {ISI}],1,1)]; % PV1AV5PV8AV12PV15AV19 (condition 5) 

elseif contains(stimType, 'ruter')    
    conds = [0.004, 0.016;
             0.01,  0.01;
             0.016, 0.004;
             0.008, 0.032;
             0.02,  0.02;
             0.032, 0.008;
             0.016, 0.064;
             0.04,  0.04;
             0.064, 0.016;
             0.032, 0.128;
             0.08,  0.08;
             0.128, 0.032];

     nStimuli = size(conds,1);
     stimuli = cell(1,nStimuli);
     for i = 1:nStimuli
         stimuli{i}  = [{ones(1,conds(i,1)/dt), -1*ones(1,conds(i,2)/dt)}, {zeros(1,1/dt);}];
     end
end



