classdef ControlApp < handle

% Copyright (C) 2013, Georgia Tech Research Corporation
% see the LICENSE file included with this software
    
    properties
        supervisors
        root
    end
    
    methods
        function obj = ControlApp(root)
            obj.supervisors = simiam.containers.ArrayList(20);
            obj.root = root;
        end
        
        function run(obj, dt)
            aLeaderRobot = obj.supervisors.elementAt(1);
            aFollowerRobot1 = obj.supervisors.elementAt(2);
            aFollowerRobot2 = obj.supervisors.elementAt(3);
            aFollowerRobot3 = obj.supervisors.elementAt(4);
           aFollowerRobot4 = obj.supervisors.elementAt(5);
           aFollowerRobot5 = obj.supervisors.elementAt(6);
           aFollowerRobot6 = obj.supervisors.elementAt(7);
           aFollowerRobot7 = obj.supervisors.elementAt(8);
           aFollowerRobot8 = obj.supervisors.elementAt(9);
           aFollowerRobot9 = obj.supervisors.elementAt(10);
          
          [x, y, theta] = aLeaderRobot.state_estimate.unpack();
          [xf1, yf1, thetaf1] = aFollowerRobot1.state_estimate.unpack();
          [xf2, yf2, thetaf2] = aFollowerRobot2.state_estimate.unpack();
          [xf3, yf3, thetaf3] = aFollowerRobot3.state_estimate.unpack();
          [xf4, yf4, thetaf4] = aFollowerRobot4.state_estimate.unpack();
          [xf5, yf5, thetaf5] = aFollowerRobot5.state_estimate.unpack();
          [xf6, yf6, thetaf6] = aFollowerRobot6.state_estimate.unpack();
          [xf7, yf7, thetaf7] = aFollowerRobot7.state_estimate.unpack();
          [xf8, yf8, thetaf8] = aFollowerRobot8.state_estimate.unpack();
          [xf9, yf9, thetaf9] = aFollowerRobot9.state_estimate.unpack();
         
          u1 = [xf1-x; yf1-y];
          u2 = [xf2-x; yf2-y];
          theta_d1 = atan2(u1(2),u1(1));
          theta_d2 = atan2(u2(2),u2(1));
          
           %% FF
           x_n1 = x+0.25*cos(theta_d1);
           y_n1 = y+0.25*sin(theta_d1);
           aFollower1 = obj.supervisors.elementAt(2);
           aFollower1.goal = [x_n1; y_n1];

           %SF
           x_n2 = xf1+0.25*cos(theta_d2);
           y_n2 = yf1+0.25*sin(theta_d2);
           aFollower2 = obj.supervisors.elementAt(3);
           aFollower2.goal = [x_n2; y_n2];

           %TF
           x_n3 = xf2+0.25*cos(theta_d2);
           y_n3 = yf2+0.25*sin(theta_d2);
           aFollower3 = obj.supervisors.elementAt(4);
           aFollower3.goal = [x_n3; y_n3];


           %FF
           x_n4 = xf3+0.25*cos(theta_d2);
           y_n4 = yf3+0.25*sin(theta_d2);
           aFollower4 = obj.supervisors.elementAt(5);
           aFollower4.goal = [x_n4; y_n4];

           %FifthF
           x_n5 = xf4+0.25*cos(theta_d2);
           y_n5 = yf4+0.25*sin(theta_d2);
           aFollower5 = obj.supervisors.elementAt(6);
           aFollower5.goal = [x_n5; y_n5];

           %SixF
           x_n6 = xf5+0.25*cos(theta_d2);
           y_n6 = yf5+0.25*sin(theta_d2);
           aFollower6 = obj.supervisors.elementAt(7);
           aFollower6.goal = [x_n6; y_n6];

           %SevnF
           x_n7 = xf6+0.25*cos(theta_d2);
           y_n7 = yf6+0.25*sin(theta_d2);
           aFollower7 = obj.supervisors.elementAt(8);
           aFollower7.goal = [x_n7; y_n7];

           %EigF
           x_n8 = xf7+0.25*cos(theta_d2);
           y_n8 = yf7+0.25*sin(theta_d2);
           aFollower8 = obj.supervisors.elementAt(9);
           aFollower8.goal = [x_n8; y_n8];

           %NineF
           x_n9 = xf8+0.25*cos(theta_d2);
           y_n9 = yf8+0.25*sin(theta_d2);
           aFollower9 = obj.supervisors.elementAt(10);
           aFollower9.goal = [x_n9; y_n9];
        end
        
        function ui_press_mouse(obj, click_src)
            aLeader = obj.supervisors.elementAt(1);
            aLeader.goal = click_src;
        end
    end
    
end
