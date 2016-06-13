% 2016/4/18
% author: Changle Zhang
% funtion:sort the data of standard_space

clc
clear all;
close all;

pathname='E:\ADHKUSEGresult\NCoutputs';           %^^change this to make analysis among NC or PSD/or AD
cd(pathname);
% cd('AllAtlasResults');
% load 'WMtractResults_FA.xls';
% cd(pathname);
dirs=dir;
dircell=struct2cell(dirs)';
filenames=dircell(:,1);
savename='Network_analysis';%name of save folder
mkdir(savename);

for i=3:18                      %3-14(NC)or3-18(PSD)depends on the number of folders^^change this to choice
    cd(char(filenames(i)));
    cd('Network');
    cd('Deterministic');
    %dirrs=dir([ , '*.WMtract']);%WMtract file at this standard space
    dirrs=dir([ , '*.txt']);%txt file at this standard space
    dirrcell=struct2cell(dirrs)';
    files=dirrcell(:,1);
    FAWMtractcount(i-2,1)=filenames(i);
    for j=1:length(files)
        ind=strfind(files(j),'FN');         %^^change this to make a selection
        if isempty(ind{1})==0               %test if it is FA
            FA=load(char(files(j)));
            for k=1:20
                FAWMtractcount(i-2,k+1)=num2cell(FA(k));
            end
        end
    end
    
    
    cd(pathname);               %back to main path
end
cd (savename);
xlswrite('NC_FN_analysis',FAWMtractcount); %^^change this to make the xls's name