#! /bin/bash
#
# .travis.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
set -e
set -x
arg_name="$1"
shift
if test "$arg_name" != "--cmd"
then
    echo "usage : $0 --cmd [cmd]"
    exit -1
fi
cmd="$1"
shift
if false
then
    :
elif test "$cmd" = "before_install"
then
    sudo apt-get update -qq
    sudo apt-get install -y ack-grep cpanminus docbook-defguide docbook-xsl libperl-dev libxml-libxml-perl libxml-libxslt-perl make perl tidy xsltproc
    sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
    cpanm local::lib
elif test "$cmd" = "install"
then
    cpanm --notest Alien::Tidyp YAML::XS
    bash -x bin/install-tidyp-systemwide.bash
    cpanm --notest HTML::Tidy
elif test "$cmd" = "build"
then
    export SCREENPLAY_COMMON_INC_DIR="$PWD/screenplays-common"
    cd HHFG/text/
    make
    make test
fi