%% --------------------- Hypnogram Plot from the Consesus Score or Individual Score ---------------------------%%
% Author: Rig Das
% Institute: UNMC
% Project: Sleep Study
% Date: 14-Mar-2022

clear all;


D1=load('C:\Users\rdas\Downloads\Consensus_Final_Subj_2\Consensus_Final\ConSense2_UNMC1.mat'); % Provide the Full Path of Night-1 Consesus Score File.
D2=load('C:\Users\rdas\Downloads\Consensus_Final_Subj_2\Consensus_Final\ConSense2_UNMC2.mat'); % Provide the Full Path of Night-2 Consesus Score File.
D3=load('C:\Users\rdas\Downloads\Consensus_Final_Subj_2\Consensus_Final\ConSense2_UNMC3.mat'); % Provide the Full Path of Night-3 Consesus Score File.

%%----------------- Start Time of the Night Calculation -----------------------%%
Start_N1=D1.TT.ActTime(1);
Start_N2=D2.TT.ActTime(1);
Start_N3=D3.TT.ActTime(1);
Night_Start_Time=[Start_N1 Start_N2 Start_N3];
Night_Start_Time=timeofday(Night_Start_Time);
Min_Start_Time=min(Night_Start_Time);
[h,m,s] = hms(Min_Start_Time);
Starting_Hour=h;
Starting_Hour=duration(Starting_Hour,0,0);
N1_Sub_ToHour=Night_Start_Time(1)-Starting_Hour;
[N1_h,N1_m,N1_s]=hms(N1_Sub_ToHour);
N1_Strat_Subtraction_ToHour=(120/3600*((N1_h*3600)+(N1_m*60)+N1_s));
N2_Sub_ToHour=Night_Start_Time(2)-Starting_Hour;
[N2_h,N2_m,N2_s]=hms(N2_Sub_ToHour);
N2_Strat_Subtraction_ToHour=(120/3600*((N2_h*3600)+(N2_m*60)+N2_s));
N3_Sub_ToHour=Night_Start_Time(3)-Starting_Hour;
[N3_h,N3_m,N3_s]=hms(N3_Sub_ToHour);
N3_Strat_Subtraction_ToHour=(120/3600*((N3_h*3600)+(N3_m*60)+N3_s));

%%----------------- Night-1 Sleep State Plotting -----------------------%%
for i=1:height(D1.TT)-1
    test_D1{i,1}=D1.TT.ActTime(i);
    test_D1{i,2}=D1.TT.FINALSCORE(i); % Replace 'FINALSCORE' by 'STNF' or 'UNMC' if you are using Stanford or UNMC scoring instead of Final Consensus Scoring%
    
    if strcmp(test_D1{i,2},'W')
        D1_SleepStates_with_Numbers(i,2)=5;
    elseif strcmp(test_D1{i,2},'R')
        D1_SleepStates_with_Numbers(i,2)=4;
    elseif strcmp(test_D1{i,2},'N1')
        D1_SleepStates_with_Numbers(i,2)=3;
    elseif strcmp(test_D1{i,2},'N2')
        D1_SleepStates_with_Numbers(i,2)=2;
    elseif strcmp(test_D1{i,2},'N3')
        D1_SleepStates_with_Numbers(i,2)=1;
    end
    D1_SleepStates_with_Numbers(i,1)=i;
    
end

[xb,yb] = stairs(D1_SleepStates_with_Numbers(:,1),D1_SleepStates_with_Numbers(:,2));

%----- Start of Subplot ----------------------------------------------%
figure;
subplot(3,1,1);
hold on;

stairs(D1_SleepStates_with_Numbers(:,1),D1_SleepStates_with_Numbers(:,2), ':k');
for i=1:2:height(xb)-1
    if yb(i)==5
        plot(xb(i:i+1),yb(i:i+1),'-r', 'LineWidth', 4);
    elseif yb(i)==4
        plot(xb(i:i+1),yb(i:i+1),'-m', 'LineWidth', 8);
    elseif yb(i)==3
        plot(xb(i:i+1),yb(i:i+1),'-g', 'LineWidth', 8);
    elseif yb(i)==2
        plot(xb(i:i+1),yb(i:i+1),'-b', 'LineWidth', 4);
    elseif yb(i)==1
        plot(xb(i:i+1),yb(i:i+1),'-c', 'LineWidth', 8);
    end
end
title('Night-1');

[k,~,~]=hms(Starting_Hour);
time_D1(1)=strcat(string(k),':00', ' PM');
AMPM=' PM';
for j=2:1:16
    k=k+1;    
    time_D1(j)=strcat(string(k),':00', AMPM);
    if k==24
        k=0;
        AMPM=' AM';
        time_D1(j)=strcat(string(0),':00', AMPM); 
    end
end

%---------Setting Properties of Subplot Graph-1---------------------------%
ax1 = gca; % current axes
ax1.FontName = 'Times New Roman';
ax1.FontSize = 12;
ax1.FontWeight = 'Bold';
ax1.TickDir = 'out';
ax1.TickLength = [0.02 0.02];
XLim_Hours=12; % Adjust value of XLim here by changing the XLim_Hours in order to view certain length of X Axis
ax1.XLim = [-N1_Strat_Subtraction_ToHour -N1_Strat_Subtraction_ToHour+(XLim_Hours*120)]; 
ax1.YLim = [0.5 5.5];
ax1.XGrid= 'on';
ax1.XTick=[(-N1_Strat_Subtraction_ToHour) (-N1_Strat_Subtraction_ToHour+120) (-N1_Strat_Subtraction_ToHour+240) (-N1_Strat_Subtraction_ToHour+360) (-N1_Strat_Subtraction_ToHour+480) (-N1_Strat_Subtraction_ToHour+600) (-N1_Strat_Subtraction_ToHour+720)...
      (-N1_Strat_Subtraction_ToHour+840) (-N1_Strat_Subtraction_ToHour+960) (-N1_Strat_Subtraction_ToHour+1080) (-N1_Strat_Subtraction_ToHour+1200) (-N1_Strat_Subtraction_ToHour+1320) (-N1_Strat_Subtraction_ToHour+1440) (-N1_Strat_Subtraction_ToHour+1560)...
      (-N1_Strat_Subtraction_ToHour+1680) (-N1_Strat_Subtraction_ToHour+1800)];
ax1.XTickLabel= {time_D1(1),time_D1(2),time_D1(3),time_D1(4),time_D1(5),time_D1(6),time_D1(7),time_D1(8),time_D1(9),time_D1(10),time_D1(11),time_D1(12),time_D1(13),time_D1(14),time_D1(15),time_D1(16)};
ax1.YGrid='on';
ax1.YTick=[0.5 1 2 3 4 5 5.5];
ax1.YTickLabel={'','N3','N2','N1','REM','Wake',''};

hold off;

%%----------------- Night-2 Sleep State Plotting -----------------------%%

for i=1:height(D2.TT)-1
    test_D2{i,1}=D2.TT.ActTime(i);
    test_D2{i,2}=D2.TT.FINALSCORE(i);
    
    if strcmp(test_D2{i,2},'W')
        D2_SleepStates_with_Numbers(i,2)=5;
    elseif strcmp(test_D2{i,2},'R')
        D2_SleepStates_with_Numbers(i,2)=4;
    elseif strcmp(test_D2{i,2},'N1')
        D2_SleepStates_with_Numbers(i,2)=3;
    elseif strcmp(test_D2{i,2},'N2')
        D2_SleepStates_with_Numbers(i,2)=2;
    elseif strcmp(test_D2{i,2},'N3')
        D2_SleepStates_with_Numbers(i,2)=1;
    end
    D2_SleepStates_with_Numbers(i,1)=i;
    
end

clearvars xb yb;
[xb,yb] = stairs(D2_SleepStates_with_Numbers(:,1),D2_SleepStates_with_Numbers(:,2));

subplot(3,1,2);
hold on;
stairs(D2_SleepStates_with_Numbers(:,1),D2_SleepStates_with_Numbers(:,2), ':k');
for i=1:2:height(xb)-1
    if yb(i)==5
        plot(xb(i:i+1),yb(i:i+1),'-r', 'LineWidth', 4);
    elseif yb(i)==4
        plot(xb(i:i+1),yb(i:i+1),'-m', 'LineWidth', 8);
    elseif yb(i)==3
        plot(xb(i:i+1),yb(i:i+1),'-g', 'LineWidth', 8);
    elseif yb(i)==2
        plot(xb(i:i+1),yb(i:i+1),'-b', 'LineWidth', 4);
    elseif yb(i)==1
        plot(xb(i:i+1),yb(i:i+1),'-c', 'LineWidth', 8);
    end
end
title('Night-2');

%---------Setting Properties of Subplot Graph-2---------------------------%
ax2 = gca; % current axes
ax2.FontName = 'Times New Roman';
ax2.FontSize = 12;
ax2.FontWeight = 'Bold';
ax2.TickDir = 'out';
ax2.TickLength = [0.02 0.02];
ax2.XLim = [-N2_Strat_Subtraction_ToHour -N2_Strat_Subtraction_ToHour+(XLim_Hours*120)]; 
ax2.YLim = [0.5 5.5];
ax2.XGrid= 'on';
ax2.XTick=[(-N2_Strat_Subtraction_ToHour) (-N2_Strat_Subtraction_ToHour+120) (-N2_Strat_Subtraction_ToHour+240) (-N2_Strat_Subtraction_ToHour+360) (-N2_Strat_Subtraction_ToHour+480) (-N2_Strat_Subtraction_ToHour+600) (-N2_Strat_Subtraction_ToHour+720)...
      (-N2_Strat_Subtraction_ToHour+840) (-N2_Strat_Subtraction_ToHour+960) (-N2_Strat_Subtraction_ToHour+1080) (-N2_Strat_Subtraction_ToHour+1200) (-N2_Strat_Subtraction_ToHour+1320) (-N2_Strat_Subtraction_ToHour+1440) (-N2_Strat_Subtraction_ToHour+1560)...
      (-N2_Strat_Subtraction_ToHour+1680) (-N2_Strat_Subtraction_ToHour+1800)];
ax2.XTickLabel= {time_D1(1),time_D1(2),time_D1(3),time_D1(4),time_D1(5),time_D1(6),time_D1(7),time_D1(8),time_D1(9),time_D1(10),time_D1(11),time_D1(12),time_D1(13),time_D1(14),time_D1(15),time_D1(16)};
ax2.YGrid='on';
ax2.YTick=[0.5 1 2 3 4 5 5.5];
ax2.YTickLabel={'','N3','N2','N1','REM','Wake',''};

hold off;

%%----------------- Night-3 Sleep State Plotting -----------------------%%

for i=1:height(D3.TT)-1
    test_D3{i,1}=D3.TT.ActTime(i);
    test_D3{i,2}=D3.TT.FINALSCORE(i);
    
    if strcmp(test_D3{i,2},'W')
        D3_SleepStates_with_Numbers(i,2)=5;
    elseif strcmp(test_D3{i,2},'R')
        D3_SleepStates_with_Numbers(i,2)=4;
    elseif strcmp(test_D3{i,2},'N1')
        D3_SleepStates_with_Numbers(i,2)=3;
    elseif strcmp(test_D3{i,2},'N2')
        D3_SleepStates_with_Numbers(i,2)=2;
    elseif strcmp(test_D3{i,2},'N3')
        D3_SleepStates_with_Numbers(i,2)=1;
    end
    D3_SleepStates_with_Numbers(i,1)=i;
    
end

clearvars xb yb;
[xb,yb] = stairs(D3_SleepStates_with_Numbers(:,1),D3_SleepStates_with_Numbers(:,2));

subplot(3,1,3);
hold on;
stairs(D3_SleepStates_with_Numbers(:,1),D3_SleepStates_with_Numbers(:,2), ':k');
for i=1:2:height(xb)-1
    if yb(i)==5
        plot(xb(i:i+1),yb(i:i+1),'-r', 'LineWidth', 4);
    elseif yb(i)==4
        plot(xb(i:i+1),yb(i:i+1),'-m', 'LineWidth', 8);
    elseif yb(i)==3
        plot(xb(i:i+1),yb(i:i+1),'-g', 'LineWidth', 8);
    elseif yb(i)==2
        plot(xb(i:i+1),yb(i:i+1),'-b', 'LineWidth', 4);
    elseif yb(i)==1
        plot(xb(i:i+1),yb(i:i+1),'-c', 'LineWidth', 8);
    end
end
title('Night-3');

%---------Setting Properties of Subplot Graph-3---------------------------%
ax3 = gca; % current axes
ax3.FontName = 'Times New Roman';
ax3.FontSize = 12;
ax3.FontWeight = 'Bold';
ax3.TickDir = 'out';
ax3.TickLength = [0.02 0.02];
ax3.XLim = [-N3_Strat_Subtraction_ToHour -N3_Strat_Subtraction_ToHour+(XLim_Hours*120)]; % Adjust value of XLim here in order to view certain length of X Axis
ax3.YLim = [0.5 5.5];
ax3.XGrid= 'on';
ax3.XTick=[(-N3_Strat_Subtraction_ToHour) (-N3_Strat_Subtraction_ToHour+120) (-N3_Strat_Subtraction_ToHour+240) (-N3_Strat_Subtraction_ToHour+360) (-N3_Strat_Subtraction_ToHour+480) (-N3_Strat_Subtraction_ToHour+600) (-N3_Strat_Subtraction_ToHour+720)...
      (-N3_Strat_Subtraction_ToHour+840) (-N3_Strat_Subtraction_ToHour+960) (-N3_Strat_Subtraction_ToHour+1080) (-N3_Strat_Subtraction_ToHour+1200) (-N3_Strat_Subtraction_ToHour+1320) (-N3_Strat_Subtraction_ToHour+1440) (-N3_Strat_Subtraction_ToHour+1560)...
      (-N3_Strat_Subtraction_ToHour+1680) (-N3_Strat_Subtraction_ToHour+1800)];
ax3.XTickLabel= {time_D1(1),time_D1(2),time_D1(3),time_D1(4),time_D1(5),time_D1(6),time_D1(7),time_D1(8),time_D1(9),time_D1(10),time_D1(11),time_D1(12),time_D1(13),time_D1(14),time_D1(15),time_D1(16)};
ax3.YGrid='on';
ax3.YTick=[0.5 1 2 3 4 5 5.5];
ax3.YTickLabel={'','N3','N2','N1','REM','Wake',''};
sgtitle('UNMC Subject No. 2') % Change the Subject Name Here
hold off;

%-----------End of Program------------------------------------------------%

