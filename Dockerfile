FROM hub.bccvl.org.au/centos/centos7-epel:2017-02-20

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
    gdal \
    gdal-devel \
    gdal-perl \
    gdal-python \
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
    R \
    && yum clean all


# Install everything biodiverse related
COPY ./files/MyConfig.pm /root/.cpan/CPAN/

ENV PERL_MM_USE_DEFAULT=1

RUN set -x && \
    cpan App::cpanminus && \
    cpanm YAML::Syck && \
    cpanm Getopt::Long::Descriptive && \
    cpanm JSON && \
    cpanm Time::HiRes@1.9733 && \
    cpanm --force Object::InsideOut && \
    cpanm Math::Random::MT::Auto && \
    cpanm List::BinarySearch && \
    cpanm List::BinarySearch::XS && \
    cpanm Task::Biodiverse::NoGUI && \
    rm -rf /root/.cpanm

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
RUN echo 'options(repos=structure(c(CRAN="https://cran.csiro.au")))' >> /root/.Rprofile && \
    /tmp/install_r_packages.sh

# install python pkgs and update setupttols, pip etc...
RUN export PIP_INDEX_URL=${PIP_INDEX_URL} && \
    export PIP_TRUSTED_HOST=${PIP_TRUSTED_HOST} && \
    export PIP_NO_CACHE_DIR=False && \
    export PIP_PRE=${PIP_PRE} && \
    easy_install pip && \
    pip install --upgrade setuptools wheel virtualenv && \
    pip install guscmversion
