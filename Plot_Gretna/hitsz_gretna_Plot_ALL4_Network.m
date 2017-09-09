
% 读取网络参数图，画出所有的4个network图，标注上各自的属性
% 运行时需要配合hitsz_gretna_4PlotNetwork函数。输出统计网络参数统计分析图并自动保存在当前路径下
% 2016-11-06(update 2017-04-04 by Challen)

% 所要自动分类的文件路径里选取任意文件
clc
clear
%选择受试分组数
num_G=4;

%分别确定G1与G2的Network Analysis网络参数txt的文件位置
pathname_G1 = 'H:\result135\nc';
pathname_G3 = 'H:\result135\scd';
pathname_G2 = 'H:\result135\amci';
pathname_G4 = 'H:\result135\ad';


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

dirs_G3=dir([pathname_G3, '\*.txt']);
dircell_G3=struct2cell(dirs_G3)' ;
filenames_G3=dircell_G3(:,1);
file_path_G3=fullfile(pathname_G3,filenames_G3); %保存各网络参数的全路径

% 读取G3的数据       

dirs_G4=dir([pathname_G4, '\*.txt']);
dircell_G4=struct2cell(dirs_G4)' ;
filenames_G4=dircell_G4(:,1);
file_path_G4=fullfile(pathname_G4,filenames_G4); %保存各网络参数的全路径

% 读取P值数据       
% dirs_P=dir([pathname_P, '\*.txt']);
% dircell_P=struct2cell(dirs_P)' ;
% filenames_P=dircell_P(:,1);
% file_path_P=fullfile(pathname_P,filenames_P); %保存各网络参数的全路径


% 调用PlotNetwork函数画图并保存
for i=1:length(filenames_G4)
    G1=load(char(file_path_G1(i)));
    G2=load(char(file_path_G2(i)));
    G3=load(char(file_path_G3(i)));
    G4=load(char(file_path_G4(i)));
    y=hitsz_gretna_4PlotNetwork(G1,G2,G3,G4);   
    
    savename=char(filenames_G1(i));
    savename(end-3:end)=[]; % 去掉文件名中的“.txt”
    print(y, '-dpng', savename); % 保存网络参数图于当前目录
    close gcf
   
end
