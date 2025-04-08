function resetWorld(optns)
%--------------------------------------------------------------------------
% resetWorld(optns)
% Calls Gazebo service to reset the world in a ROS+Gazebo environment
% Input: (struct) optns - optional struct, not required
% Output: None
%--------------------------------------------------------------------------
    disp('Resetting the world...');

    try
        % 01 - Create a service client for Gazebo's reset_world service
        client = rossvcclient('/gazebo/reset_world');

        % 02 - Create an empty request message
        req = rosmessage(client);

        % 03 - Call the service
        call(client, req, 'Timeout', 3);
        disp('World has been successfully reset!');
        
    catch ME
        disp('Failed to reset the world:');
        disp(ME.message);
    end
end
