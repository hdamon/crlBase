function [bestIdx,bestGoal,goalDistribution] = goalFunctionScan(lField,testInputs,nVec)
% Goal function scan
%
% function [results] = goalFunctionScan(lField,testInputs,nVec)
%
% Compute a goal function scan value for each spatial location in the
% lField
%
% Currently only implements least squares loss function. 
%
% Inputs
% ------
%      lField : Leadfield matrix for reconstruction
%  testInputs : Test Inputs: These are 
%               
%        nVec : Number of columns/location in leadfield matrix
%
% Outputs
% -------
%   bestIdx : Index of the location in lField best matching each test
%               input.
%  bestGoal : Value of the goal function scan at bestIdx
%  goalDistribution : Histogram of goal values in bins 0:0.01:1.
%


nLoc = size(lField,2)/nVec;
nInput = size(testInputs,2);

bestIdx  = zeros(1,nInput);
bestGoal = zeros(1,nInput);
goalDistribution = zeros(101,nInput);

inputNorms = sqrt(sum(testInputs.^2,1));

if false && nVec==1
  % Special Case w/ 1 Column Per Location
  
else
  % Multiple rows per location
  
  % Loop across test locations
  disp('Looping across test locations');
  for i=1:nLoc
    disp(['Idx: ' num2str(i)]);
    % lField for current location
    tmp=lField(:,(i-1)*nVec+1:i*nVec);
    
    % Inverse and Data Estimator
    mCurr = tmp*pinv(tmp);
    
    a     = testInputs - mCurr*testInputs;
    normErr = sqrt(sum(a.^2,1));
    
    % Compute Goal Function
    currGoal=(1-normErr./inputNorms)*100;
    
    %allGoals(i,:) = currGoal;
    
    % Increment the appropriate histogram bins for each test function
    idxBin = 1+round(currGoal);
    tmpMat = sparse(idxBin,1:nInput,ones(1,nInput),101,nInput);
    goalDistribution = goalDistribution + tmpMat;
    
    %   idxBin = 1 + round(currGoal);
    %   for j = 1:numel(idxBin)
    %     goalDist(idxBin,j) = goalDist(idxBin,j) + 1;
    %   end;
    
    % Check if the new location is the best.
    isBest = currGoal>bestGoal;
    
    bestIdx(isBest) = i;
    bestGoal(isBest) = currGoal(isBest);
    
    if mod(i,10000)==0
      disp(['Completed row ' num2str(i) ' at ' num2str(toc) ' seconds.']);
    end
  end
  
end

% % Output Structure
% results.bestIdx = bestIdx;
% results.bestGoal = bestGoal;
% results.goalDist = goalDistribution;

end