% Cen45
% Centroid to 45-degree line distance is a new complexity measure based on cartesian state space distance.
% Usages: capture variability, long term correlations with different lag numbers.
% Comparable to entropy measures such as sampen and apen, and other distance based entropy techniques. 
% Based on poincare recurrence plots.
%{
This function captures the variability in the time_series by decomposing each 6 consecutive data points into a triangle,
And computing the the shortest distances between each triangle center and the x=y line.
 %
 %	
 %
 %
 Inputs :
 time_series : 1*N column vector.
 lag : distance between chosen points for triangle edges.
 example usage :
 time_series = rand(1,500);
 [out D] = Cen45(time_series);
 plot(D)
 out
 note that this results in a differentiation from the average of the in distances between centroids.
 to use the Centroid distance variability sequence a second output D must be specified.
%}







function [out D] = Cen45(time_series, lag)

    for k=1:length(time_series)-5
cx(k)=mean([ld3(k),ld3(k+2),ld3(k+4)]);
cy(k)=mean([ld3(k+1),ld3(k+3),ld3(k+5)]);
D(k)=(abs(cx(k)-cy(k)))/sqrt(2);
D=D(1:lag:end);
    end
    out=mean(abs(abi(1:end-5)-abi(6:end)));
end
