function u = genInput(reps,sampsPerRep, minSamps, mode, p, mag, offSamps, offset, offInit, offEnd)
    utmp = zeros(1,sampsPerRep);
    switch mode
        case 0 % binary noise
            flips = (2*binornd(1,p,1,sampsPerRep/minSamps))-1;
            utmp(1:minSamps) = 2*binornd(1,p)-1;
            for k = 2:sampsPerRep/minSamps
                utmp(minSamps*(k-1)+1:minSamps*k) = flips(k-1)*utmp(k-1);
            end
            
            u = repmat(mag*utmp,1,reps);
        case 1 % binary noise with off stim between reps
            flips = (2*binornd(1,p,1,sampsPerRep/minSamps))-1;
            utmp(1:minSamps) = 2*binornd(1,p)-1;
            for k = 2:sampsPerRep/minSamps
                utmp(minSamps*(k-1)+1:minSamps*k) = flips(k-1)*utmp(k-1);
            end
            if ~exist('offSamps','var')
                u = repmat([mag*utmp + mag + offset, zeros(1,minSamps)],1,reps);
            else
                u = repmat([mag*utmp + mag + offset, zeros(1,offSamps)],1,reps);
            end
            u = [zeros(1,offInit), u, zeros(1,offEnd)];
        case 2
            
        case 3
    end
end

