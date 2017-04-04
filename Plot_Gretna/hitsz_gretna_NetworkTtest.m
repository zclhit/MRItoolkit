%% hitsz_gretna_NetworkTtest_w.m
% 脑网络参数统计分析unpaired t-test with covariates and FDR correction
% w means weighted network
% 需要用到的程序包括：gretna_TTest2.m fdr_bh.m
% Input: 
% covariates：<string> yes代表加入协变量,no代表不加入协变量
% pathname1:<string> NC网络所有参数文件txt的文件夹路径; 
% pathname2:<string> PSD网络所有参数文件txt的文件夹路径; 
% file_path_c1:<string> NC协变量文件txt路径; 
% file_path_c2:<string> PSD协变量文件txt路径;
% OutputDir:<string> P值输出路径
% 
% Output:在输出路径下生成txt的P值文件



%%
clc
clear
covariates='yes'; %yes代表加入协变量,no代表不加入协变量

%选择Network目录

pathname1='H:\JMRI\CC_subnetwork\NetWork_FA_25\Analysis_NC'; %NC网络所有参数文件txt的文件夹路径
pathname2='H:\JMRI\CC_subnetwork\NetWork_FA_25\Analysis_PSD';%PSD网络所有参数文件txt的文件夹路径

file_path_c1='H:\JMRI\CC_subnetwork\Cov_NC.txt'; %NC协变量文件txt路径
file_path_c2='H:\JMRI\CC_subnetwork\Cov_PSD.txt'; %PSD协变量文件txt路径

OutputDir='E:\ML\matlab\GRETNA_1.2.1_release'; %P值输出路径

%读取NC网络参数文件名
dirs1=dir([pathname1, '\*.txt']);
dircell1=struct2cell(dirs1)' ;
filenames1=dircell1(:,1);
file_path1=fullfile(pathname1,filenames1); %保存各网络参数的全路径
%读取PSD网络参数文件名
dirs2=dir([pathname2, '\*.txt']);
dircell2=struct2cell(dirs2)' ;
filenames2=dircell2(:,1);
file_path2=fullfile(pathname2,filenames2); %保存各网络参数的全路径



% 读取每个NC网络参数
for i=1:length(filenames1)
    tempmat=load(char(file_path1(i)));
    [R,C]=size(tempmat);
    Coef1(i)=mat2cell(tempmat,R,C);
end
% 读取每个PSD网络参数
for i=1:length(filenames2)
    tempmat=load(char(file_path2(i)));
    [R,C]=size(tempmat);
    Coef2(i)=mat2cell(tempmat,R,C);
end

cd(OutputDir);
DependentFiles={};

% 若输入协变量，则读取协变量文件
if strcmp(covariates,'yes')   
    tempmat=load(char(file_path_c1));
    Covar(1)=mat2cell(tempmat,size(tempmat,1),size(tempmat,2));
    tempmat=load(char(file_path_c2));
    Covar(2)=mat2cell(tempmat,size(tempmat,1),size(tempmat,2));
end

% 计算P值并输出
for i=1:length(filenames1)
    DependentFiles(1)=Coef1(i);
    DependentFiles(2)=Coef2(i);
    if strcmp(covariates,'yes')
        [T, P] = gretna_TTest2(DependentFiles,Covar);
    else
        [T, P] = gretna_TTest2(DependentFiles);
    end
    filestr=char(filenames1(i))
    if ~isempty(strfind(filestr,'All_Node')) %对于All_Node.txt文件的P值需要FDR校正
        [h, crit_p, adj_ci_cvrg, adj_p]=fdr_bh(P,0.05); % fdr_bh(p,q):当adj_p<q为显著
        P=adj_p;
    end
    result_P(i)=mat2cell(P,size(P,1),size(P,2));
    str_tmp=char(filenames1(i));
    result_tmp=cell2mat(result_P(i));
    save([str_tmp(1:end-4),'_P.txt'], '-ascii', 'result_tmp');
end

