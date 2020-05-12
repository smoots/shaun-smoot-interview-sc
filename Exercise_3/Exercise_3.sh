#!/bin/bash
#
# script:  Exercise_3.sh
#
# description: SELinux managment commands
#
#


# Command use map the 'restricteduser' user to the SELinux user 'user_u'
sudo semanage login -a -s user_u restricteduser


# Command use to update default user mapping in SELinux to 'user_u'
sudo semanage login -m -S targeted -s "user_u" -r s0 __default__
