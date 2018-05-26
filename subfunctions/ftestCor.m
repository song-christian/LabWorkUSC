function p = ftestCor(data1,data2)

    sx2 = varianceoftimeseries(data1);
    sy2 = varianceoftimeseries(data2);
    
    if sx2 >= sy2
        F = sx2/sy2;
        p = fcdf(F,length(data1)-1,length(data2)-1,'upper');
        
    else
        F = sy2/sx2;
        p = fcdf(F,length(data2)-1,length(data1)-1,'upper');
    end
end

