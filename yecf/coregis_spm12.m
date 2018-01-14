%-----------------------------------------------------------------------
% Chenfei Ye updated:10/16/2016 
% function coregis_spm12(dir_ref,dir_source,dir_other) can run
% intra-subject coregsitering based on SPM12
% Input: 
% dir_ref: reference image directory
% dir_source: source image directory
% dir_other: other image dicrectory
% This function will generate the coregistered images 
% The default parameters is using normalized mutual information, 12-parametric transformation and trilinear interpolation
% Below are formats of some variables.
% jobs{1}.spm.spatial.coreg.estwrite.ref = {'D:\Subjects\0339350_118_LAUEAR\0339350_118_LAUEAR_150914\scans\301-MPRAGE\oWIPMPRAGESENSE.nii,1'};
% jobs{1}.spm.spatial.coreg.estwrite.source = {'D:\Subjects\0339350_118_LAUEAR\0339350_118_LAUEAR_150914\scans\1201-Skinny_T2AX\WIPSkinnyT2AXSENSEA.nii,1'};
% jobs{1}.spm.spatial.coreg.estwrite.other = {'D:\Subjects\0339350_118_LAUEAR\0339350_118_LAUEAR_150914\scans\1201-Skinny_T2AX\resources\DICOM\files\T2_map.nii,1'};
%-----------------------------------------------------------------------
function coregis_spm12(dir_ref,dir_source,dir_other)
spm_get_defaults;
global defaults
spm_jobman('initcfg');
%% using default parameters in SPM12
jobs{1}.spm.spatial.coreg.estwrite.ref =dir_ref;
jobs{1}.spm.spatial.coreg.estwrite.source =dir_source;
jobs{1}.spm.spatial.coreg.estwrite.other =dir_other;
jobs{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
jobs{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
jobs{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
jobs{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
jobs{1}.spm.spatial.coreg.estwrite.roptions.interp = 1;
jobs{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
jobs{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
jobs{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';

spm_jobman('run',jobs);
clear jobs