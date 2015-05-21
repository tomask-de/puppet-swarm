# Definition for installation of swarm cli
# Parameters:
#   $version - The version to install e.g. 0.17.0
define swarmcli::install($version) {

    package { 'tar':
        ensure  => installed
    }

    package { 'wget':
        ensure  => installed
    }

    exec { "swarmcli-${version}-get":
        command => "/usr/bin/wget http://downloads.giantswarm.io/sw\
arm/clients/${version}/swarm-${version}-linux-amd64.tar.gz -O /root/swarm-\
${version}-linux-amd64.tar.gz",
        require => Package['wget'],
        creates => "/root/swarm-${version}-linux-amd64.tar.gz"
    }

    file { "/root/swarm-${version}-linux-amd64.tar.gz":
        ensure  => present,
        mode    => '0700',
        require => Exec["swarmcli-${version}-get"]
    }

    exec { 'swarmcli-uninstall-old':
        command => '/bin/rm -rf /usr/local/bin/swarm'
    }


    exec { "swarmcli-${version}-install":
        require => [
            Package['tar'],
            File["/root/swarm-${version}-linux-amd64.tar.gz"],
            Exec['swarmcli-uninstall-old'] ],
        command => "/bin/tar -zxf /root/swarm-${version}-linux-amd64.tar.gz -C\
 /usr/local/bin",
        creates => '/usr/local/bin/swarm'
    }

}
