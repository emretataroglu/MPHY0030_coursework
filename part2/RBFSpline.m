% RBFSpline
classdef RBFSpline
%     properties
%     end
    methods
        function alpha = fit(s_points, t_points, lambda, sigma)
            % Inputs
            % s_points = source points
            % t_points = target points (qk)
            % lambda = aprox. localisation error
            K = kernel_gaussian(s_points, t_points
            
            
            % Output
            % alpha = spline coefficients
        end
        function t_q_points = evaluate(q_points, c_points, alpha, sigma)
            % Inputs
            % q_points = query points that are needed to be transformed
            % c_points = control points
            
            
            
            % Output
            %  t_q_points = transformed query points
            
        end
        % RBF kernel function
        function K = kernel_gaussian(q_points, c_points, sigma)
            % Inputs
            % q_points = query points that are needed to be transformed
            % c_points = control points
            
            % Squared Euclidean distances
            dx = zeros(3,1);
            dx(1) = q_points(1)-c_points(:,1); %D^2X
            dx(2) = q_points(2)-c_points(:,2); %D^2Y
            dx(3) = q_points(3)-c_points(:,3); %D^2Z
            
            gamma = 2*(sigma^2);
            
            % Constructing kernel
            K(1) = exp((-dx(1)/gamma)); %KX
            K(2) = exp((-dx(2)/gamma)); %KY
            K(3) = exp((-dx(3)/gamma)); %KZ
           
            
            % Outputs
            % K = [KX, KY, KZ] = Kernel values between the query points and the control point
            % sets
            
            
        end
        
        
    end
end % End of RBFSpline