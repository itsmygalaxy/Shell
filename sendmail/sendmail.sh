#!/bin/bash
#Declaring variables
. /etc/profile.d/CP.sh
SENDER=no_reply@$(uname -n).com
RECEIVER=<receiver email address goes here>
SMTP_SERVER=1.1.1.1
SUBJECT="Alert"
#syntax
SENDMAIL="$FWDIR/bin/sendmail -t $SMTP_SERVER -s "$SUBJECT" -f $SENDER $RECEIVER"
#send email
more somelog.txt | $SENDMAIL
