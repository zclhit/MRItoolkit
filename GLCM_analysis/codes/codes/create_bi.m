% 创建28个ROI的excel
for e_num = 1:28;
    clc;
    clearvars -except e_num;
    
    load('I:\Data\codes\roi_name');
    ans_set=load('I:\Data\codes\ans_set'); 
    stat_header = load('D:\Documents\MatlabCode\dtireference\header');
    method = load('D:\Documents\MatlabCode\dtireference\method');
%     filespath_excel='K:\Data\JHU_AD\graymatrixdata\NC';
%     filenames_excel=dir(filespath_excel);
%     filenames_excel=struct2cell(filenames_excel);
%     filenames_excel=filenames_excel(1,3:14)';
    
    roi_load=char(roi_name(e_num));          %当前ROI的名称
    destination=cell(28,1);
    
    destination{e_num,1}=strcat('I:\Data\graymatrixdata\analysis\Bi\Bi_',roi_load,'.xlsx');
    temp = method.method;
    header = (ans_set.ans_set)';
    for sheet_num = 1:4;
        sheetname = temp{sheet_num,1};
        xlswrite(destination{e_num,1},header,sheetname,'B1');
%         xlswrite(destination{e_num,1},header,sheet_num+1,'B1');
    end
    system('tskill excel');
end