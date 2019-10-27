#!/bin/bash
#
echo Running $0
#
psql bgp -c 'DROP TABLE customer_providers'
psql bgp -c 'DROP TABLE extrapolation_inverse_results'
psql bgp -c 'DROP TABLE hijack'
psql bgp -c 'DROP TABLE invalid_asn'
psql bgp -c 'DROP TABLE invalid_asn_blocked_hijacked'
psql bgp -c 'DROP TABLE invalid_asn_blocked_not_hijacked'
psql bgp -c 'DROP TABLE invalid_asn_not_blocked_hijacked'
psql bgp -c 'DROP TABLE invalid_length'
psql bgp -c 'DROP TABLE invalid_length_blocked_hijacked'
psql bgp -c 'DROP TABLE invalid_length_blocked_not_hijacked'
psql bgp -c 'DROP TABLE invalid_length_not_blocked_hijacked'
psql bgp -c 'DROP TABLE leak'
psql bgp -c 'DROP TABLE mrt_w_roas'
psql bgp -c 'DROP TABLE non_stubs'
psql bgp -c 'DROP TABLE peers'
psql bgp -c 'DROP TABLE roas'
psql bgp -c 'DROP TABLE rov'
psql bgp -c 'DROP TABLE rov_not_blocked_hijacked'
psql bgp -c 'DROP TABLE rov_validity'
psql bgp -c 'DROP TABLE stubs'
psql bgp -c 'DROP TABLE total_announcements'
#
