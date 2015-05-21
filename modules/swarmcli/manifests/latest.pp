# Including the latest available version and
# removing previous versions
class swarmcli::latest {

    include swarmcli::revokeoldversions
    include swarmcli::0_17_0

}
