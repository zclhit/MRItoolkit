1.Auto_T1_T2_DWI_selection.m 
用于自动化的从原始数据中提取出T1，T2，DWI数据并建立文件夹保存。

2.autoDWIsprlitbytime.m
没有用，一开始是想为PANDA做的

3.DiComDifferenceExam.m
是那时候和毛帅为了验证两个Dicom文件改变后的差异分析，平常用不到

4.DTI_bvec_DiffutionToolkit_allfilesread.m
用于一次性将目录下所有bvector文件转换为Diffusion Toolkit可用的格式。

5.rotate_for_trackvis.m
用于提取我们感兴趣的ROI模板信息，来加载到tracvis软件中进行特定的纤维提取。

6.SeparationByScanningDate.m
这个还能有点用处，如果我们得到的Dicom文件时不同日期获取的图像，但是却糅杂在了一起，我们便可以用这个小程序来进行按照日期的划分工作。

7.standard_space_sorting.m
用于对PANDA输出结果中的标准空间下的结果进行筛选，选出我们需要的包含特定字段（比如'FA','LDHs','LDHk'）的文件，存储到一张mat表下，并输出为xls格式。

8.Mean_FA.m
用于计算平均的FA值

9.CIN_network_extraction_toolkit.m：
Extraction CIN(lable 31:36 in AAL 90 atlas set)to show the construction
 
10.CIN_network_extraction_toolkit_with_split.m 
分割出我们需要的FA扣带回相关网络中那些非孤立点的连接关系矩阵
