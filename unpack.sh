#!/bin/bash
#
echo Running $0
#
zcat results.sql.gz | psql bgp
#
