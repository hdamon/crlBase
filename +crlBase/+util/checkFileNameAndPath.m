function [fName, fPath] = checkFileNameAndPath(varargin)
% DEPRECATED FUNCTION STUB

warning('crlBase.util.checkFileNameAndPath is deprecated. Use crlBase.fileIO version instead');

[fName,fPath] = crlBase.fileio.checkFileNameAndPath(varargin{:});

end
