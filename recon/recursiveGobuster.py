import os
import sys

def runGobuster():
	levels = sys.argv[1]
	target = sys.argv[2]
	level = 0
	wordlist = sys.argv[3]
	threads = sys.argv[4]
	extensions = sys.argv[5]
	gobusterOutput = sys.argv[6]

	print(f"{str(sys.argv)}")

	if(level == 0):
		os.system(f"gobuster dir -f -u {target} -w {wordlist} -t {threads} -x {extensions} -o {gobusterOutput} | grep -i 'status: [234]' | awk \"{print $1}\" | tr -d '/' | grep -v '\.' | while read line; do echo '\$line Added to Queue' ")
		level=level+1
	elif (level > 1 and level < levels):
		printf(f"under processing....")

runGobuster()
