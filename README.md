# *TerraFERMA* CIDER Tutorials, June-July 2017, Berkeley CA

TerraFERMA is the *Transparent Finite Element Rapid Model Assembler*, a software system for the  rapid and reproducible construction and exploration of  coupled  multi-physics models.  

This repository contains the input files for the tutorial conducted at the CIDER conference in Berkeley, CA in 2017.

All input files are included in this repository but ``simulation harness'' files are the most convenient way to run the examples
with minimal user configuration required.  This can be done using the `tfsimulationharness` command:

    tfsimulationharness --test <input_filename>.shml

where <input_filename>.shml is one of the files in the main repository directory.  Each example has parameters that may be varied
from the command line (documented below) using the `--parameters` argument:

    tfsimulationharness --parameters <parameter_name> <parameter_value_1> [<parameter_name> <parameters_value_2>] --test <input_filename>.shml

To see the output from the tests without waiting for the simulation to complete (or run again) replace `--test` with `--just-test`:

    tfsimulationharness --parameters <parameter_name> <parameter_value_1> [<parameter_name> <parameters_value_2>] --just-test <input_filename>.shml

Available input files include:

* `poisson_simple.shml`
   
  A simple steady-state heat diffusion in a unit square example with homogeneous Dirichlet boundary conditions.

  Available parameters are:

  * `k` - non-dimensional diffusion coefficient (default = 1)
  * `f` - non-dimensional heat source (default = 1)

  Outputs:

  * plot of the non-dimensional temperature solution

* `driven_cavity_freeslip.shml`
   
  Steady-state solution of the incompressible Stokes equations in a unit square. Free-slip boundary conditions are applied
everywhere except at the top of the domain where shear is driven tangential to the boundary.

  Available parameters are:

  * `dmu` - viscosity jump factor in the lower half of the domain (default = 1, no jump in viscosity)

  Outputs:

  * plot of the non-dimensional velocity solution
  * print out of RMS velocity in the whole domain and its upper and lower sections

* `driven_cavity_noslip.shml`
   
  As in the previous example except with no-slip boundary conditions.  Steady-state solution of the incompressible Stokes equations in a unit square. No-slip boundary conditions are applied
everywhere except at the top of the domain where shear is driven tangential to the boundary.

  Available parameters are:

  * `dmu` - viscosity jump factor in the lower half of the domain (default = 1, no jump in viscosity)

  Outputs:

  * plot of the non-dimensional velocity solution
  * print out of RMS velocity in the whole domain and its upper and lower sections

* `subduction_solid.shml`

  Solves for the temperature distribution in the slab and wedge of a simplified subduction zone using the heat advection-diffusion
and Stokes equations.  Flow is driven by an internal boundary condition along the top of a prescribed slab.  This example is
time-dependent with initial temperature conditions assuming an error function distribution dependent on the age of the slab and
overriding crust.  Simulations are run for 20Myr.

  Available parameters are:

  * `delta` - slab dip in degrees from horizontal (default = 45degrees)
  * `tslab` - age of the incoming slab in Myr (default =  50Myr)
  * `tcrust` - age of the overriding crust in Myr (default = 50Myr)
  * `vslab` - convergence rate of slab and crust in m/yr (default = 0.05m/yr)

  Outputs:
  * plot(s) of the non-dimensional temperature and velocity solutions
  * plot(s) of the temperature at the slab surface as a function of depth
  * plot(s) of the temperature in the wedge as a function of depth above the 100km contour of the slab surface
  * print out of the temperature at the 100km contour of the slab surface
  * print out of the maximum temperature (and its depth) in the wedge above the 100km contour of the slab surface



   

