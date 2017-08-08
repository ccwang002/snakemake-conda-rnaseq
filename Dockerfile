FROM lbwang/alpine-glibc-conda

## Install git
RUN apk add --no-cache git

RUN conda install -y python=3.6 stringtie "samtools<1.5" hisat2 snakemake && \
    conda uninstall -y snakemake && \
    conda clean -y --all

RUN git clone https://ccwang002@bitbucket.org/ccwang002/snakemake.git /opt/snakemake && \
    cd /opt/snakemake && \
    git checkout add-gs-remoteobj-name && \
    python setup.py install && \
    cd ~ && \
    rm -rf /opt/snakemake

RUN pip install --no-cache-dir google-cloud-storage
