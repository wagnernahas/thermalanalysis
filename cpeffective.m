
function [cp] = cpeffective(index, s, temp)
  por = s(index).porosity;
  c = s(index).cpmatrix;
  rho = s(index).density;
  cw = s(index).cpfluid;
  rhow = s(index).waterdensity;
  if (s(index).intrusive == true)
    if (temp < s(index).tempsolidus)
        cp = (c*rho*(1-por)) + (cw*rhow*por);
    else
        Ts = s(index).tempsolidus;
        Tm = s(index).tempmagma;
        L = s(index).latentheat;
        cm = s(index).cpmagma;
        c = cm*(1 + L/(Tm-Ts));
        cp = (c*rho*(1-por)) + (cw*rhow*por);
    end
  else
    cp = (c*rho*(1-por)) + (cw*rhow*por);    
  end
  %%Wang
  
end
