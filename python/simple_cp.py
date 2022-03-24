import os
from shutil import copy
import telebot
import paramiko
from scp import SCPClient

token = "my_tg_token"

bot = telebot.TeleBot(token)

path_for_onedrive = "my_windows_path"
ip = "10.0.0.2"
port = "22"
user_pass = "example"
target_folder = ""

def createSSHClient(server, port, user, password):
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(server, port, user, password)
    return client


def create_scp(ip:str, port: str, user: str, password:str):
    ssh = createSSHClient(ip, port, user, password)
    scp = SCPClient(ssh.get_transport())
    return scp

@bot.message_handler(regexp="^.*-R[0-9].*r\n*")
def send_rel(message):
    bot.reply_to(message, "Copy:  " + message.text)
    scp = create_scp(ip, port, user_pass, user_pass)
    for line in message.text.splitlines():
        print("copy: " + line)
        try:
            scp.put(path_for_onedrive + line, remote_path=target_folder)
        except FileNotFoundError:
            bot.reply_to(message, f'Cannot find file {line}')
        except OSError as e:
            print(e)
    bot.reply_to(message, "download " + message.text)
bot.polling()