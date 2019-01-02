% Configure Matlab Path to Include the full crlEEG
function addCRLBasePath()
[currDir,~,~] = fileparts(mfilename('fullpath'));

addpath(currDir);
addpath(fullfile(currDir, 'external', 'export_fig')); 
