function [score] = dice(A,B)
%
% function [score] = dice(A,B)
%
% Computes the dice score between two sets, computed as:
%
% Mutual = intersect(A(:),B(:))
% score  = 2*length(Mutual)/(length(A) + length(B));
%
% Written By: D. Hyde
% January 2014

if isempty(A)|isempty(B)
  score = 0;
  
else
  A = A(:);
  B = B(:);
  
  Mutual = intersect(A,B);
 
  score = 2*length(Mutual)/(length(A)+length(B));
  
end;

if isnan(score)|isinf(score)
  warning('cnlEEG:metricsPkg:dice:badDice',...
    ['Returning a Dice index score that is NaN or Inf. \n' ...
    'Something has probably gone wrong. \n'...
    'Returning control to keyboard.']);
  keyboard;
end;

end