#!/bin/bash
# DESC: remove ansible
# DATE: 20190502
# WHO: Chris Ruettimann cruettimann@uniqconsulting.ch

rpm -q ansible >/dev/null 2>&1 && yum -y remove ansible git
echo done
