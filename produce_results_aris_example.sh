#!/bin/bash

#SBATCH --job-name=LIF    # Job name
#SBATCH --output=LIF.%j.out # Stdout (%j expands to jobId)
#SBATCH --error=LIF.%j.err # Stderr (%j expands to jobId)
#SBATCH --ntasks=1     # Number of tasks(processes)
#SBATCH --nodes=1     # Number of nodes requested
#SBATCH --ntasks-per-node=1     # Tasks per node
#SBATCH --cpus-per-task=20     # Threads per task
#SBATCH --time=50:00:00   # walltime
#SBATCH --partition=taskp    # Partition
#SBATCH --account=pr007011_taskp    # Replace with your system project


Ls="0.0"
Ss="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0"
Ns="800 850 900 950 1000 1050 1100 1150 1200"
#Rs="50 100 200 350"
r="270"
seed=1
sign="-1" # 1 for positive -1 for negative

for l in $Ls; do
	for s in $Ss; do
		for N in $Ns; do
			./lif $r $l $s $N $seed $sign &
		done
	done
done
wait
