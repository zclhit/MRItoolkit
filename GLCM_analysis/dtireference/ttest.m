tvalue = zeros(28,22);
mark = zeros(28,22);
destination1=strcat('I:\Data\graymatrixdata\ana_less.xlsx');
destination2=strcat('I:\Data\graymatrixdata\ana_mark.xlsx');
for j = 1:4;
    for i = 1:28;
    
        clc;
%         clearvars -except i j;
       
        load('I:\Data\codes\roi_name');

        roi_load=char(roi_name(i));          %当前ROI的名称
        
        source = strcat('I:\Data\graymatrixdata\Bi_ana\',roi_load,'.xlsx');     %读取目标excel文件
       
        sheet = j+1;
        [num,txt,raw] = xlsread(source,sheet);
        total = num;
        for m = 1:22;
            if num(2*m-1,2) > 0.05
                tvalue(i,m) = total(2*m-1,5);
            else
                tvalue(i,m) = total(2*m,5);
            end
        end
        
        for n = 1:22;
            if tvalue(i,n) >0.05
                mark(i,n) = 100;
            elseif tvalue(i,n) <=0.05 && tvalue(i,n) > 0.01
                mark(i,n) = 50;
            else
                mark(i,n) = 0;
            end
        end
        
    end
    ans_Range = 'B2:W29';
    xlswrite(destination1,tvalue,j,ans_Range);
    xlswrite(destination2,mark,j,ans_Range);
    system('tskill excel');
end
   