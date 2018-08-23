function varargout = subsref(obj,s)
% subsref method for labelledArray objects
%

switch s(1).type
  case '.'       
      varargout = {builtin('subsref',obj,s)};        
  case '()'
    if numel(obj) == 1
      %% Implement obj(indices)
      
      if (numel(s(1).subs)==1)&&(numel(s(1).subs{1})==1)&&(s(1).subs{1}==1)
        varargout = {builtin('subsref',obj,s)};
        return;
      end
      
      if numel(s)==1
        % Internal object indices can only be accessed individually        
        %disp(['Accessing single object: Single Reference']);
        %dimIdx = obj.getNumericIndex(s.subs{:});        
        varargout = {obj.sliceGrid(s.subs{:})};
      else
        % Get the right object, then reference into it.
        %disp(['Accessing single object: Multiple Reference']);
        tmp = subsref(obj,s(1));
        varargout = {subsref(tmp,s(2:end))};                
      end;
    else
      % Just use the builtin for arrays of objects
      varargout = {builtin('subsref',obj,s)};              
    end
    
  case '{}'
    varargout = {builtin('subsref',obj,s)};        
    
  otherwise
    error('Not a valid indexing expression')
end
