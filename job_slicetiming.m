function [matlabbatch] = job_slicetiming(b)
%Specify parameters
file_filter = '^g.*nii';%raw NIFTI files
nslices = 27;
TR = 2;
TA = TR-(TR/nslices);
slice_order = [1:2:27 2:2:27];
refslice = 2;
prefix = 'a';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File selector -- adding new sessions for each BOLD run
%%Run dir
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

matlabbatch{13}.spm.temporal.st.scans{1}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{2}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{3}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{4}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{5}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{6}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{7}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{8}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{9}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{10}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{11}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{11}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{13}.spm.temporal.st.scans{12}(1) = cfg_dep(['File Selector (Batch Mode): Selected Files (',file_filter,')'], substruct('.','val', '{}',{12}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
%%
%%Slice timing correction param
matlabbatch{13}.spm.temporal.st.nslices = nslices;
matlabbatch{13}.spm.temporal.st.tr = TR;
matlabbatch{13}.spm.temporal.st.ta = TA;
matlabbatch{13}.spm.temporal.st.so = slice_order;
matlabbatch{13}.spm.temporal.st.refslice = refslice;
matlabbatch{13}.spm.temporal.st.prefix = prefix;

spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end
