
function [printTime] = isTimeToPrint(t, time)
ntime1 = size(time);
ntime = ntime1(2) ;
printTime = false;
for nt=1:ntime
    it = time(nt);
    if ( t == it )
        printTime = true;
        break;
    end
end
end 
