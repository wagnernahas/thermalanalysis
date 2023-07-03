
function [k] = conductivity(index, model, temp)
  por = model(index).porosity;
  ks = model(index).conductivity;
  kw = model(index).waterconductivity;
  k = (ks*(1-por))+(kw*por);
  k = k / (1 + (model(index).alphatemperature)*(temp)); 
end
