#!/bin/bash
#
echo Running $0
#
psql bgp -c 'DROP TABLE customer_providers, extrapolation_inverse_results, hijack, invalid_asn, invalid_asn_blocked_hijacked, invalid_asn_blocked_not_hijacked, invalid_asn_not_blocked_hijacked, invalid_length, invalid_length_blocked_hijacked, invalid_length_blocked_not_hijacked, invalid_length_not_blocked_hijacked, leak, mrt_w_roas, non_stubs, peers, roas, rov, rov_not_blocked_hijacked, rov_validity, stubs, total_announcements'
