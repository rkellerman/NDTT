classdef TabletDataObject
    %TABLETDATAOBJECT temporarily stores recorded data from RTR toolbox
    %   Each TabletDataObject will have several sets of data corresponding
    %   to the different measurements that will be performed on a tablet.
    %   The data object is passed among iterations of the parfor loop,
    %   ending with the storage of the data to the appropriate location.
    
    properties
        BATCH_ID
        COMP_data
        THICKNESS_data
        MASS_data
        TOF_data
    end
    
    methods
        % store
    end
    
end

