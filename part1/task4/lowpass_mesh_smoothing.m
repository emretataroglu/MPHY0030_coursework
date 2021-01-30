function smoothed = lowpass_mesh_smoothing(vertices, faces, iterations, lambda, mu)
    % Set default values based on the number of input arguments
    
    if nargin <= 2 || isempty(iterations)
        iterations = 10;
    end
    
    if nargin <= 3 || isempty(lambda)
        lambda = 0.9;
    end
    
    if nargin <= 4 || isempty(mu)
        mu = lambda*(-1.02);
    end
    
    % Number of vertices
    size_p = size(vertices);
   
    % Initialise smoothed matrix
    smoothed = vertices;
    
    for f = 1:iterations
        
        % For loops the iteration number and vertex count
        for i = 1:size_p(1)
            
            neighbours = [faces(find(faces(:,1)==i),:);faces(find(faces(:,2)==i),:);faces(find(faces(:,3)==i),:)];

            % Unique neighbours
            U = unique(neighbours)';
            
            % Deduce our original point 
            U(find(U==i))=[];

            N = length(U);

            % Weighting factor
            w = 1/N;
            
            for m = [lambda,mu*lambda]
                for j = 1:N

                smoothed(i,:) = smoothed(i,:) + m*w*(vertices(U(j),:)-vertices(i,:));
                
                end
            end
        end
        
        vertices = smoothed;
        
    end
end
    
    
    