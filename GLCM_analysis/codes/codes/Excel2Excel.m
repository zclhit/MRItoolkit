for i = 1:28;
    for j = 1:4;
        clc;
        clearvars -except i j;
        filespath_excel='I:\Data\AD';
        filenames_excel=dir(filespath_excel);
        filenames_excel=struct2cell(filenames_excel);
        filenames_excel=filenames_excel(1,3:20)';
        %roi_name = raw1;
        peoplenum = filenames_excel(1:18,1);
        load('I:\Data\codes\roi_name');
        stat_header = load('I:\Data\codes\stat_header');
        method = load('D:\Documents\MatlabCode\dtireference\method');
        write_co = load('I:\Data\codes\write_co');

        roi_load=char(roi_name(i));          %当前ROI的名称
        destination=cell(28,1);
        source = cell(4,1);
        
        temp = method.method;
        source{j,1} = strcat('I:\Data\graymatrixdata\NC\',temp{j,1},'\',roi_load,'.xlsx');     %读取目标excel文件
        destination{i,1}=strcat('I:\Data\graymatrixdata\NC2\',temp{j,1},'\',roi_load,'.xlsx');
        header = stat_header.txt1;
        coordinate = write_co.write_co;
        xlRange = 'B2:IA19';
        
        %ans_Range = 'B2';
        for sheet = 1:22;
            aveSheet = sheet+1;
            [num,txt,raw] = xlsread(source{j,1},aveSheet,xlRange);
            %ans_Range = coordinate{sheet-1,1};
            sheetname = header{sheet};
            xlswrite(destination{i,1},num,sheetname,'B2');
            xlswrite(destination{i,1},peoplenum,aveSheet,'A2');
            for number = 1:18;
                peopletemp = nanmean(num(number,:));
                numbertemp = int2str(20+number);
                location = strcat('A',numbertemp);
                xlswrite(destination{i,1},peopletemp,aveSheet,location);
            end
        end
        
    end
    system('tskill excel');
end