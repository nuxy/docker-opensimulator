# docker-opensimulator

Run a [Open Simulator](http://opensimulator.org/wiki/Main_Page) server in Docker.

## Dependencies

- [Docker](https://docs.docker.com/get-docker)
- [Visual Studio Code](https://code.visualstudio.com/download) (optional)

### VS Code extensions

- [Remote-Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Manually starting the container

    $ docker build -t opensim . --build-arg VERSION=<version> EXTERNAL_IP=<ip-address>
    $ docker run -it -p 9000:9000/tcp -p 9000:9010/udp opensim

## Launching in Remote-Containers

In the VS Code _Command Palette_ choose "Open Folder in Container" which will launch the server in a Docker container allowing for realtime development and testing.  Once launched, the server can be accessed using an [OpenSim viewer](http://opensimulator.org/wiki/Compatible_Viewers#Viewers) at - [http://localhost:9000](http://localhost:9000)

## Managing the grid server

The following command can be executed within the Docker container:

    $ service grid-server {start|stop|restart}

## Importing a custom database

If you have an existing database (MySQL backup `*.sql`) that you want to use, thereby overriding the installation default, replace the existing `db/opensim.sql` file with your [mysqldump](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html) output.  Please note the configured [OpenSim release version](http://opensimulator.org/wiki/Upgrading) since older databases may introduce backwards compatibility issues.

## References

- [Runtime options with Memory, CPUs, and GPUs](https://docs.docker.com/config/containers/resource_constraints)

## Contributions

If you fix a bug, or have a code you want to contribute, please send a pull-request with your changes.

## Versioning

This package is maintained under the [Semantic Versioning](https://semver.org) guidelines.

## License and Warranty

This package is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose.

_docker-opensimulator_ is provided under the terms of the [MIT license](http://www.opensource.org/licenses/mit-license.php)

## Author

[Marc S. Brooks](https://github.com/nuxy)
