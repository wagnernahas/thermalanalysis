% code developed by Prof. Wagner Nahas - 06/2023
% mail: wagnernahas@poli.ufrj.br
% solve 1D equation for thermal analysis in porous media
% using standard Galerkin FEM
clc
clf
clear all

% physical parameters
seconds_per_yr = 60*60*24*365; % number of seconds in one year

% input data model
model = inputmodel();

% input total time and time to print (time in seconds)
[time, totaltime] = timeToPrint();

% generate mesh coords and elements
[g_coord, g_num, material, temp0] = mesh(model) ;

% initial conditions and variable initialization
number_of_elements = size(g_num,2);
number_of_nodes = size(g_coord, 2);

displ = zeros(number_of_nodes,1); 
displ = temp0'; % Initial temperature (ºC)
displ0 = displ ; % save old temperature

% define boundary conditions
number_of_layers = size(model,2);
bcdof = [ 1 number_of_nodes ] ; % boundary nodes
temp_top = model(1).temptop;
temp_bottom = model(number_of_layers).tempbottom;
bcval = [ temp_top temp_bottom ] ; % boudary values
figure(2)
title('0Ma');
ymax = model(1).depthtop;
ymin = model(number_of_layers).depthbase;
ax1 = nexttile;
plot(temp0,g_coord,'-', 'color','r');
title('Temperature')
xlabel(' ')
ylabel('Depth (m)')
xlim ([min(temp0) max(temp0)]);
ylim ([ymax ymin]);
set(gca, 'YDir','reverse')
hold on
drawnow

plotinputmodel(model)

t=0;
initial = 1
dt = 100*seconds_per_yr ; % time step (s)
dtoriginal = dt;
while (t <= totaltime)

    [dt, initial] = selectTimeStep(t, totaltime, dt, time, initial);
    t = t + dt ;tolerance = 0.01 ; % error tolerance

    [displ, displ0] = solve(g_coord, g_num, material, dt, displ, displ0, model, bcdof, bcval);

    displ0 = displ;
    dt = dtoriginal;

    if (isTimeToPrint(t,time) == true)    
        plot(ax1,displ',g_coord);
        set(gca, 'YDir','reverse')
        hold on
        drawnow
        clc
        t/seconds_per_yr/1000
    end
end

