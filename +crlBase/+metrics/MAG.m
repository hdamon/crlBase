function [MAG] = MAG(A,B,dim)
% function [MAG] = MAG(LeadField1,LeadField2,SolutionRegion)
%
% Compute the relative difference metric (RDM) and magnitude error (MAG)
% between two vectors.  Checks to make sure sizes are matched.
%
% Written By: D. Hyde
% January 2014

if (ndims(A)~=ndims(B))||(~all(size(A)==size(B)))
  error('crlBase:metrics:MAG:SizeMismatch', ...
        ['Mismatch in sizes between inputs to metrics.MAG']);
end
if ~exist('dim','var'), dim = 1; end; 

normA = sqrt(sum(A.^2,dim));
normB = sqrt(sum(B.^2,dim));

%normA = norm(A(:));
%normB = norm(B(:));

MAG = normA./normB;

end