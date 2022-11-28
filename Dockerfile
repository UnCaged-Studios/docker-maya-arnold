FROM mottosso/maya:2022

# install mtoa and bypass eula
RUN wget https://wdown.solidangle.com/mtoa/MtoA-5.1.3.3-linux-2022.run
RUN chmod a+x MtoA-5.1.3.3-linux-2022.run
RUN ./MtoA-5.1.3.3-linux-2022.run --noexec --target install-mtoa
RUN ./install-mtoa/unix_installer.sh "silent "
