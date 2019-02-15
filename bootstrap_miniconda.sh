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

if ! grep -q "conda" ~/.bashrc; then
cat <<EOT >> ~/.bashrc
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '~/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then
        . "~/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="~/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
EOT
fi


source ~/.bashrc
# Update and get our base config
conda update -n base -c defaults conda -y
wget https://git.io/fh7Hs -O environment.yml
conda env create -n $ENV_NAME -f environment.yml

source ~/miniconda3/bin/activate $ENV_NAME
pip install ipykernel
python -m ipykernel install --user --name $ENV_NAME --display-name "Python (${ENV_NAME})"

echo $ENV_NAME
