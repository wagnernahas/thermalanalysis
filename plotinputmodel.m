
function plotinputmodel(model)
%---------------------------------------------------------
% plotting
figure(1)
sd = size(model);
number_of_layers = sd(2);
ymax = model(1).depthtop;
ymin = model(number_of_layers).depthbase;
tiledlayout(1,4) % Requires R2019b or later
nexttile
%set(gca, 'YDir','reverse')
for ni=1:number_of_layers
y1 = model(ni).depthtop;
y2 = model(ni).depthbase;
x1 =0;
x2 =1;
x=[x1 x2 x2 x1];
y=[y2 y2 y1 y1];
fill(x,y, model(ni).color);
hold on
end
title('Lithology')
xlabel(' ')
ylabel('Depth (m)')
%hold off
xlim auto
ylim ([ymax ymin]);
set(gca, 'YDir','reverse')
drawnow

nexttile
i=1;
for ni=1:number_of_layers
y1 = model(ni).porosity;
y2 = model(ni).porosity;
x1 =model(ni).depthtop;
x2 =model(ni).depthbase;
x(i)=y1;
xc(i)=model(ni).conductivity;
xd(i)=model(ni).density;
y(i)=x1;
i=i+1;
x(i)=y2;
xc(i)=model(ni).conductivity;
xd(i)=model(ni).density;
y(i)=x2;
i=i+1;
end
plot(x,y, 'b');
hold on
if (number_of_layers == 1) 
    return 
end
%nexttile
xlim auto
ylim auto
title('Porosity (-) ')
xlabel(' ')
ylabel('Depth (m)')
xlim auto
ylim ([ymax ymin]);
set(gca, 'YDir','reverse')
hold on
drawnow


nexttile
plot(xc,y, 'b');
xlim auto
ylim auto
title('Thermal Condutivity - (Wm/K) ')
xlabel(' ')
ylabel('Depth (m)')
xlim auto
ylim ([ymax ymin]);
set(gca, 'YDir','reverse')
hold on
drawnow


nexttile
xlim auto
ylim auto
plot(xd,y, 'b');
title('Density (kg/m3) ')
xlabel(' ')
ylabel('Depth (m)')
xlim auto
ylim ([ymax ymin]);
set(gca, 'YDir','reverse')
hold on
drawnow

end
