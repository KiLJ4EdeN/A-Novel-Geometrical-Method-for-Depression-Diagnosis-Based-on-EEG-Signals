% CCdis 
% Centroid to Centroid distance is a new complexity measure based on a triangle center differentiation from the input signal.
% Usages: capture variability, long term correlations with different lag numbers.
% Comparable to entropy measures such as sampen and apen, and other distance based entropy techniques. 
% Based on poincare recurrence plots.
%{
This function captures the variability in the time_series by decomposing each 6 consecutive data points into a triangle,
And computing the distances between each pair of Centroids.
 %
 %	
 %
 %
 Inputs :
 time_series : 1*N column vector.
 lag : distance between chosen points for triangle edges.
 example usage :
 time_series = rand(1,500);
 D = CCdis(time_series);
 note that this results in a differentiation from the average of the in distances between centroids.
 to use the Centroid distance variability sequence a second output D must be specified.
%}





function [out D]=CCdis(time_series, lag)

	% Parameter Control
    
    	if nargin < 2 || nargin > 2 
		fprintf('WARNING: 2 input arguments: time_series and lag are needed.\n refer to InRadius comments for more information.\n')
	end
	if ~isvector(time_series)
		error('time_series must be a 1*N vector.')
	end
	if lag > length(time_series)
		error('lag must be smaller than data size.')
	end
	    % Looping the signal samples to exctract centroids.
	    
	    for k = 1:length(time_series) - 5
			% calculating the centroid coordinates for every triangle.
			% with cx and cy representing the centroids x and y coords respectiely.
			
			cx(k) = mean([time_series(k), time_series(k+2), time_series(k+4)]);
			cy(k) = mean([time_series(k+1), time_series(k+3), time_series(k+5)]);
	    end
	    % extracting the triangle centers that meet the lag criteria.
	    
	    cx=cx(1:lag:end);
	    cy=cy(1:lag:end);
	    % measuring the distance between two consecutive triangle centers.
	    % note: any type of desire distance can be measured
	    % euclidean chebychev mikowski cityblock etc.
	    
	    D=sqrt((cx(2:end)-cx(1:end-1)).^2+(cy(2:end)-cy(1:end-1)).^2);
	    % the triangle distance vector can be used to your needs.
	    % here the mean is calculated as a feature.
	    
	    out=mean(abs(D(1:lag:end-1)-D(2:lag:end)));
end
    
