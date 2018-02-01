FROM jupyter/tensorflow-notebook:2c80cf3537ca

RUN conda install --quiet --yes \
    'dlib=19.4*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR
