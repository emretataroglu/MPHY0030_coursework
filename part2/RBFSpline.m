% RBFSpline
classdef RBFSpline
%     properties
%     end
    methods (Static)
        
        function alpha = fit(c_points, lambda, sigma, K)
            % Inputs
            % s_points = source points
            % t_points = target points (qk)
            % lambda = aprox. localisation error
            n = size(c_points,1); % Size of source points
            
            % Construct W
            W = diag(1./sigma.^2);
            
            R = K + lambda*inv(W);
     
            % Only finding alpha since beta is absent for Gaussian RBF Kernel
            
            alpha = inv(R)*c_points;
            
            % Output
            % [alpha beta] = spline coefficients
        end
        
        function t_q_points = evaluate(q_points, c_points, alpha, sigma)
            % Inputs
            % q_points = query points that are needed to be transformed
            % c_points = control points
            
            nq = size(q_points,1);
            
            t_q_points = zeros(nq,1);
            
            for i = 1:nq

                for m = 1:length(alpha)
                    D = norm(q_points(i,:) - c_points(m,:));
                    t_q_points(i) = t_q_points(i)+(alpha(m,1)*exp(-D^2/(2.*sigma(m,1)^2)));
                end

            end

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
            
            for i = 2:nc
                for j = 1:i-1
                    D = norm(c_points(i,:)-c_points(j,:));
                    K(i,j) = exp(-D^2/(2.*sigma(i)^2));
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