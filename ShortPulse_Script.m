clearvars;
home;
%close all;


%% %%%%%%%%%%%%%%%%%%%%%%
% Simulation variables
Fn = 60;                    % Grid frequency
Ts_control = 1/(300*Fn);    % Sampling time of the Notch and DSC: 18kHz
Ts = Ts_control / 60;       % Step time of the simulation
zeta = 2^-0.5;              % damping of the notch filters


%% A variable just to gather things
Bench = [];

%% %%%%%%%%%%%%%%%%%%%%%%
% Update the name of the model for simulation
Bench.nomemodelo = 'ShortPulse';


%% %%%%%%%%%%%%%%%%%%%%%%
% Chose the case, (fazendo casos só por hábito)
caso = 1;


%% Cable lenghts
% made a switch just out of habit
switch (caso)
    case 1
        %  simulate for this many periods
        Ttot = 10*60/Fn; % 5 seconds for now
        
        %Bench.StepTimes = [0 0.025/PCC.Fn];
        Bench.StepTimes = [0 7*Ts_control];
        Bench.StepValues = [1 0];
        
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        disp(['Simulating: ',Bench.nomemodelo, '; Simulated time:',num2str(Ttot), ' s']);
        Bench.simulado = sim(Bench.nomemodelo, 'SimulationMode', 'accelerator');
        Bench.rawdata(:,:) = Bench.simulado.get('ShortPulse_Raw');
    
        Bench.saveTXTfile = 1;
    
    otherwise
        Ttot = 1/Fn;
        
        %Bench.StepTimes = [0 SIMU.Ts];
        Bench.StepTimes = [0 1/Fn];
        Bench.StepValues = [1 0];
        
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        disp('%% no simulation case chosen %%%%%%%%%%');
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        
        return
end


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Saving data for Python matplotlib
if Bench.saveTXTfile == 1
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('Saving raw data');
    Bench.arquivo = fopen('ShortPulse_Raw.txt','w');
    for cnt = 1:length(Bench.rawdata(:,1))
        fprintf(Bench.arquivo,'%e, %e, %e, %e, %e, %e, %e, %e, %e, %e\n',Bench.rawdata(cnt, :));
    end
    fclose(Bench.arquivo);
end
         






