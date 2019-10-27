#!/bin/bash
#
echo Running $0
#
host="bgpforecast-test.uconn.edu"
loc_file="/var/lib/postgresql/results.sql.gz"
rem_dir=""
clean_sh="clean.sh"
unpack_sh="unpack.sh"
#
usage(){
    echo "Can't perform sync";
    echo "Using:";
    echo " $0 dry";
    echo "Or:";
    echo " $0 sync";
}
#
echo "Host: $host";
echo "Directory: $dir";
# 
# ext input tables
roas_tbl='roas'
peer_tbl='peers'
cust_tbl='customer_providers'
stub_tbl='stubs'
nstub_tbl='non_stubs'
ann_tbl='total_announcements'
mrt_tbl='mrt_w_roas'
# analysis tables
hij_tbl='hijack'
leak_tbl='leak'
res_tbl='extrapolation_inverse_results'
# invalid by asn tables
asn_data1='invalid_asn'
asn_data1='invalid_asn_blocked_hijacked'
asn_data1='invalid_asn_blocked_not_hijacked'
# invalid by asn tables
len_data1='invalid_length'
len_data1='invalid_length_blocked_hijacked'
len_data1='invalid_length_blocked_not_hijacked'
len_data1='invalid_length_not_blocked_hijacked'
# invalid by asn tables
rov_data1='rov'
rov_data1='rov_not_blocked_hijacked'
rov_data1='rov_validity'
#
if [ $# -eq 1 ]
then
    if [ "$1" == "dry" ]
    then
        echo "Dry Run";
    elif [ "$1" == "sync" ]
    then
        echo "Sync Run";
        sudo -u postgres pg_dump bgp -t customer_providers -t extrapolation_inverse_results -t hijack -t invalid_asn -t invalid_asn_blocked_hijacked -t invalid_asn_blocked_not_hijacked -t invalid_asn_not_blocked_hijacked -t invalid_length -t invalid_length_blocked_hijacked -t invalid_length_blocked_not_hijacked -t invalid_length_not_blocked_hijacked -t leak -t mrt_w_roas -t non_stubs -t peers -t roas -t rov -t rov_not_blocked_hijacked -t rov_validity -t stubs -t total_announcements | gzip > results.sql.gz
        rsync -vrP ./results.sql.gz bgp_user@$host\:$rem_dir
        ssh bgp_user@$host 'bash -s' < $clean_sh && $unpack_sh
    else
        usage;
    fi;
else
    usage;
fi;
