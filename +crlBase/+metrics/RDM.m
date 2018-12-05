function [RDM] = RDM(A,B,dim)
% function [RDM ] = RDM(A,B)
%
% Compute the relative difference metric (RDM) and magnitude error (MAG)
% between two vectors.  Checks to make sure sizes are matched.
%
% Written By: D. Hyde
% January 2014

if (ndims(A)~=ndims(B))||(~all(size(A)==size(B)))
  error('cnlEEG:metricsPkg:SizeMismatch', ...
        ['Mismatch in sizes between inputs to metrics.RDMandMAG']);
end
 
if ~exist('dim','var'), dim = 1; end

normA = sqrt(sum(A.^2,dim));
normB = sqrt(sum(B.^2,dim));

RDM = sqrt(sum((A./normA - B./normB).^2,dim));


end