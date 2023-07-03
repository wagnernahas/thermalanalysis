function [displ, displ0] = solve(g_coord, g_num, material, dt, displ, displ0, model, bcdof, bcval)
tolerance = 0.01 ; % error tolerance
nod = 2;
nip = 2 ; % no. Gauss int. pts per element
% integration data
points = [-sqrt(1/3) sqrt(1/3)] ; % positions of the Gauss points
wts = [1 1] ; % Gauss-Legendre weights
% shape functions and their derivatives (both in local coordinates)
% evaluated at the Gauss integration points
for k=1:nip
    fun_s(k,:) = [ (1-points(k))/2 (1+points(k))/2 ] ; % N1 and N2
    der_s(k,:) = [ -1/2 1/2 ] ; % dN1/xi dN2/xi
end
error = 1 ;
iters = 0 ;
number_of_elements = size(g_num,2);
number_of_nodes = size(g_coord, 2);
while error>tolerance
    iters = iters + 1;
    ff = zeros(number_of_nodes,1);
    lhs = sparse(number_of_nodes,number_of_nodes); % reinitialise global lhs matrix
    rhs = sparse(number_of_nodes,number_of_nodes); % reinitialise global rhs matrix
    for iel=1:number_of_elements % sum over elements
        num = g_num(:,iel) ; % element nodes
        coord = g_coord(:,num)' ; % element coordinates
        KM = zeros(nod,nod) ; % initialisation
        MM = zeros(nod,nod) ;
        MM0 = zeros(nod,nod) ;
        F = zeros(nod,1) ;
        %rho = rhov(phase(iel)) ;
            for k = 1:nip % integration loop
                fun = fun_s(k,:) ; % shape functions
                der = der_s(k,:) ; % der. of shape functions
                jac = der*coord;  % jacobian matrix
                dx = coord(2)-coord(1);
                ri = fun*coord(:,1); % distance from symmetry axis
                detjac = dx/2 ;% factor to scale integration limits
                invjac = 2/dx ;% factor to scale derivatives
                deriv = der*invjac ;%shape. fun. deriv. in phys. coords.
                T = fun*displ(num) ; % T interpolated to int. pt.
                dwt = detjac*wts(k) ;
                K = conductivity(material(iel),model, T);
                rhoCp = cpeffective(material(iel),model, T);
                dehidr = latentHeatDehidatration(material(iel), model, T);
                KM = KM + deriv'*K*deriv*dwt ; % stiffness matrix
                MM = MM + (rhoCp+dehidr)*(fun')*fun*dwt ; % mass matrix
                MM0 = MM0 + (rhoCp+dehidr)*(fun')*fun*dwt; % mass matrix0
                F = dx*0*[1/2 ; 1/2] ; % load vector
            end
        % assemble global matrices
        lhs(num,num) = lhs(num,num) + MM/dt + KM ;
        rhs(num,num) = rhs(num,num) + MM0/dt ;
        ff(num) = ff(num) + F;
    end
        
    %----------------------------------------------------------------
    b = rhs*displ0 + ff; % form rhs global vector
    % impose boundary conditions
    lhs(bcdof,:) = 0 ; % zero the boundary equations
    tmp = spdiags(lhs,0) ; % store diagonal
    tmp(bcdof)=1 ; % place 1 on stored-diagonal
    lhs=spdiags(tmp,0,lhs); % reinsert diagonal
    b(bcdof) = bcval;  % set boundary values
    displ_tmp = displ;  % same temporary solution
    displ = inv(lhs)*b;  % solve system of equations
    error = max(abs(displ-displ_tmp))/max(abs(displ)); % evaluate error
    
end % end while
%displ0 = displ ; % update old solution

end