%从excel读入所有ROI对应区域的位置
clc;clear;
source1=strcat('I:\Data\test.xlsx');
readxlRange = 'A1:M28';
[num1,txt1,raw1] = xlsread(source1,readxlRange);
num = num1;
save num num1

% 从excel读入所有ROI的名称
% clc;clear;
% source1=strcat('I:\Data\test.xlsx');
% readxlRange = 'N1:N28';
% [num1,txt1,raw1] = xlsread(source1,readxlRange);
% roi_name = raw1;
% save roi_name roi_name

%从excel中读取要写入Ans_开头的excel的位置
% clc;clear;
% source1=strcat('I:\Data\test.xlsx');
% readxlRange = 'B32:W32';
% [num1,txt1,raw1] = xlsread(source1,readxlRange);
% write_co = txt1;
% save write_co write_co;

%从excel中读取要写入Bi_开头的excel的位置18个AD18个NC
% clc;clear;
% source1=strcat('I:\Data\test.xlsx');
% readxlRange = 'X1:X36';
% [num,txt,raw] = xlsread(source1,readxlRange);
% save txt txt;