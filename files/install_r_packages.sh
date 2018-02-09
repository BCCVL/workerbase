#! /usr/bin/env Rscript


pkglist = c(
    'biomod2',
    'caret',
    'dismo',
    'dplyr',
    'gam',
    'gamlss',
    'gdalUtils',
    'ggdendro',
    'gridExtra',
    'gstat',
    'jpeg',
    'lme4',
    'mgcv',
    'ordinal',
    'png',
    'proj4',
    'rasterVis',
    'rgdal',
    'rgeos',
    'RCurl',
    'rjson',
    'SDMTools',
    'spatial.tools'
)

# require devtools for install_version command
# install.packages('devtools')  # install devtools and all it's dependencies
# require('devtools')

# # define list of packages to install
# pkglist = c(
#     # 'FNN',           '1.1',
#     # 'KernSmooth',    '2.23-15',
#     # 'MASS',          '7.3-47',
#     # 'Matrix',        '1.2-12',
#     'MatrixModels',  '0.4-1',
#     # 'ModelMetrics',  '1.1.0',
#     # 'R.methodsS3',   '1.7.1',
#     # 'R.oo',          '1.21.0',
#     # 'R.utils',       '2.6.0',
#     # 'R2HTML',        '2.3.2',
#     # 'RColorBrewer',  '1.1-2',
#     # 'Rcpp',          '0.12.14',
#     # 'RcppEigen',     '0.3.3.3.1',
#     # 'SDMTools',      '1.1-221',
#     # 'SparseM',       '1.77',
#     # 'abind',         '1.4-5',
#     # 'biomod2',       '3.3-7',
#     # 'boot',          '1.3-20',
#     'car',           '2.1-6',
#     # 'caret',         '6.0-78',
#     # 'class',         '7.3-14',
#     # 'cluster',       '2.0.6',
#     # 'codetools',     '0.2-15',
#     # 'colorspace',    '1.3-2',
#     'deldir',        '0.1-14',
#     # 'dichromat',     '2.0-0',
#     # 'digest',        '0.6.13',
#     # 'dismo',         '1.1-4',
#     # 'doParallel',    '1.0.11',
#     'evaluate',      '0.10.1',
#     # 'foreach',       '1.4.4',
#     # 'foreign',       '0.8-69',
#     # 'gam',           '1.14-4',
#     # 'gamlss',        '5.0-6',
#     # 'gamlss.data',   '5.0-0',
#     # 'gamlss.dist',   '5.0-4',
#     # 'gbm',           '2.1.3',
#     # 'gdalUtils',     '2.0.1.7',
#     # 'ggdendro',      '0.1-20',
#     # 'ggplot2',       '2.2.1',
#     # 'gridExtra',     '2.3',
#     # 'gstat',         '1.1-5',
#     # 'gtable',        '0.2.0',
#     # 'hexbin',        '1.27.1',
#     # 'intervals',     '0.15.1',
#     # 'iterators',     '1.0.9',
#     # 'labeling',      '0.3',
#     # 'lazyeval',      '0.2.1',
#     # 'lattice',       '0.20-33',
#     # 'latticeExtra',  '0.6-28',
#     # 'lme4',          '1.1-14',
#     # 'magrittr',      '1.5',
#     # 'mda',           '0.4-10',
#     # 'mgcv',          '1.8-22',
#     # 'minqa',         '1.2.4',
#     # 'mmap',          '0.6-15',
#     # 'munsell',       '0.4.3',
#     # 'nlme',          '3.1-131',
#     # 'nloptr',        '1.0.4',
#     # 'nnet',          '7.3-12',
#     # 'ordinal',       '2015.6-28',
#     'pbkrtest',      '0.4-7',
#     # 'pROC',          '1.10.0',
#     # 'plyr',          '1.8.3',
#     # 'png',           '0.1-7',
#     'proto',         '1.0.0',
#     'quantreg',      '5.34',
#     # 'randomForest',  '4.6-12',
#     # 'raster',        '2.6-7',
#     # 'rasterVis',     '0.41',
#     # 'reshape',       '0.8.7',
#     # 'reshape2',      '1.4.3',
#     # 'rgdal',         '1.2-16',
#     # 'rgeos',         '0.3-26',
#     # 'rjson',         '0.2.15',
#     # 'rpart',         '4.1-11',
#     # 'scales',        '0.5.0',
#     # 'sp',            '1.2-5',
#     # 'spacetime',     '1.2-1',
#     # 'spatial',       '7.3-11',
#     # 'spatial.tools', '1.4.8',
#     # 'stringi',       '1.1.6',
#     # 'stringr',       '1.2.0',
#     # 'survival',      '2.41-3',
#     # 'tibble',        '1.3.4',
#     # 'ucminf',        '1.1-4',
#     # 'xts',           '0.10-0',
#     # 'zoo',           '1.8-0'
# )

# # install method
# install_package <- function(pkg) {
#     installed = installed.packages()
#     if (is.element(pkg['pkg'], installed[,1])) {
#         if (pkg['ver'] != installed[pkg['pkg'], 'Version']) {
#             # already installed
#             return;
#         }
#     }
#     install_version(package=pkg['pkg'], version=pkg['ver'], INSTALL_opts=c('--no-html', '--no-docs', '--clean'))
# }

# # create package matrix and install packages
# pkgnames = pkglist[seq(1, length(pkglist), 2)]
# packages = matrix(pkglist, ncol=2, nrow=length(pkgnames), byrow=TRUE,
#                   dimnames=list(pkgnames, c('pkg', 'ver')))

# # apply install method to packages data frame
# apply(packages, 1, install_package)

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
        pkgstrings <- append(pkgstrings,
               sprintf("    %-15s '%s'", paste("'", name , "',", sep=""), pkgs[name, 'Version']))
    }
    cat(paste(pkgstrings, sep=",\n"))
}

install.packages(pkglist)
print_nobase_pkgs()
