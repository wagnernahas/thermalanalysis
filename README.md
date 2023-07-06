# thermalanalysis
The formulation applied here is based in modelling of heat transfer from sill to the host rocks related to a simple 1D of porous media energy equation without fluid flow. The porous media has a solid domain (rock matrix), and a pore structure (voids) which are fluid filled, in this system a the energy equation[[1]](#1) can be defined as: 
$$\mathrm{\frac{\partial ((\phi\rho_f c_f+(1-\phi)\rho_m c_m)T)}{\partial t} =\nabla.((\phi K_f+(1-\phi) K_m)\nabla T)+H_L+H_D}$$
where $T$ is the temperature, $\rho_m$ is the rock density, $\rho_f$ is the fluid density, $c_m$ is the specific heat capacity of rock, $c_f$ is the specific heat capacity of fluid, $K_m$ is the thermal diffusivity of rock, $K_f$ is the thermal diffusivity of fluid and $\phi$ is the porosity. The terms $H_L$ and $H_D$, respectivaly, crystallization latent heat of magma and latent heat of dehydration of host rocks, are defined similary as presented in [[1]](#1) and [[2]](#2) :
$$\mathrm{H_L =\frac{\rho_m L_c}{(T_{c1}-T_{c2})} \frac{\partial T}{\partial t}}$$ and $$\mathrm{H_D =\frac{(1-\phi) \rho_m L_d}{(T_{d1}-T_{d2})} \frac{\partial T}{\partial t}}$$
where $L_c$ is the crystallization latent heat of magma, $T_{c1}-T_{c2}$ is the crystallization temperature range of crystallization of melted magma, $L_d$ is the latent heat of dehydration and $T_{d1}-T_{d2}$ is the temperature range of dehydration of host rocks. In host rocks the $H_L$ becomes zero and $H_D$ becomes zero in the sills.
The energy equation, subject to initial and boundary condition on $T$ is solve by numerical analysis applying the traditional formulation of finite element method, using one-dimensional elements[[3]](#3) .

The implementation of the current code was maintained thinking about the academic and research objectives.

## References
<a id="1">[1]</a> 
Wang, D., and M. Manga. (2015). Organic matter maturation in the contact aureole of an igneous sill as a tracer of hydrothermal convection, J. Geophys. Res. Solid Earth, 120, 4102–4112, doi:10.1002/2015JB011877.

<a id="2">[2]</a> 
Galushkin. (1997). Thermal effects of igneous intrusions on maturity of organic matter: A possible mechanism of intrusion, Org. Geochem., 26(11–12), 645–658.

<a id="3">[3]</a> 
Sympson, G. (2017). Practical finite element modeling in Earth Science using Matlab. John Wiley & Sons Ltd. ISBN: 9781119248620.
