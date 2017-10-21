FROM debian

LABEL maintainer "Hank Birkdale <hank.birkdale@gmail.com>"
# The Pycharm section was originally developed by  Viktor Adam <rycus86@gmail.com>"
# and can be found at https://hub.docker.com/r/rycus86/pycharm/~/dockerfile/

# Install Python
RUN apt-get update && apt-get install --no-install-recommends -y \
  python python-dev python-setuptools python-pip \
  python3 python3-dev python3-setuptools python3-pip \
  gcc git openssh-client \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 \
  && rm -rf /var/lib/apt/lists/*
# End Install Python

# Install and configure Pycharm
ARG pycharm_source=https://download-cf.jetbrains.com/python/pycharm-community-2017.2.2.tar.gz
ARG pycharm_local_dir=.PyCharmCE2017.2

RUN mkdir /opt/pycharm
WORKDIR /opt/pycharm

ADD $pycharm_source /opt/pycharm/installer.tgz

RUN tar --strip-components=1 -xzf installer.tgz && rm installer.tgz

RUN /usr/bin/python2 /opt/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
RUN /usr/bin/python3 /opt/pycharm/helpers/pydev/setup_cython.py build_ext --inplace
# End install pycharm

# Configure container with 'developer' user
RUN useradd -ms /bin/bash developer
USER developer
ENV HOME /home/developer

RUN mkdir /home/developer/.PyCharm \
  && ln -sf /home/developer/.PyCharm /home/developer/$pycharm_local_dir

CMD [ "/opt/pycharm/bin/pycharm.sh" ]
# Pycharm should work at this point but you will need to have X-windows configured.
# If your docker container already has X-windows - it should work reasonably well,
# but you will probably have to edit $DISPLAY. If you are running Docker on a Mac
# you will need to install XQuartz, the X-window lib for Mac
