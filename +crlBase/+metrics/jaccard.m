function [score] = jaccard(A,B)
%
% function [score] = jaccard(A,B)
%
% Computes the Jaccard index between two sets, computed as:
%
% Mutual = intersect(A(:),B:))
% Union  = union(A(:),B(:))
% score  = length(Mutual)/length(Union);
%
% Written By: D. Hyde
% January 2014

if isempty(A)|isempty(B)
  score = 0;
  
else
  A = A(:);
  B = B(:);
  
  Mutual = intersect(A,B);
  Union  = union(A,B);
  
  score = length(Mutual)/length(Union);
  
end;

if isnan(score)|isinf(score)
  warning('cnlEEG:metricsPkg:jaccard:badJaccard',...
    ['Returning a Jaccard index score that is NaN or Inf. \n' ...
    'Something has probably gone wrong. \n'...
    'Returning control to keyboard.']);
  keyboard;
end;

end