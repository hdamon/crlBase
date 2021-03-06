classdef grid
  %
  % classdef crlBase.typegrid
  %
  % Class used to define a 1D, 2D, or 3D grid.
  %
  % All three grid sizes are ultimately represented in 3D space, with the
  % values for the second and third dimension set to either 1 or zero,
  % depending on how it's indexed.
  %
  % Constructor Syntax:
  %    obj = CNLGRID(sizes);
  %
  % Properties:
  %        sizes: 
  %        idxBy:  
  %    dimension: 
  %    
  % Methods:
  %     ptsOut = getGridPoints(grid,idx)
  %     mapOut = getMapGridToGrid(gridIn,gridOut,mapType);
  %  varargout = getGridConnectivity(grid,conSize);
  %
  % Written By: Damon Hyde
  % Last Edited: July 24, 2015
  % Part of the cnlEEG Project
  %
  
  properties    
    sizes = [ 1 1 1 ]; % Default size
    idxBy = crlBase.type.indexType.startAtOne;
  end
  
  properties (Dependent = true)
    dimension
  end
  
  methods    
    %% Object Constructor
    function obj = grid(sizes)
      % Object constructor function for crlBase.typegrid
      if nargin>0
        if isa(sizes,'crlBase.type.grid')
          obj.sizes = sizes.sizes;
          obj.idxBy = sizes.idxBy;
        else
          obj.sizes = sizes;
        end;      
      end;
    end
          
    function dim = get.dimension(grid)
      % Dimension of the grid is the length of the sizes
      dim = length(grid.sizes);
    end
    
    function out = size(a)
      out = a.sizes;
    end
    
    function isEqual = eq(a,b)
      % Test for equality of crlBase.typegrid objects
      %
      assert(isa(a,'crlBase.type.grid')&&isa(b,'crlBase.type.grid'),...
        'Both inputs must be crlBase.type.grid objects');
      
      isEqual = false;
      if ( (numel(a.sizes)==numel(b.sizes)) && all(a.sizes==b.sizes) )
        if ( a.idxBy == b.idxBy )
          isEqual = true;
        end;
      end;      
        
    end
       
    function out = sliceGrid(obj,varargin)
      
      newSize = zeros(1,3);
      for i = 1:3
        if i<=numel(varargin)
          if isequal(varargin{i},':')
            newSize(i) = obj.sizes(i);
          else
            newSize(i) = numel(varargin{i});
          end;
        else
          newSize(i) = obj.sizes(i);
        end
      end
      out = crlBase.type.grid(newSize);
    end
    
    out = resample(obj,resamplelevel)
    
    ptsOut = getGridPoints(grid,idx)
    
    % For obtaining a map between two grids
    mapOut = getMapping(gridIn,gridOut,mapType);
    
    % To obtain the grid connectivity matrix, assuming adjacency only in
    % the X, Y, and Z directions
    varargout = getGridConnectivity(grid,conSize);    
    
  end
  
  methods (Access=protected,Static = true)    
    mapOut = getMapping_Tent(gridIn,gridOut);
  end
  
end
