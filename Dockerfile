FROM mono

ARG VERSION=0.9.2.1
ARG EXTERNAL_IP="SYSTEMIP"
ENV EXTERNAL_IP $EXTERNAL_IP

WORKDIR /usr/games

RUN apt -y update && apt -y install default-mysql-server
RUN curl "http://opensimulator.org/dist/opensim-${VERSION}.tar.gz" -s | tar xfz - --strip 2 -C /usr/games "opensim-${VERSION}/bin"

COPY config/OpenSim.ini /usr/games/OpenSim.ini
COPY config/Regions.ini /usr/games/Regions/Regions.ini
COPY db/opensim.sql /tmp/opensim.sql

# Limit permissions to games group.
RUN chown -R games:games /usr/games

COPY init.d/grid-server /etc/init.d/grid-server
COPY launch.sh /usr/games/launch.sh

# Install LSB init and RC scripts.
RUN update-rc.d grid-server defaults

EXPOSE 9000-9010

CMD /usr/games/launch.sh && sleep infinity
