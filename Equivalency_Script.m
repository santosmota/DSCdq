clearvars;
home;


%% %%%%%%%%%%%%%%%%%%%%%%
% Simulation variables
Fn = 60;                    % Grid frequency
Ts_control = 1/(300*Fn);    % Sampling time of the Notch and DSC: 18kHz
Ts = Ts_control / 60;       % Step time of the simulation
zeta = 2^-0.5;   

%% A variable just for this mess
Bench = [];

%% %%%%%%%%%%%%%%%%%%%%%%
% Update the name of the model for simulation
Bench.nomemodelo = 'Equivalency';


%% %%%%%%%%%%%%%%%%%%%%%%
% Chose the case, (fazendo casos só por hábito)
caso = 1;


%% Cable lenghts
% made a switch just out of habit
switch (caso)
    case 1
        %  simulate for this many periods
        %SIMU.Ttot = 5*60/PCC.Fn; % 5 seconds for now
        Ttot = 2/Fn; % 5 seconds for now
        
        Bench.AmpFund = 1;
        Bench.AmpHarm = 0.1;
        
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        disp(['Simulating: ',Bench.nomemodelo, '; Simulated time:',num2str(Ttot), ' s']);
        Bench.simulado = sim(Bench.nomemodelo, 'SimulationMode', 'accelerator');
        Bench.rawdata(:,:) = Bench.simulado.get('Equivalency_Raw');
            
        Bench.saveTXTfile = 1;
         
    otherwise
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        disp('%% no simulation case chosen %%%%%%%%%%');
        disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        
        
        Bench.AmpFund = 1;
        Bench.AmpHarm = 0.1;
        SIMU.Ttot = 2/Fn; % 5 seconds for now
        return
end


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Saving data for Python matplotlib
if Bench.saveTXTfile == 1
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%');
    disp('Saving raw data');
    Bench.arquivo = fopen('Equivalency_Raw.txt','w');
    for cnt = 1:length(Bench.rawdata(:,1))
        fprintf(Bench.arquivo,'%e, %e, %e, %e, %e, %e, %e, %e\n',Bench.rawdata(cnt, :));
    end
    fclose(Bench.arquivo);
end
         






