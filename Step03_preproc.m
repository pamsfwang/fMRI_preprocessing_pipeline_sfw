%Step03: Slice timing correction, Motion correction
%Preprocessing batch wraper
%Shao-Fang Wang 2016
%modified from ritcheym > batch_reproc.m
%* remember to generate a project specific initialize_vars
%* remember to adjust file selector part of each batch function script

clear all;
clc

% get and set paths
scriptdir = '/Users/Pamsfwang/Desktop/VR_nims/scripts/preprocessing/spm_preproc';
diarydir = [scriptdir,'/notes_diary/'];
addpath('/Volumes/Macintosh HD/Users/Pamsfwang/Documents/MATLAB/spm12/')
addpath('/Users/Pamsfwang/Desktop/VR_nims/scripts/preprocessing/spm_preproc/'); % add any necessary paths (e.g., to initialize_vars)

% Specify variables
outLabel = 'basic_pp'; %output label
subjects = { 'vr05' 'vr06' 'vr10' 'vr21' 'vr27'};
batch_functions = {'job_slicetiming' 'job_realign'};
diary_name = ['Step03_preproc_bad_slice_removed_',date];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diary([diarydir,diary_name])
% initialize error log
errorlog = {}; ctr=1;

% loop over batch functions
for m=1:length(batch_functions)
    fprintf('\nFunction: %s\n',batch_functions{m});

    % loop over subjects
    for i=1:length(subjects)
        fprintf('\nWorking on %s...\n',subjects{i});

        % get subject-specific variables
        b = initialize_vars(subjects,i);

        % move to subject data folder
        cd(b.dataDir);
        
        %run matlabbatch job
        try
            fprintf('\n Data dir %s \n',b.dataDir)
            
            %run current job function, passing along subject-specific inputs
            batch_output = eval(strcat(batch_functions{m},'(b)'));

            %save output (e.g., matlabbatch) for future reference
            outName = strcat(outLabel,'_',date,'_',batch_functions{m});
            save(outName, 'batch_output');

        catch err % if there's an error, take notes & move on
            errorlog{ctr,1} = subjects{i};
            errorlog{ctr,2} = batch_functions{m};
            errorlog{ctr,3} = err;
            ctr = ctr + 1;
            cd(scriptdir);
            continue;
        end

        cd(scriptdir);
    end

end

if ~isempty(errorlog)
    disp(errorlog) % print error log at end
else
    disp('No errors detected.');
end
diary off