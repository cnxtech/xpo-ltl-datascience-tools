# xpo-ltl-datascience-tools

## Conda setup works

Say you're running a new container/server/VM instance and you need a working Python 3 distribution with your normal ML/DS tools. Instead of installing everything manually, you can run this.

```
$ curl -L https://git.io/fh5kg | bash -n [env_name]

```

This will install the latest version of Miniconda3 and a set of baseline packages including the following:

```
- pip
- numpy
- scikit-learn
- pandas
- scipy
- elasticsearch
- matplotlib
- keras
- tensorflow
- theano
- pyodbc
```
It will also use `ipykernel` to register your environment for use with jupyterhub as well. Currently only works with Linux distros.
