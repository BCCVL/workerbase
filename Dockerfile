FROM hub.bccvl.org.au/centos/centos7-epel:2016-02-04

MAINTAINER Jan Hettenhausen <j.hettenhausen@griffith.edu.au>

ENV LANG en_US.UTF-8

RUN yum install -y http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm && \
    yum install -y perl perl-CPAN gdal gdal-perl gdal-python gcc make expat-devel && \
    yum install -y proj proj-devel proj-epsg proj-nad geos geos-devel gdal-devel  && \
    yum install -y gcc-c++ libpng libpng-devel && \
    yum install -y R && \
    yum clean all

# Install everything biodiverse related
COPY ./files/MyConfig.pm /root/.cpan/CPAN/

ENV PERL_MM_USE_DEFAULT=1

RUN set -x && \
    cpan App::cpanminus && \
    cpanm YAML::Syck && \
    cpanm Getopt::Long::Descriptive && \
    cpanm JSON && \
    cpanm Time::HiRes && \
    cpanm --force Object::InsideOut && \
    cpanm Math::Random::MT::Auto && \
    cpanm List::BinarySearch && \
    cpanm List::BinarySearch::XS && \
    cpanm Task::Biodiverse::NoGUI && \
    rm -rf /root/.cpanm

RUN curl https://codeload.github.com/shawnlaffan/biodiverse/tar.gz/r1.0 | tar xvz -C /opt/

ENV PERL5LIB="/opt/biodiverse-r1.0/lib"

# install maxent
COPY ./files/maxent.jar /opt/maxent/

# Install R libs
RUN echo 'options(repos=structure(c(CRAN="http://mirror.aarnet.edu.au/pub/CRAN")))' >> /root/.Rprofile
COPY ./files/install_r_packages.sh /tmp/
RUN /bin/bash /tmp/install_r_packages.sh
