#! /usr/bin/env Rscript

# require devtools for install_version command
install.packages('devtools')  # install devtools and all it's dependencies
require('devtools')

# define list of packages to install
pkglist = c(
    'FNN',           '1.1',
    'KernSmooth',    '2.23-15',
    'MASS',          '7.3-45',
    'Matrix',        '1.2-3',
    'MatrixModels',  '0.4-1',
    'ModelMetrics',  '1.1.0',
    'R.methodsS3',   '1.7.1',
    'R.oo',          '1.20.0',
    'R.utils',       '2.2.0',
    'R2HTML',        '2.3.1',
    'RColorBrewer',  '1.1-2',
    'Rcpp',          '0.12.3',
    'RcppEigen',     '0.3.3.3.0',
    'SDMTools',      '1.1-221',
    'SparseM',       '1.77',
    'abind',         '1.4-3',
    'biomod2',       '3.1-64',
    'boot',          '1.3-17',
    'caret',         '6.0-76',
    'car',           '2.1-0',
    'class',         '7.3-14',
    'cluster',       '2.0.3',
    'codetools',     '0.2-14',
    'colorspace',    '1.2-6',
    'deldir',        '0.1-9',
    'dichromat',     '2.0-0',
    'digest',        '0.6.9',
    'dismo',         '1.1-1',
    'doParallel',    '1.0.10',
    'evaluate',      '0.8',
    'foreach',       '1.4.3',
    'foreign',       '0.8-66',
    'gam',           '1.12',
    'gamlss',        '4.3-8',
    'gamlss.data',   '4.3-2',
    'gamlss.dist',   '4.3-5',
    'gbm',           '2.1.1',
    'gdalUtils',     '2.0.1.7',
    'ggdendro',      '0.1-20',
    'ggplot2',       '2.2.1',
    'gridExtra',     '2.2.0',
    'gstat',         '1.1-2',
    'gtable',        '0.2.0',
    'hexbin',        '1.27.1',
    'intervals',     '0.15.1',
    'iterators',     '1.0.8',
    'labeling',      '0.3',
    'lacyeval',      '0.2.0',
    'lattice',       '0.20-33',
    'latticeExtra',  '0.6-28',
    'lme4',          '1.1-11',
    'magrittr',      '1.5',
    'mda',           '0.4-8',
    'mgcv',          '1.8-9',
    'minqa',         '1.2.4',
    'mmap',          '0.6-12',
    'munsell',       '0.4.3',
    'nlme',          '3.1-123',
    'nloptr',        '1.0.4',
    'nnet',          '7.3-11',
    'ordinal',       '2015.1-21',
    'pbkrtest',      '0.4-2',
    'pROC',          '1.8',
    'plyr',          '1.8.3',
    'png',           '0.1-7',
    'proto',         '0.3-10',
    'quantreg',      '5.33',
    'randomForest',  '4.6-12',
    'raster',        '2.5-8',
    'rasterVis',     '0.37',
    'reshape',       '0.8.5',
    'reshape2',      '1.4.1',
    'rgdal',         '1.2-5',
    'rgeos',         '0.3-22',
    'rjson',         '0.2.15',
    'rpart',         '4.1-10',
    'scales',        '0.4.1',
    'sp',            '1.2-4',
    'spacetime',     '1.1-5',
    'spatial',       '7.3-11',
    'spatial.tools', '1.4.8',
    'stringi',       '1.0-1',
    'stringr',       '1.0.0',
    'survival',      '2.38-3',
    'tibble',        '1.3.0',
    'ucminf',        '1.1-4',
    'xts',           '0.9-7',
    'zoo',           '1.7-12'
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
    install_version(package=pkg['pkg'], version=pkg['ver'], INSTALL_opts=c('--no-html', '--no-docs', '--clean'))
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
