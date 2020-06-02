#!/usr/bin/env bash

energy=$1
index=$2
working_dir=$PWD

echo "Version: " $version
echo "Energy: " $energy
echo "Index: " $index

printf "User is: "; whoami
printf "Host is: "; hostname

source /etc/profile.d/modules.sh
source /mnt/research/IceCube/baclark/IceCube/work_with_jorge/env.sh

export setup_file='/mnt/research/IceCube/baclark/IceCube/work_with_jorge/comparison_studies/SETUP/sim_comparison/setupRNO_comparison_E'$energy'.txt'

cd /mnt/research/IceCube/baclark/IceCube/work_with_jorge/comparison_studies

index=$((index+4000))

./AraSim $setup_file $index $working_dir

cd $working_dir
chmod -R 777 *.root
chmod -R 777 *

cp $working_dir/*.root /mnt/research/IceCube/baclark/IceCube/work_with_jorge/output/E${energy}/${sigma}
rm *.root
