clc;clear;
%   onsetp: output fiducial points as the beginning of each beat;
%   peakp: output fiducial points as systolic peaks;
%   dicron: output fiducial points as dicrotic notches;


cd 'F:\Our\数据拆分\peace';
dirs=dir;
dircell=struct2cell(dirs)';
filenames=dircell(:,1);
m=size(filenames);

for num=3:m(1)
    filename=char(filename);
    filename=filenames(num);    %去读文件名
    len1=lenghth(filename);
    name=filename(1:len1-4);        %保存文件名
    
    %主路径
    mainpath='F:\Our\数据拆分';
    cd (mainpath);
    
    folder=cell(1,5);
    folder{1,1}='peace';
    folder{1,2}='happy';
    folder{1,3}= 'sadness';
    folder{1,4}='fear';
    folder{1,5}='FirstBaseline';
    
    for i =1:5
        pathway=char(folder(i));
        cd (pathway);
        cd 'ppg';
        load(filename);
        cd (mainpath);
    end
    
    
    ppg5=ppg_FirstBaseline(60001:4:end);%figure;plot(ppg5);title('beseline');
    ppg1=ppg_peace(1:4:end);%figure;plot(ppg1);title('peace');
    ppg2=ppg_happy(1:4:end);%figure;plot(ppg2);title('happy');
    ppg3=ppg_sadness(1:4:end);%figure;plot(ppg3);title('sadness');
    ppg4=ppg_fear(1:4:end);%figure;plot(ppg4);title('fear');
    ppg=[ppg5 ppg1 ppg2 ppg3 ppg4];
    % figure;
    % plot(ppg5,'r');
    % hold on
    % plot(ppg1,'b');
    % hold on
    % plot(ppg2,'k');
    % hold on
    % plot(ppg3,'m');
    % hold on
    % plot(ppg4,'g');
    % hold off
    % legend('baseline','peace','happy','sadness','fear');
    
    
    
    name1_1=[name '_ppg_BLp.mat'];
    name1_2=[name '_ppg_BLp_onsetp'];
    name1_3=[name '_ppg_BLp_onsetp_v'];
    name1_4=[name '_ppg_BLp_peakp'];
    name1_5=[name '_ppg_BLp_peakp_v'];
    name1_6=[name '_ppg_BLp_dicron'];
    name1_7=[name '_ppg_BLp_dicron_v'];
    
    name2_1=[name '_ppg_Pp.mat'];
    name2_2=[name '_ppg_Pp_onsetp'];
    name2_3=[name '_ppg_Pp_onsetp_v'];
    name2_4=[name '_ppg_Pp_peakp'];
    name2_5=[name '_ppg_Pp_peakp_v'];
    name2_6=[name '_ppg_Pp_dicron'];
    name2_7=[name '_ppg_Pp_dicron_v'];
    
    name3_1=[name '_ppg_Hp.mat'];
    name3_2=[name '_ppg_Hp_onsetp'];
    name3_3=[name '_ppg_Hp_onsetp_v'];
    name3_4=[name '_ppg_Hp_peakp'];
    name3_5=[name '_ppg_Hp_peakp_v'];
    name3_6=[name '_ppg_Hp_dicron'];
    name3_7=[name '_ppg_Hp_dicron_v'];
    
    name4_1=[name '_ppg_Sp.mat'];
    name4_2=[name '_ppg_Sp_onsetp'];
    name4_3=[name '_ppg_Sp_onsetp_v'];
    name4_4=[name '_ppg_Sp_peakp'];
    name4_5=[name '_ppg_Sp_peakp_v'];
    name4_6=[name '_ppg_Sp_dicron'];
    name4_7=[name '_ppg_Sp_dicron_v'];
    
    name5_1=[name '_ppg_Fp.mat'];
    name5_2=[name '_ppg_Fp_onsetp'];
    name5_3=[name '_ppg_Fp_onsetp_v'];
    name5_4=[name '_ppg_Fp_peakp'];
    name5_5=[name '_ppg_Fp_peakp_v'];
    name5_6=[name '_ppg_Fp_dicron'];
    name5_7=[name '_ppg_Fp_dicron_v'];
    
    
    fsamp1=250;%采样频率
    fcuts1=[10 15]; %截止频率2.5，过度频带1.5-2.5Hz
    mags1=[1 0]; %低通
    devs1=[0.5 0.1];%文波起伏和阻带衰减
    [n1,Wn1,beta1,ftype1]=kaiserord(fcuts1,mags1,devs1,fsamp1);
    hh1=fir1(n1,Wn1,ftype1,kaiser(n1+1,beta1),'noscale');%得到符合要求的滤波器
    for a=1:5
        PPG1 =filtfilt(hh1,1,ppg(:,a));%滤波
        % figure;
        % plot(PPG1);
        %PPG1=ppg;
        %abpfreq=1000;
        abpsig=PPG1;
        abpfreq=fsamp1;
        [onsetp,peakp,dicron] = delineator(abpsig,abpfreq);
        for i=1:length(onsetp)
            onsetp_v(i)=PPG1(onsetp(i));
        end
        for j=1:length(peakp)
            peakp_v(j)=PPG1(peakp(j));
        end
        for k=1:length(dicron)
            dicron_v(k)=PPG1(dicron(k));
        end
        if a==1;
            eval([name1_2 '=' 'onsetp' ]);
            eval([name1_3 '=' 'onsetp_v' ]);
            eval([name1_4 '=' 'peakp' ]);
            eval([name1_5 '=' 'peakp_v' ]);
            eval([name1_6 '=' 'dicron' ]);
            eval([name1_7 '=' 'dicron_v' ]);
            save(name1_1,name1_2,name1_3,name1_4,name1_5,name1_6,name1_7);
        elseif a==2;
            eval([name2_2 '=' 'onsetp' ]);
            eval([name2_3 '=' 'onsetp_v' ]);
            eval([name2_4 '=' 'peakp' ]);
            eval([name2_5 '=' 'peakp_v' ]);
            eval([name2_6 '=' 'dicron' ]);
            eval([name2_7 '=' 'dicron_v' ]);
            save(name2_1,name2_2,name2_3,name2_4,name2_5,name2_6,name2_7);
        elseif a==3;
            eval([name3_2 '=' 'onsetp' ]);
            eval([name3_3 '=' 'onsetp_v' ]);
            eval([name3_4 '=' 'peakp' ]);
            eval([name3_5 '=' 'peakp_v' ]);
            eval([name3_6 '=' 'dicron' ]);
            eval([name3_7 '=' 'dicron_v' ]);
            save(name3_1,name3_2,name3_3,name3_4,name3_5,name3_6,name3_7);
        elseif a==4;
            eval([name4_2 '=' 'onsetp' ]);
            eval([name4_3 '=' 'onsetp_v' ]);
            eval([name4_4 '=' 'peakp' ]);
            eval([name4_5 '=' 'peakp_v' ]);
            eval([name4_6 '=' 'dicron' ]);
            eval([name4_7 '=' 'dicron_v' ]);
            save(name4_1,name4_2,name4_3,name4_4,name4_5,name4_6,name4_7);
        elseif a==5;
            eval([name5_2 '=' 'onsetp' ]);
            eval([name5_3 '=' 'onsetp_v' ]);
            eval([name5_4 '=' 'peakp' ]);
            eval([name5_5 '=' 'peakp_v' ]);
            eval([name5_6 '=' 'dicron' ]);
            eval([name5_7 '=' 'dicron_v' ]);
            save(name5_1,name5_2,name5_3,name5_4,name5_5,name5_6,name5_7);
        end
        % figure;
        % plot(PPG1);
        % hold on
        % plot(onsetp,onsetp_v,'r*');
        % hold on
        % plot(peakp,peakp_v,'b*');
        % hold on
        % plot(dicron,dicron_v,'k*');
        % hold off
        clear onsetp peakp dicron onsetp_v peakp_v dicron_v
    end
end

% figure;
% plot(ppg);
% hold on
% plot(onsetp,onsetp_v,'r*');
% hold on
% plot(peakp,peakp_v,'b*');
% hold on
% plot(dicron,dicron_v,'k*');
% hold off