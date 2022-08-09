FROM jupyter/scipy-notebook:latest

USER root

RUN apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

RUN conda install --quiet --yes -c \
    conda-forge 'optuna' \ 
    'neptune-client' \
    'neptune-optuna' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER root
