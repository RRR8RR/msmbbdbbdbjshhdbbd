from pyrogram import Client,filters,enums
import redis
r = redis.Redis(
    host="127.0.0.1",
    port=6379,
    charset="utf-8",
    decode_responses=True
    )

sudo_id = 6186856384
bot_user = "D_P1_2_bot"
api_id = 10823881
api_hash = "339886e2109eb67203ce12022b32e035"
session = "BAClb5LHg5JEvqA3mSo3UU-w9jZSrqrV9R7PdTnQ6F-3unwGhHETe2hq93gWqdqErRUn7F1Y-i9EXNPvXT0zzE-oRv6GjgBg_XmH6JfMTVBZktlravBc2yaUnMSlD0w96aEMVd029IWdJHRE73gtCNzQvlzk3Mf6X9DqGeNZbKF4gp_4rxtnpkZpTn1g9XAiU_ZSQmknFXFjiaQ7oISKqaPPN6kXvleQnIj1qFUHrw6j7GDvW7hHlh1-vjnBYe_uhGkbJpWEOkBBZ99re5f0YjmN3CDpgQYKLWhwomhPtiGdIUGIgxZ90Nfu8pD7bzXlwH-i8_NjW6XLquGNVhLsh4-NAAAAAXJdAbYA"
token = "6247911571:AAE5BigKpsEb26VLCi19M3V-nWg_L5NQY4Y"
sudo_command = [6186856384, 1001132193]
pm = "6186856384"
mention = "6186856384"
plugins = dict(root="plugins")
app = Client("user:D_P1_2_bot",api_id , api_hash ,in_memory=True,session_string = session,plugins=plugins)
bot = Client("D_P1_2_bot",api_id=api_id , api_hash=api_hash ,bot_token=token,plugins=dict(root="plug_bot"))
