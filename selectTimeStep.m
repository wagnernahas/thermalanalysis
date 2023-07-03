function [dt, initial] = selectTimeStep(t, totaltime, dt, time, initial)
ntime1 = size(time);
ntime = ntime1(2) ;
atual = t;
proximo = t+dt;
if (initial < ntime)
    if ( (proximo >= time(initial)) )
        dt = time(initial) - t;
        initial = initial +1;
    end
end
if ((t) ~= totaltime)
    if ((t+dt) > totaltime)
        dt = totaltime-t;
    end
end
end
