function success = raise(obj)
% Change focus to object's parent figure.
%
% success = crlBase.gui.util.parentfigure.changeto(obj)
%
% Inputs
% ------
%  obj : uicontrol or crlBase.gui.uipanel object
%
% Output
%  success : True if object succesfully found and figure focus changed
%
% Written By: Damon Hyde
% Part of the crlBase Project
% 2009-2017
%

if ~isempty(obj)&&(ishghandle(obj)||isa(obj,'crlBase.gui.uipanel'))
  if ishghandle(obj)
    figure(ancestor(obj,'figure'));
  elseif isa(obj,'crlBase.gui.uipanel')
    figure(ancestor(obj.panel,'figure'));
  end
  success = true;
else
  success = false;
end;

end