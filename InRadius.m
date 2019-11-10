% InRadius 
% InRadius is a novel complexity measure based on the first degree of a geometrical differentiation from the input signal.
% Usages: capture variability, long term correlations with different lag numbers
% Comparable to entropy measures such as sampen and apen, and other distance based entropy techniques. 
% Based on poincare recurrence plots.
%{
This function captures the variability in the time_series by decomposing each 6 consecutive data points into a triangle,
And computing the InRadius size for each triangle
 %
 %	
 %
 %
 Inputs :
 time_series : 1*N column vector 
 lag : distance between chosen points for triangle edges.
 example usage :
 time_series = rand(1,500);
 IR = InRadius(time_series);
 note that this results in the average of the in radius differentiaion
 to use the Radius changes and Radius size as out puts do [out radchng r] in which radchng and r denote Radius changes and size respectively.
%}



function [out radchng r] = InRadius(time_series, lag)
% lag should be chosen based on sampling rate and time_series data Typical values are 1:5 / higher than 6 lags will have data loss
	if nargin<2 || nargin>2 
		fprintf('WARNING: 2 input arguments: time_series and lag are needed.\n refer to InRadius comments for more information.\n')
	end
	if ~isvector(time_series)
		error('time_series must be a 1*N vector.')
	end
	if lag>length(time_series)
		error('lag must be smaller than data size.')
	end
	% Looping through all the samples
	for i=1:length(time_series)-5
 		% Triangle area calculation for six consecutive samples
 		% With D representing the area for each triangle
		D(i)=polyarea([time_series(i),time_series(i+2),time_series(i+4)],[time_series(i+1),time_series(i+3),time_series(i+5)]);
		% Triangle side calculation
		% With x, y, z denoting each triangle side
		x(i)=sqrt((time_series(i)-time_series(i+2))^2+(time_series(i+1)-time_series(i+3))^2);
		y(i)=sqrt((time_series(i)-time_series(i+4))^2+(time_series(i+1)-time_series(i+5))^2);
		z(i)=sqrt((time_series(i+2)-time_series(i+4))^2+(time_series(i+3)-time_series(i+5))^2);
			% Inradius computation for every triangle
			if x(i)+y(i)+z(i)==0
				r(i)=0;
			else
				r(i)=2*(D(i))/(x(i)+y(i)+z(i));
			end
	end
% Any analysis can be done with the resulting signal here.
% Absolute Derivative calculation for the InRadius sequence.
radchng=abs(r(1:lag:end-1)-r(2:lag:end));
out=mean(radchng);
