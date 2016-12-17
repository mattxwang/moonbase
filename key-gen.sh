#!/bin/bash

# Read keyfile
echo "Please enter keyfile location (same as config.yml)"
echo -n "If none is entered, default './user/login.key': "
read KEYFILE

# Use default if none provided
if [ "$KEYFILE" == "" ]; then
	KEYFILE='./user/login.key'
fi


# Read new password
echo -n "Please enter new password: "
read PASSWORD

# Fail on empty
if [ "$PASSWORD" == "" ]; then
	echo "Can't use empty password"
	exit 128
fi

# Read new re-password
echo -n "Please re-enter new password: "
read REPASSWORD

# Fail on empty or different
if [ "$REPASSWORD" == "" ] || [ "$REPASSWORD" != "$PASSWORD" ]; then
	echo "Can't use empty password"
	exit 128
fi

echo "Password confirmed"
echo $(md5 -qs $PASSWORD) > $KEYFILE
echo "Password change successful"