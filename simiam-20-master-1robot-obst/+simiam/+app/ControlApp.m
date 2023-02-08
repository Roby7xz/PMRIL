classdef ControlApp < handle

% Copyright (C) 2013, Georgia Tech Research Corporation
% see the LICENSE file included with this software
    
    properties
        supervisors
        root
    end
    
    methods
        function obj = ControlApp(root)
            obj.supervisors = simiam.containers.ArrayList(2);
            obj.root = root;
        end
        
        function run(obj, dt)
            
 
        end
        
        function ui_press_mouse(obj, click_src)
            aLeader = obj.supervisors.elementAt(1);
            aLeader.goal = click_src;
        end
    end
    
end
