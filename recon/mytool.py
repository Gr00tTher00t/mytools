import os
import re

BASIC = ["whoami","hostname ","uname -a","cat /etc/password","cat /etc/shadow","groups","ifconfig","ps aux | grep root","uname -a","env","id","cat /proc/version","cat /etc/issue","cat /etc/passwd","cat /etc/group","cat /etc/shadow","cat /etc/hosts"]


print("\t\t\t\t===========Start===================\n\n")
for i in BASIC:
	print(f"\n\t\t==========={i} Starting================\n")

	os.system(f"{i}")

	print(f"\n\t\t====================={i} Ending=================\n\n")