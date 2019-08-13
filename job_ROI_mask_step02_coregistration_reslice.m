function [matlabbatch] = job_ROI_mask_step02_coregistration_reslice(b,co_ref,co_source,res_ref,prefix)
%-----------------------------------------------------------------------
% Job saved on 23-Oct-2016 00:08:35 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6470)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.spatial.coreg.estimate.ref = {co_ref};
matlabbatch{1}.spm.spatial.coreg.estimate.source = {co_source};
%%
matlabbatch{1}.spm.spatial.coreg.estimate.other = {
                                                   [b.ROImaskDir,'/Bi_CA1.nii,1']
                                                   [b.ROImaskDir,'/Bi_CA3DG.nii,1']
                                                   [b.ROImaskDir,'/Bi_CA3DG_ant.nii,1']
                                                   [b.ROImaskDir,'/Bi_CA3DG_post.nii,1']
                                                   [b.ROImaskDir,'/Bi_ERC.nii,1']
                                                   [b.ROImaskDir,'/Bi_PHC.nii,1']
                                                   [b.ROImaskDir,'/Bi_Hipp.nii,1']
                                                   [b.ROImaskDir,'/Bi_PRC.nii,1']
                                                   [b.ROImaskDir,'/Bi_Sub.nii,1']
                                                   [b.ROImaskDir,'/L_CA1.nii,1']
                                                   [b.ROImaskDir,'/L_CA3DG.nii,1']
                                                   [b.ROImaskDir,'/L_CADG_ant.nii,1']
                                                   [b.ROImaskDir,'/L_CADG_post.nii,1']
                                                   [b.ROImaskDir,'/L_ERC.nii,1']
                                                   [b.ROImaskDir,'/L_Hipp.nii,1']
                                                   [b.ROImaskDir,'/L_PHC.nii,1']
                                                   [b.ROImaskDir,'/L_PRC.nii,1']
                                                   [b.ROImaskDir,'/L_Sub.nii,1']
                                                   [b.ROImaskDir,'/R_CA1.nii,1']
                                                   [b.ROImaskDir,'/R_CA3DG.nii,1']
                                                   [b.ROImaskDir,'/R_CADG_ant.nii,1']
                                                   [b.ROImaskDir,'/R_CADG_post.nii,1']
                                                   [b.ROImaskDir,'/R_ERC.nii,1']
                                                   [b.ROImaskDir,'/R_Hipp.nii,1']
                                                   [b.ROImaskDir,'/R_PHC.nii,1']
                                                   [b.ROImaskDir,'/R_PRC.nii,1']
                                                   [b.ROImaskDir,'/R_Sub.nii,1']
                                                   };
%%
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{2}.spm.spatial.coreg.write.ref = {res_ref};
matlabbatch{2}.spm.spatial.coreg.write.source(1) = cfg_dep('Coregister: Estimate: Coregistered Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{2}.spm.spatial.coreg.write.roptions.interp = 4;
matlabbatch{2}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.coreg.write.roptions.mask = 0;
matlabbatch{2}.spm.spatial.coreg.write.roptions.prefix = prefix;

spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end

