
for j = 1:4;
    for i = 1:14;
        load('G:\Data\codes\method.mat');
        method=char(method{j,1});          
        source =strcat('G:\Data\graymatrixdata\all_average_filter.xlsx');
        destination=strcat('G:\Data\graymatrixdata\final_data\',method,'.xlsx');        
        ans_final = zeros(28,3);
        readxlRange = 'B2:O85';
        [num1,txt1,raw1] = xlsread(source,j,readxlRange);
        temp = num1(1:84,i)';
        for k = 1:28;
            ans_final(k,1:3) = temp(3*k-2:3*k);
        end   
        xlswrite(destination,ans_final,i,'A1');
    end
    system('tskill excel');
end