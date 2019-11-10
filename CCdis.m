function [out D]=CCdis(time_series, lag)
    % looping the signal to exctract centroids.
    for k=1:length(time_series)-5
    		% calculating the centroid coordinates for every triangle.
		cx(k)=mean([time_series(k),time_series(k+2),time_series(k+4)]);
		cy(k)=mean([time_series(k+1),time_series(k+3),time_series(k+5)]);
    end
    % choosing the triangle centers that meet the lag criteria.
    cx=cx(1:lag:end);
    cy=cy(1:lag:end);
    % measuring the distance between two consecutive triangle centers.
    D=sqrt((cx(2:end)-cx(1:end-1)).^2+(cy(2:end)-cy(1:end-1)).^2);
    % the triangle distance vector can be used to your needs.
    % here the mean is calculated as a feature.
    out=mean(abs(aji(1:lag:end-1)-aji(2:lag:end)));
end
    
