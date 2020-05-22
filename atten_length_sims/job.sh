B1;95;0c#!/usr/bin/env bash

version=$1
energy=$2
index=$3
working_dir=$PWD

echo "Version: " $version
echo "Energy: " $energy
echo "Index: " $index

printf "User is: "; whoami
printf "Host is: "; hostname

source /etc/profile.d/modules.sh
source /mnt/research/IceCube/baclark/ara/atten_length_comparison/env.sh

export setup_file='/mnt/research/IceCube/baclark/ara/atten_length_comparison/sims/setups/setup_E'$energy'.txt'

cd /mnt/research/IceCube/baclark/ara/atten_length_comparison/sims/$version

echo $PWD

./AraSim $setup_file $index $working_dir

cd $working_dir
chmod -R 777 *.root
chmod -R 777 *

mv $working_dir/*.root /mnt/research/IceCube/baclark/ara/atten_length_comparison/output/${version}/E${energy}
