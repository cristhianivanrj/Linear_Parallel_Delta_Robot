clc 
clear all
close all
load Data_T.txt;
Filas=size(Data_T);
BestF=int64(Data_T(:,1));
rows=(Filas(1));
k=0;
n=0;
m=0;
for i=1:100:rows
n=n+1;
m=0;
for j=i:1:(j+100)
        m=m+1;
        k=k+1;
        Best(n,m)=int64(BestF(k));          
        %  X1:  vector of x data Generation
        X1(n)=n;%Trasponer        
        %x_min=min(x); %The best function value found 
end   
BestFitness (n) = min( Best(n,:));
MeanFitness (n) = mean(Best(n,:));
end

% Create figure
figure1 = figure('InvertHardcopy','off','PaperUnits','centimeters',...
    'NumberTitle','off',...
    'Name','@gaplotbestf',...
    'Color',[1 1 1]);

% Create axes
axes1 = axes('Position',...
    [0.108171206225681 0.126598015991007 0.808223368860318 0.774228430289983],...
    'Tag','gaplotbestf');
hold(axes1,'on');

Generation=X1';

% Create multiple lines using matrix input to plot
plot1 = plot(Generation,BestFitness,'Marker','o','LineStyle','none');
set(plot1(1),'DisplayName','Best fitness','Tag','gaplotbestf',...
    'MarkerFaceColor',[0.200000002980232 0.800000011920929 0],...
    'MarkerEdgeColor',[0 1 0],...
    'Color',[0 0 0]);

plot2 = plot(Generation,MeanFitness,'Marker','o','LineStyle','none');
set(plot2(1),'DisplayName','Mean fitness','Tag','gaplotmean',...
    'MarkerFaceColor',[0.200000002980232 0.400000005960464 1],...
    'MarkerEdgeColor',[0.200000002980232 0.400000005960464 1],...
    'Color',[0 0 1]);

% Create ylabel
ylabel('Fitness value','Margin',2,'FontName','times new roman',...
    'Interpreter','none');

% Set the remaining axes properties
set(axes1,'FontName','times new roman','FontSize',16,'XGrid','on','YGrid',...
    'on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.442023347555895 0.454958678917451 0.11595330488821 0.0900826421650974],...
    'FontSize',16,...
    'EdgeColor',[0 0 0]);

% Create textbox
annotation(figure1,'textbox',...
    [0.731739299610897 0.68595041322314 0.163202334630348 0.0925619834710716],...
    'String',{'Best: 40028445','Mean: 40050829.65'},...
    'FontSize',16,...
    'FontName','times new roman',...
    'FitBoxToText','off');

       