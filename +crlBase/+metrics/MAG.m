function [MAG] = MAG(A,B)
% function [MAG] = MAG(LeadField1,LeadField2,SolutionRegion)
%
% Compute the relative difference metric (RDM) and magnitude error (MAG)
% between two vectors.  Checks to make sure sizes are matched.
%
% Written By: D. Hyde
% January 2014

if (ndims(A)~=ndims(B))||(~all(size(A)==size(B)))
  error('cnlEEG:metricsPkg:MAG:SizeMismatch', ...
        ['Mismatch in sizes between inputs to metrics.MAG']);
end;
 
normA = norm(A(:));
normB = norm(B(:));

MAG = normA/normB;

end