function disp_FullWidth(message,lineLength)
% Display full width message with comments lines before/after
%
% function disp_FullWidth(message,lineLength)
%
% Inputs
% ------
%    message : Message to display
% lineLength : (Optional) Length to use for each line
%
% Function
% --------
%  Displays:
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% YOUR MESSAGE HERE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Best used for making messages particularly visible in a long string of other outputs.
%

if ~exist('lineLength','var'),
  lineLength = 80;
end;

msgLength = length(message);

msgLine = ['%%  ' message];
msgLine(lineLength-1:lineLength) = '%';

disp(repmat('%',1,lineLength));
disp(msgLine);
disp(repmat('%',1,lineLength));

end
