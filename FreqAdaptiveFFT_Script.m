clearvars;
home;

%% %%%%%%%%%%%%%%%%%%%%%%
% Simulation variables
Fn = 60;                    % Grid frequency
Ts_control = 1/(300*Fn);    % Sampling time of the Notch and DSC: 18kHz
%Ts_control = 1/(150*Fn);    % Sampling time of the Notch and DSC: 18kHz
Ts = Ts_control / 60;       % Step time of the simulation
zeta = 2^-0.5;   

Ndelay = 300/4 - 0.5;
%Ndelay = 150/4-1;


%% Variable for this mess
FreqAdaptDSCFFT = [];

%% %%%%%%%%%%%%%%%%%%%%%%
% Update the name of the model for simulation
FreqAdaptDSCFFT.nomemodelo = 'FreqAdaptiveFFT';

%% %%%%%%%%%%%%%%%%%%%%%%
% Chose the case, (fazendo casos só por hábito)
caso = 1;

%% Cable lenghts
% made a switch just out of habit
switch (caso)
    case 1
        %  simulate for this many periods
        Ttot = 1/Fn; % seconds for now
        
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        disp(['Simulating: ',FreqAdaptDSCFFT.nomemodelo, '; Simulated time:',num2str(Ttot), ' s']);
        FreqAdaptDSCFFT.simulado = sim(FreqAdaptDSCFFT.nomemodelo, 'SimulationMode', 'accelerator');
        FreqAdaptDSCFFT.rawdata(:,:) = FreqAdaptDSCFFT.simulado.get('FreqAdaptiveFFT_Raw');
    
        FreqAdaptDSCFFT.saveTXTfile = 1;
    
    otherwise
        Ttot = 1/Fn;
        
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        disp('%% no simulation case chosen %%%%%%%%%%');
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        
        return
end

%% Indices
FreqAdaptDSCFFT.Ind = [];
FreqAdaptDSCFFT.Ind.time = 1;
FreqAdaptDSCFFT.Ind.x = 2;
FreqAdaptDSCFFT.Ind.yc = 3;
FreqAdaptDSCFFT.Ind.yf = 4;
FreqAdaptDSCFFT.Ind.yw = 5;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Saving data for Python matplotlib
if FreqAdaptDSCFFT.saveTXTfile == 1
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('Saving raw data');
    FreqAdaptDSCFFT.arquivo = fopen('FreqAdaptiveFFT_Raw.txt','w');
    for cnt = 1:length(FreqAdaptDSCFFT.rawdata(:,FreqAdaptDSCFFT.Ind.time))
        fprintf(FreqAdaptDSCFFT.arquivo,'%e, %e, %e, %e, %e\n',FreqAdaptDSCFFT.rawdata(cnt, :));
        disp(['Sample: ',num2str(cnt)]);
    end
    fclose(FreqAdaptDSCFFT.arquivo);
end
         






