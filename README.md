# Dockerfile to create DECoN images on centos7 (GNU included)

It assumes Docker is correctly installed on your system  

In a folder which will contains dockerfile and files below
1) First you need to download the shiny-verse image from the dockerhub:   
    docker pull rocker/shiny-verse
2) Then you may need the Rcpp packages from R which will avoid some install issues:  
   wget -c https://cran.r-project.org/src/contrib/Rcpp_1.0.4.6.tar.gz && tar -xvzf Rcpp_1.0.4.6.tar.gz && rm -r Rcpp_1.0.4.6.tar.gz  
3) Build the image (Assure that you don't have stuff on the 3838 tcp port):  
   docker image build -t decon:(your tag, for example:1.0) .   (do not forget space and dot)
   
 Finally have a look on github DECoN team repository to be able to run analysis, to access the GNU shiny app go to:  
 (IPadress of your server):3838  in your favorite web browser 
 
 
 
 
 
