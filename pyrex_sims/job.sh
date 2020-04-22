#!/bin/bash

energy=$1
index=$2
working_dir=$PWD

source /mnt/research/IceCube/baclark/IceCube/radio_sims/tools/env.sh

cd /mnt/research/IceCube/baclark/IceCube/radio_sims/scripts

python run_sim.py -e $energy -i $index -n 10 -o $working_dir

cd $working_dir
chmod -R 777 *.log
chmod -R 777 *.hdf5

mv $working_dir/*.log  /mnt/research/IceCube/baclark/IceCube/radio_sims/output/E${energy}/
mv $working_dir/*.hdf5 /mnt/research/IceCube/baclark/IceCube/radio_sims/output/E${energy}/

