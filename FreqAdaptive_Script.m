clearvars;
home;

%% %%%%%%%%%%%%%%%%%%%%%%
% Simulation variables
Fn = 60;                    % Grid frequency
Ts_control = 1/(300*Fn);    % Sampling time of the Notch and DSC: 18kHz
Ts = Ts_control / 60;       % Step time of the simulation
zeta = 2^-0.5;   

%% Variable for this mess
FreqAdaptDSCFFT = [];

%% %%%%%%%%%%%%%%%%%%%%%%
% Update the name of the model for simulation
FreqAdaptDSCFFT.nomemodelo = 'FreqAdaptive';

%% %%%%%%%%%%%%%%%%%%%%%%
% Chose the case, (fazendo casos só por hábito)
caso = 1;

%% Cable lenghts
% made a switch just out of habit
switch (caso)
    case 1
        %  simulate for this many periods
        Ttot = 0.25*60/Fn; % seconds for now
        
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        disp(['Simulating: ',FreqAdaptDSCFFT.nomemodelo, '; Simulated time:',num2str(Ttot), ' s']);
        FreqAdaptDSCFFT.simulado = sim(FreqAdaptDSCFFT.nomemodelo, 'SimulationMode', 'accelerator');
        FreqAdaptDSCFFT.rawdata(:,:) = FreqAdaptDSCFFT.simulado.get('FreqAdaptive_Raw');
    
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
FreqAdaptDSCFFT.Ind.vd = 2;
FreqAdaptDSCFFT.Ind.vq = 3;
FreqAdaptDSCFFT.Ind.vd_r = 4;
FreqAdaptDSCFFT.Ind.vq_r = 5;
FreqAdaptDSCFFT.Ind.vd_c = 6;
FreqAdaptDSCFFT.Ind.vq_c = 7;
FreqAdaptDSCFFT.Ind.vd_f = 8;
FreqAdaptDSCFFT.Ind.vq_f = 9;
FreqAdaptDSCFFT.Ind.vd_w = 10;
FreqAdaptDSCFFT.Ind.vq_w = 11;
FreqAdaptDSCFFT.Ind.f = 12;
FreqAdaptDSCFFT.Ind.n = 13;
FreqAdaptDSCFFT.Ind.va = 14;
FreqAdaptDSCFFT.Ind.vb = 15;
FreqAdaptDSCFFT.Ind.vc = 16;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Saving data for Python matplotlib
if FreqAdaptDSCFFT.saveTXTfile == 1
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('Saving raw data');
    FreqAdaptDSCFFT.arquivo = fopen('FreqAdaptive_Raw.txt','w');
    for cnt = 1:length(FreqAdaptDSCFFT.rawdata(:,FreqAdaptDSCFFT.Ind.time))
        fprintf(FreqAdaptDSCFFT.arquivo,'%e, %e, %e, %e, %e, %e, %e, %e, %e, %e, %e, %e, %e, %e, %e, %e\n',FreqAdaptDSCFFT.rawdata(cnt, :));
    end
    fclose(FreqAdaptDSCFFT.arquivo);
end
         






