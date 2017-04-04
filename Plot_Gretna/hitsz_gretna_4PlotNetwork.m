% 画网络参数图
% 2016-05-05
% Input:  Pvalue是后缀_P.txt;G1是Group1的网络参数txt；G2是Group2的网络参数txt；G3是Group3的网络参数txt
% Output: y是当前fig的句柄



function y=hitsz_gretna_4PlotNetwork(Pvalue,G1,G2,G3,G4)

%读取文件 (测试AUC文件)
% G1=load('H:\JMRI\output_NetworkAnalysis\G1\Results_NetworkSmallWorld\aEg.txt');
% G2=load('H:\JMRI\output_NetworkAnalysis\G2\Results_NetworkSmallWorld\aEg.txt');
% Pvalue=load('H:\JMRI\output_NetworkComp_withoutCor\NetsEg_none_P.txt');

%读取文件 (测试All_threshold文件)
% G1=load('H:\JMRI\output_NetworkAnalysis\G1\Results_NetworkSmallWorld\Cp_All_Threshold.txt');
% G2=load('H:\JMRI\output_NetworkAnalysis\G2\Results_NetworkSmallWorld\Cp_All_Threshold.txt');
% Pvalue=load('H:\JMRI\output_NetworkComp_withoutCor\Cp_All_Threshold_P.txt');

%读取文件 (测试All_Node文件)
% G1=load('H:\JMRI\output_NetworkAnalysis\G1\Results_NetworkSmallWorld\anodalCp_All_Node.txt');
% G2=load('H:\JMRI\output_NetworkAnalysis\G2\Results_NetworkSmallWorld\anodalCp_All_Node.txt');
% Pvalue=load('H:\JMRI\output_NetworkComp_withoutCor\anodalCp_All_Node_P.txt');

% 如果组别不包含有G3
if nargin==3
    meanG1=mean(G1); stdG1=std(G1);%求G1组均值与标准差
    meanG2=mean(G2);  stdG2=std(G2);%求G2组均值与标准差
    Xaxis=0.05:0.01:0.4; %阈值横坐标
    % 如果mean是单值，画棒状图；
    if length(meanG1)==1
        %画图
        errorbar(0.5,meanG1,stdG1,'rx');hold on;
        errorbar(0.6,meanG2,stdG2,'bx');hold on;
        %画P值标记
        if Pvalue <0.05
            plot(0.55,max(meanG1,meanG2)+max(stdG1,stdG2),'*','MarkerFaceColor','k');
        end
        
    else
        %如果Pvalue文件维度等于阈值坐标维度，则画阈值图
        if size(Pvalue,1)==length(Xaxis)
            plot(Xaxis,meanG1,'o-','color','r');hold on;
            plot(Xaxis,meanG2,'v-','color','b');hold on;
            legend('G1','G2');
            errorbar(Xaxis,meanG1,stdG1,'r');hold on;
            errorbar(Xaxis,meanG2,stdG2,'b');
            
            %画P值标记
            corr=zeros(1,length(Pvalue));
            full=[meanG1 meanG2];
            for i=1:length(Pvalue)
                if Pvalue(i)<0.05
                    corr(i)=min(full)-0.05;
                end
            end
            pos=find(Pvalue<0.05);
            plot(Xaxis(pos),corr(pos),'*','MarkerFaceColor','k');
            
        else %画node图
            plot(meanG1,'o-','color','r');hold on;
            plot(meanG2,'v-','color','b');hold on;
            legend('G1','G2');
            errorbar(meanG1,stdG1,'r');hold on;
            errorbar(meanG2,stdG2,'b');
            
            %画P值标记
            corr=zeros(1,length(Pvalue));
            full=[meanG1 meanG2];
            for i=1:length(Pvalue)
                if Pvalue(i)<0.05
                    corr(i)=min(full)-0.05;
                end
            end
            pos=find(Pvalue<0.05);
            plot(pos,corr(pos),'*','MarkerFaceColor','k');
        end
        
    end
% 如果包含G3
else
    meanG1=mean(G1); stdG1=std(G1);%求G1组均值与标准差
    meanG2=mean(G2);  stdG2=std(G2);%求G2组均值与标准差
    meanG3=mean(G3);  stdG3=std(G3);%求G3组均值与标准差
    meanG4=mean(G4);  stdG4=std(G4);%求G3组均值与标准差
    Xaxis=0.05:0.01:0.4; %阈值横坐标
    % 如果mean是单值，画棒状图；
    if length(meanG1)==1
        %画图
        errorbar(0.5,meanG1,stdG1,'rx');hold on;
        errorbar(0.6,meanG2,stdG2,'bx');hold on;
        errorbar(0.7,meanG3,stdG3,'gx');hold on;
        errorbar(0.7,meanG4,stdG4,'gx');hold on;
        legend('SCD','aMCI','AD','NC');
        %画P值标记
%         if Pvalue <0.05
%             plot(0.6,max([meanG1,meanG2,meanG3])+max([stdG1,stdG2,stdG3]),'*','MarkerFaceColor','k');
%         end
        
    else
        %如果Pvalue文件维度等于阈值坐标维度，则画阈值图
        if size(Pvalue,1)==length(Xaxis)
            plot(Xaxis,meanG1,'o-','color','r');hold on;
            plot(Xaxis,meanG2,'v-','color','b');hold on;
            plot(Xaxis,meanG3,'s-','color','g');hold on;
            plot(Xaxis,meanG4,'g-','color','k');hold on;
            legend('SCD','aMCI','AD','NC');
            errorbar(Xaxis,meanG1,stdG1,'r');hold on;
            errorbar(Xaxis,meanG2,stdG2,'b');hold on;
            errorbar(Xaxis,meanG3,stdG3,'g');hold on;
            errorbar(Xaxis,meanG4,stdG4,'k');hold on;
            
%             %画P值标记
%             corr=zeros(1,length(Pvalue));
%             full=[meanG1 meanG2 meanG3];
%             for i=1:length(Pvalue)
%                 if Pvalue(i)<0.05
%                     corr(i)=min(full)-0.05;
%                 end
%             end
%             pos=find(Pvalue<0.05);
%             plot(Xaxis(pos),corr(pos),'*','MarkerFaceColor','k');
            
        else %画node图
            plot(meanG1,'o-','color','r');hold on;
            plot(meanG2,'v-','color','b');hold on;
            plot(meanG3,'s-','color','g');hold on;
            plot(meanG4,'g-','color','k');hold on;
            legend('SCD','aMCI','AD','NC');
            errorbar(meanG1,stdG1,'r');hold on;
            errorbar(meanG2,stdG2,'b');hold on;
            errorbar(meanG3,stdG3,'g');hold on;
            errorbar(meanG4,stdG4,'g');hold on;
            
%             %画P值标记
%             corr=zeros(1,length(Pvalue));
%             full=[meanG1 meanG2 meanG3];
%             for i=1:length(Pvalue)
%                 if Pvalue(i)<0.05
%                     corr(i)=min(full)-0.05;
%                 end
%             end
%             pos=find(Pvalue<0.05);
%             plot(pos,corr(pos),'*','MarkerFaceColor','k');
        end
        
    end
end

% return gcf
y=gcf;
