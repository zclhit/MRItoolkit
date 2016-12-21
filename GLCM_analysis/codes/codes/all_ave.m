%write the ave & std to the excel
% ans_ave_AD = zeros(28,22);
% ans_ave_NC = zeros(28,22);

for j = 1:4;
    for i = 1:28;
        load('G:\Data\codes\roi_name.mat');
        roi_load=char(roi_name(i));          
        ans_ave_AD = 0;
        ans_ave_NC = 0;
        source=strcat('G:\Data\graymatrixdata\Bi_ave\Bi_',roi_load,'.xlsx');        
        destination =strcat('G:\Data\graymatrixdata\all_average.xlsx');
        readxlRange = 'B2:W37';
        [num1,txt1,raw1] = xlsread(source,j+1,readxlRange);
        for k = 1:22;
            ans_ave_AD = mean(num1(1:18,k));
            ans_ave_NC = mean(num1(19:36,k));
            AD_range = strcat(char(k+65),int2str(2*i));
            NC_range = strcat(char(k+65),int2str(2*i+1));
            xlswrite(destination,ans_ave_AD,j,AD_range);
            xlswrite(destination,ans_ave_NC,j,NC_range);
        end     
    end
    system('tskill excel');
end