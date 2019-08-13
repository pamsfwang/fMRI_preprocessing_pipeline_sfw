# fMRI_preprocessing_pipeline_sfw
My SPM fMRI preprocessing pipeline with ART   

**Author: Shao-Fang Wang**  
Please read the PDF manual for details.

**Reference:**
Thackery Brown (Cognitive Neuroimaging Lab), 
Mumford videos on youtube, 
Maureen Ritchey's Github (ritcheym), 
ArtRepair website, 
SPM manual

## Step00:Header Information

Header information contained details on how your data were being stored and some details about data acquisition.
Why correct header is important:
1. Preprocessing softwares often use data acquisition information in header as parameters. For example, nifti header stores information about the timing of an fMRI acquisition, which is represented by a number code. A preprocessing software could use this code to perform slice timing correction.
2. Header information also tells a program how to read in the data. If there is something wrong about it, the program will read in the data wrongly. For example, if the orientation information is not correct, it could lead to wrong labeling of the left and right hemispheres.

## Step01: Reorienting
The NIFTI intensity data is stored on disk as a list of numbers (voxel coordinates). The ordering of these numbers are arbitrary. This depends on how you reconstruct the image. For example, (0,0,0) of this 3D matrix is not necessarily the center of the brain. These voxel coordinates (i,j,k) gives your spatial information of where a voxel locates in this 3D matrix, but this is not relates to anatomical information.
Header information is used to associated spatial and anatomical location information (qform and sform mtr) with these numbers. qform is the scanner coordinate system (the real space inside the scanner bore) and sform is relating to standard space coordinates (e.g. MNI152). One of them is being used to assign anatomical information to voxel coordinates. This is what it meant by mapping from voxel coordinates to real world coordinates. The “ real world” coordinates are also called continuous coordinates or mm coordinates ( the mm in the SPM display dialog)). You can check whether this mapping is correct by viewing the image via FSL/Mricron. If the orientation labels are not correct (say, anterior and posterior flip), there may be some prob with the mapping process (this could be one potential reasons for it).

## Step02: Organize files
This step is setting up your file structure for further analyses. This step will vary across different projects and you can have your own way to meet the purposes:
1. Convert a 4D volume into 3D volume files if needed (My current batch scripts work on 3D files not 4D files. SPM can work on 4D file. I just haven’t tried it out in my batch scripts. The key point may be in spm_selector: argument frame enter number of volumes, for example 1:300, this will read in the first 300 volumes in your 4D file.)
2. Exclude the first few volumes that you save for the scanner to warm up from the following processing steps (My way is to put them into a separate folder). You do want to somehow separate them from other functional volumes because, if you include them in preprocessing pipeline, their signal will propagate to other volumes through any steps that contain interpolation

## Step03: Check raw data (ArtRepair)
Repair bad data before preprocessing, otherwise large outliers will propagate to good data through slice timing (interpolation). We will fix bad slices before preprocessing. But, ArtRepair recommends not to repair any bad volumes until after preprocessing.
Software: ArtRepair (Center for Interdisciplinary Brain Sciences Research, Stanford) ArtRepair software is developed to use with SPM to remove noisy volumes and slices. http://cibsr.stanford.edu/tools/human-brain-project/artrepair-software.html

## Step04: Fix bad slices (ArtRepair)
Bad slices: abnormally high or low tSNR of a slice
Source of noise:
• increase background signal: ArtRepair
• decrease object signal: CNI QA

## Step05: Slice timing and motion correction
**Slice timing correction**
Correct differences in image acquisition time between slides. If your TR is 2 seconds, the time difference between the first slide and the last slide you collected is 2 seconds! The GLM model assumes slides were collected at the same time. Therefore, you can either fix the model or fix the signal (functional image).
• slice timing differences are worse in event related design  
• Short TR would have less slice timing differences (obviously). According to Mumford, if your TR <=2 + interleaved acquisition + spatial smoothing, you can reduce slice timing effects (actually, she does not do slice timing  
correction for her data)
• Adding temporal derivatives to model would help  
Basically, doing slice timing correction in preprocessing is fixing the signal by interpolation. This is also why removing outlier slides or volumes before preprocessing is important. If you do not remove outliers, those “bad” signal will be used in interpolation.
• This is accomplished by a simple shift of the phase of the sines that make up the signal and the correction works by lagging theme-series data on each slice using sinc-interpolation  
• each time series having the values that would have been obtained had the slice been acquired at the same time as the reference slice  

**Motion correction (Realignment)**
Align each image in a time series with a reference image. Uses rigid body motion correction (x,y,z, 3 rotations). Register each volume to a reference volume. You will obtain motion parameters (how much a volume is being moved to match the reference) after doing registration. Motion parameters can be used to illustrate the motion over time.
Relative displacement (i.e. how far a volume moved from the last scan) is typically more informative about the change in BOLD signal magnitude.

## Step06: Fix bad volumes
Outlier volumes may be caused by exceeding a intensity variation threshold and/or a scan-to-scan motion threshold. It is also possible to manually enter bad volumes (e.g. technical issues happened, loss of behavioral data, etc)



