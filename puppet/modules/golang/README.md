Puppet module for installing the Go from the unofficial [golang-backports](https://launchpad.net/~james-page/+archive/golang-backports) PPA.

This will allow later versions of Go to be installed on older versions (>= 12.04) of Ubuntu, many of which currently are locked to v1.0.3.

## Usage

The module includes a single class:

    include 'golang'

This will (currently) install the latest (v1.1.1 as of this writing) version of Go. Once the PPA adds future releases of Go, additional parameters will allow the installation of specific versions.

Note that this PPA will allow newer versions of Go to be installed from the official Ubuntu repositories.

# License

New BSD license. Code forked from [garethr/garethr-golang](https://github.com/garethr/garethr-golang).