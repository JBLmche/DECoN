### from shiny-verse
FROM rocker/shiny-verse:latest

LABEL maintainer="jean-baptiste.lamouche@chru-strasbourg.fr"

### system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    git


### install R packages required

RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github('andrewsali/shinycssloaders')"
RUN R -e "install.packages('lubridate', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('magrittr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('glue', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('plotly', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('packrat', repos='http://cran.rstudio.com/')"
RUN R -e ".libPaths(c( .libPaths(), '/home/APP_DC/DECoN/Linux/packrat/lib/x86_64-pc-linux-gnu/3.6.1'))"


EXPOSE 3838

### get DECoN app
WORKDIR /home/APP_DC
RUN git clone https://github.com/RahmanTeam/DECoN.git

### avoid R issues
COPY Rcpp /home/APP_DC/DECoN/Linux/packrat/lib/x86_64-pc-linux-gnu/3.6.1/Rcpp

### Starting setup
WORKDIR /home/APP_DC/DECoN/Linux
RUN ./setup.sh

### run GUI on host's web browser
RUN sed -i "/runApp/ s/launch.browser=T/port = 3838, launch.browser = FALSE, host = '0.0.0.0', workerId = '', quiet = FALSE, display.mode = c('auto', 'normal', 'showcase')/" /home/APP_DC/DECoN/Linux/runShiny.R

### Rprofiles config
RUN echo "options(repos=structure(BiocManager::repositories()))" >> /usr/local/lib/R/etc/Rprofile.site

CMD ["/bin/bash"]
