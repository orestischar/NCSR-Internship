# NCSR-Internship
Neuron Simulation using the Leaky Integrate-and-Fire (LIF) model

In this project we researched synchronization phenomena in neuron models. More specifically, we implemented the Leaky Integrate-and-Fire model on a non-local ring network.
By alternating the loss coefficient 'λ', the coupling strenth 'σ' and the initial conditions of the system we observed the creation of chimera states.

For the simulation algorithm implemented in C++, we used the Euler Method. The parameters for the simulation are: the number of neighbors R in each direction for every neuron in each direction, the loss coefficient λ, the coupling strength σ, the total number of neurons N, our seed (we used a seed array and alternated between 4 different seeds) and the sign of the sum +/- alternating between excitatory and inhibitory behavior respectively.

Most of the simulations were executed in the hyper-computer HPC Aris. The graphs from our txt results were created using gnuplot.

The results as well as a thorough explanation of the simulation can be observed thouroughly in the report file.
The project was created through my Internship in National Centre of Scientific Research "Demokritos" supervised by Dr. Astero Provata.
