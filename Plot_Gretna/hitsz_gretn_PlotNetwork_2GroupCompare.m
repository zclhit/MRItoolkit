
% 读取网络参数图
% 运行时需要配合hitsz_gretna_PlotNetwork函数。输出统计网络参数统计分析图并自动保存在当前路径下
% 2016-11-06

% 所要自动分类的文件路径里选取任意文件
clc
clear
%选择受试分组数
num_G=2;

%分别确定G1与G2的Network Analysis网络参数txt的文件位置
pathname_G1 = 'G:\韩璎课题组数据\SCD-NC\1SCD_network';
pathname_G2 = 'G:\韩璎课题组数据\SCD-NC\NC_network';
pathname_G3 = 'G:\韩璎课题组数据\SCD-NC\Result_path';
pathname_P='G:\韩璎课题组数据\SCD-NC\P_value';

% 读取G1的数据       
dirs_G1=dir([pathname_G1, '\*.txt']);
dircell_G1=struct2cell(dirs_G1)' ;
filenames_G1=dircell_G1(:,1);
file_path_G1=fullfile(pathname_G1,filenames_G1); %保存各网络参数的全路径

% 读取G2的数据       
dirs_G2=dir([pathname_G2, '\*.txt']);
dircell_G2=struct2cell(dirs_G2)' ;
filenames_G2=dircell_G2(:,1);
file_path_G2=fullfile(pathname_G2,filenames_G2); %保存各网络参数的全路径

% 读取G3的数据       
if num_G==3
dirs_G3=dir([pathname_G3, '\*.txt']);
dircell_G3=struct2cell(dirs_G3)' ;
filenames_G3=dircell_G3(:,1);
file_path_G3=fullfile(pathname_G3,filenames_G3); %保存各网络参数的全路径
end

% 读取P值数据       
dirs_P=dir([pathname_P, '\*.txt']);
dircell_P=struct2cell(dirs_P)' ;
filenames_P=dircell_P(:,1);
file_path_P=fullfile(pathname_P,filenames_P); %保存各网络参数的全路径


% 调用PlotNetwork函数画图并保存
for i=1:length(filenames_P)
    G1=load(char(file_path_G1(i)));
    G2=load(char(file_path_G2(i)));
    Pvalue=load(char(file_path_P(i)));
    if num_G==3
        G3=load(char(file_path_G3(i)));
        y=hitsz_gretna_PlotNetwork(Pvalue,G1,G2,G3);   
    else
    y=hitsz_gretna_PlotNetwork(Pvalue,G1,G2);   
    end
    savename=char(filenames_P(i));
    savename(end-3:end)=[]; % 去掉文件名中的“.txt”
    print(y, '-dpng', savename); % 保存网络参数图于当前目录
    close gcf
   
end
