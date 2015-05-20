define swarm-cli::install($version) {

    package { 'tar':
        ensure  => installed
    }

    package { 'wget':
        ensure  => installed
    }

    exec { "swarm-cli-${version}-get":
        command => "/usr/bin/wget --no-proxy http://downloads.giantswarm.io/swarm/clients/${version}/swarm-${version}-linux-amd64.tar.gz -O /root/swarm-${version}-linux-amd64.tar.gz",
        require => Package["wget"],
        creates => "/root/swarm-${version}-linux-amd64.tar.gz"
    }

    file { "/root/swarm-${version}-linux-amd64.tar.gz":
        ensure  => present,
        mode    => 0700,
        require => Exec["swarm-cli-${version}-get"]
    }

    exec { 'swarm-cli-uninstall-old':
        command => '/bin/rm -rf /usr/local/bin/swarm'
    }


    exec { "swarm-cli-${version}-install":
        require => [
            Package["tar"],
            File["/root/swarm-${version}-linux-amd64.tar.gz"],
            Exec["swarm-cli-uninstall-old"] ],
        command => "/bin/tar -zxf /root/swarm-${version}-linux-amd64.tar.gz -C /usr/local/bin",
        creates => "/usr/local/bin/swarm"
    }

}
