#!/bin/bash
#SBATCH --partition=cpu_short # partition on which to run
#SBATCH --job-name=step1 # name 
#SBATCH --mail-type=ALL #Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email #Where to send mail
#SBATCH --ntasks=10
#SBATCH --mem-per-cpu=8gb #Job memory request ##max 128GB
#SBATCH --time=12:00:00 #Time limit hrs:min:sec
#SBATCH --output=./fastqc/pre_trimming/fastqc_script.log #Standard output and error log
#SBATCH --no-kill

cd "$1""/fastq"

source /file_path/anaconda3/bin/activate rnaseq_pipeline

fastqc -t 10 *.fastq.gz -o ../fastqc/pre_trimming
