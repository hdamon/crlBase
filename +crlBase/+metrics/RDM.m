function [RDM] = RDM(A,B)
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
end;
 
normA = norm(A(:));
normB = norm(B(:));

RDM = norm(A/normA - B/normB);

end