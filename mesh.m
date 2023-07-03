
function [g_coord, g_num, material, temp0] = fem(s)
sd = size(s);
numberOfLayers = sd(2);
dx= 1;
i=1;
g_coord(i)=s(1).depthtop;
temp0(i)=s(1).temptop;
i = i+1;
iel = 1;
for ni=1:numberOfLayers
    y1 = s(ni).depthtop;
    y2 = s(ni).depthbase;
    t1 = s(ni).temptop;
    t2 = s(ni).tempbottom;
    m=(t2-t1)/(y2-y1);
    division = (y2-y1)/dx;
    for id=1:division
        g_num(1,iel)=i-1;
        g_num(2,iel)=i;
        material(i-1)=ni;
        iel=iel+1;
        temp0(i) = t1 + m*((g_coord(i-1)+dx) - y1);
        if (s(ni).intrusive==true)
            temp0(i) = s(ni).tempmagma; 
        end
        g_coord(i)=g_coord(i-1)+dx;
        i = i+1;
    end
end
end
