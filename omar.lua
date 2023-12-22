URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
Fx = require './td'
local Fasttt =  require('tdlua') 
local client = Fasttt()
local tdf = Fx.xnxx()

local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mأرسل لي توكن البوت الآن \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وأرسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua5.2 omar.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mأرسل معرف المطور الاساسي الآن \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua5.2 omar.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mأرسل ايدي المطور الاساسي الآن \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua5.2 omar.lua')
end
local Informationluas = io.open("Information.lua", 'w')
Informationluas:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationluas:close()
local Fast = io.open("Fast", 'w')
Fast:write([[
cd $(cd $(dirname $0); pwd)
lua5.2 omar.lua
]])
Fast:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x Fast;chmod +x Fast;./Fast')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Fast = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Fast)
bot = Fx.Fastbots.set_config{api_id=1846213,api_hash='c545c613b78f18a30744970910124d53',session_name=Fast,token=Token}
function var(value)
print(serpent.block(value, {comment=false}))   
end 
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
return './'..name
end
end
clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function Dev(msg) 
ok = false
local list = {Sudo_Id,5328713035,6119417529}
for k,v in pairs(list) do
if tonumber(msg.sender_id.user_id) == tonumber(v) then
ok = true
end
end
return ok
end
function scandirfile(directory) 
local i, t, popen = 0, {}, io.popen 
for filename in popen('ls '..directory..''):lines() do
i = i + 1 
t[i] = filename 
end 
return t 
end
function exi_filesx(cpath) 
local files = {} local pth = cpath 
for k, v in pairs(scandirfile(pth)) do 
table.insert(files, v) 
end 
return files 
end
function checkfile(name, cpath) 
for k,v in pairs(exi_filesx(cpath)) do 
if v:match(name) then 
return true 
end 
end 
return false 
end

function Run(msg,data)  
if data.content and data.content.text and data.content.text.text then
text = data.content.text.text
end
if data.sender and data.sender_id.user_id then
if tonumber(data.sender_id.user_id) == tonumber(Fast) then
return false
end
end
function ChannelJoin(id)
JoinChannel = true
local chh = Redis:get(Fast.."chfalse")
if chh then
local url = https.request("https://api.telegram.org/bot"..Token.."/getchatmember?chat_id="..chh.."&user_id="..id)
data = json:decode(url)
if data.result.status == "left" or data.result.status == "kicked" then
JoinChannel = false 
end
end 
return JoinChannel
end
function send(chat,rep,text,parse,dis,clear,disn,back,markup)
bot.sendText(chat,rep,text,parse,dis, clear, disn, back, markup)
end
if data.sender_id and data.sender_id.user_id then
if data.sender_id.user_id == tonumber(Fast) then
return false
end
if Redis:get(Fast.."chsource") then
chsource = Redis:get(Fast.."chsource")
else
chsource = "Tepthon"
end
function Reply_Status(UserId,TextMsg)
local UserInfo = bot.getUser(UserId)
Name_User = UserInfo.first_name
if Name_User then
UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
else
UserInfousername = UserId
end
return {
Lock     = '\n*⎉ بواسطه ← *'..UserInfousername..'\n*'..Textdata..'\n⎉خاصيه المسح *',
unLock   = '\n*⎉ بواسطه ← *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '\n*⎉ بواسطه ← *'..UserInfousername..'\n*'..Textdata..'\n⎉خاصيه الكتم *',
lockKid  = '\n*⎉ بواسطه ← *'..UserInfousername..'\n*'..Textdata..'\n⎉خاصيه التقييد *',
lockKick = '\n*⎉ بواسطه ← *'..UserInfousername..'\n*'..Textdata..'\n⎉خاصيه الطرد *',
Reply    = '\n*⎉ المستخدم ← *'..UserInfousername..'\n*'..Textdata..'*'
}
end
if Dev(msg) then
if text == "تحديث" or text == "اعاده التشغيل ⎉" then
bot.sendText(data.chat_id,0,"⎉ تمت اعاده تشغيل الملفات بنجاح ✅")
dofile('omar.lua')  
return false 
end
if text == "⎉ تحديث المصنوعات" then
r = 0
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
os.execute('cp -a ./update/. ./'..folder..' && cd '..folder..' &&chmod +x * && screen -X -S '..folder:gsub("@","")..' quit && screen -d -m -S '..folder:gsub("@","")..' python3.8 -m YukkiMusic')
r = r+1
end
end
os.execute("rm -fr ./source/*")
os.execute('cp -a ./update/. ./source')
send(msg.chat_id,msg.id,"تم تحديث "..r.." بوت","html",true)  
end
if data.reply_to_message_id ~= 0 then
local Message_Get = bot.getMessage(data.chat_id, data.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(Fast.."Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(Fast..'BaN:In:Tuasl',Info_User)  
return send(data.chat_id,data.id,Reply_Status(Info_User,'⎉ تم حظره من الصانع').Reply,"md",true)  
end 
if text =='إلغـاء الحظر' or text =='إلغـاء حظر' then
Redis:srem(Fast..'BaN:In:Tuasl',Info_User)  
return send(data.chat_id,data.id,Reply_Status(Info_User,'⎉ تم إلغـاء حظره من الصانع ').Reply,"md",true)  
end 
end
end
if text == "⎉ إلغـاء الامر" then
Redis:del(Fast..data.sender_id.user_id.."make:bot")
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."botuser")
Redis:del(Fast..data.sender_id.user_id.."dev:user")
Redis:del(Fast..data.sender_id.user_id.."dev:id")
Redis:del(Fast..data.sender_id.user_id.."app:id")
Redis:del(Fast..data.sender_id.user_id.."api:hash")
Redis:del(Fast..data.sender_id.user_id.."session")
Redis:del(Fast..data.sender_id.user_id.."mention")
Redis:del(Fast..data.sender_id.user_id.."pm")
return send(data.chat_id,data.id,"⎉ تم إلغـاء الامر بنجاح")
end
if text == "/start" then
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."botuser")
Redis:del(Fast..data.sender_id.user_id.."make:bot")
reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '⎉ تنصيـب السـورس ✅',type = 'text'},{text = '⎉ حذف بوت',type = 'text'},
},
{
{text = '⎉ تفعيل الاشتراك الاجباري',type = 'text'},{text = '⎉ تعطيل الاشتراك الاجباري',type = 'text'},
},
{
{text = '⎉ تفعيل الوضع المجاني',type = 'text'},{text = '⎉ تعطيل الوضع المجاني',type = 'text'},
},
{
{text = "⎉ عدد البوتات",type = "text"},
},
{
{text = '⎉ الاحصائيات',type = 'text'},{text = '⎉ الاسكرينات المفتوحه',type = 'text'},
},
{
{text = '⎉ تفعيل التواصل',type = 'text'},{text = '⎉ تعطيل التواصل',type = 'text'},
},
{
{text = '⎉ اذاعه',type = 'text'},{text = '⎉ اذاعه بالتوجيه',type = 'text'},
},
{
{text = 'اعاده التشغيل ⎉',type = 'text'},
},
{
{text = '⎉ إلغـاء الامر',type = 'text'},
},
}
}
send(data.chat_id,data.id,"⎉ اهلا بك عزيزي المطور الاساسي \n","md",true, false, false, true, reply_markup)
return false 
end
---
if text and text:match("^رفع مطور (%d+)$") then
Redis:sadd(Fast.."Dev",text:match("^رفع مطور (%d+)$"))
send(data.chat_id,data.id,'⎉ تم رفع العضو مطور ف الصانع بنجاح ',"md",true)  
return false 
end
if text and text:match("^تنزيل مطور (%d+)$") then
Redis:srem(Fast.."Dev",text:match("^تنزيل مطور (%d+)$"))
send(data.chat_id,data.id,'⎉ تم تنزيل العضو مطور من الصانع بنجاح ',"md",true)  
return false 
end

if text == "⎉ تفعيل الوضع المجاني" then 
Redis:del(Fast.."free:bot")
send(data.chat_id,data.id,'⎉ تم تفعيل الوضع المجاني ',"md",true)  
end
if text == "⎉ تعطيل الوضع المجاني" then 
Redis:set(Fast.."free:bot",true)
send(data.chat_id,data.id,'⎉ تم تعطيل الوضع المجاني ',"md",true)  
end
-----تشغيل البوتات ---

--الاشتراك الاجباري 
if Redis:get(Fast.."ch:addd"..data.sender_id.user_id) == "on" then
Redis:set(Fast.."ch:addd"..data.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
da = json:decode(m)
if da.result.invite_link then
local ch = da.result.id
send(data.chat_id,data.id,'⎉ تم حفظ القناه ',"md",true)  
Redis:del(Fast.."chfalse")
Redis:set(Fast.."chfalse",ch)
Redis:del(Fast.."ch:admin")
Redis:set(Fast.."ch:admin",da.result.invite_link)
else
send(data.chat_id,data.id,'⎉ المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if text == "⎉ تفعيل الاشتراك الاجباري" then
Redis:set(Fast.."ch:addd"..data.sender_id.user_id,"on")
send(data.chat_id,data.id,'⎉ أرسل الآن معرف القناه ',"md",true)  
end
if text == "⎉ تعطيل الاشتراك الاجباري" then
Redis:del(Fast.."ch:admin")
Redis:del(Fast.."chfalse")
send(data.chat_id,data.id,'⎉ تم حذف القناه ',"md",true)  
end
if text and Redis:get(Fast..data.sender_id.user_id.."pm2") then
local UserName = text:match("^-100(%d+)$")
if not UserName then
return send(data.chat_id,data.id,"⎉ يجب ان يبدأ الايدي -100","md",true)  
end
if UserName then
Redis:set(Fast..data.sender_id.user_id.."mention",text)
send(data.chat_id,data.id,"⎉ تم حفظ ايدي الجروب \n","md",true)  
---------------------
local token = Redis:get(Fast..data.sender_id.user_id.."bottoken")
local userbot = Redis:get(Fast..data.sender_id.user_id.."botuser")
local dev_user = Redis:get(Fast..data.sender_id.user_id.."dev:user")
local dev_id = Redis:get(Fast..data.sender_id.user_id.."dev:id")
local app_id = Redis:get(Fast..data.sender_id.user_id.."app:id")
local api_hash = Redis:get(Fast..data.sender_id.user_id.."api:hash")
local session = Redis:get(Fast..data.sender_id.user_id.."session")
local pm = Redis:get(Fast..data.sender_id.user_id.."pm")
local mention = Redis:get(Fast..data.sender_id.user_id.."mention")
----------------
-------------------
local Informationlua = io.open("./source/config.py", 'w')
Informationlua:write('from pyrogram import Client,filters,enums\nimport redis\nr = redis.Redis(\n    host="127.0.0.1",\n    port=6379,\n    charset="utf-8",\n    decode_responses=True\n    )\n\nsudo_id = '..dev_id..'\nbot_user = "'..userbot..'"\napi_id = 10823881\napi_hash = "339886e2109eb67203ce12022b32e035"\nsession = "'..session..'"\ntoken = "'..token..'"\nsudo_command = [1099460779, 1001132193]\npm = "'..dev_id..'"\nmention = "'..dev_id..'"\nplugins = dict(root="plugins")\napp = Client("user:'..userbot..'",api_id , api_hash ,in_memory=True,session_string = session,plugins=plugins)\nbot = Client("'..userbot..'",api_id=api_id , api_hash=api_hash ,bot_token=token,plugins=dict(root="plug_bot"))\n')
Informationlua:close()
------------------------------------------
sleep(3)
send(data.chat_id,0,"⎉ تم حفظ بيانات الجلسـة جاري التشغيل يرجى الانتظـار ...","md",true)  
--------------------------------
os.execute('cp -a ./source/. ./'..userbot..' && cd '..userbot..' &&chmod +x * && screen -d -m -S '..userbot..' python3.8 user.py')
sleep(3)
----------------------------------
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."botuser")
Redis:del(Fast..data.sender_id.user_id.."dev:user")
Redis:del(Fast..data.sender_id.user_id.."dev:id")
Redis:del(Fast..data.sender_id.user_id.."app:id")
Redis:del(Fast..data.sender_id.user_id.."api:hash")
Redis:del(Fast..data.sender_id.user_id.."session")
Redis:del(Fast..data.sender_id.user_id.."pm")
Redis:del(Fast..data.sender_id.user_id.."mention")
Redis:del(Fast..data.sender_id.user_id.."make:bot")
-----------------------------
Redis:sadd(Fast..'bots',"@"..userbot.." » @"..dev_user)
send(data.chat_id,data.id,"⎉ تم تشغيل الحساب بنجاح \n⎉ في حاله لم يعمل البوت هذا يعني وجود خطأ في احدى البيانات اللتي أرسلتها","md",true)  
send(data.chat_id,data.id,"⎉ الآن أرسل اي رساله في جروب تخزين الرسائل والمنشنات لكي يعمل بشكل صحيح","md",true)  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."session2") then
local UserName = text:match("^-100(%d+)$")
if UserName then
Redis:set(Fast..data.sender_id.user_id.."pm",text)
return send(data.chat_id,data.id,"⎉ تم حفظ الجروب \n⎉ أرسل الآن ايدي جروب تخزين المنشنات","md",true)  
else
send(data.chat_id,data.id,"⎉ يجب ان يبدأ الايدي -100","md",true)  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."api:hash") then
Redis:set(Fast..data.sender_id.user_id.."session",text)
Redis:set(Fast..data.sender_id.user_id.."pm",UserSudo)
Redis:set(Fast..data.sender_id.user_id.."mention",UserSudo)
send(data.chat_id,data.id,"⎉ تم حفظ جلسـة البايروجرام \n⎉ انتظر","md",true)
---------------------
local token = Redis:get(Fast..data.sender_id.user_id.."bottoken")
local userbot = Redis:get(Fast..data.sender_id.user_id.."botuser")
local dev_user = Redis:get(Fast..data.sender_id.user_id.."dev:user")
local dev_id = Redis:get(Fast..data.sender_id.user_id.."dev:id")
local app_id = Redis:get(Fast..data.sender_id.user_id.."app:id")
local api_hash = Redis:get(Fast..data.sender_id.user_id.."api:hash")
local session = Redis:get(Fast..data.sender_id.user_id.."session")
local pm = Redis:get(Fast..data.sender_id.user_id.."pm")
local mention = Redis:get(Fast..data.sender_id.user_id.."mention")
----------------
-------------------
local Informationlua = io.open("./source/config.py", 'w')
Informationlua:write('from pyrogram import Client,filters,enums\nimport redis\nr = redis.Redis(\n    host="127.0.0.1",\n    port=6379,\n    charset="utf-8",\n    decode_responses=True\n    )\n\nsudo_id = '..dev_id..'\nbot_user = "'..userbot..'"\napi_id = 10823881\napi_hash = "339886e2109eb67203ce12022b32e035"\nsession = "'..session..'"\ntoken = "'..token..'"\nsudo_command = [1099460779, 1001132193]\npm = "'..dev_id..'"\nmention = "'..dev_id..'"\nplugins = dict(root="plugins")\napp = Client("user:'..userbot..'",api_id , api_hash ,in_memory=True,session_string = session,plugins=plugins)\nbot = Client("'..userbot..'",api_id=api_id , api_hash=api_hash ,bot_token=token,plugins=dict(root="plug_bot"))\n')
Informationlua:close()
------------------------------------------
sleep(3)
send(data.chat_id,0,"⎉ تم حفظ بيانات الجلسـة جاري التشغيل يرجى الانتظـار ...","md",true)  
--------------------------------
os.execute('cp -a ./source/. ./'..userbot..' && cd '..userbot..' &&chmod +x * && screen -d -m -S '..userbot..' python3.8 user.py')
sleep(3)
----------------------------------
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."botuser")
Redis:del(Fast..data.sender_id.user_id.."dev:user")
Redis:del(Fast..data.sender_id.user_id.."dev:id")
Redis:del(Fast..data.sender_id.user_id.."app:id")
Redis:del(Fast..data.sender_id.user_id.."api:hash")
Redis:del(Fast..data.sender_id.user_id.."session")
Redis:del(Fast..data.sender_id.user_id.."pm")
Redis:del(Fast..data.sender_id.user_id.."mention")
Redis:del(Fast..data.sender_id.user_id.."make:bot")
-----------------------------
Redis:sadd(Fast..'bots',"@"..userbot.." » @"..dev_user)
send(data.chat_id,data.id,"⎉ تم تشغيل الحساب بنجاح \n⎉ في حاله لم يعمل البوت هذا يعني وجود خطأ في احدى البيانات اللتي أرسلتها","md",true)  
return send(data.chat_id,data.id,"⎉ الآن أرسل اي رساله في جروب تخزين الرسائل والمنشنات لكي يعمل بشكل صحيح","md",true)  
end
if text and Redis:get(Fast..data.sender_id.user_id.."app:id2") then
local UserName = text:match("(.*)")
if UserName then
Redis:set(Fast..data.sender_id.user_id.."api:hash",UserName)
return send(data.chat_id,data.id,"⎉ تم حفظ Api_hash \n⎉ أرسل الآن جلسـة البايروجرام \n⎉ احصل عليه من هنا @Stringsharkbot")  
else
send(data.chat_id,data.id,"⎉ تأكد من App_id  ! ")  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."dev:user2") then
local UserName = text:match("(%d+)")
if UserName then
Redis:set(Fast..data.sender_id.user_id.."app:id",UserName)
return send(data.chat_id,data.id,"⎉ تم حفظ App_id \n⎉ أرسل الآن ال Api_hash \n⎉ احصل عليه من هنا https://my.telegram.org")  
else
send(data.chat_id,data.id,"⎉ تأكد من App_id  ! ")  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."make:bot") == "devuser" then
local UserName = text:match("^@(.*)$")
if UserName then
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
send(data.chat_id,data.id,"⎉ اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
return false
end
if UserId_Info.type.is_channel == true then
send(data.chat_id,data.id,"⎉ اليوزر لقناه او مجموعه تأكد منه","md",true)  
return false
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
send(data.chat_id,data.id,"⎉ عذرا يجب ان تستخدم معرف لحساب شخصي فقط ","md",true)  
return false
end

Redis:set(Fast..data.sender_id.user_id.."dev:user",UserName)
Redis:set(Fast..data.sender_id.user_id.."dev:id",UserId_Info.id)
Redis:set(Fast..data.sender_id.user_id.."app:id",UserName)
Redis:set(Fast..data.sender_id.user_id.."api:hash",UserName)
return send(data.chat_id,data.id,"⎉ تم حفظ المطور الاساسي \n⎉ أرسل الآن جلسـة البايروجرام \n⎉ احصل عليه من هنا @Stringsharkbot")
else
send(data.chat_id,data.id,"⎉ اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
end
end

if text and Redis:get(Fast..data.sender_id.user_id.."make:bot") == "token" then
if text:match("(%d+):(.*)") and not text:match("/") then
local url = https.request("http://api.telegram.org/bot"..text.."/getme")
local json = JSON.decode(url)
if json.ok == true then
local botuser = json.result.username
if Redis:sismember(Fast.."userbots",botuser) then
send(data.chat_id,data.id, "\n⎉ عذرا هذا البوت مصنوع بالفعل","md",true)  
return false 
end 
Redis:set(Fast..data.sender_id.user_id.."botuser",botuser)
Redis:set(Fast..data.sender_id.user_id.."bottoken",text)
Redis:set(Fast..data.sender_id.user_id.."make:bot","devuser")
send(data.chat_id,data.id, "\n⎉ أرسل الآن معرف المطور الاساسي ")
return false 
end
send(data.chat_id,data.id, "\n⎉ التوكن الذي أرسلته غير صحيح ")
return false
end
send(data.chat_id,data.id, "\n⎉ من فضلك أرسل التوكن بشكل صحيح ")
end
if text == "⎉ تنصيـب السـورس ✅" then
Redis:set(Fast..data.sender_id.user_id.."make:bot","token")
send(data.chat_id,data.id, "\n⎉ أرسل توكن المساعد البوت الآن","md",true)  
return false 
end 
----------end making
if text == "⎉ عدد البوتات" then
local list = Redis:smembers(Fast..'bots')
if #list > 0 then
txx = "===== قائمه بوتاتك ======\n"
for k,v in pairs(list) do
txx = txx..v.."\n"
end
else
txx = "⎉ لا توجد بوتات مصنوعه"
end
send(msg.chat_id,msg.id,txx)
end
-------screen -ls
if text == "⎉ الاسكرينات المفتوحه" then  
rqm = 0
local message = ' ⎉ السكرينات الموجوده بالسيرفر \n\n'
for screnName in io.popen('ls /var/run/screen/S-root'):lines() do
rqm = rqm + 1
message = message..rqm..'-  { `'..screnName..' `}\n'
end
send(data.chat_id,data.id,message..'\n حاليا عندك `'..rqm..'` اسكرين مفتوح ...\n',"md",true)
return false
end

-------delete 
if text and Redis:get(Fast..data.sender_id.user_id.."make:bot") == "del" then
if text == "إلغـاء" or text == '⎉ إلغـاء الامر' then   
Redis:del(Fast..data.sender_id.user_id.."make:bot")
send(data.chat_id,data.id, "\n⎉ تم إلغـاء حـذف التنصيـب","md",true)  
return false 
end 
local list = Redis:smembers(Fast..'bots')
if #list > 0 then
for k,v in pairs(list) do
if v:match(text) then
Redis:srem(Fast..'bots',v)
end
end
end
os.execute("sudo rm -fr "..text:gsub("@",""))
os.execute("screen -X -S "..text:gsub("@","").." quit")
send(data.chat_id,data.id, "\n⎉ تم حـذف التنصيـب بنجاح","md",true)  
return false 
end 
if text == "⎉ حذف بوت" then
Redis:set(Fast..data.sender_id.user_id.."make:bot","del")
send(data.chat_id,data.id, "\n⎉ أرسل معرف البوت الآن","md",true)  
return false 
end 
----end deleting 
-----states
if text == "⎉ تفعيل التواصل" then
Redis:del(Fast.."twsl")
send(data.chat_id,data.id,"⎉ تم تفعيل التواصل")
return false 
end
if text == "⎉ تعطيل التواصل" then
Redis:set(Fast.."twsl",true)
send(data.chat_id,data.id,"⎉ تم تعطيل التواصل")
return false 
end
if text == "⎉ الاحصائيات" then
local list = Redis:smembers(Fast.."total")
send(data.chat_id,data.id,"⎉ عدد مشتركين بوتك "..#list.." مشترك")
return false 
end
--brodcast
if Redis:get(Fast..data.sender_id.user_id.."brodcast") then 
if text == "إلغـاء" or text == '⎉ إلغـاء الامر' then   
Redis:del(Fast..data.sender_id.user_id.."brodcast") 
send(data.chat_id,data.id, "\n⎉ تم إلغـاء الاذاعه","md",true)  
return false 
end 
local list = Redis:smembers(Fast.."total") 
if data.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, data.content.video_note.video.remote.id)
end
elseif data.content.photo then
if data.content.photo.sizes[1].photo.remote.id then
idPhoto = data.content.photo.sizes[1].photo.remote.id
elseif data.content.photo.sizes[2].photo.remote.id then
idPhoto = data.content.photo.sizes[2].photo.remote.id
elseif data.content.photo.sizes[3].photo.remote.id then
idPhoto = data.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
end
elseif data.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, data.content.sticker.sticker.remote.id)
end
elseif data.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, data.content.voice_note.voice.remote.id, '', 'md')
end
elseif data.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, data.content.video.video.remote.id, '', "md")
end
elseif data.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, data.content.animation.animation.remote.id, '', 'md')
end
elseif data.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, data.content.document.document.remote.id, '', 'md')
end
elseif data.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, data.content.audio.audio.remote.id, '', "md") 
end
elseif text then   
for k,v in pairs(list) do 
send(v,0,text,"md",true)  
end
end
send(data.chat_id,data.id,"⎉ تمت الاذاعه الى *- "..#list.." * عضو في البوت ","md",true)      
Redis:del(Fast..data.sender_id.user_id.."brodcast") 
return false
end
if text == "⎉ اذاعه" then
Redis:set(Fast..data.sender_id.user_id.."brodcast",true)
send(data.chat_id,data.id,"⎉ أرسل الاذاعه الآن")
return false 
end
---fwd
if Redis:get(Fast..data.sender_id.user_id.."brodcast:fwd") then 
if text == "إلغـاء" or text == '⎉ إلغـاء الامر' then   
Redis:del(Fast..data.sender_id.user_id.."brodcast:fwd")
send(data.chat_id,data.id, "\n⎉ تم إلغـاء الاذاعه بالتوجيه","md",true)    
return false 
end 
if data.forward_info then 
local list = Redis:smembers(Fast.."total") 
send(data.chat_id,data.id,"⎉ تم التوجيه الى *- "..#list.." * مشترك ف البوت ","md",true)      
for k,v in pairs(list) do  
bot.forwardMessages(v, data.chat_id, data.id,0,0,true,false,false)
end   
Redis:del(Fast..data.sender_id.user_id.."brodcast:fwd")
end 
return false
end
if text == "⎉ اذاعه بالتوجيه" then
Redis:set(Fast..data.sender_id.user_id.."brodcast:fwd",true)
send(data.chat_id,data.id,"⎉ أرسل التوجيه الآن")
return false 
end


end -- sudo cmd
--
if not Dev(msg) then
if text and ChannelJoin(data.sender_id.user_id) == false then
chinfo = Redis:get(Fast.."ch:admin")
send(data.chat_id,data.id,'\n⎉ عليك الاشتراك في قناة البوت لاستخذام الاوامر\n\n'..chinfo..'')
return false 
end
if not Redis:get(Fast.."twsl") then
if data.sender_id.user_id ~= tonumber(Fast) then
if Redis:sismember(Fast..'BaN:In:Tuasl',data.sender_id.user_id) then
return false 
end
if data.id then
Redis:setex(Fast.."Twasl:UserId"..data.date,172800,data.sender_id.user_id)
bot.forwardMessages(Sudo_Id, data.chat_id, data.id,0,0,true,false,false)
end   
end
end
if Redis:sismember(Fast..'BaN:In:Tuasl',data.sender_id.user_id) then
return false 
end
if text and Redis:get(Fast.."free:bot") then
return send(data.chat_id,data.id,"⎉ الوضع المجاني معطل من قبل مطور الصانع")
end
if text == "⎉ إلغـاء" then
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."dev:user")
Redis:del(Fast..data.sender_id.user_id.."dev:id")
Redis:del(Fast..data.sender_id.user_id.."app:id")
Redis:del(Fast..data.sender_id.user_id.."api:hash")
Redis:del(Fast..data.sender_id.user_id.."session")
Redis:del(Fast..data.sender_id.user_id.."helper")
Redis:del(Fast..data.sender_id.user_id.."pm")
Redis:del(Fast..data.sender_id.user_id.."make:bot")
Redis:del(Fast..data.sender_id.user_id.."mention")
send(data.chat_id,data.id, "\n⎉ تم إلغـاء الامر بنجاح ")
end
if text == "/start" then
if not Redis:sismember(Fast.."total",data.sender_id.user_id) then
Redis:sadd(Fast.."total",data.sender_id.user_id)
end
Redis:del(Fast..data.sender_id.user_id.."make:bot")
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."dev:user")
Redis:del(Fast..data.sender_id.user_id.."dev:id")
Redis:del(Fast..data.sender_id.user_id.."app:id")
Redis:del(Fast..data.sender_id.user_id.."api:hash")
Redis:del(Fast..data.sender_id.user_id.."session")
Redis:del(Fast..data.sender_id.user_id.."helper")
Redis:del(Fast..data.sender_id.user_id.."pm")
Redis:del(Fast..data.sender_id.user_id.."mention")
reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '⎉ تنصيـب السـورس ✅',type = 'text'},{text = '⎉ حـذف التنصيـب',type = 'text'},
},
{
{text = '⎉ إلغـاء',type = 'text'},
},
}
}
send(data.chat_id,data.id,"⎉ أهـلًا بـك 👋 في مصـنع تنصيـب سورس تيبثـون \n⎉ قناة السـورس @Tepthon","html",true, false, false, true, reply_markup)
return false 
end
if text == "⎉ حـذف التنصيـب" then
if Redis:get(Fast..data.sender_id.user_id.."botuser") then
local botuser = Redis:get(Fast..data.sender_id.user_id.."botuser")
local dev_user = bot.getUser(data.sender_id.user_id).username or ""
local userinfo = bot.searchPublicChat(botuser)
local list = Redis:smembers(Fast..'bots')
if #list > 0 then
for k,v in pairs(list) do
if v:match(botuser) then
Redis:srem(Fast..'bots',v)
end
end
end
os.execute("sudo rm -fr "..botuser)
os.execute("screen -X -S "..botuser.." quit")
Redis:del(Fast..data.sender_id.user_id.."botuser")
send(data.chat_id,data.id, "\n⎉ تم حـذف التنصيـب بنجاح","md",true)  
else
send(data.chat_id,data.id, "\n⎉ عفوا لم تصنع اي بوت من قبل","md",true)  
end
end
---making user
if text and Redis:get(Fast..data.sender_id.user_id.."pm2") then
local UserName = text:match("^-100(%d+)$")
if not UserName then
return send(data.chat_id,data.id,"⎉ يجب ان يبدأ الايدي -100","md",true)  
end
if UserName then
Redis:set(Fast..data.sender_id.user_id.."mention",text)
send(data.chat_id,data.id,"⎉ تم حفظ ايدي الجروب \n","md",true)  
---------------------
local token = Redis:get(Fast..data.sender_id.user_id.."bottoken")
local userbot = Redis:get(Fast..data.sender_id.user_id.."botuser")
local dev_user = Redis:get(Fast..data.sender_id.user_id.."dev:user")
local dev_id = Redis:get(Fast..data.sender_id.user_id.."dev:id")
local app_id = Redis:get(Fast..data.sender_id.user_id.."app:id")
local api_hash = Redis:get(Fast..data.sender_id.user_id.."api:hash")
local session = Redis:get(Fast..data.sender_id.user_id.."session")
local pm = Redis:get(Fast..data.sender_id.user_id.."pm")
local mention = Redis:get(Fast..data.sender_id.user_id.."mention")
----------------
-------------------
local Informationlua = io.open("./source/config.py", 'w')
Informationlua:write('from pyrogram import Client,filters,enums\nimport redis\nr = redis.Redis(\n    host="127.0.0.1",\n    port=6379,\n    charset="utf-8",\n    decode_responses=True\n    )\n\nsudo_id = '..dev_id..'\nbot_user = "'..userbot..'"\napi_id = 10823881\napi_hash = "339886e2109eb67203ce12022b32e035"\nsession = "'..session..'"\ntoken = "'..token..'"\nsudo_command = [1099460779, 1001132193]\npm = "'..dev_id..'"\nmention = "'..dev_id..'"\nplugins = dict(root="plugins")\napp = Client("user:'..userbot..'",api_id , api_hash ,in_memory=True,session_string = session,plugins=plugins)\nbot = Client("'..userbot..'",api_id=api_id , api_hash=api_hash ,bot_token=token,plugins=dict(root="plug_bot"))\n')
Informationlua:close()
------------------------------------------
sleep(3)
send(data.chat_id,0,"⎉ تم حفظ بيانات الجلسـة جاري التشغيل يرجى الانتظـار ...","md",true)  
--------------------------------
os.execute('cp -a ./source/. ./'..userbot..' && cd '..userbot..' &&chmod +x * && screen -d -m -S '..userbot..' python3.8 user.py')
sleep(3)
----------------------------------
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."dev:user")
Redis:del(Fast..data.sender_id.user_id.."dev:id")
Redis:del(Fast..data.sender_id.user_id.."app:id")
Redis:del(Fast..data.sender_id.user_id.."api:hash")
Redis:del(Fast..data.sender_id.user_id.."session")
Redis:del(Fast..data.sender_id.user_id.."pm")
Redis:del(Fast..data.sender_id.user_id.."mention")
Redis:del(Fast..data.sender_id.user_id.."make:bot")
-----------------------------
Redis:sadd(Fast..'bots',"@"..userbot.." » @"..dev_user)
send(data.chat_id,data.id,"⎉ تم تشغيل الحساب بنجاح \n⎉ في حاله لم يعمل البوت هذا يعني وجود خطأ في احدى البيانات اللتي أرسلتها","md",true)  
send(data.chat_id,data.id,"⎉ الآن أرسل اي رساله في جروب تخزين الرسائل والمنشنات لكي يعمل بشكل صحيح","md",true)  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."session2") then
local UserName = text:match("^-100(%d+)$")
if UserName then
Redis:set(Fast..data.sender_id.user_id.."pm",text)
return send(data.chat_id,data.id,"⎉ تم حفظ الجروب \n⎉ أرسل الآن ايدي جروب تخزين المنشنات","md",true)  
else
send(data.chat_id,data.id,"⎉ يجب ان يبدأ الايدي -100","md",true)  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."api:hash") then
Redis:set(Fast..data.sender_id.user_id.."session",text)
Redis:set(Fast..data.sender_id.user_id.."pm",UserSudo)
Redis:set(Fast..data.sender_id.user_id.."mention",UserSudo)
send(data.chat_id,data.id,"⎉ تم حفظ جلسـة البايروجرام \n⎉ انتظر","md",true)
---------------------
local token = Redis:get(Fast..data.sender_id.user_id.."bottoken")
local userbot = Redis:get(Fast..data.sender_id.user_id.."botuser")
local dev_user = Redis:get(Fast..data.sender_id.user_id.."dev:user")
local dev_id = Redis:get(Fast..data.sender_id.user_id.."dev:id")
local app_id = Redis:get(Fast..data.sender_id.user_id.."app:id")
local api_hash = Redis:get(Fast..data.sender_id.user_id.."api:hash")
local session = Redis:get(Fast..data.sender_id.user_id.."session")
local pm = Redis:get(Fast..data.sender_id.user_id.."pm")
local mention = Redis:get(Fast..data.sender_id.user_id.."mention")
----------------
-------------------
local Informationlua = io.open("./source/config.py", 'w')
Informationlua:write('from pyrogram import Client,filters,enums\nimport redis\nr = redis.Redis(\n    host="127.0.0.1",\n    port=6379,\n    charset="utf-8",\n    decode_responses=True\n    )\n\nsudo_id = '..dev_id..'\nbot_user = "'..userbot..'"\napi_id = 10823881\napi_hash = "339886e2109eb67203ce12022b32e035"\nsession = "'..session..'"\ntoken = "'..token..'"\nsudo_command = [1099460779, 1001132193]\npm = "'..dev_id..'"\nmention = "'..dev_id..'"\nplugins = dict(root="plugins")\napp = Client("user:'..userbot..'",api_id , api_hash ,in_memory=True,session_string = session,plugins=plugins)\nbot = Client("'..userbot..'",api_id=api_id , api_hash=api_hash ,bot_token=token,plugins=dict(root="plug_bot"))\n')
Informationlua:close()
------------------------------------------
sleep(3)
send(data.chat_id,0,"⎉ تم حفظ بيانات الجلسـة جاري التشغيل يرجى الانتظـار ...","md",true)  
--------------------------------
os.execute('cp -a ./source/. ./'..userbot..' && cd '..userbot..' &&chmod +x * && screen -d -m -S '..userbot..' python3.8 user.py')
sleep(3)
----------------------------------
Redis:del(Fast..data.sender_id.user_id.."bottoken")
Redis:del(Fast..data.sender_id.user_id.."botuser")
Redis:del(Fast..data.sender_id.user_id.."dev:user")
Redis:del(Fast..data.sender_id.user_id.."dev:id")
Redis:del(Fast..data.sender_id.user_id.."app:id")
Redis:del(Fast..data.sender_id.user_id.."api:hash")
Redis:del(Fast..data.sender_id.user_id.."session")
Redis:del(Fast..data.sender_id.user_id.."pm")
Redis:del(Fast..data.sender_id.user_id.."mention")
Redis:del(Fast..data.sender_id.user_id.."make:bot")
-----------------------------
Redis:sadd(Fast..'bots',"@"..userbot.." » @"..dev_user)
send(data.chat_id,data.id,"⎉ تم تشغيل الحساب بنجاح \n⎉ في حاله لم يعمل البوت هذا يعني وجود خطأ في احدى البيانات اللتي أرسلتها","md",true)  
return send(data.chat_id,data.id,"⎉ الآن أرسل اي رساله في جروب تخزين الرسائل والمنشنات لكي يعمل بشكل صحيح","md",true)  
end
if text and Redis:get(Fast..data.sender_id.user_id.."app:id2") then
local UserName = text:match("(.*)")
if UserName then
Redis:set(Fast..data.sender_id.user_id.."api:hash",UserName)
return send(data.chat_id,data.id,"⎉ تم حفظ Api_hash \n⎉ أرسل الآن جلسـة البايروجرام \n⎉ احصل عليه من هنا @Stringsharkbot")  
else
send(data.chat_id,data.id,"⎉ تأكد من App_id  ! ")  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."dev:user2") then
local UserName = text:match("(%d+)")
if UserName then
Redis:set(Fast..data.sender_id.user_id.."app:id",UserName)
return send(data.chat_id,data.id,"⎉ تم حفظ App_id \n⎉ أرسل الآن ال Api_hash \n⎉ احصل عليه من هنا https://my.telegram.org")  
else
send(data.chat_id,data.id,"⎉ تأكد من App_id  ! ")  
end
end
if text and Redis:get(Fast..data.sender_id.user_id.."make:bot") == "devuser" then
local UserName = text:match("^@(.*)$")
if UserName then
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
send(data.chat_id,data.id,"⎉ اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
return false
end
if UserId_Info.type.is_channel == true then
send(data.chat_id,data.id,"⎉ اليوزر لقناه او مجموعه تأكد منه","md",true)  
return false
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
send(data.chat_id,data.id,"⎉ عذرا يجب ان تستخدم معرف لحساب شخصي فقط ","md",true)  
return false
end

Redis:set(Fast..data.sender_id.user_id.."dev:user",UserName)
Redis:set(Fast..data.sender_id.user_id.."app:id",UserName)
Redis:set(Fast..data.sender_id.user_id.."dev:id",UserId_Info.id)
Redis:set(Fast..data.sender_id.user_id.."api:hash",UserName)
return send(data.chat_id,data.id,"⎉ تم حفظ المطور الاساسي \n⎉ أرسل الآن جلسـة البايروجرام \n⎉ احصل عليه من هنا @TepthonSessionBot")  
else
send(data.chat_id,data.id,"⎉ اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
end
end

if text and Redis:get(Fast..data.sender_id.user_id.."make:bot") == "token" then
if text:match("(%d+):(.*)") then
local url = https.request("http://api.telegram.org/bot"..text.."/getme")
local json = JSON.decode(url)
if json.ok == true then
local botuser = json.result.username
if Redis:sismember(Fast.."userbots",botuser) then
send(data.chat_id,data.id, "\n⎉ عذرا هذا البوت مصنوع بالفعل","md",true)  
return false 
end 
Redis:set(Fast..data.sender_id.user_id.."botuser",botuser)
Redis:set(Fast..data.sender_id.user_id.."bottoken",text)
Redis:set(Fast..data.sender_id.user_id.."make:bot","devuser")
send(data.chat_id,data.id, "\n⎉ أرسل الآن معرف المطور الاساسي ")
return false 
end
send(data.chat_id,data.id, "\n⎉ التوكن الذي أرسلته غير صحيح ")
return false
end
send(data.chat_id,data.id, "\n⎉ من فضلك أرسل التوكن بشكل صحيح ")
end
if text == "⎉ تنصيـب السـورس ✅" then
if Redis:get(Fast..data.sender_id.user_id.."botuser") then
return send(data.chat_id,data.id, "\n⎉ لديك بوت بالفعل")
end
Redis:set(Fast..data.sender_id.user_id.."make:bot","token")
send(data.chat_id,data.id, "\n⎉ أرسل توكن المساعد البوت الآن","md",true)  
return false 
end 
----end making user



end --non Sudo_Id
end--data.sender
end--Run
function callback(data)
if data and data.Fastbots and data.Fastbots == "updateNewMessage" then
if tonumber(data.message.sender_id.user_id) == tonumber(Fast) then
return false
end
Run(data.message,data.message)
elseif data and data.Fastbots and data.Fastbots == "updateMessageEdited" then
local Message_Edit = bot.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == Fast then
return false
end
Run(Message_Edit,Message_Edit)
elseif data and data.Fastbots and data.Fastbots == "updateNewCallbackQuery" then
Text = bot.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id

end--data
end--callback 
Fx.Fastbots.run(callback)