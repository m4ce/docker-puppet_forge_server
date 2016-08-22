# Docker image for Puppet Forge Server
Docker image to run a private Puppet Forge Server (https://github.com/unibet/puppet-forge-server)

See the usage section for more details.

## Usage
Generic configuration can be driven by exporting the following enviroment variables:

| Environment variable  | Description |
| ------------- | ------------- |
| PUPPET_FORGE_SERVER_PORT | Port number to bind to (default: 8080) |
| PUPPET_FORGE_SERVER_CACHEDIR | Proxy module cache base directory (default: /srv/puppet-forge-server/cache) |
| PUPPET_FORGE_SERVER_LOGDIR | Log directory (default: STDOUT) |
| PUPPET_FORGE_SERVER_MODULEDIR | Directory containing packaged modules (recursively searched) |
| PUPPET_FORGE_SERVER_PROXY | Remote forge URL |
| PUPPET_FORGE_SERVER_DEBUG | Log everything into STDERR |

## Run
```
docker run -d --restart=always -p 8080:8080 -e PUPPET_FORGE_SERVER_MODULEDIR=/srv/puppet-forge-server/modules -v <path_to_modules>:/srv/puppet-forge-server/modules m4ce/puppet-forge-server
```

If you wish to run the forge daemon as a non-root user, please look at user namespaces support in Docker.

## Contact
Matteo Cerutti - matteo.cerutti@hotmail.co.uk
