%创建27个ROI的excel
for e_num = 1:28;
    clc;
    clearvars -except e_num;
    
    load('I:\Data\codes\roi_name');%加载roi_name  raw1
    stat_header = load('I:\Data\codes\stat_header');
    method = load('D:\Documents\MatlabCode\dtireference\method');
    filespath_excel='I:\Data\NC';
    filenames_excel=dir(filespath_excel);
    filenames_excel=struct2cell(filenames_excel);
    filenames_excel=filenames_excel(1,3:20)';
    %roi_name = raw1;
    roi_load=char(roi_name(e_num));          %当前ROI的名称
    destination=cell(28,1);
    
    destination{e_num,1}=strcat('I:\Data\graymatrixdata\analysis\NC\Ans_',roi_load,'.xlsx');
    temp = method.method;
    header = stat_header.txt1;
    for sheet_num = 1:4;
        sheetname = temp{sheet_num,1};
        xlswrite(destination{e_num,1},filenames_excel,sheetname,'A2');
        xlswrite(destination{e_num,1},header,sheet_num+1,'B1');
    end
    system('tskill excel');
end


for i = 1:27;
    for j = 1:4;
        clc;
        clearvars -except i j;

        load('I:\Data\codes\roi_name');
        stat_header = load('I:\Data\codes\stat_header');
        method = load('D:\Documents\MatlabCode\dtireference\method');
        write_co = load('I:\Data\codes\write_co');

        roi_load=char(roi_name(i));          %当前ROI的名称
        destination=cell(28,1);
        source = cell(4,1);
        
        temp = method.method;
        source{j,1} = strcat('K:\Data\JHU_AD\graymatrixdata\analysis\AD\',temp{j,1},'\',roi_load,'.xlsx');     %读取目标excel文件
        destination{i,1}=strcat('K:\Data\JHU_AD\graymatrixdata\analysis2\AD\Ans_',roi_load,'.xlsx');
        
        coordinate = write_co.write_co;
        xlRange = 'A21:A40';
        aveSheet = j+1;
        for sheet = 2:23;
            [num,txt,raw] = xlsread(source{j,1},sheet,xlRange);
            ans_Range = coordinate{sheet-1,1};
            xlswrite(destination{i,1},num,aveSheet,ans_Range);
        end
        
    end
    system('tskill excel');
end