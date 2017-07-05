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

  * `k` - non-dimensional diffusion coefficient (default = [0.1, 1.0, 10.0])
  * `f` - non-dimensional heat source (default = [0.1, 1.0, 10.0])
  * `ncells` - number of cells in each dimension of the unit square (default = [16, 32, 64])

  Outputs:

  * plot of the non-dimensional temperature solution
  * print out of the maximum and integral of the non-dimensional temperature

* `driven_cavity_freeslip.shml`
   
  Steady-state solution of the incompressible Stokes equations in a unit square. Free-slip boundary conditions are applied
everywhere except at the top of the domain where shear is driven tangential to the boundary.

  Available parameters are:

  * `dmu` - viscosity jump factor in the lower half of the domain (default = [0.1, 1.0, 10.0])
  * `ncells` - number of cells in each dimension of the unit square (default = [16, 32, 64])

  Outputs:

  * plot of the non-dimensional velocity solution
  * print out of RMS velocity in the whole domain and its upper and lower sections

* `driven_cavity_noslip.shml`
   
  As in the previous example except with no-slip boundary conditions.  Steady-state solution of the incompressible Stokes equations in a unit square. No-slip boundary conditions are applied
everywhere except at the top of the domain where shear is driven tangential to the boundary.

  Available parameters are:

  * `dmu` - viscosity jump factor in the lower half of the domain (default = [0.1, 1.0, 10.0])
  * `ncells` - number of cells in each dimension of the unit square (default = [16, 32, 64])

  Outputs:

  * plot of the non-dimensional velocity solution
  * print out of RMS velocity in the whole domain and its upper and lower sections

* `subduction_solid.shml`

  Solves for the temperature distribution in the slab and wedge of a simplified subduction zone using the heat advection-diffusion
and Stokes equations.  Flow is driven by an internal boundary condition along the top of a prescribed slab.  This example is
time-dependent with initial temperature conditions assuming an error function distribution dependent on the age of the slab and
overriding crust.  Simulations are run for 20Myr.

  Available parameters are:

  * `delta` - slab dip in degrees from horizontal (default = [30.0, 45.0]degrees)
  * `tslab` - age of the incoming slab in Myr (default =  [20.0, 50.0]Myr)
  * `tcrust` - age of the overriding crust in Myr (default = [20.0, 50.0]Myr)
  * `vslab` - convergence rate of slab and crust in m/yr (default = [0.02, 0.05]m/yr)
  * `cpdepth` - depth of mechanical coupling between the slab and the wedge (default = 80.0km)
  * `mindx` - minimum element edge length of the wedge corner in km (default = [1.0, 2.0, 3.0, 5.0]km)

  Outputs:
  * animation(s) of the re-dimensionalized temperature and velocity over time
  * plot(s) of the re-dimensionalized temperature and velocity solutions at the end of the simulation
  * plot(s) of the temperature at the slab surface as a function of depth
  * plot(s) of the temperature in the wedge as a function of depth above the 100km contour of the slab surface
  * print out of the temperature at the 100km contour of the slab surface
  * print out of the maximum temperature (and its depth) in the wedge above the 100km contour of the slab surface

* `subduction_fluidbuoyancy.shml`

  Simulation of porous media aqueous fluid flow across a subduction zone wedge assuming that the fluid is only driven by buoyancy
(zero-compaction length approximation).  Length of simulations varies depending on w0onv0 (50 times the amount of time for the
reference fluid to traverse the wedge).

  Available parameters are:

  * `delta` - slab dip in degrees from horizontal (default = 45.0degrees)
  * `tslab` - age of the incoming slab in Myr (default =  50.0Myr)
  * `tcrust` - age of the overriding crust in Myr (default = 50.0Myr)
  * `vslab` - convergence rate of slab and crust in m/yr (default = 0.05m/yr)
  * `cpdepth` - depth of mechanical coupling between the slab and the wedge (default = 80.0km)
  * `mindx` - minimum element edge length of the wedge corner in km (default = 3.0km)
  * `fluxdepth` - depth at which fluid flux is imposed at base of wedge (default = 150.0 km)
  * `w0onv0` - ratio of reference fluid to solid velocities (default = [5.0, 50.0, 500.0]km)

  Outputs (re-dimensionalization assumes known input flux integral):
  * animation(s) of the re-dimensionalized porosity (fluid fraction) over time
  * time-averaged plot(s) of the re-dimensionalized porosity

* `subduction_fluidcompaction.shml`

  Simulation of porous media aqueous fluid flow across a subduction zone wedge assuming that the fluid is driven by buoyancy and
compaction (still ignore dynamic pressure).  Length of simulations varies depending on w0onv0 (50 times the amount of time for the
reference fluid to traverse the wedge).

  Available parameters are:

  * `delta` - slab dip in degrees from horizontal (default = 45.0degrees)
  * `tslab` - age of the incoming slab in Myr (default =  50.0Myr)
  * `tcrust` - age of the overriding crust in Myr (default = 50.0Myr)
  * `vslab` - convergence rate of slab and crust in m/yr (default = 0.05m/yr)
  * `cpdepth` - depth of mechanical coupling between the slab and the wedge (default = 80.0km)
  * `mindx` - minimum element edge length of the wedge corner in km (default = 3.0km)
  * `fluxdepth` - depth at which fluid flux is imposed at base of wedge (default = 150.0 km)
  * `w0onv0` - ratio of reference fluid to solid velocities (default = [5.0, 50.0, 500.0]km)

  Outputs (re-dimensionalization assumes known input flux integral):
  * animation(s) of the re-dimensionalized porosity (fluid fraction) over time
  * time-averaged plot(s) of the re-dimensionalized porosity

* `subduction_benchmark1a.shml`

  Solves subduction benchmark 1a from van Keken et al. (2008) [doi:10.1016/j.pepi.2008.04.015] for the temperature distribution in
the wedge.

  Available parameters are:

  * `mindx` - minimum element edge length of the wedge corner in km (default = [3.0, 2.0, 1.0, 0.5, 0.25]km)

  Outputs:
  * plot(s) of the re-dimensionalized temperature and velocity solutions
  * plot(s) of the temperature at the slab surface as a function of depth
  * print out of the temperature at the 60km contour of the slab surface (and compares to the benchmark result T_{11,11})
  * print out of the integrated temperature along the slab (and compares to the benchmark result ||T_{slab}||)
  * print out of the integrated temperature in the wedge (and compares to the benchmark result ||T_{wedge}||)

* `subduction_benchmark1b.shml`

  Solves subduction benchmark 1b from van Keken et al. (2008) [doi:10.1016/j.pepi.2008.04.015] for the temperature and velocity
distributions in an isoviscous wedge with essential velocity boundary conditions.

  Available parameters are:

  * `mindx` - minimum element edge length of the wedge corner in km (default = [3.0, 2.0, 1.0, 0.5, 0.25]km)

  Outputs:
  * plot(s) of the re-dimensionalized temperature and velocity solutions
  * plot(s) of the temperature at the slab surface as a function of depth
  * print out of the temperature at the 60km contour of the slab surface (and compares to the benchmark result T_{11,11})
  * print out of the integrated temperature along the slab (and compares to the benchmark result ||T_{slab}||)
  * print out of the integrated temperature in the wedge (and compares to the benchmark result ||T_{wedge}||)

* `subduction_benchmark1c.shml`

  Solves subduction benchmark 1c from van Keken et al. (2008) [doi:10.1016/j.pepi.2008.04.015] for the temperature and velocity
distributions in an isoviscous wedge with natural velocity boundary conditions on the wedge side.

  Available parameters are:

  * `mindx` - minimum element edge length of the wedge corner in km (default = [3.0, 2.0, 1.0, 0.5, 0.25]km)

  Outputs:
  * plot(s) of the re-dimensionalized temperature and velocity solutions
  * plot(s) of the temperature at the slab surface as a function of depth
  * print out of the temperature at the 60km contour of the slab surface (and compares to the benchmark result T_{11,11})
  * print out of the integrated temperature along the slab (and compares to the benchmark result ||T_{slab}||)
  * print out of the integrated temperature in the wedge (and compares to the benchmark result ||T_{wedge}||)

* `subduction_benchmark2a.shml`

  Solves subduction benchmark 2a from van Keken et al. (2008) [doi:10.1016/j.pepi.2008.04.015] for the temperature and velocity
distributions in a diffusion creep rheology wedge with natural velocity boundary conditions on the wedge side.

  Available parameters are:

  * `mindx` - minimum element edge length of the wedge corner in km (default = [2.0, 1.0, 0.5, 0.25]km)

  Outputs:
  * plot(s) of the re-dimensionalized temperature and velocity solutions
  * plot(s) of the temperature at the slab surface as a function of depth
  * print out of the temperature at the 60km contour of the slab surface (and compares to the benchmark result T_{11,11})
  * print out of the integrated temperature along the slab (and compares to the benchmark result ||T_{slab}||)
  * print out of the integrated temperature in the wedge (and compares to the benchmark result ||T_{wedge}||)

* `subduction_benchmark2b.shml`

  Solves subduction benchmark 2b from van Keken et al. (2008) [doi:10.1016/j.pepi.2008.04.015] for the temperature and velocity
distributions in a dislocation creep rheology wedge with natural velocity boundary conditions on the wedge side.

  Available parameters are:

  * `mindx` - minimum element edge length of the wedge corner in km (default = [2.0, 1.0, 0.5, 0.25]km)

  Outputs:
  * plot(s) of the re-dimensionalized temperature and velocity solutions
  * plot(s) of the temperature at the slab surface as a function of depth
  * print out of the temperature at the 60km contour of the slab surface (and compares to the benchmark result T_{11,11})
  * print out of the integrated temperature along the slab (and compares to the benchmark result ||T_{slab}||)
  * print out of the integrated temperature in the wedge (and compares to the benchmark result ||T_{wedge}||)

