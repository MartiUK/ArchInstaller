#!/usr/bin/env bash

packer -S --noedit --noconfirm btsync
systemctl --system daemon-reload

#Configuration is located at /etc/btsync.conf and contains sample data.
#The corresponding systemd-unit is 'btsync.service'
#WebGUI can be accessed at http://localhost:8888
#
#User-specific BTSync configuration
#Helps to set ownership to someone other than root for files that are copied
#with btsync. A default configuration file is automatically created at
#~/.config/btsync/btsync.conf if this file does not exist. You may want to
#change the device_name, webui.login and webui.password settings. You can
#either edit the config file directly or use the
#/usr/share/bittorrent-sync/btsync-makeconfig.sh script, pass it the --help
#flag to learn more about it. Please note that the PIDFile setting in
#  /usr/lib/systemd/system/btsync@.service assumes the default settings of
#  storage_path and pid_file.
#
#  To start btsync, execute:
#
#  $ systemctl start btsync@user
#
#  where 'user' is your username.

