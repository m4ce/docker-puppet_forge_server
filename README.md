# Docker image for Puppet Forge Server
Docker image to run a private Puppet Forge Server (https://github.com/unibet/puppet-forge-server)

See the usage section for more details.

## Usage
Generic configuration can be driven by exporting the following enviroment variables:

| Environment variable  | Description |
| ------------- | ------------- |
| PUPPET_FORGE_SERVER_PORTR | Port number to bind to (default: 8080) |
| PUPPET_FORGE_SERVER_MODULEDIR | Directory containing packaged modules (recursively searched) |
| PUPPET_FORGE_SERVER_PROXY | Remote forge URL |
| PUPPET_FORGE_SERVER_DEBUG | Log everything into STDERR |

## Contact
Matteo Cerutti - matteo.cerutti@hotmail.co.uk
