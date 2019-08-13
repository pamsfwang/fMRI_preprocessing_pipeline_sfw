function [] = organize_file(b)
%Step00: Organize files
%Shao-Fang Wang 2016
%1. Split 4D file into individual 3D files
%2. Put the 4D file into another directory
%3. Put the first few volumes into another directory
%**Remember to edit initialize_vars

mkdir_4D = '4D'; %folder for 4D file
mkdir_rmv = '5v'; %folder for removed volumes
n_rmv = 5; %number of volumes at the begining of a scan to be removed

errorlog = {};ctr = 1;
    fprintf('Processing subject %s \n',b.currSubj)
    for irun = 1:length(b.funcRuns)
        try
            fprintf('\t Processing %s \n',b.funcRuns{irun})
            cd([b.dataDir b.funcRuns{irun}])
            %making directory
            mkdir([b.dataDir b.funcRuns{irun}],mkdir_4D);
            mkdir([b.dataDir b.funcRuns{irun}],mkdir_rmv);
            
            %moving .mat and .nii file (4D) into the 4D folder
            fmat = dir('*.mat');
            fnii = dir('*.nii');
            movefile(fmat.name,[b.dataDir b.funcRuns{irun},'/',mkdir_4D]);
            movefile(fnii.name,[b.dataDir b.funcRuns{irun},'/',mkdir_4D]);
            
            %4D to 3D
            spm_file_split([b.dataDir b.funcRuns{irun},'/',mkdir_4D,'/',fnii.name],[b.dataDir b.funcRuns{irun}])
            nii_3D = dir('*.nii');
            
            for irmv = 1:n_rmv
                movefile(nii_3D(irmv).name,[b.dataDir b.funcRuns{irun},'/',mkdir_rmv,'/']);
            end
            
        catch err
            
            errorlog{ctr,1} = subjects{i};
            errorlog{ctr,2} = b.funcRuns{irun};
            errorlog{ctr,3} = err;
            ctr = ctr + 1;
            
            continue;
        end %try
        
    end

if ~isempty(errorlog)
    disp(errorlog) % print error log at end
    error(['Check errorlog ',b.currSubj,': error happened when spliting and organizing files\n'])
else
    disp('No errors detected.');
end
end
