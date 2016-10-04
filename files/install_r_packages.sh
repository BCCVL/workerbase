#! /usr/bin/env Rscript

# setup local mirror
repos <- getOption('repos')
repos['CRAN'] = 'http://cran.csiro.au'
options(repos = repos)

# require devtools for install_version command
install.packages('devtools')  # install devtools and all it's dependencies
# devtools 1.11 is buggy and can't download specific versions from archive (had to do the previous step to get deps in)
install.packages("http://mirror.aarnet.edu.au/pub/CRAN/src/contrib/Archive/devtools/devtools_1.10.0.tar.gz", repos=NULL)
require('devtools')

# define list of packages to install
pkglist = c(
    'FNN',          '1.1',
    'KernSmooth',   '2.23-15',
    'MASS',         '7.3-45',
    'Matrix',       '1.2-3',
    'R.methodsS3',  '1.7.1',
    'R.oo',         '1.20.0',
    'R.utils',      '2.2.0',
    'R2HTML',       '2.3.1',
    'RColorBrewer', '1.1-2',
    'Rcpp',         '0.12.3',
    'SDMTools',     '1.1-221',
    'abind',        '1.4-3',
    'biomod2',      '3.1-64',
    'boot',         '1.3-17',
    'class',        '7.3-14',
    'cluster',      '2.0.3',
    'codetools',    '0.2-14',
    'colorspace',   '1.2-6',
    'deldir',       '0.1-9',
    'dichromat',    '2.0-0',
    'digest',       '0.6.9',
    'dismo',        '1.1-1',
    'evaluate',     '0.8',
    'foreach',      '1.4.3',
    'foreign',      '0.8-66',
    'gam',          '1.12',
    'gamlss',       '4.3-8',
    'gamlss.data',  '4.3-2',
    'gamlss.dist',  '4.3-5',
    'gbm',          '2.1.1',
    'ggplot2',      '2.0.0',
    'gridExtra',    '2.2.0',
    'gstat',        '1.1-2',
    'gtable',       '0.2.0',
    'hexbin',       '1.27.1',
    'intervals',    '0.15.1',
    'iterators',    '1.0.8',
    'labeling',     '0.3',
    'lattice',      '0.20-33',
    'latticeExtra', '0.6-28',
    'magrittr',     '1.5',
    'mda',          '0.4-8',
    'mgcv',         '1.8-9',
    'munsell',      '0.4.3',
    'nlme',         '3.1-122',
    'nnet',         '7.3-11',
    'pROC',         '1.8',
    'plyr',         '1.8.3',
    'png',          '0.1-7',
    'proto',        '0.3-10',
    'randomForest', '4.6-12',
    'raster',       '2.5-8',
    'rasterVis',    '0.37',
    'reshape',      '0.8.5',
    'reshape2',     '1.4.1',
    'rgdal',        '1.1-10',
    'rgeos',        '0.3-20',
    'rjson',        '0.2.15',
    'rpart',        '4.1-10',
    'scales',       '0.4.0',
    'sp',           '1.2-3',
    'spacetime',    '1.1-5',
    'spatial',      '7.3-11',
    'stringi',      '1.0-1',
    'stringr',      '1.0.0',
    'survival',     '2.38-3',
    'xts',          '0.9-7',
    'zoo',          '1.7-12'
)

# install method
install_package <- function(pkg) {
    installed = installed.packages()
    if (is.element(pkg['pkg'], installed[,1])) {
        if (pkg['ver'] != installed[pkg['pkg'], 'Version']) {
            # already installed
            return;
        }
    }
    install_version(package=pkg['pkg'], version=pkg['ver'])
}

# create package matrix and install packages
pkgnames = pkglist[seq(1, length(pkglist), 2)]
packages = matrix(pkglist, ncol=2, nrow=length(pkgnames), byrow=TRUE,
                  dimnames=list(pkgnames, c('pkg', 'ver')))

# apply install method to packages data frame
apply(packages, 1, install_package)

# function to return list of installed package that are not part of base installation
nobase_pkglist <- function() {
    installed = installed.packages()
    # build index vector to filter out base packages
    nobase = as.vector(installed[,'Priority']) != 'base'
    # replace possible NA values with TRUE (nobase)
    nobase[is.na(nobase)] = TRUE
    return(installed[nobase,])
}

# get alphabetically sorted list of currently installed packages in a
# format suitable to copy/paste here
print_nobase_pkgs <- function() {
    pkgs = nobase_pkglist()
    pkgstrings = c()
    for (name in sort(row.names(pkgs))) {
        append(pkgstrings,
               sprintf("    %-15s '%s'", paste("'", name , "',", sep=""), pkgs[name, 'Version']))
    }
    cat(paste(pkgstrings, sep=",\n"))
}
