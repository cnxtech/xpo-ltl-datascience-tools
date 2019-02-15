#!/bin/bash
# Create baseline Anaconda environment with basic DS/ML packages

BASHRC="${HOME}/.bashrc"

while getopts n: option
do
  case "${option}"
    in
    n) ENV_NAME=${OPTARG};;
  esac
done

if [ -z "$ENV_NAME" ]
then
  echo "Environment name must be provided."
  exit 1
fi

# Install conda and set up base environment
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda3.sh
bash miniconda3.sh -b 
source ~/.bashrc
# Get our base config
wget https://git.io/fh7Hs -O environment.yml
conda env create -n $ENV_NAME -f environment.yml

conda activate $ENV_NAME
python -m ipykernel install --user --name $ENV_NAME --display-name "Python (${ENV_NAME})"

echo $ENV_NAME
