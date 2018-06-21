function success = close(obj)
% Close an object's parent figure
%
% success = crlBase.gui.util.parentfigure.close(obj)
%
% Inputs
% ------
%  obj : uicontrol or crlBase.gui.uipanel object
%  
% Output
% ------
%  success : True if object succesfully located figure closed
%
% Written By: Damon Hyde
% Part of the crlBase Project
% 2009-2017
%

if ~isempty(obj)&&ishghandle(obj)
  delete(ancestor(obj,'figure'));
end;

end