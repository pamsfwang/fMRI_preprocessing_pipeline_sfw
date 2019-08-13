function [matlabbatch] = job_realign(b)
%Specify parameters
file_filter = '^a.*nii';%slice timing corrected files > prefix: a
quality = 1;
sep = 2;
fwhm = 3;
interpolation = 7;
prefix = 'r';


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%File selector -- select files for each BOLD run
%-----------------------------------------------------------------------
% Job saved on 22-Sep-2016 17:02:27 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6470)
%-----------------------------------------------------------------------
%% Run dir
%Change this part according to # of runs: this is where the program extract
%files from. Specify directories for runs and wildcard. Once you done it
%for one subject, you do not need to change anything here for other
%subejcts.
%Here is an example of 12 runs
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{2}]};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{3}]};
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{4}]};
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{5}]};
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{6}]};
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{7}]};
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{8}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{8}]};
matlabbatch{8}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{8}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{9}]};
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{9}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{10}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{10}]};
matlabbatch{10}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{10}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{11}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{11}]};
matlabbatch{11}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{11}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{12}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{12}]};
matlabbatch{12}.cfg_basicio.file_dir.file_ops.file_fplist.filter = file_filter;
matlabbatch{12}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';

matlabbatch{13}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{2}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{3}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{4}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{5}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{6}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{7}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{8}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{9}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{10}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{11}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{11}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.spatial.realign.estwrite.data{12}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{12}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
%%

%%Realign param
matlabbatch{13}.spm.spatial.realign.estwrite.eoptions.quality = quality;
matlabbatch{13}.spm.spatial.realign.estwrite.eoptions.sep = sep;%separation
matlabbatch{13}.spm.spatial.realign.estwrite.eoptions.fwhm = fwhm; %smoothing
matlabbatch{13}.spm.spatial.realign.estwrite.eoptions.rtm = 1;%resgister to mean
matlabbatch{13}.spm.spatial.realign.estwrite.eoptions.interp = interpolation;
matlabbatch{13}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{13}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{13}.spm.spatial.realign.estwrite.roptions.which = [2 1];%resliced images: all images + Mean image
matlabbatch{13}.spm.spatial.realign.estwrite.roptions.interp = interpolation;
matlabbatch{13}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{13}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{13}.spm.spatial.realign.estwrite.roptions.prefix = prefix;

spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end
