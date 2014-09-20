# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status
from i3pystatus.mail import imap
import accounts

status = Status(standalone=True)

status.register("clock",
	format="%a %-d %b %X",)

#status.register("temp",
#	format="{temp:.0f}°C",)

status.register("battery",
	format="{status} {remaining:%E%hh:%Mm}",
	alert=True,
	alert_percentage=5,
	status={
		"DIS":  "Discharging",
		"CHR":  "Charging",
		"FULL": "Bat full",
	},)

status.register("network",
	interface="eth0",
	detached_down=True,
	format_up="{v4cidr}",)

status.register("network",
	interface="usb0",
	detached_down=True,
	format_up="{v4cidr}",)

status.register("wireless",
	interface="wlan0",
	detached_down=True,
	format_up="{essid} {quality:03.0f}% {v4cidr}",)

status.register("disk",
	path="/",
	format="/ : {avail}G libre",)

status.register("disk",
	path="/home",
	format="/home : {avail}G libre",)

status.register("mem",
	format="{used_mem}/{total_mem}")

theBackends=[]
for account in accounts.credentials:
	theBackends.append(imap.IMAP(host="imap.gmail.com", port=993, ssl=True, username=account[0], password=account[1]))

status.register("mail", backends=theBackends)

status.run()
