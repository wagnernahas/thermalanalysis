
function [dehidr] = latentHeatDehidatration(index, s, temp)
    por = s(index).porosity;
    rho = s(index).density;
    %isempty(s(index).tf)
    if (temp>=350 && temp<=650)
        td1 = s(index).td1temperature;
        td2 = s(index).td2temperature;
        Ld = s(index).latentHeatDehidadration; 
        dehidr = (1-por)*rho* Ld/(td2-td1);
    else
        dehidr = 0.0;
    end
end
