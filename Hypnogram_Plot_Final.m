%% --------------------- Hypnogram Plot from the Consesus Score or Individual Score ---------------------------%%
% Author: Rig Das
% Institute: UNMC
% Project: Sleep Study
% Date: 14-Mar-2022

clear all;


D1=load('C:\Users\rdas\Downloads\Consensus_Final_Subj_2\Consensus_Final\ConSense2_UNMC1.mat'); % Provide the Full Path of Night-1 Consesus Score File.
D2=load('C:\Users\rdas\Downloads\Consensus_Final_Subj_2\Consensus_Final\ConSense2_UNMC2.mat'); % Provide the Full Path of Night-2 Consesus Score File.
D3=load('C:\Users\rdas\Downloads\Consensus_Final_Subj_2\Consensus_Final\ConSense2_UNMC3.mat'); % Provide the Full Path of Night-3 Consesus Score File.

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

[h,m,s] = hms(test_D1{1,1});
time_D1(1)=strcat(string(h),':',string(m),':', string(s), ' PM');
k=h;
AMPM=' PM';
for j=2:1:15
    k=k+1;
    time_D1(j)=strcat(string(k),':',string(m),':', string(s), AMPM);
    if k==24
        k=0;
        AMPM=' AM';
        time_D1(j)=strcat(string(0),':',string(m),':', string(s), AMPM);
    end
end

%---------Setting Properties of Subplot Graph-1---------------------------%
ax = gca; % current axes
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
ax.FontWeight = 'Bold';
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XLim = [0 1320]; % Adjust value of XLim here in order to view certain length of X Axis
ax.YLim = [0.5 5.5];
ax.XGrid= 'on';
ax.XTick=[0 120 240 360 480 600 720 840 960 1080 1200 1320 1440 1560 1680];
ax.XTickLabel= {time_D1(1),time_D1(2),time_D1(3),time_D1(4),time_D1(5),time_D1(6),time_D1(7),time_D1(8),time_D1(9),time_D1(10),time_D1(11),time_D1(12),time_D1(13),time_D1(14),time_D1(15)};
ax.YGrid='on';
ax.YTick=[0.5 1 2 3 4 5 5.5];
ax.YTickLabel={'','N3','N2','N1','REM','Wake',''};

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
[h,m,s] = hms(test_D2{1,1});
time_D2(1)=strcat(string(h),':',string(m),':', string(s), ' PM');
k=h;
AMPM=' PM';
for j=2:1:15
    k=k+1;
    time_D2(j)=strcat(string(k),':',string(m),':', string(s), AMPM);
    if k==24
        k=0;
        AMPM=' AM';
        time_D2(j)=strcat(string(0),':',string(m),':', string(s), AMPM);
    end
end

%---------Setting Properties of Subplot Graph-2---------------------------%
ax = gca; % current axes
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
ax.FontWeight = 'Bold';
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XLim = [0 1320]; % Adjust value of XLim here in order to view certain length of X Axis
ax.YLim = [0.5 5.5];
ax.XGrid= 'on';
ax.XTick=[0 120 240 360 480 600 720 840 960 1080 1200 1320 1440 1560 1680];
ax.XTickLabel= {time_D2(1),time_D2(2),time_D2(3),time_D2(4),time_D2(5),time_D2(6),time_D2(7),time_D2(8),time_D2(9),time_D2(10),time_D2(11),time_D2(12),time_D2(13),time_D2(14),time_D2(15)};
ax.YGrid='on';
ax.YTick=[0.5 1 2 3 4 5 5.5];
ax.YTickLabel={'','N3','N2','N1','REM','Wake',''};

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
[h,m,s] = hms(test_D3{1,1});
time_D3(1)=strcat(string(h),':',string(m),':', string(s), ' PM');
k=h;
AMPM=' PM';
for j=2:1:15
    k=k+1;
    time_D3(j)=strcat(string(k),':',string(m),':', string(s), AMPM);
    if k==24
        k=0;
        AMPM=' AM';
        time_D3(j)=strcat(string(0),':',string(m),':', string(s), AMPM);
    end
end

%---------Setting Properties of Subplot Graph-3---------------------------%
ax = gca; % current axes
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
ax.FontWeight = 'Bold';
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XLim = [0 1320]; % Adjust value of XLim here in order to view certain length of X Axis
ax.YLim = [0.5 5.5];
ax.XGrid= 'on';
ax.XTick=[0 120 240 360 480 600 720 840 960 1080 1200 1320 1440 1560 1680];
ax.XTickLabel= {time_D3(1),time_D3(2),time_D3(3),time_D3(4),time_D3(5),time_D3(6),time_D3(7),time_D3(8),time_D3(9),time_D3(10),time_D3(11),time_D3(12),time_D3(13),time_D3(14),time_D3(15)};
ax.YGrid='on';
ax.YTick=[0.5 1 2 3 4 5 5.5];
ax.YTickLabel={'','N3','N2','N1','REM','Wake',''};
sgtitle('UNMC Subject No. 3') % Add The subject No and the acronym of institution that acquired the data to add Title of the Figure

hold off;



