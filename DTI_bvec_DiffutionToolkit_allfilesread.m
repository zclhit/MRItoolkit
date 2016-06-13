% author: Chenfei Ye upgrated by ZCL
% function: 转换目标路径下所有文件夹中的.bvec文件为Diffusion Toolkit分析的梯度byce_DT.txt
clc;
clear all;
cd 'E:\biomedical signal\AD_HKU\6Oct2014\AD&MCI';   %包含所有文件的文件夹
filename = dir ('.');                               %获取包括.（1） ..（2） 在内的所有文件夹名称
dircell = struct2cell(filename);                       %结构变化成cell
name1 = dircell(1,:);                                 %读入文件名cell格式
len = length(name1);                                  %长度为len

for i = 3:len
    %cc=int2str(i);
    c=name1(i,:);                                       %读取structure中3到最后的每个位置的cell
    cc=char(c);                                         %将这个位置的cell转变为str
    ppath=['E:\biomedical signal\AD_HKU\6Oct2014\NORMAL\' cc '\DWI_B0_1000'];   %路径字符串
cd (ppath);                                                             %进入路径
%%
num_g=33;
%%
filename=dir('*.bvec');
bvec=load(filename.name);

bvec=bvec';

temp=cell(num_g,1);
for i=0:num_g-1
    temp{i+1,1}=strcat(num2str(bvec(i+1,1),4),',',num2str(bvec(i+1,2),4),',',num2str(bvec(i+1,3),4));
end

fid=fopen('bvec_DT.txt','wt');
for i=1:num_g
	fprintf(fid,'%s\n',temp{i,1});
end
status= fclose(fid)
end