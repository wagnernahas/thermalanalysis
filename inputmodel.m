
function [model] = inputmodel()
%Layer 1
model(1).name = 'SAL';
model(1).depthtop = 0;
model(1).depthbase = 500;
model(1).temptop = 44;
model(1).tempbottom = 51;
model(1).conductivity = 5.8;
model(1).porosity = 0.0;
model(1).cpmatrix = 926;
model(1).cpfluid = 4182;
model(1).density = 2600;
model(1).waterconductivity = 0.6;
model(1).waterdensity = 1031;
model(1).color = 'm';
model(1).intrusive = false;
model(1).alphatemperature = 10e-3;
model(1).td1temperature = 350;
model(1).td2temperature = 650;
model(1).latentHeatDehidadration = 0; 

%Layer 2
model(2).name = 'DIABASIO';
model(2).depthtop = 500;
model(2).depthbase = 556;
model(2).temptop = 51;
model(2).tempbottom = 52;
model(2).conductivity = 2.1;
model(2).porosity = 0.0;
model(2).cpmatrix = 1250;
model(2).cpfluid = 4182;
model(2).density = 2900;
model(2).waterconductivity = 0.6;
model(2).waterdensity = 1031;
model(2).color = 'r';
model(2).intrusive = true;
model(2).cpmagma = 1250;
model(2).tempmagma = 1000;
model(2).latentheat = 420;
model(2).tempsolidus = 900;
model(2).alphatemperature = 1E-4;
model(2).td1temperature = 350;
model(2).td2temperature = 650;
model(2).latentHeatDehidadration = 0; 

%Layer 3
model(3).name = 'CARBONATO';
model(3).depthtop = 556;
model(3).depthbase = 651;
model(3).temptop = 52;
model(3).tempbottom = 56.6;
model(3).conductivity = 2.08;
model(3).porosity = 0.05;
model(3).cpmatrix = 816;
model(3).cpfluid = 4182;
model(3).density = 2720;
model(3).waterconductivity = 0.6;
model(3).waterdensity = 1031;
model(3).color = 'r';
model(3).intrusive = false;
model(3).alphatemperature = 5E-4;
model(3).td1temperature = 350;
model(3).td2temperature = 650;
model(3).latentHeatDehidadration = 0; 

%Camada 4
model(4).name = 'CARBONATO';
model(4).depthtop = 651;
model(4).depthbase = 683;
model(4).temptop = 56.6;
model(4).tempbottom = 58.2;
model(4).conductivity = 2.08;
model(4).porosity = 0.1;
model(4).cpmatrix = 816;
model(4).cpfluid = 4182;
model(4).density = 2720;
model(4).waterconductivity = 0.6;
model(4).waterdensity = 1031;
model(4).color = 'g';
model(4).intrusive = false;
model(4).alphatemperature = 5E-4;
model(4).td1temperature = 350;
model(4).td2temperature = 650;
model(4).latentHeatDehidadration = 0; 

%Layer 5
model(5).name = 'CRB';
model(5).depthtop = 683;
model(5).depthbase = 873;
model(5).temptop = 58.2;
model(5).tempbottom = 65.6;
model(5).conductivity = 2.13;
model(5).porosity = 0.16;
model(5).cpmatrix = 823;
model(5).cpfluid = 4182;
model(5).density = 2712;
model(5).waterconductivity = 0.6;
model(5).waterdensity = 1031;
model(5).color = 'g';
model(5).intrusive = false;
model(5).alphatemperature = 5E-4;
model(5).td1temperature = 350;
model(5).td2temperature = 650;
model(5).latentHeatDehidadration = 0; 

%Layer 6
model(6).name = 'FOLHELHO';
model(6).depthtop = 873;
model(6).depthbase = 1011;
model(6).temptop = 65.6;
model(6).tempbottom = 70.9;
model(6).conductivity = 2.57;
model(6).porosity = 0.11;
model(6).cpmatrix = 828;
model(6).cpfluid = 4182;
model(6).density = 2671;
model(6).waterconductivity = 0.6;
model(6).waterdensity = 1031;
model(6).color = 'b';
model(6).intrusive = false;
model(6).cpmagma = 1250;
model(6).tempmagma = 1000;
model(6).latentheat = 420;
model(6).tempsolidus = 900;
model(6).alphatemperature = 2.52E-4;
model(6).td1temperature = 350;
model(6).td2temperature = 650;
model(6).latentHeatDehidadration = 0; 

%Layer 7
model(7).name = 'ARENITO';
model(7).depthtop = 1011;
model(7).depthbase = 1080;
model(7).temptop = 70.9;
model(7).tempbottom = 73;
model(7).conductivity = 3.2;
model(7).porosity = 0.13;
model(7).cpmatrix = 774;
model(7).cpfluid = 4182;
model(7).density = 2650;
model(7).waterconductivity = 0.6;
model(7).waterdensity = 1031;
model(7).color = 'y';
model(7).intrusive = false;
model(7).alphatemperature = 3E-3;
model(7).td1temperature = 350;
model(7).td2temperature = 650;
model(7).latentHeatDehidadration = 0;

end
