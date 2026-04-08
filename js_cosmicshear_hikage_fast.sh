#!/bin/bash -l
#SBATCH --qos=regular
#SBATCH -J test-hik
#SBATCH -n 256
#SBATCH --cpus-per-task=1
#SBATCH --constraint=cpu
#SBATCH --time=03:00:00
#SBATCH -o shear_chain.log
#SBATCH -e shear_chain.error
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ignacio.sevilla@ciemat.es

# Put here the path to the desc tutorial repo location
cd $HOME/minimal_mcmc

# Load environment
source /global/cfs/cdirs/lsst/groups/MCP/setup-cosmology.sh

time srun -N 2 cosmosis --mpi cosmicshear_multinest_hikage.ini -v cosmological_parameters.h0=0.69 cosmological_parameters.n_s=0.96  firecrown_two_point.source_0_delta_z=0.0 firecrown_two_point.source_1_delta_z=0.0 firecrown_two_point.source_2_delta_z=0.0 firecrown_two_point.source_3_delta_z=1.0 firecrown_two_point.mult_bias=0.0  firecrown_two_point.a_ia=0.0 firecrown_two_point.eta_eff=0.0 
#cosmosis cosmicshear_multinest_hikage.ini -p runtime.sampler=test 
