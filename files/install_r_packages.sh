#!/bin/bash
set -x
set -e
TMPDIR=/tmp/r_packages
mkdir -p $TMPDIR
mkdir -p /usr/share/doc/R-3.2.2/html/

curl -o $TMPDIR/rjson_0.2.13.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/rjson/rjson_0.2.13.tar.gz
R CMD INSTALL $TMPDIR/rjson_0.2.13.tar.gz

curl -o $TMPDIR/sp_1.0-15.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/sp/sp_1.0-15.tar.gz
R CMD INSTALL $TMPDIR/sp_1.0-15.tar.gz

curl -o $TMPDIR/raster_2.2-31.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/raster/raster_2.2-31.tar.gz
R CMD INSTALL $TMPDIR/raster_2.2-31.tar.gz

curl -o $TMPDIR/rgdal_0.8-16.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/rgdal/rgdal_0.8-16.tar.gz
R CMD INSTALL $TMPDIR/rgdal_0.8-16.tar.gz

curl -o $TMPDIR/rgeos_0.3-4.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/rgeos/rgeos_0.3-4.tar.gz
R CMD INSTALL $TMPDIR/rgeos_0.3-4.tar.gz

curl -o $TMPDIR/gam_1.09.1.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/gam/gam_1.09.1.tar.gz
R CMD INSTALL $TMPDIR/gam_1.09.1.tar.gz

curl -o $TMPDIR/Rcpp_0.11.1.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/Rcpp/Rcpp_0.11.1.tar.gz
R CMD INSTALL $TMPDIR/Rcpp_0.11.1.tar.gz

curl -o $TMPDIR/plyr_1.8.1.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/plyr/plyr_1.8.1.tar.gz
R CMD INSTALL $TMPDIR/plyr_1.8.1.tar.gz

curl -o $TMPDIR/pROC_1.7.2.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/pROC/pROC_1.7.2.tar.gz
R CMD INSTALL $TMPDIR/pROC_1.7.2.tar.gz

curl -o $TMPDIR/R2HTML_2.2.1.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/R2HTML/R2HTML_2.2.1.tar.gz
R CMD INSTALL $TMPDIR/R2HTML_2.2.1.tar.gz

curl -o $TMPDIR/png_0.1-7.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/png_0.1-7.tar.gz
R CMD INSTALL $TMPDIR/png_0.1-7.tar.gz

curl -o $TMPDIR/survival_2.37-7.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/survival/survival_2.37-7.tar.gz
R CMD INSTALL $TMPDIR/survival_2.37-7.tar.gz

curl -o $TMPDIR/lattice_0.20-29.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/lattice/lattice_0.20-29.tar.gz
R CMD INSTALL $TMPDIR/lattice_0.20-29.tar.gz

curl -o $TMPDIR/gbm_2.0-8.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/gbm/gbm_2.0-8.tar.gz
R CMD INSTALL $TMPDIR/gbm_2.0-8.tar.gz

curl -o $TMPDIR/stringr_0.6.2.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/stringr/stringr_0.6.2.tar.gz
R CMD INSTALL $TMPDIR/stringr_0.6.2.tar.gz

curl -o $TMPDIR/evaluate_0.5.3.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/evaluate/evaluate_0.5.3.tar.gz
R CMD INSTALL $TMPDIR/evaluate_0.5.3.tar.gz

curl -o $TMPDIR/dismo_0.9-3.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/dismo/dismo_0.9-3.tar.gz
R CMD INSTALL $TMPDIR/dismo_0.9-3.tar.gz

curl -o $TMPDIR/R.methodsS3_1.6.1.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/R.methodsS3/R.methodsS3_1.6.1.tar.gz
R CMD INSTALL $TMPDIR/R.methodsS3_1.6.1.tar.gz

curl -o $TMPDIR/R.oo_1.18.0.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/R.oo/R.oo_1.18.0.tar.gz
R CMD INSTALL $TMPDIR/R.oo_1.18.0.tar.gz

curl -o $TMPDIR/R.utils_1.29.8.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/R.utils/R.utils_1.29.8.tar.gz
R CMD INSTALL $TMPDIR/R.utils_1.29.8.tar.gz

curl -o $TMPDIR/SDMTools_1.1-20.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/SDMTools/SDMTools_1.1-20.tar.gz
R CMD INSTALL $TMPDIR/SDMTools_1.1-20.tar.gz

curl -o $TMPDIR/abind_1.4-0.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/abind/abind_1.4-0.tar.gz
R CMD INSTALL $TMPDIR/abind_1.4-0.tar.gz

curl -o $TMPDIR/RColorBrewer_1.0-5.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/RColorBrewer/RColorBrewer_1.0-5.tar.gz
R CMD INSTALL $TMPDIR/RColorBrewer_1.0-5.tar.gz

curl -o $TMPDIR/latticeExtra_0.6-26.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/latticeExtra_0.6-26.tar.gz
R CMD INSTALL $TMPDIR/latticeExtra_0.6-26.tar.gz

curl -o $TMPDIR/hexbin_1.26.3.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/hexbin/hexbin_1.26.3.tar.gz
R CMD INSTALL $TMPDIR/hexbin_1.26.3.tar.gz

curl -o $TMPDIR/zoo_1.7-11.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/zoo/zoo_1.7-11.tar.gz
R CMD INSTALL $TMPDIR/zoo_1.7-11.tar.gz

curl -o $TMPDIR/rasterVis_0.28.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/rasterVis/rasterVis_0.28.tar.gz
R CMD INSTALL $TMPDIR/rasterVis_0.28.tar.gz

curl -o $TMPDIR/mda_0.4-4.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/mda/mda_0.4-4.tar.gz
R CMD INSTALL $TMPDIR/mda_0.4-4.tar.gz

curl -o $TMPDIR/randomForest_4.6-7.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/randomForest/randomForest_4.6-7.tar.gz
R CMD INSTALL $TMPDIR/randomForest_4.6-7.tar.gz

curl -o $TMPDIR/biomod2_3.1-25.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/biomod2/biomod2_3.1-25.tar.gz
R CMD INSTALL $TMPDIR/biomod2_3.1-25.tar.gz

curl -o $TMPDIR/nlme_3.1-117.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/nlme/nlme_3.1-117.tar.gz
R CMD INSTALL $TMPDIR/nlme_3.1-117.tar.gz

curl -o $TMPDIR/MASS_7.3-33.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/MASS/MASS_7.3-33.tar.gz
R CMD INSTALL $TMPDIR/MASS_7.3-33.tar.gz

curl -o $TMPDIR/gamlss.dist_4.3-0.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/gamlss.dist/gamlss.dist_4.3-0.tar.gz
R CMD INSTALL $TMPDIR/gamlss.dist_4.3-0.tar.gz

curl -o $TMPDIR/gamlss.data_4.2-7.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/gamlss.data/gamlss.data_4.2-7.tar.gz
R CMD INSTALL $TMPDIR/gamlss.data_4.2-7.tar.gz

curl -o $TMPDIR/gamlss_4.3-0.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/gamlss/gamlss_4.3-0.tar.gz
R CMD INSTALL $TMPDIR/gamlss_4.3-0.tar.gz

curl -o $TMPDIR/intervals_0.15.0.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/intervals/intervals_0.15.0.tar.gz
R CMD INSTALL $TMPDIR/intervals_0.15.0.tar.gz

curl -o $TMPDIR/xts_0.9-7.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/xts_0.9-7.tar.gz
R CMD INSTALL $TMPDIR/xts_0.9-7.tar.gz

curl -o $TMPDIR/FNN_1.1.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/FNN_1.1.tar.gz
R CMD INSTALL $TMPDIR/FNN_1.1.tar.gz

curl -o $TMPDIR/spacetime_1.1-1.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/spacetime/spacetime_1.1-1.tar.gz
R CMD INSTALL $TMPDIR/spacetime_1.1-1.tar.gz

curl -o $TMPDIR/gstat_1.0-19.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/gstat/gstat_1.0-19.tar.gz
R CMD INSTALL $TMPDIR/gstat_1.0-19.tar.gz

curl -o $TMPDIR/deldir_0.1-6.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/deldir/deldir_0.1-6.tar.gz
R CMD INSTALL $TMPDIR/deldir_0.1-6.tar.gz

curl -o $TMPDIR/digest_0.6.4.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/digest/digest_0.6.4.tar.gz
R CMD INSTALL $TMPDIR/digest_0.6.4.tar.gz

curl -o $TMPDIR/gtable_0.1.2.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/gtable_0.1.2.tar.gz
R CMD INSTALL $TMPDIR/gtable_0.1.2.tar.gz

curl -o $TMPDIR/reshape2_1.4.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/reshape2/reshape2_1.4.tar.gz
R CMD INSTALL $TMPDIR/reshape2_1.4.tar.gz

curl -o $TMPDIR/dichromat_2.0-0.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/dichromat_2.0-0.tar.gz
R CMD INSTALL $TMPDIR/dichromat_2.0-0.tar.gz

curl -o $TMPDIR/colorspace_1.2-4.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/colorspace/colorspace_1.2-4.tar.gz
R CMD INSTALL $TMPDIR/colorspace_1.2-4.tar.gz

curl -o $TMPDIR/munsell_0.4.2.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/munsell_0.4.2.tar.gz
R CMD INSTALL $TMPDIR/munsell_0.4.2.tar.gz

curl -o $TMPDIR/labeling_0.3.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/labeling_0.3.tar.gz
R CMD INSTALL $TMPDIR/labeling_0.3.tar.gz

curl -o $TMPDIR/scales_0.2.4.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/scales/scales_0.2.4.tar.gz
R CMD INSTALL $TMPDIR/scales_0.2.4.tar.gz

curl -o $TMPDIR/proto_0.3-10.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/proto_0.3-10.tar.gz
R CMD INSTALL $TMPDIR/proto_0.3-10.tar.gz

curl -o $TMPDIR/ggplot2_1.0.0.tar.gz http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/ggplot2/ggplot2_1.0.0.tar.gz
R CMD INSTALL $TMPDIR/ggplot2_1.0.0.tar.gz


rm -rf $TMPDIR
