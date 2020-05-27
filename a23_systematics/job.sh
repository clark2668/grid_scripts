#!/usr/bin/env bash

sigma=$1
energy=$2
index=$3
working_dir=$PWD

echo "Version: " $version
echo "Energy: " $energy
echo "Index: " $index

printf "User is: "; whoami
printf "Host is: "; hostname

source /etc/profile.d/modules.sh
source /mnt/research/IceCube/baclark/ara/a23_systematics/env.sh

export setup_file='/mnt/research/IceCube/baclark/ara/a23_systematics/tools/a23_4yr_diffuse_simconfigs/dAdSigma/dAdSigma_'$sigma'_A2_c1_E'$energy'.txt'

cd /mnt/research/IceCube/baclark/ara/a23_systematics/tools/AraSim

./AraSim $setup_file $index $working_dir

cd $working_dir
chmod -R 777 *.root
chmod -R 777 *

cp $working_dir/*.root /mnt/research/IceCube/baclark/ara/a23_systematics/outputs/dAdSigma/dAdSigma${sigma}
rm *.root
