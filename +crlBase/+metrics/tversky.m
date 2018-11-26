function [score] = tversky(A,B,alpha,beta)
%
% function [score] = get_Tversky(A,B,alpha,beta)
%
% Computes the Tversky Index between two sets, given coefficients alpha and
% beta.  This is computed as:
%
%   Mutual = intersect(A,B);
%   DiffA = setdiff(A,B);
%   DiffB = setdiff(B,A);
%   denom = length(Mutual) + alpha*length(DiffA) + beta*length(DiffB)
%   Tversky = length(Mutual)/denom
%
% Written by: D. Hyde
% January 2014

if ~isempty(A)&(~isempty(B))
  
  A = A(:);
  B = B(:);
  
  Mutual = intersect(A,B);
  DiffA = setdiff(A,B);
  DiffB = setdiff(B,A);
  
  score = length(Mutual)/(length(Mutual) + alpha*length(DiffA) + beta*length(DiffB));
  
else
  score = 0;
end;

if isnan(score)|isinf(score)
  warning('cnlEEG:metricsPkg:tversky:badTversky',...
    ['Returning a Tversky index score that is NaN or Inf. \n' ...
    'Something has probably gone wrong. \n'...
    'Returning control to keyboard.']);
  keyboard;
end;

end