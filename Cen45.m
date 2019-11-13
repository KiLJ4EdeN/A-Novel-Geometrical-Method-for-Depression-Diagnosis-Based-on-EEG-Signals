% Cen45







function [out D] = Cen45(time_series, lag)

    for k=1:length(time_series)-5
cx(k)=mean([ld3(k),ld3(k+2),ld3(k+4)]);
cy(k)=mean([ld3(k+1),ld3(k+3),ld3(k+5)]);
D(k)=(abs(cx(k)-cy(k)))/sqrt(2);
D=D(1:lag:end);
    end
    out=mean(abs(abi(1:end-5)-abi(6:end)));
end
