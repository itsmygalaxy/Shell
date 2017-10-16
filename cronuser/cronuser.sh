#!/bin/bash
#for user in $(clish -c "show users" | awk '{print $1}'); do
for user in $(cut -d : -f 1 /etc/passwd); do
echo -e "USER - $user:\n"
more /var/spool/cron/$user
echo -d "##################\n"
done
