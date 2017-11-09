FROM hub.bccvl.org.au/centos/centos7-epel:2017-10-16

MAINTAINER Jan Hettenhausen <j.hettenhausen@griffith.edu.au>

# configure pypi index to use
ARG PIP_INDEX_URL
ARG PIP_TRUSTED_HOST
# If set, pip will look for pre releases
ARG PIP_PRE

ENV LC_ALL=en_US.UTF-8

# TODO: can I get gdal2 here as well?
RUN yum install -y http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm \
    && yum install -y \
    dos2unix \
    expat-devel \
    gcc \
    gcc-c++ \
    geos \
    geos-devel \
    libcurl-devel \
    libpng \
    libpng-devel \
    make \
    openssl-devel \
    patch \
    perl \
    perl-CPAN \
    proj proj-devel \
    proj-epsg \
    proj-nad \
    python-devel \
    R \
    && yum clean all \
    && curl https://bootstrap.pypa.io/get-pip.py | python -

# Manually Install GDAL and newer version of numpy
# libarmadillo adds a a number of dependencies: arpack-devel, atlas-devel, blas-devel, lapack-devel, libquadmath-devel, gcc-fortran
RUN export PIP_INDEX_URL=${PIP_INDEX_URL} && \
    export PIP_TRUSTED_HOST=${PIP_TRUSTED_HOST} && \
    export PIP_NO_CACHE_DIR=False && \
    export PIP_PRE=${PIP_PRE} && \
    export GDAL_VERSION="2.2.0" && \
    pip install --no-cache-dir virtualenv guscmversion numpy && \
    `# install build edpendencies:` && \
    yum install -y \
        make \
        qhull \
        hdf \
        crytpopp && \

    buildDeps='hdf5-devel \
               libcurl-devel \
               geos-devel \
               xerces-c-devel \
               expat-devel \
               jasper-devel \
               hdf-devel \
               libgta-devel \
               sqlite-devel \
               armadillo-devel \
               cryptopp-devel \
               cfitsio-devel \
               poppler-devel \
               netcdf-devel \
               libdap-devel \
               json-c-devel \
               qhull-devel \
    ' && \

    yum install -y $buildDeps && \

    cd /tmp && \
    curl http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz | tar -xz && \
    cd gdal-${GDAL_VERSION} && \
    ./configure --with-armadillo --with-poppler --with-epsilon --with-webp --with-cfitsio --with-liblzma=yes --with-dods-root=/usr && \
    make -j 4 && \
    make install && \
    cd .. && \

    `# make sure library paths are set up correctly` && \
    echo -e '/usr/local/lib\n/usr/local/lib64' > /etc/ld.so.conf.d/local.conf && \
    ldconfig && \
    rm -fr gdal-${GDAL_VERSION} && \
    pip install --no-cache-dir gdal==${GDAL_VERSION} && \
    yum remove -y $buildDeps && \
    yum clean all


# Install everything biodiverse related
COPY ./files/MyConfig.pm /root/.cpan/CPAN/

ENV PERL_MM_USE_DEFAULT=1

# TODO: there is a problem with the tests in Geo::GDAL-2.010301 ...
#       it has been fixed upstream but not released yet.
RUN set -x && \
    buildDeps='expat-devel' && \
    yum install -y $buildDeps && \
    cpan App::cpanminus && \
    cpanm YAML::Syck && \
    cpanm Getopt::Long::Descriptive && \
    cpanm JSON && \
    cpanm Time::HiRes@1.9733 && \
    cpanm --force Object::InsideOut && \
    cpanm Math::Random::MT::Auto && \
    cpanm List::BinarySearch && \
    cpanm List::BinarySearch::XS && \
    cpanm --force Geo::GDAL && \
    cpanm Task::Biodiverse::NoGUI && \
    rm -rf /root/.cpanm && \
    yum remove -y $buildDeps && \
    yum clean all

# patch biodiverse
COPY ./files/biodiverse-1.0-Readonly.patch /opt/
RUN curl https://codeload.github.com/shawnlaffan/biodiverse/tar.gz/r1.0 | tar xvz -C /opt/ && \
    dos2unix /opt/biodiverse-r1.0/lib/Biodiverse/Metadata/Indices.pm && \
    patch -d /opt/biodiverse-r1.0 -p 1 < /opt/biodiverse-1.0-Readonly.patch && \
    unix2dos /opt/biodiverse-r1.0/lib/Biodiverse/Metadata/Indices.pm

ENV PERL5LIB="/opt/biodiverse-r1.0/lib"

# install maxent
ENV MAXENT=/opt/maxent/maxent.jar
COPY ./files/maxent.jar ${MAXENT}

# Install R libs
COPY ./files/install_r_packages.sh /tmp/
#RUN echo 'options(repos=structure(c(CRAN="http://mirror.aarnet.edu.au/pub/CRAN")))' >> /root/.Rprofile && \
#    /tmp/install_r_packages.sh
RUN yum install -y \
        R-devel \
        libcurl-devel \
        geos-devel \
        libssh2-devel && \
    echo 'options(repos=structure(c(CRAN="https://cran.csiro.au")))' >> /root/.Rprofile && \
    /tmp/install_r_packages.sh
