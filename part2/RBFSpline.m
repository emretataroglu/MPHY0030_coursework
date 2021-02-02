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
            n = size(s_points,1); % Size of source points
            
            % Construct W
            m = ones(1,n);
            w = m./sigma^2;
            W = diag(w);
            
            % Initialise R
            R = zeros(1,3);
            
            K = kernel_gaussian(s_points, t_points, sigma);
            
            R(1) = K(:,1) + lambda*inv(W);
            R(2) = K(:,2) + lambda*inv(W);
            R(3) = K(:,3) + lambda*inv(W);
     
            % Only finding alpha since beta is absent for Gaussian RBF Kernel
            
            alpha = inv(R).*t_points(:,1);
            
            % Output
            % [alpha beta] = spline coefficients
            
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
        end
        % RBF kernel function
        function K = kernel_gaussian(q_points, c_points, sigma)
            % Inputs
            % q_points = data matrix with training points
            % c_points = data matrix with test samples
            
            nq = size(q_points,1);
            nc = size(c_points,1);
            
            % Sum of the elements, squared
            nq_sq = sum(q_points.^2,1);
            nc_sq = sum(c_points.^2,1);
            
            % Euclidean distances
            D = (ones(nc,1)*nq_sq)' + ones(nq,1)*nc_sq - 2*q_points'*c_points;
            
            % Kernel
            K = exp(-D/(2*sigma^2));
            
            % Outputs
            % K = [KX, KY, KZ] = Kernel values between the query points and the control point
            % sets
        end
    end
end
         
      
 % End of RBFSpline