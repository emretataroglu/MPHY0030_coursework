% RBFSpline
classdef RBFSpline
%     properties
%     end
    methods (Static)
        
        function alpha = fit(t_points, lambda, sigma)
            % Inputs
            % s_points = source points
            % t_points = target points (qk)
            % lambda = aprox. localisation error
            n = size(t_points,1); % Size of source points
            
            % Construct W
            W = diag(1./sigma.^2);
            
            K = RBFSpline.kernel_gaussian(t_points, sigma);
            
            R = K + lambda*inv(W);
     
            % Only finding alpha since beta is absent for Gaussian RBF Kernel
            
            alpha = inv(R)*t_points;
            
            % Output
            % [alpha beta] = spline coefficients
        end
        function t_q_points = evaluate(q_points, c_points, alpha, sigma)
            % Inputs
            % q_points = query points that are needed to be transformed
            % c_points = control points
            
            nq = size(q_points,1);
            hq = size(q_points,2);
            nc = size(c_points,1);
            
            
            % Output
            %  t_q_points = transformed query points
        end
        
        % RBF kernel function
        function K = kernel_gaussian(c_points, sigma)
            % Inputs
            % q_points = data matrix with training points
            
            nc = size(c_points,1);
            
            % Initialise Kernel
            K = zeros(nc);
            
            for i = 1:nc
                for j = 1:i-1
                    D = norm(c_points(i,:)-c_points(j,:));
                    K(i,j) = exp(-D/(2.*sigma(i)));
                end
            end
            
            K = K + K' + eye(nc);

            % Outputs
            % K = [KX, KY, KZ] = Kernel values between the query points and the control point
            % sets
        end
    end
end
         
      
 % End of RBFSpline