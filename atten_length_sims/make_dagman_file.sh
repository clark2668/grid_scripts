#!/bin/bash

job_file=dagman.dag
job_index=1

echo 'CONFIG dagman.config' >> $job_file
echo '' >> $job_file

declare -a newold=("new" "old")
declare -a energies=("17" "18" "19")

for i in "${newold[@]}"
do
	for j in "${energies[@]}"
	do
		for ((njob=1; njob<=400; njob+=1))
		do
			echo 'JOB job_'$job_index job.sub >> $job_file
			echo 'VARS job_'$job_index 'version="'$i'"' 'energy="'$j'"' >> $job_file
			echo '' >> $job_file
			job_index=$(($job_index+1))
		done
	done
done