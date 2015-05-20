class swarm-cli::revoke-old-versions {

    file { '/root/swarm-0.16.0-linux-amd64.tar.gz':
        ensure => absent
    }

}
