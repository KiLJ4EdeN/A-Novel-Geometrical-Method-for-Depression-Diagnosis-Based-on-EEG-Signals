% Cen45
% Centroid to 45-degree line distance is a new complexity measure based on cartesian state space distance.
% Usages: capture variability, long term correlations with different lag numbers.
% Comparable to entropy measures such as sampen and apen, and other distance based entropy techniques. 
% Based on poincare recurrence plots.
%{
This function captures the variability in the time_series by decomposing each 6 consecutive data points into a triangle,
And computing the the shortest distances between each triangle center and the x = y line.
 %
 %	
 %
 %
 Inputs :
 time_series: 1*N column vector.
 lag: distance between chosen points for triangle edges.
 example usage:
 time_series = rand(1, 500);
 [out Censeq] = Cen45(time_series, 1);
 plot(D)
 out
 note that this results in a differentiation from the average of the in distances between centroids and the 45-degree line.
 to use the Centroid distance to 45-degree line variability sequence a second output D must be specified.
%}







function [out Censeq] = Cen45(time_series, lag)

        % Parameter Control
    
    	if nargin < 2 || nargin > 2
		fprintf('WARNING: 2 input arguments: time_series and lag are needed.\n refer to InRadius comments for more information.\n')
	end
        if ~ isvector(time_series)
                error('time_series must be a 1*N vector.')
        end
        if lag > length(time_series)
                error('lag must be smaller than data size.')
        end

          % looping through the signal elements.
           for k = 1:length(time_series)-5
           		       	% calculating the centroid coordinates for every triangle.
			                  % with cx and cy representing the centroids x and y coords respectiely.
                     
                     cx(k) = mean([time_series(k), time_series(k+2), time_series(k+4)]);
                     cy(k) = mean([time_series(k+1), time_series(k+3), time_series(k+5)]);
            
           end
           
           % extracting the triangles that meet the lag critetia.
           
           D = D(1:lag:end);
           % measuring the shortest distance between the triangle centroid and the x=y line.
           D(k) = (abs(cx(k) - cy(k))) / sqrt(2);
       
           out = mean(abs(D(1:end-5) - D(6:end)));
end
