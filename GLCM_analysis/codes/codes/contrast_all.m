clc;
clear;

   load('D:\JHU_AD\codes\roi_name');
       for i=1:27;
            filespath=strcat('D:\JHU_AD\analysis\contrast\',roi_name(i),'\AD\');
            filenames=dir(char(filespath));
            filenames=struct2cell(filenames);
            filenames=filenames(1,3:18)';
        for j=1:17
            cur=char(filenames(j));
            im_path=strcat('D:\JHU_AD\analysis\contrast\',roi_name(i),'\NC\',cur);
            x(:,:,:,j)=imread(char(im_path));
        end
        
        png_all=[ x(:,:,:,1); x(:,:,:,2); x(:,:,:,3); x(:,:,:,4); x(:,:,:,5);x(:,:,:,6); x(:,:,:,7); x(:,:,:,8); x(:,:,:,9); x(:,:,:,10); x(:,:,:,11); x(:,:,:,12); x(:,:,:,13); x(:,:,:,14); x(:,:,:,15); x(:,:,:,16);x(:,:,:,17)];
        png_name=strcat(roi_name(i),'_NC_all.png');
        imwrite(png_all,char(png_name),'png');
    
        source=strcat('D:\JHU_AD\codes\',png_name);
        destination=strcat('D:\JHU_AD\analysis\contrast_all\');
        movefile(char(source),char(destination)); 
        
       
       end
