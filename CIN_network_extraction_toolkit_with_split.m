%Name:CIN_network_extraction_toolkit(with split)
%Function:Extraction CIN(lable 31:36 in AAL 90 atlas set)to show the
%construction
%Author :Changle Zhang e-mail:zhangchanglehit@163.com
clc;clear all;close all;
path='E:\PKU_PSD\JMRI\output_PSD\Network';
cd (path);            %进入存储目录，后期可以根据需要修改0000i以及确定不确定等

dirs=dir;
dircell=struct2cell(dirs)';
filenames=dircell(3:18,1);
%FA=load ('00001_dti_FACT_35_02_1_0_Matrix_FA_AAL_Contract_90_2MM_90.txt'); %打开FA
%FA=load ('00001_dti_FACT_35_02_1_0_Matrix_FN_AAL_Contract_90_2MM_90.txt');
%%打开FN
% num=1;
for num=1:16
    FA=load(char(filenames(num)));
    savename=['split_' char(filenames(num))];
    %%打开Length
    %Upper_Left
    for i=1:30
        for j=1:30
            FA(i,j)=0;
        end
    end
    %Upper_Right
    for i = 1:30
        for j = 37:90
            FA(i,j)=0;
        end
    end
    %Lower_Left
    for i=37:90
        for j=1:30
            FA(i,j)=0;
        end
    end
    %Lower_Right
    for i=37:90
        for j=37:90
            FA(i,j)=0;
        end
    end
    rols=zeros(90,1);
    for j=1:90
        rols(j)=sum(FA(j,:));
    end
    number=0;
    for k=1:90
        if rols(k)==0
            FA(:,k-number)=[];
            FA(k-number,:)=[];
            number=number+1;
        end
    end
    
    
    
    save(savename,'FA','-ascii');                       %进行保存
    
end