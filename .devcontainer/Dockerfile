# Pre-built Dev Container Image for R. More info: https://github.com/rocker-org/devcontainer-images/pkgs/container/devcontainer%2Ftidyverse
# Available R version: 4, 4.1, 4.0
ARG VARIANT="4.2"
FROM ghcr.io/rocker-org/devcontainer/tidyverse:${VARIANT}

RUN install2.r --error --skipinstalled -n -1 \
        statip \
        patchwork \
        paletteer \
        here \
        doParallel \
        janitor \
        vip \
        ranger \
        palmerpenguins \
        skimr \
        nnet \
        kernlab \
        plotly \
        factoextra \
        cluster \
        tidymodels \
        markdown \
        ottr \
        caret \
        GGally \
        rpart.plot \
        modeltools \
    && R -q -e 'remotes::install_github("https://github.com/dcomtois/summarytools/tree/0-8-9")'

COPY install_packages.R /tmp/RCode 
RUN Rscript /tmp/RCode/install_packages.R && rm -rf /tmp/RCode

#COPY db_create.R /tmp/RCode 
#RUN Rscript /tmp/RCode/db_create.R && rm -rf /tmp/RCode

#COPY install_packages.R db_create.R /tmp/RCode
#RUN Rscript /tmp/RCode/install_packages.R Rscript /tmp/RCode/db_create.R Rscript && rm -rf /tmp/RCode

# Install Python packages
COPY requirements.txt /tmp/pip-tmp/
RUN python3 -m pip --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt
