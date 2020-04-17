# DECoN: Dockerfile to create DECoN images on centos7

It assumes Docker is correctly installed on your system  

In a folder which contains all necessary files
1) First you need to download the shiny-verse image from the dockerhub:   
    docker pull rocker/shiny-verse
2) Then you may need the Rcpp packages from R which will avoid some install issues:  
   wget -c https://cran.r-project.org/src/contrib/Rcpp_1.0.4.6.tar.gz && tar -xvzf Rcpp_1.0.4.6.tar.gz && rm -r Rcpp_1.0.4.6.tar.gz
