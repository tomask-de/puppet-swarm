# Remove old binary packages from previous installations
class swarmcli::revokeoldversions {

    file { '/root/swarm-0.16.0-linux-amd64.tar.gz':
        ensure => absent
    }

}
