function nrmse = findnrmse(ycorr)
    nsteps = size(ycorr,2)-1;
    nrmse = zeros(1,length(nsteps));
    for k = 1:length(nsteps)
        err = (ycorr(:,1) - ycorr(:,k+1));
        rmse = norm(err);
        nrmse(k) = 100*(1-rmse/norm( ycorr(:,1)-mean(ycorr(:,1)) ));
    end
end

