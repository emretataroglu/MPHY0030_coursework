% Free Form Deformation

classdef FreeFormDeformation
    
    methods
        function gP = classConstructor(points, ranges)
            % Points is a 3x1 vector consisting of x, y and z
            % Ranges is a 3x2 matrix consisting of min and max values of x,
            % y and z
            
            x = linspace(ranges(1,1),ranges(1,2),points(1)); 
            y = linspace(ranges(2,1),ranges(2,2),points(2)); 
            z = linspace(ranges(3,1),ranges(3,2),points(3)); 
            
            for i = 1:points(1)
                for j = 1:points(2)
                    for k = 1:points(3)
                        gP(i,j,k) = [x(i), y(j), z(k)];
                    end
                end
            end
            
        end
        
        function cp_coords = optionalclassConstructor(image3D, points)
            
            x = linspace(image3D.x_min,image3D.x_max,points(1)); 
            y = linspace(image3D.y_min,image3D.y_max,points(2)); 
            z = linspace(image3D.z_min,image3D.z_max,points(3)); 
            
            for i = 1:points(1)
                for j = 1:points(2)
                    for k = 1:points(3)
                        cp_coords(i,j,k) = [x(i), y(j), z(k)];
                    end
                end
            end
        end
        
        function displaced_c_points = random_transform_generator(c_points, val)
            
            max_range_x = c_points(2,1,1) - c_points(1,1,1);
            max_range_y = c_points(1,2,1) - c_points(1,1,1);
            max_range_z = c_points(1,1,2) - c_points(1,1,1);
            
            max_range_x = max_range_x(1);
            max_range_y = max_range_y(2);
            max_range_z = max_range_z(3);
            
            ax = max_range_x/2*val;
            bx = -max_range_x/2*val;
            
            ay = max_range_y/2*val;
            by = -max_range_y/2*val;
            
            az = max_range_z/2*val;
            bz = -max_range_z/2*val;

            rx = (bx-ax).*rand(length(c_points),1) + ax;
            ry = (by-ay).*rand(length(c_points),2) + ay;
            rz = (bz-az).*rand(length(c_points),3) + az;
            
            r = [rx ry rz];
            
            displaced_c_points = c_points + r;
            
        end
        
        function warpedImage = warp_image(image3D, RBFSpline)
        end
        
        function transformed = random_transform(~)
        end
        
        
    end
    
    
    
end