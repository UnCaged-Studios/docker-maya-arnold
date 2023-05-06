FROM mottosso/maya:2022

RUN yum update -y \
  && yum install -y redhat-lsb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil libxkbcommon-x11

# intalled autodesk license manager
ARG NLM_VERSION=nlm11.18.0.0_ipv4_ipv6_linux64
RUN curl "https://download.autodesk.com/us/support/files/network_license_manager/linux/${NLM_VERSION}.tar.gz" -o "${NLM_VERSION}.tar.gz"
RUN tar -xf "${NLM_VERSION}.tar.gz"
RUN rpm -vhi "${NLM_VERSION}.rpm"

# install mtoa and bypass eula
RUN wget https://wdown.solidangle.com/mtoa/MtoA-5.1.3.3-linux-2022.run
RUN chmod a+x MtoA-5.1.3.3-linux-2022.run
RUN ./MtoA-5.1.3.3-linux-2022.run --noexec --target install-mtoa
RUN ./install-mtoa/unix_installer.sh "silent "
