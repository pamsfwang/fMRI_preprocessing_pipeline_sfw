clear all;
clc

% get and set paths
scriptdir = '/Volumes/group/awagner/sfwang/SPM_preprocessing';
diarydir = [scriptdir,'/notes_diary/'];
addpath(genpath('/Volumes/Macintosh HD/Users/Pamsfwang/Documents/MATLAB/spm12/'))
addpath(genpath(scriptdir)); % add any necessary paths (e.g., to initialize_vars)

% Specify variables
subjects = {'vr02' 'vr03' 'vr04' 'vr05' 'vr06' 'vr09' 'vr10' 'vr11' 'vr14' 'vr16' 'vr17' 'vr21' 'vr22' 'vr23' 'vr27'};
directory = 'sni';%this is setting up directory for working on local matchine. Check ini
diary_fname = [diarydir,'preproc_ART_exclude.txt'];

batch_functions ='art_global_raw_sfw';
%'art_global_raw_sfw' 'art_slice_sfw' 'art_global' 'job_brain_mask' 'ROImask';
%% For runing art_slice
%imgFilter = '.*nii';
repairOption = 1; %detect and repair bad slices
%1.Repair Bad Slices and Write BadSliceLog ( best choice for TR > 2 sec )
%2.Median Filter All Data  ( best choice for TR = 2 sec or less )
%3.Eliminate data outside head
%4.Repair Bad Slices and Eliminate data outside head
%5.Median Filter All Data and Eliminate data outside head

threshold = 10; % defaults is 18
%  Threshold above sample means to filter slices
%  15 is very visible on contrast image. 8 is slightly visible.
mask_flag = 1; %generate whole head mask yes:1, no:0
mask_name = 'temporary_whole_head_mask.nii';%mask should live in the dir of each functional run

%% FOr running art_global_sfw_zscore_thre
%Auto or GUI collect files
GUI = 0; %0==auto, 1==GUI
%Define zscore threshold
zscore_threshold = 3;
per_thresh = 0;
GoRepair=1; % repair volumes =1 (yes), 2 (deweighted), 0 (no)
art_global_sfw_zscore_thre_name='_art_global_3SD_threshold2.jpg';

%% For generating ROI masks
rawROImask = '_ROImasks.nii'; %name of traced ROImasks
co_ref_fname = 'reorient_inp.nii';%inplane
co_source_fname = 'reorient_cor.nii'; %anat coronal
res_ref_fname = 'vrag_func_img.nii';

%%%Probability threshold for creating binary masks
threshold = 0.6;
%%%Names for ROI masks
ROIs = {'rBi_CA1' 'rBi_CA3DG' 'rBi_CA3DG_ant' 'rBi_CA3DG_post' 'rBi_ERC' 'rBi_Hipp'...
                    'rBi_PRC' 'rBi_PHC' 'rBi_Sub' 'rL_CA1' 'rL_CA3DG' 'rL_CADG_ant' 'rL_CADG_post' 'rL_ERC'...
                    'rL_Hipp' 'rL_PHC' 'rL_PRC' 'rL_Sub' 'rR_CA1' 'rR_CA3DG' 'rR_CADG_ant' ...
                    'rR_CADG_post' 'rR_ERC' 'rR_Hipp' 'rR_PHC' 'rR_PRC' 'rR_Sub'};

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialize error log
errorlog = {}; ctr=1;

%diary(diary_fname)

%for m= 4%2:length(batch_functions)
fprintf('\nFunction: %s\n',batch_functions);

% loop over subjects
for i=1:length(subjects)
    fprintf('\nWorking on %s...\n',subjects{i});
    
    % get subject-specific variables
    b = initialize_vars(subjects,i,directory);
    
    % move to subject data folder
    cd(b.dataDir);
    
    %run batch_functions
    try
        fprintf('\n Data dir %s \n',b.dataDir)
        
        
        switch batch_functions
            
            case 'art_global_raw_sfw'
                %% art_global_raw_sfw
                %1. coarse motion estimate
                %2. detect potential bad volumes (global signal)
                %3. save a figure to displace
                
                art_global_raw_sfw(b);
                %eval(strcat(batch_functions{m},'(b)'));
                close all
                
            case 'art_slice_sfw'
            %% art_slice_sfw
            %1. remove non-funcitonal images
            %2. create coarse whole head mask for each run
            %3. correct for bad slices and generate bad slice log
                
                for irun = 1:length(b.funcRuns)
                    fprintf('\t %s\n',b.funcRuns{irun})
                    cd([b.dataDir b.funcRuns{irun}])
                    %%Remove non functional images generated in visual
                    %%inspection step
                    maskfname = dir('A*.nii');%Artifact mask
                    temporary_mean = dir('t*.nii');%temporary mean
                    mean_fname = dir('m*.nii');%mean
                    
                    if size(maskfname,1)==1
                        fprintf('\t\t Delete non-functional img: %s \n',maskfname.name)
                        delete(maskfname.name)
                    end
                    
                    if size(temporary_mean,1)==1
                        fprintf('\t\t Delete non-functional img: %s \n',temporary_mean.name)
                        delete(temporary_mean.name)
                    end
                    
                    if size(mean_fname,1)==1
                        fprintf('\t\t Delete non-functional img: %s \n',mean_fname.name)
                        delete(mean_fname.name)
                    end
                    
                    %%Generate whole head mask
                    if mask_flag ==1
                        fprintf('\n Generate a whole head mask \n')
                        Pname = spm_select('FPList',[b.dataDir b.funcRuns{irun}],'.*nii');
                        imgFile = [Pname(1,:),',1'];
                        job_whole_head_mask(imgFile,mask_name);
                        
                        %remove c# .nii files
                        ctemp = dir('c*.nii');
                        delete(ctemp.name)
                        clear Pname imgFile ctemp
                    else
                        fprintf('\n Whole head mask exists %s \n',mask_name)
                    end
                    
                    
                    temp = dir('*.nii');
                    %wild card for functional img
                    imgFilter = ['^',temp(1).name(1:3),'.*nii'];
                    fprintf('\t\t Select functional images: %s\n',imgFilter)
                    fprintf('\n Runing art_slice_sfw\n')
                    
                    art_slice_sfw([b.dataDir b.funcRuns{irun}],imgFilter,repairOption,threshold,mask_name);
                    %eval(strcat(batch_functions{m},'([b.dataDir b.funcRuns{irun}],imgFilter,repairOption,threshold,mask_name)'));
                    
                end
                
                
            case 'art_global_sfw_zscore_thre'
                %% 'art_global_sfw_zscore_thre': Identify signal outliers using zscore threshold
                %art_global_sfw_zscore_thre(zscore_thresh)
                %I only allow users to enter zscore threshold in this
                
                %script
                %1. GUI interface: select mask, functional images, and
                %motion parameters
                %2. Calculate outliers based on zscore threshold and motion
                for irun = 1:length(b.funcRuns)
                    fprintf('\t %s\n',b.funcRuns{irun})
                    cd([b.dataDir b.funcRuns{irun}])
                    [z_thresh,pers_thresh, out_idx,num_fimage]=art_global_sfw_zscore_thre(GUI,zscore_threshold,per_thresh,GoRepair);
                    s(i).perthreshold(irun)=pers_thresh;
                    s(i).outlier_time(irun)=length(out_idx);
                    s(i).num_vol(irun)=num_fimage;

                    fprintf('save figure1\n')
                    %-------Save Figure-------%
                    fig = figure(1);
                    hgexport(fig, [subjects{i},'_',b.funcRuns{irun}(1:2),art_global_sfw_zscore_thre_name], hgexport('factorystyle'), 'Format', 'jpeg');
                    
                    close all
                end
                
                %% Generate ROI masks
            case 'ROI_mask'
                
                %Step 01: separate ROI mask into individual ROI masks
                inputROIfile = [b.ROImaskDir,'/',b.curSubj,rawROImask,',1'];
                outputDir = b.ROImaskDir;
                job_ROI_mask_step01(inputROIfile,outputDir);
                
                %Step 02: coregistration and reslice
                %%coregister reference: inplane; coregister source:
                %%coronal; others: ROImasks
                co_ref = [b.ROImaskDir,'/',co_ref_fname,',1'];
                co_source = [b.ROImaskDir,'/',co_source_fname,',1'];
                %%reslice reference: a functional image
                res_ref = [b.ROImaskDir,'/',res_ref_fname,',1'];
                prefix = 'r';
                job_ROI_mask_step02_coregistration_reslice(b,co_ref,co_source,res_ref,prefix);
                
                %%Binary mask
                for iroi = 1:length(ROIs)
                    fprintf('Working on ROI: %s \n',ROIs{iroi})
                    header = spm_vol(spm_select('FPList',b.ROImaskDir,['^',ROIs{iroi},'.*nii']));
                    
                    mtr = spm_read_vols(header);
                    mtr(mtr>threshold)=1;
                    mtr(mtr<threshold)=0;
                    spm_write_vol(header,mtr);
                    
                    clear header mtr
                end

        end % end switch
        
    catch err % if there's an error, take notes & move on
        errorlog{ctr,1} = subjects{i};
        errorlog{ctr,2} = batch_functions;
        errorlog{ctr,3} = err;
        ctr = ctr + 1;
        cd(scriptdir);
        continue;
    end
    
    cd(scriptdir);
end

%end

if ~isempty(errorlog)
    disp(errorlog) % print error log at end
else
    disp('No errors detected.');
end
diary off