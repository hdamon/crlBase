classdef testFileObj < crlBase.baseFileObj
  
  properties (Constant, Hidden = true)
    validExts = {};
  end
  
  methods
  
    function obj = testFileObj(varargin)
  
      obj = obj@crlBase.baseFileObj(varargin{:});
    end
    
    function read(obj)
    end
    
    function write(obj)
    end
    
  end
end
  