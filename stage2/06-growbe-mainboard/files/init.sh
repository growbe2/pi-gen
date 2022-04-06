# ! /bin/bash

if [ -n "$(ls -A /boot/growbe/ 2>/dev/null)" ]
then
	cp -r /boot/growbe/* /opt/growbe

    if [ -f /opt/growbe/autossh/id_rsa ]; then
        chmod 0700 /opt/growbe/autossh/id_rsa
    fi

    if [ ! -f /opt/growbe/growbe-mainboard ]; then
        cd /opt/growbe/
        bash ./download.sh latest
        mv growbe-mainboard-arm-linux-latest growbe-mainboard
    fi
	/opt/growbe/configure.sh
	rm -rf /boot/growbe/*
else
  echo "empty (or does not exist)"
fi
