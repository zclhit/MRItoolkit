% 2016/4/18
% author: Changle Zhang
% funtion:sort the data of standard_space change【line 9 line 20 line 80】

clc
clear all;
close all;

pathname='E:\PKU_PSD\output_NC';           %^^change this to make analysis among NC or PSD/or AD
cd(pathname);
% cd('AllAtlasResults');
% load 'WMtractResults_FA.xls';
% cd(pathname);
dirs=dir;
dircell=struct2cell(dirs)';
filenames=dircell(:,1);
savename='MeanFA';%name of save folder
mkdir(savename);
FAcounter=zeros(90,90);
for i=3:14                      %3-14(NC)or3-18(PSD)depends on the number of folders^^change this to choice
    cd(char(filenames(i)));
    cd('Network');
    cd('Deterministic');
    %dirrs=dir([ , '*.WMtract']);%WMtract file at this standard space
    dirrs=dir([ , '*.txt']);%txt file at this standard space
    dirrcell=struct2cell(dirrs)';
    files=dirrcell(:,1);
    for j=1:length(files)
        ind=strfind(files(j),'FA_AAL');         %^^change this to make a selection
        if isempty(ind{1})==0               %test if it is FA
            FA=load(char(files(j)));
            FAcounter=FAcounter+FA/16;       %^^change this according to number of files
            end
    end
         cd(pathname);               %back to main path
end
%threshold value = 0.15

for m=1:90
    for n=1:90
        if FAcounter(m,n)<=0.15
            FAcounter(m,n)=0;
        end
    end
end
%higher left
for m=1:30
    for n=1:30
        FAcounter(m,n)=0;
    end
end
%lower left
for m=37:90
    for n=1:30
        FAcounter(m,n)=0;
    end
end
%higher right
for m=1:30
    for n=37:90
        FAcounter(m,n)=0;
    end
end
%lower right
for m=37:90
    for n=37:90
        FAcounter(m,n)=0;
    end
end
%构造掩膜板
model=zeros(90,90);
for x=1:90
    for y=1:90
        if FAcounter(x,y)>0
            model(x,y)=1;
        end
    end
end
pathname='E:\PKU_PSD\output_PSD';           %^^change this to make analysis among NC or PSD/or AD
cd(pathname);
dirs=dir;
dircell=struct2cell(dirs)';
filenames=dircell(:,1);
%掩膜板处理每个矩阵
for i=3:18                      %3-14(NC)or3-18(PSD)depends on the number of folders^^change this to choice
    sumrow=zeros(1,90);
    sumcol=zeros(1,90);
    cd(char(filenames(i)));
    cd('Network');
    cd('Deterministic');
    %dirrs=dir([ , '*.WMtract']);%WMtract file at this standard space
    dirrs=dir([ , '*.txt']);%txt file at this standard space
    dirrcell=struct2cell(dirrs)';
    files=dirrcell(:,1);
    for j=1:length(files)
        ind=strfind(files(j),'FA_AAL');         %^^change this to make a selection
        if isempty(ind{1})==0               %test if it is FA
            RMZ=load(char(files(j)));
            RMZ=RMZ.*model;                 %加模板处理后得到RMZ
        end
    end
    for s=1:90
        sumrow(s)=sum(model(s,:));
        sumcol(s)=sum(model(:,s));
    end
    row1=90-sum(sumcol(:)==0);
    col1=90-sum(sumrow(:)==0);
    OPT1=zeros(90,col1);%输出矩阵暂存矩阵1
    OPT2=zeros(row1,col1);
    counter1=1;
    counter2=1;
    %去除多余的列
    for c=1:90
        if sumcol(c)>0
            OPT1(:,counter1)=RMZ(:,c);
            counter1=counter1+1;
        end
    end
    %去除多余的行
    for r=1:90
        if sumrow(r)>0
            OPT2(counter2,:)=OPT1(r,:);
            counter2=counter2+1;
        end
    end
    
    
%    for q=1:6
%      OPT(:,q)=RMZ(:,30+q);
%    end
     optname=strcat(char(filenames(i)),'FA_full.txt');
%     
     cd(pathname);               %back to main path
     save (optname,'OPT2','-ascii');
end
% for i=1:6
%     RMZ(:,i)=FAcounter(:,30+i);
% end

% cd (savename);
% save MeanFA_90_6.txt FAcounter -ascii
%xlswrite('MeanFA',FAWMtractcount); %^^change this to make the xls's name