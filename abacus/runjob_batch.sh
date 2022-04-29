#!/bin/bash

# Compile executable for 
cd /homedtic/emunoz/codes/abaqus/complete/L2L3/
ifort exec_batch.f

# Run executable for list of simulation
cd /homedtic/emunoz/codes/abaqus/complete/L2L3/
./a.out

