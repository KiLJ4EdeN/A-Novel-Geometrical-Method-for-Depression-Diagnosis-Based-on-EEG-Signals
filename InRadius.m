function out = InRadius(time_series, lag)
% lag should be chosen based on sampling rate and time_series data Typical values are 1:5 
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
