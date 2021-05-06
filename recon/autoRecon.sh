#!/bin/bash

IP=$1

mkdir -p scans/nmap scans/dirbs reports/loot exploits www
touch reports/notes.md

initial(){
    sudo nmap -vv -sC -sV -O -A -oA scans/nmap/initial -T4 -Pn $IP
}
initial

allPorts(){
    ports=$(sudo nmap -p- -T4 --min-rate=1000 $IP | grep open | awk -F'/' '{print $1}' | tr '\n' ',' | sed s/,$// )
    sudo nmap -vv -p$ports -sC -sV -O -A -oA scans/nmap/allPorts -T4 -Pn $IP
}
allPorts

vulnScan(){
    sudo nmap -vv -p$ports --script=vuln -sV -O -oA scans/nmap/vulnScan -T4 -Pn $IP
}
vulnScan

udpScan(){
    udPorts=$(sudo nmap -sU -p- -T4 --min-rate=10000 $IP | grep open | awk -F'/' '{print $1}' | tr '\n' ',' | sed s/,$// )
    sudo nmap -vv -A -p$udPorts -oA scans/nmap/udp -T4 -Pn $IP
}
udpScan
