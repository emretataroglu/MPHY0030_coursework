% Image3D

classdef Image3D
 
    properties
        
        x_img 
        y_img
        z_img
        vol
        voxdims
        size
        dim
        x_max
        x_min
        y_max
        y_min
        z_max
        z_min
        x_range
        y_range
        z_range

    end
    
    methods (Static)
        function img_3D = Image3D(vol,voxdims)
            
            img_3D.vol = vol;
            img_3D.voxdims = voxdims;
            img_3D.size = size(vol);
            img_3D.dim = length(size(vol));
            
                % All x values
                for i = 1:img_3D.size(img_3D.size(1))
                    img_3D.x_img(i,:,:);
                end
                
                % All y values
                for j = 1:img_3D.size(img_3D.size(2))
                    img_3D.y_img(:,j,:)
                end
                
                % All z values
                for k = 1:img_3D.size(img_3D.size(3))
                    img_3D.z_img(:,:,k);
                end
                
                % Min max for x y z
                img_3D.x_min = min(img_3D.x_img);
                img_3D.x_max = max(img_3D.x_img);
                
                img_3D.y_min = min(img_3D.y_img);
                img_3D.y_max = max(img_3D.y_img);
                
                img_3D.z_min = min(img_3D.z_img);
                img_3D.z_max = max(img_3D.z_img);
                
                % Range for x y z
                img_3D.x_range = img_3D.x_max-img_3D.x_min;
                img_3D.y_range = img_3D.y_max-img_3D.y_min;
                img_3D.z_range = img_3D.z_max-img_3D.z_min;
            
   
        end
    end
end
