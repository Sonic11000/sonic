--[[

]]

function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
    -- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

local getUser = function(user_id,cb)
tdcli_function({ID = "GetUser",user_id_ = user_id},cb,nil)
end

Bot_Api = 'https://api.telegram.org/bot'.. Token
function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end








function lock_photos(msg)
if not msg.Director then 
return " ⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆"
end
redis:set(Sonic.."getidstatus"..msg.chat_id_, "Simple")
return  "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم تعطيل الايدي بالصوره \n⋆" 
end 
function unlock_photos(msg)
if not msg.Director then
return " ⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆"
end
redis:set(Sonic.."getidstatus"..msg.chat_id_, "Photo")
return  "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم تفعيل الايدي بالصوره \n⋆" 
end
function cmds_on(msg)
if not msg.Creator then return " ⋆  ⇽ هذا الامر يخص :\n  المنشئ ⇽ المطور فقط  \n⋆"
end
redis:set(Sonic..'lock:kara:'..msg.chat_id_,'on')
return "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.."تم تعطيل الرفع في المجموعه \n⋆"
end
function cmds_off(msg)
if not msg.Creator then return " ⋆  ⇽ هذا الامر يخص :\n  المنشئ ⇽ المطور فقط  \n⋆"
end
redis:set(Sonic..'lock:kara:'..msg.chat_id_,'off')
return "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم تفعيل الرفع في المجموعه \n⋆"
end

function lockjoin(msg)
if not msg.Admin then return " ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆"
end
redis:set(Sonic..'lock:join:'..msg.chat_id_,true)
return " ⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم قفل الدخول بالرابط \n⋆" 

end
function unlockjoin(msg)
if not msg.Admin then return  "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆"
end
redis:del(Sonic..'lock:join:'..msg.chat_id_)
return "⋆ ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم فتح الدخول بالرابط \n⋆" 
end


local function iSonic(msg,MsgText)

Channel = redis:get(Sonic..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(Sonic..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUser then
function name(arg,data)
bd = '👷🏾‍♂╿اسمك  ('..(data.first_name_ or '')..')\n📡╽معرفك (@'..(data.username_ or '')..')\n\n🚸╽آشـترگ بآلقنآ‌‏هہ آولآ \n🔛╽ثم آرجع آستخدم الامر.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'آشـترگ بآلقنآ‌‏هہ 🙋🏻‍♂',url='https://telegram.me/'..Channel}}}   
send_inline(msg.chat_id_,bd,keyboard,'html')
end
getUser(msg.sender_user_id_,name)
else
return true
end
else
return true
end
end
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(Sonic.."getidstatus"..msg.chat_id_, "Photo")
redis:set(Sonic..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end






if MsgText[1] == "تفعيل الايدي بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول بالرابط" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول بالرابط" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "هذا الامر يخص المطور فقط  \n" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(Sonic..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(Sonic..'CheckExpire::'..msg.chat_id_) then 
redis:set(Sonic..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️│في مجموعه  » »  '..redis:get(Sonic..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│عزيزي المطور ✋🏿\n👨🏻‍🔧│شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "هذا الامر يخص المطور, فقط  \n" end
if MsgText[2] == '1' then
redis:setex(Sonic..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(Sonic..'CheckExpire::'..msg.chat_id_) then 
redis:set(Sonic..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك  👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(Sonic..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(Sonic..'CheckExpire::'..msg.chat_id_) then 
redis:set(Sonic..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(Sonic..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(Sonic..'CheckExpire::'..msg.chat_id_) then 
redis:set(Sonic..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local check_time = redis:ttl(Sonic..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳│`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end



if MsgText[1] == "المجموعه" then
if not msg.Admin then return "هذا الامر يخص : الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(Sonic..'group:name'..msg.chat_id_) or '')
redis:set(Sonic..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"  〈 مـعـلومـات الـمـجـموعـه 〉\n\n"
.."⋆ ⇽  عدد الاعـضـاء ⟵〈 *"..data.member_count_.."* 〉"
.."\n ⋆ ⇽  عدد المحظـوريـن ⟵ 〈 *"..data.kicked_count_.."* 〉"
.."\n ⋆ ⇽  عدد الادمـنـيـه ⟵ 〈 *"..data.administrator_count_.."* 〉"
.."\n ⋆ ⇽  ايدي المجموعه ⟵ 〈"..msg.chat_id_.."〉"
.."\n\n ⋆ ⇽  الاسم ⟵ 〈  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  〉\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return GetListAdmin(msg) 
end

if MsgText[1] == "منشن" then
if not msg.Admin then return " ⋆  ⇽ هذا الامر يخص : الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط ⋆ . \n" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,taha)
local t = "\n ⋆  ⇽ قائمة الاعضاء \n⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ "
x = 0
local list = taha.members_
for k, v in pairs(list) do
users = redis:get(Sonic..'user_names:'..v.user_id_) or v.user_id_
x = x + 1
t = t..""..x.." ⇾ ["..users.."](tg://user?id="..v.user_id_..") \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if (MsgText[1] == "منشن للحلوين" and is_JoinChannel(msg)) then 
if not msg.Admin then return " ⋆  ⇽ هذا الامر يخص : الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "منشن للكل" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆ " end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "المنشى الاساسي" then 
if not msg.Admin then return " ⋆  ⇽ هذا الامر يخص  الادمن⇽المدير⇽المنشئ⇽المطور فقط\n⋆" end
return MONSEBOT(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return ownerlist(msg) 
end

if MsgText[1] == "المنشئ الاساسي" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return Hussainlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return " ⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return " ⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,' المعرف غير صحيح ')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,' هذا معرف قناة ')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. Sonic..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\n ⋆  ⇽  اهلًا عزيزي هذا البوت ، وصلاحياته هي   \n⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ \n تغير معلومات المجموعه ↞ 〈 '..info..' 〉\n حذف الرسائل ↞ 〈 '..delete..' 〉\n حظر المستخدمين ↞ 〈 '..restrict..' 〉\n دعوة مستخدمين ↞ 〈 '..invite..' 〉\n تثبيت الرسائل ↞ 〈 '..pin..' 〉\n اضافة مشرفين جدد ↞ 〈 '..promote..' 〉\n\n ملاحضه » علامة 〈  ꪜ 〉 تعني لديه الصلاحية وعلامة 〈 ✘ 〉 تعني ليس ليديه الصلاحيه')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(Sonic..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(Sonic..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_," ⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم تثبيت الرساله \n ⋆ ")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'  عذرًا لا يمكنني التثبيت .   لست مشرف او لا املك صلاحيه التثبيت \n ')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
if not msg.Director and redis:get(Sonic..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_," ⋆  ⇽ أهلا عزيزي "..msg.TheRankCmd.."  تم الغاء تثبيت الرساله  .")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,' ⋆  ⇽ عذرا لا يمكنني الغاء التثبيت \n  لست مشرف او لا املك صلاحيه التثبيت . ')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,' ⋆  ⇽ عذرا عزيزي '..msg.TheRankCmd..'   لا توجد رساله مثبته لاقوم بازالتها . ')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مزه" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆ " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setdonke"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setsetdonke"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setdonke"})
end 
return false
end


if MsgText[1] == "تنزيل مزه" then
if not msg.Admin then return " ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remdonke"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remdonke"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remdonke"})
end 
return false
end

if MsgText[1] == "رفع جني" then
if not msg.Admin then return " ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆   " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setskoldy"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setskoldy"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setskoldy"})
end 
return false
end


if MsgText[1] == "تنزيل جني" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remskoldy"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remskoldy"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remskoldy"})
end 
return false
end

if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end 
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆ " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end

if MsgText[1] == "رفع زق" then
if not msg.Admin then return " ⋆  ⇽ هذا الامر يخص الادمن,المدير,المنشئ,المطور فقط  . " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmote"})
end 
return false
end


if MsgText[1] == "تنزيل زق" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmote"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
if not MsgText[2] and msg.reply_id then
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_," ⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." الرفع معطل . ")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص : \n  المطور ⇽ المنشئ فقط\n⋆ " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى اساسي" or MsgText[1] == "رفع منشئ اساسي") then
if not msg.SudoUser then return "⋆  ⇽ هذا الامر يخص :\n المطور ⇽ المطور الاساسي فقط  \n⋆" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "تنزيل منشى اساسي" or MsgText[1] == "تنزيل منشى اساسي") then
if not msg.SudoUser then return "⋆  ⇽ هذا الامر يخص :\n المطور ⇽ المطور الاساسي فقط  \n⋆" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.Kara then return " ⋆  ⇽ هذا الامر يخص : \n المنشئ الاساسي ⇽ المطور ⇽ المطور الاساسي فقط  \n⋆" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.Kara then return " ⋆  ⇽ هذا الامر يخص : \n المطور ⇽ المنشى الاساسي فقط  \n⋆" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if not MsgText[2] and msg.reply_id then
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(Sonic..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_," ⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." الرفع معطل  \n⋆ ")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "تنزيل الكل" then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end

local Admins = redis:scard(Sonic..'admins:'..msg.chat_id_)
redis:del(Sonic..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(Sonic..'owners:'..msg.chat_id_)
redis:del(Sonic..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(Sonic..'whitelist:'..msg.chat_id_)
redis:del(Sonic..'whitelist:'..msg.chat_id_)

return "⋆  ⇽ أهلا عزيزي "..msg.TheRankCmd.." \n تم تنزيل ❴ "..Admins.." ❵ من الادمنيه\n تم تنزيل ❴ "..NumMDER.." ❵ من المدراء\n تم تنزيل ❴ "..MMEZEN.." ❵ من المميزين\n\n تم تـنـزيـل الـكـل بـنـجـاح" 
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"    then return lock_All(msg) end
if MsgText[2] == "الوسائط"   then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد"    then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"           then return mute_text(msg) end
if MsgText[2] == "المتحركه"      then return mute_gif(msg) end
if MsgText[2] == "الصور"       then return mute_photo(msg) end
if MsgText[2] == "الفيديو"       then return mute_video(msg) end
if MsgText[2] == "البصمات"    then  return mute_audio(msg) end
if MsgText[2] == "الصوت"    then return mute_voice(msg) end
if MsgText[2] == "الملصقات"   then return mute_sticker(msg) end
if MsgText[2] == "الجهات"     then return mute_contact(msg) end
if MsgText[2] == "التوجيه"    then return mute_forward(msg) end
if MsgText[2] == "الموقع"   then return mute_location(msg) end
if MsgText[2] == "الملفات"    then return mute_document(msg) end
if MsgText[2] == "الاشعارات"  then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين"     then return mute_inline(msg) end
if MsgText[2] == "الكيبورد"   then return mute_keyboard(msg) end
if MsgText[2] == "الروابط"    then return lock_link(msg) end
if MsgText[2] == "التاك"    then return lock_tag(msg) end
if MsgText[2] == "المعرفات"   then return lock_username(msg) end
if MsgText[2] == "التعديل"    then return lock_edit(msg) end
if MsgText[2] == "الكلايش"    then return lock_spam(msg) end
if MsgText[2] == "التكرار"    then return lock_flood(msg) end
if MsgText[2] == "البوتات"    then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد"   then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان"   then return lock_markdown(msg) end
if MsgText[2] == "الويب"    then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت"    then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح"    then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد"     then return fktqeed_photo(msg)  end
if MsgText[2] == "الفيديو بالتقييد"   then return fktqeed_video(msg)  end
if MsgText[2] == "المتحركه بالتقييد"  then return fktqeed_gif(msg)  end
if MsgText[2] == "التوجيه بالتقييد"   then return fktqeed_fwd(msg)  end
if MsgText[2] == "الروابط بالتقييد"   then return fktqeed_link(msg)   end
if MsgText[2] == "المتحركه"   then return unmute_gif(msg)   end
if MsgText[2] == "الدردشه"    then return unmute_text(msg)  end
if MsgText[2] == "الصور"    then return unmute_photo(msg)   end
if MsgText[2] == "الفيديو"    then return unmute_video(msg)   end
if MsgText[2] == "البصمات"    then return unmute_audio(msg)   end
if MsgText[2] == "الصوت"    then return unmute_voice(msg)   end
if MsgText[2] == "الملصقات"   then return unmute_sticker(msg) end
if MsgText[2] == "الجهات"     then return unmute_contact(msg) end
if MsgText[2] == "التوجيه"    then return unmute_forward(msg) end
if MsgText[2] == "الموقع"     then return unmute_location(msg) end
if MsgText[2] == "الملفات"    then return unmute_document(msg) end
if MsgText[2] == "الاشعارات"  then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين"     then return unmute_inline(msg)  end
if MsgText[2] == "الكيبورد"   then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط"    then return unlock_link(msg)  end
if MsgText[2] == "التاك"    then return unlock_tag(msg)   end
if MsgText[2] == "المعرفات"   then return unlock_username(msg) end
if MsgText[2] == "التعديل"    then return unlock_edit(msg)  end
if MsgText[2] == "الكلايش"    then return unlock_spam(msg)  end
if MsgText[2] == "التكرار"    then return unlock_flood(msg)   end
if MsgText[2] == "البوتات"    then return unlock_bots(msg)  end
if MsgText[2] == "البوتات بالطرد"   then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان"   then return unlock_markdown(msg) end
if MsgText[2] == "الويب"    then return unlock_webpage(msg)   end
if MsgText[2] == "التثبيت"    then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if not redis:get(Sonic..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(Sonic..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(Sonic..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ تم انشاء رابط جديد \n ["..LinkGp.."]\n لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ لا يمكنني انشاء رابط للمجموعه لانني لست مشرف في المجموعه \n ")
end
else
return sendMsg(msg.chat_id_,msg.id_," ⋆  ⇽ لقد قمت بانشاء الرابط سابقًاارسل { الرابط } لرؤيه الرابط  \n ")
end
return false
end 

if MsgText[1] == "ضع رابط" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
redis:setex(Sonic..'linkGroup'..msg.sender_user_id_,300,true)
return '⋆  ⇽ عزيزي قم برسال الرابط الجديد . '
end

if MsgText[1] == "الرابط" then
if not redis:get(Sonic..'linkGroup'..msg.chat_id_) then 
return "⋆  ⇽ لا يوجد رابط قل رابط لانشاء الرابط ." 
end
local GroupName = redis:get(Sonic..'group:name'..msg.chat_id_)
local GroupLink = redis:get(Sonic..'linkGroup'..msg.chat_id_)
return sendMsgg(msg.chat_id_,msg.id_,"["..Flter_Markdown(GroupName).."]("..GroupLink..")\n")
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local GroupLink = redis:get(Sonic..'linkGroup'..msg.chat_id_)
if not GroupLink then return "لا يوجد رابط امتب ضع رابط لوضع الرابط ." end
local Text = " ⋆  ⇽ رابـط الـمـجـمـوعه :\n "..Flter_Markdown(redis:get(Sonic..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return " عذرًا عزيزي \n لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "  عذرًا عزيزي \n لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return " أهلًا عزيزي "..msg.TheRankCmd.."  \n تم ارسال الرابط خاص لك  "
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
redis:setex(Sonic..'rulse:witting'..msg.sender_user_id_,300,true)
return ' حسنًا عزيزي \n الان ارسل القوانين  للمجموعه '
end

if MsgText[1] == "القوانين" then
if not redis:get(Sonic..'rulse:msg'..msg.chat_id_) then 
return " اهلًا القوانين كالآتي : \nيُمنع نشر الروابط . \nيُمنع السب والقذف . \nاحترام الاعضاء + مدير القروب ."
else 
return "* ⋆  ⇽ القوانين :*\n"..redis:get(Sonic..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return " حدود التكرار ,  يجب ان تكون ما بين   2-50 " 
end
redis:set(Sonic..'flood'..msg.chat_id_,MsgText[2]) 
return "  تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if 500 < tonumber(MsgText[2]) then return "  حدود المسح ,  يجب ان تكون ما بين  2-100" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_," تـم مسح ⇾ { *"..MsgText[2].."* } من الرسائل   ")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_," تـم مسح ⇾ { *"..MsgText[2].."* } من الرسائل  ")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end

local Admins = redis:scard(Sonic..'admins:'..msg.chat_id_)
if Admins ==0 then  
return " ⋆  ⇽ لا يوجد ادمنيه ليتم مسحهم ." 
end
redis:del(Sonic..'admins:'..msg.chat_id_)
return "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.."   \n تم مسح {"..Admins.."} من الادمنيه في البوت . "
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local Mn3Word = redis:scard(Sonic..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return " ⋆  ⇽ عذرًا لا توجد كلمات ممنوعه ليتم حذفها . " 
end
redis:del(Sonic..':Filter_Word:'..msg.chat_id_)
return " أهلًا عزيزي "..msg.TheRankCmd.."   \n تم مسح {*"..Mn3Word.."*} كلمات من المنع  "
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if not redis:get(Sonic..'rulse:msg'..msg.chat_id_) then 
return " عذرا لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(Sonic..'rulse:msg'..msg.chat_id_)
return " أهلًا عزيزي "..msg.TheRankCmd.."   \n تم حذف القوانين بنجاح "
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if not redis:get(Sonic..'welcome:msg'..msg.chat_id_) then 
return " ⋆  ⇽ لايوجد ترحيب ليتم مسحه ." 
end
redis:del(Sonic..'welcome:msg'..msg.chat_id_)
return " أهلًا عزيزي "..msg.TheRankCmd.."   \n تم حذف الترحيب بنجاح "
end


if MsgText[2] == "المنشى الاساسي" then
if not msg.SudoUser then return "هذا الامر يخص المطور فقط  \n" end
local NumMnsha = redis:scard(Sonic..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return " عذرا لا يوجد منشى اساسي \n!" 
end
redis:del(Sonic..':Hussain:'..msg.chat_id_)
return " أهلًا عزيزي "..msg.TheRankCmd.."   \n  تم مسح {* "..NumMnsha.." *} المنشى الاساسي  "
end


if MsgText[2] == "المنشئيين" then
if not msg.SudoUser then return "هذا الامر يخص المطور فقط  \n" end
local NumMnsha = redis:scard(Sonic..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return " عذرا لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(Sonic..':MONSHA_BOT:'..msg.chat_id_)
return " أهلًا عزيزي "..msg.TheRankCmd.."   \n  تم مسح {* "..NumMnsha.." *} من المنشئيين "
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local NumMDER = redis:scard(Sonic..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return " عذرا لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(Sonic..'owners:'..msg.chat_id_)
return " أهلًا عزيزي "..msg.TheRankCmd.."   \n  تم مسح {* "..NumMDER.." *} من المدراء   "
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end

local list = redis:smembers(Sonic..'banned:'..msg.chat_id_)
if #list == 0 then return " لا يوجد مستخدمين محظورين   " end
message = '  قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(Sonic..'banned:'..msg.chat_id_)
return " ⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.."   \n  تم مسح {* "..#list.." *} من المحظورين  "
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local MKTOMEN = redis:scard(Sonic..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "⋆  ⇽ لا يوجد مستخدمين مكتومين في المجموعه . " 
end
redis:del(Sonic..'is_silent_users:'..msg.chat_id_)
return " ⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.."   \n  تم مسح {* "..MKTOMEN.." *} من المكتومين . "
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local MMEZEN = redis:scard(Sonic..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return " ⋆  ⇽ لا يوجد مستخدمين مميزين في المجموعه ." 
end
redis:del(Sonic..'whitelist:'..msg.chat_id_)
return "-} أهلًا عزيزي "..msg.TheRankCmd.."   \n تم مسح {* "..MMEZEN.." *} من المميزين  "
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
if not redis:get(Sonic..'linkGroup'..msg.chat_id_) then 
return " لا يوجد رابط مضاف اصلا . " 
end
redis:del(Sonic..'linkGroup'..msg.chat_id_)
return "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم مسح رابط المجموعه ."
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
redis:setex(Sonic..'name:witting'..msg.sender_user_id_,300,true)
return "حسنًا عزيزي ، \n- الان ارسل الاسم  للمجموعه ."
end


if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  ??" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم مسح صورة المجموعہ .')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'🚸│تم تغيير صوره آلمـجمـوعهہ ⠀\n✓')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'ماعندي  صلاحيه تغيير الصوره \n - يجب اعطائي صلاحيه `تغيير معلومات المجموعه `')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(Sonic..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '⋆  ⇽ حسنًا عزيزي ، \nالآن قم بارسال الصوره' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
redis:setex(Sonic..'about:witting'..msg.sender_user_id_,300,true) 
return "⋆  ⇽ حسنًا عزيزي ، \nالآن ارسل الوصف  للمجموعه . " 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_," ⋆  ⇽ لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "⋆  ⇽ عـدد الـبـوتات  :   {* "..(Total - 1).." *} \n\n"
if NumBot == 0 then 
TextR = TextR.."لا استطيع طرد البوتات لانهم مشرفين ):.\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."⋆  ⇽  لم يتم طـرد {* "..NumBotAdmin.." بوت لانهم مـشـرفين."
else
TextR = TextR.."⋆  ⇽ تم طـرد كــل البوتات بنجاح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص المطور و المنشئ فقط .  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '⋆  ⇽ قـائمه البوتات الـحالية: \n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

  ⋆  ⇽ لديك {]]..total..[[} بـوتات
  ⋆  ⇽ ملاحظة : الـ ★ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ جاري البحث عـن الـحـسـابـات المـحذوفـة .')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(Sonic..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(Sonic..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(Sonic..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(Sonic..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ تم طـرد {* "..NumMemDone.." *} من الحسابات المحذوفہ‏‏ ")
else
sendMsg(msg.chat_id_,msg.id_,'لا يوجد حسابات محذوفه في المجموعه ')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then

  if not MsgText[2] and not msg.reply_id then
  if redis:get(Sonic..'lock_id'..msg.chat_id_) then
  local msgs = redis:get(Sonic..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
  GetUserID(msg.sender_user_id_,function(arg,data)
  if data.username_ then UserNameID = "⋆ يـوزرك ⟡ [@"..data.username_.."] \n" else UserNameID = "" end
  local zz = (redis:get(Sonic..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0)
  local rfih = (redis:get(Sonic..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
  local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
  GetPhotoUser(msg.sender_user_id_,function(arg, data)
  if data.photos_[0] then 
  ali = {
  '⠀',
  }
  ssssys = ali[math.random(#ali)]
  sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,
  ''..ssssys..'\n'
  ..'⋆ أسمّـك ⟡ '..Namei..' \n'
  ..'⋆ ايديـك ⟡ ['..msg.sender_user_id_..'] \n'
  ..UserNameID
  ..'⋆ رتبـتك ⟡ '..msg.TheRank..' \n'
  ..'⋆ رسائلك ⟡ '..msgs..'  \n'
  ..'⋆ سَ ⟡ @Source_Sonic'
  ,dl_cb,nil)
  else
  sendMsg(msg.chat_id_,msg.id_,
  '⋆️┐لا استطيع اظهار صوره بروفايلك لانك قمت بحظر البوت ...!\n'..'['..UserNameID..']'
  ..'⋆ أسمّـك ⟡'..Namei..'. \n'
  ..'⋆ رتبـتك ⟡  '..msg.TheRank..'. \n'
  ..'⋆ ايديـك ⟡ '..msg.sender_user_id_..'. \n'
  ..UserNameID
  ..'⋆ رسائلك ⟡ '..msgs..'. \n'
  ..'⋆ سَ ⟡ @Source_Sonic')
  end
  end) 
  end ,nil)
  end
  return false
  end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(Sonic..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(Sonic..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(Sonic..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(Sonic..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(Sonic..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(Sonic..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(Sonic..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(Sonic..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(Sonic..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n〈 احصائيات رسـائـلك 〉\n \n"
.."الـرسـائـل 〈 "..msgs.." 〉\n"
.."الـجـهـات 〈 "..NumGha.." 〉\n"
.."الـصـور 〈 "..photo.." 〉\n"
.."الـمـتـحـركـه 〈 "..animation.." 〉\n"
.."الـمـلـصـقات 〈 "..sticker.." 〉\n"
.."الـبـصـمـات 〈 "..voice.." 〉\n"
.."الـصـوت 〈 "..audio.." 〉\n"
.."الـفـيـديـو 〈 "..video.." 〉\n"
.."الـتـعـديـل 〈 "..edited.." 〉\n"
.."تـفـاعـلـك 〈 "..Get_Ttl(msgs).." 〉\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(Sonic..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "عذرًا لا يوجد رسائل لك في البوت  " end
redis:del(Sonic..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "تم مسح {* "..msgs.." *} من رسائلك "
end

if MsgText[1]== 'جهاتي' then
return '⋆  ⇽  عدد جهاتك المضافہ‏‏ ⇜ 〈 '..(redis:get(Sonic..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' 〉 '
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(Sonic..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return " ⋆  ⇽  عذرًا ليس لديك جهات لكي يتم مسحها ." end
redis:del(Sonic..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return " تم مسح {* "..adduser.." *} من جهاتك"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n\n ⋆  ⇽ اسمك الثاني ⟶ '..(data.last_name_ or ""),90)
local Get_info = " ⋆  ⇽ اسمك الاول ⟶ \n "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(Sonic..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return " ⋆  ⇽ عذرًا ليس لديك نقاط لكي يتم مسحها" end
redis:del(Sonic..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return " ⋆  ⇽ تم مسح {* "..points.." *} من نقاطك . "
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(Sonic..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(Sonic..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(Sonic..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(Sonic..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(Sonic..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(Sonic..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(Sonic..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(Sonic..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(Sonic..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="اهـلًا بـك عزيزي في معلوماتك  \n"
.." ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆\n"
.."الاســم 〈 "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." 〉\n"
.."المعرف 〈 "..ResolveUser(data).." 〉\n"
.."الايـدي 〈 `"..msg.sender_user_id_.."` 〉\n"
.."رتبتــك 〈 "..msg.TheRank.." 〉\n"
.."ـ 〈 `"..msg.chat_id_.."` 〉\n"
.." ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆\n"
.." 〈 الاحـصـائـيـات الـرسـائـل 〉\n"
.."الـرسـائـل 〈 `"..msgs.."` 〉\n"
.."الـجـهـات 〈 `"..NumGha.."` 〉\n"
.."الـصـور 〈 `"..photo.."` 〉\n"
.."الـمـتـحـركـه 〈 `"..animation.."` 〉\n"
.."الـمـلـصـقات 〈 `"..sticker.."` 〉\n"
.."الـبـصـمـات 〈 `"..voice.."` 〉\n"
.."الـصـوت 〈 `"..audio.."` 〉\n"
.."الـفـيـديـو 〈 `"..video.."` 〉\n"
.."الـتـعـديـل 〈`"..edited.."` 〉\n"
.."تـفـاعـلـك 〈 "..Get_Ttl(msgs).." 〉\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(Sonic..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(Sonic..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(Sonic..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(Sonic..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(Sonic..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(Sonic..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(Sonic..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(Sonic..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(Sonic..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="⋆  ⇽اهلن عزيزي تم حذف جميع معلوماتك ."
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود"   then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه"  then return unlock_brod(msg) end
if MsgText[2] == "الايدي"   then return unlock_ID(msg) end
if MsgText[2] == "االترحيب"   then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير"  then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود"   then return lock_replay(msg) end
if MsgText[2] == "الاذاعه"  then return lock_brod(msg) end
if MsgText[2] == "الايدي"   then return lock_ID(msg) end
if MsgText[2] == "االترحيب"   then return lock_Welcome(msg) end
if MsgText[2] == "التحذير"  then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
redis:set(Sonic..'welcom:witting'..msg.sender_user_id_,true) 
return "⋆  ⇽حسنًا  عزيزي \n⋆  ⇽ ارسل كليشه الترحيب الان\n\n ⋆  ⇽ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n⋆  ⇽ اضهار قوانين المجموعه  » *{القوانين}*  \n⋆  ⇽  اضهار الاسم العضو » *{الاسم}*\n⋆  ⇽ اضهار المعرف العضو » *{المعرف}*\n⋆  ⇽ اضهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
if redis:get(Sonic..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(Sonic..'welcome:msg'..msg.chat_id_))
else 
return "⟶ أهلا عزيزي "..msg.TheRankCmd.."  \n⋆  ⇽ نورت المجموعه \n⋆" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "⋆  ⇽ هذا الامر يخص الادمن⇽المدير⇽المنشئ⇽المطور فقط .   \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "⋆  ⇽ هذا الامر يخص الادمن⇽المدير⇽المنشئ⇽المطور فقط .   \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "⋆  ⇽ هذا الامر يخص الادمن⇽المدير⇽المنشئ⇽المطور فقط .   \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "⋆  ⇽ هذا الامر يخص الادمن⇽المدير⇽المنشئ⇽المطور فقط .   \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "⋆  ⇽ هذا الامر يخص الادمن⇽المدير⇽المنشئ⇽المطور فقط .   \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "⋆  ⇽ هذا الامر يخص الادمن⇽المدير⇽المنشئ⇽المطور فقط .   \n" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "⋆  ⇽ هذا الامر يخص الادمن⇽المدير⇽المنشئ⇽المطور فقط .   \n" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆  " end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"⋆  ⇽ هذا الامر يخص المطور الاساسي فقط . \n" end
local mtwren = redis:scard(Sonic..':SUDO_BOT:')
if mtwren == 0 then  return "- عذرًا لا يوجد مطورين في البوت  ." end
redis:del(Sonic..':SUDO_BOT:') 
return "- تم مسح {* "..mtwren.." *} من المطورين "
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"هذا الامر يخص {المطور الاساسي} فقط  \n" end
local addbannds = redis:scard(Sonic..'gban_users')
if addbannds ==0 then 
return " قائمة الحظر فارغه . " 
end
redis:del(Sonic..'gban_users') 
return "⋆  ⇽ تـم مـسـح { *"..addbannds.." *} من قائمه العام." 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not msg.SudoBase then return "⋆  ⇽ هذا الامر يخص المطور الاساسي  فقط . \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 🗑" then
local groups = redis:smembers(Sonic..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,' جـيـد , لا توجد مجموعات وهميه ')
else
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽  عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n⋆  ⇽  تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n⋆  ⇽  اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين 🗑" or MsgText[1] == "تنظيف المشتركين 🗑" then
local pv = redis:smembers(Sonic..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(Sonic..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'⚜| جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽  عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n⋆  ⇽  تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n⋆  ⇽  اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(Sonic..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'حسنًا عزيزي \nالان قم بارسال الصوره للترحيب .' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(Sonic..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[⚜╿اهلا انآ بوت آسـمـي ]]..redis:get(Sonic..':NameBot:')..[[ ✓
👨🏻‍✈️│آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
📛╽مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...

🎭│مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ ⋆  
]])

return false
else
return "📛╿لا توجد صوره مضافه للترحيب في البوت \n📌╽ لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع وصف المطور" then 
redis:setex(Sonic..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '⋆  ⇽ حسنًا  عزيزي \n الان قم بارسال الوصف .\n ⋆' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(Sonic..':addnumberusers',MsgText[2]) 
return ' تم وضـع شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..MsgText[2]..'】* عضـو  .\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'⋆  ⇽ شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..redis:get(Sonic..':addnumberusers')..'】* عضـو  .' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🌋" then
if not msg.SudoUser then return "هذا الامر يخص المطور, فقط  \n" end
return ' ⋆ ⇽ عدد المجموعات المفعلة  ⋆ `'..redis:scard(Sonic..'group:ids')..'`  ⋆' 
end

if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين Ⓜ" then
if not msg.SudoUser then return "⋆  ⇽ هذا الامر يخص المطور فقط  \n" end
return '⋆ ⇽ عدد المشتركين في البوت ⋆  `'..redis:scard(Sonic..'users')..'` ⋆'
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "هذا الامر يخص المطور, فقط  \n" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "هذا الامر يخص المطور, فقط  \n" end
if redis:sismember(Sonic..'group:ids',MsgText[2]) then
local name_gp = redis:get(Sonic..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'⋆  ⇽ تم تعطيل المجموعه بأمر من المطور  \n غادرت . ')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '⋆  ⇽ تم تعطيل المجموعه ومغادرتها \nالمجموعة » ['..name_gp..']\n الايدي » ( *'..MsgText[2]..'* )'
else 
return ' لا توجد مجموعه مفعله بهذا الايدي !\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(Sonic..":TEXT_SUDO") or 'لا يوجد وصف المطور .\nيمكنك اضافه وصف من خلال الامر\n       " `ضع وصف المطور` " '
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
if not msg.SudoUser then return"هذا الامر يخص المطور, فقط  \n" end
if not msg.SudoBase and not redis:get(Sonic..'lock_brod') then 
return "⋆  ⇽ الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(Sonic..'fwd:'..msg.sender_user_id_,300, true) 
return "⋆  ⇽ حسنًا  الان ارسل التوجيه للاذاعه ." 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then    
if not msg.SudoUser then return"هذا الامر يخص المطور فقط  \n" end
if not msg.SudoBase and not redis:get(Sonic..'lock_brod') then 
return "⋆  ⇽ الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(Sonic..'fwd:all'..msg.sender_user_id_,300, true) 
return "⋆  ⇽ حسنًا  الان ارسل الكليشه للاذاعه عام ." 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 🗣" then    
if not msg.SudoUser then return "هذا الامر يخص المطور فقط  \n" end
if not msg.SudoBase and not redis:get(Sonic..'lock_brod') then 
return "⋆  ⇽ الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(Sonic..'fwd:pv'..msg.sender_user_id_,300, true) 
return "⋆  ⇽ حسنًا  الان ارسل الكليشه للاذاعه خاص . "
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 🗣" then    
if not msg.SudoUser then return"هذا الامر يخص المطور فقط  \n" end
if not msg.SudoBase and not redis:get(Sonic..'lock_brod') then 
return "⋆  ⇽ الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(Sonic..'fwd:groups'..msg.sender_user_id_,300, true) 
return "⋆  ⇽ حسنًا  الان ارسل الكليشه للاذاعه للمجموعات ." 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 🔥" then
if not msg.SudoUser then return"هذاالامر يخص المطور, فقط  \n" end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام 📜" then 
if not msg.SudoUser then return"هذاالامر يخص المطور, فقط  \n" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"هذا الامر يخص {المطور الاساسي} فقط  \n" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"هذا الامر يخص {المطور الاساسي} فقط  \n" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "هذا الامر يخص {المطور الاساسي} فقط  \n" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return ' رتبتك  ⇽〈 '..msg.TheRank..' 〉.' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
redis:del(Sonic..'welcom:witting'..msg.sender_user_id_,
Sonic..'rulse:witting'..msg.sender_user_id_,
Sonic..'rulse:witting'..msg.sender_user_id_,
Sonic..'name:witting'..msg.sender_user_id_,
Sonic..'about:witting'..msg.sender_user_id_,
Sonic..'fwd:all'..msg.sender_user_id_,
Sonic..'fwd:pv'..msg.sender_user_id_,
Sonic..'fwd:groups'..msg.sender_user_id_,
Sonic..'namebot:witting'..msg.sender_user_id_,
Sonic..'addrd_all:'..msg.sender_user_id_,
Sonic..'delrd:'..msg.sender_user_id_,
Sonic..'addrd:'..msg.sender_user_id_,
Sonic..'delrdall:'..msg.sender_user_id_,
Sonic..'text_sudo:witting'..msg.sender_user_id_,
Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_,
Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '⋆  ⇽  تم آلغآء آلآمـر بنجآح \n⋆  '
end  


if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return 'اصدار سورس دريم : *v'..version..'* .'
end

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس 🔂') then
if not msg.SudoBase then return "⋆  ⇽ هذا الامر يخص المطور الاساسي فقط  \n" end
local GetVerison = https.request('https://github.com/DDIIO/Sonic.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,' يوجد تحديث جديد الان \n جاري تنزيل وتثبيت التحديث .')
redis:set(Sonic..":VERSION",GetVerison)
return false
else
return "الاصدار الحالي : *v"..version.."* \n عندك احدث اصدار "
end
return false
end

if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"هذا الامر يخص المطور الاساسي  فقط . \n" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "هذاالامر يخص المطور الاساسي ⋆  ⇽  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,' جاري رفع النسخه انتظر قليلا ... ')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_," عذرًا النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n")
end
else 
sendMsg(msg.chat_id_,msg.id_,' عذرًا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس Sonic يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n')
end  
else
sendMsg(msg.chat_id_,msg.id_,' عذرًا الملف ليس بصيغه Json !?\n')
end 
else
sendMsg(msg.chat_id_,msg.id_,' عذًرا هذا ليس ملف النسحه الاحتياطيه للمجموعات\n')
end 
end,nil)
else 
return " ارسل ملف النسخه الاحتياطيه اولا\n ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="فحص بوتي" or MsgText[1]=="test") then 
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
return "شغال شغال ." 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي🆔") and msg.type == "pv" then return  "\n - اهلًا حبيبي  المطور ايديك  :\n\n⋆ ⇽ "..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس 📡" and msg.type == "pv" then
local inline = {{{text="قناة السورس .",url="t.me/@Source_Sonic"}}}
send_key(msg.sender_user_id_,'[ قناة سورس سونيك .](t.me/@Source_Sonic)',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 💥" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
return '⋆  ⇽ الاحصائيات : \n\n عدد المجموعات المفعله ⋆ '..redis:scard(Sonic..'group:ids')..' ⋆\nعدد المشتركين في البوت ⋆ '..redis:scard(Sonic..'users')..' ⋆ \n⋆'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام ➕" then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(Sonic..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "حسنًا  الان ارسل كلمة الرد العام "
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local names   = redis:exists(Sonic..'replay:'..msg.chat_id_)
local photo   = redis:exists(Sonic..'replay_photo:group:'..msg.chat_id_)
local voice   = redis:exists(Sonic..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(Sonic..'replay_animation:group:'..msg.chat_id_)
local audio   = redis:exists(Sonic..'replay_audio:group:'..msg.chat_id_)
local sticker   = redis:exists(Sonic..'replay_sticker:group:'..msg.chat_id_)
local video   = redis:exists(Sonic..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(Sonic..'replay:'..msg.chat_id_,Sonic..'replay_photo:group:'..msg.chat_id_,Sonic..'replay_voice:group:'..msg.chat_id_,
Sonic..'replay_animation:group:'..msg.chat_id_,Sonic..'replay_audio:group:'..msg.chat_id_,Sonic..'replay_sticker:group:'..msg.chat_id_,Sonic..'replay_video:group:'..msg.chat_id_)
return "⋆  ⇽ تم مسح كل الردود \n⋆"
else
return '⋆  ⇽ لا يوجد ردود ليتم مسحها . \n'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"⋆  ⇽ هذا الامر للمطورين فقط ." end
local names   = redis:exists(Sonic..'replay:all')
local photo   = redis:exists(Sonic..'replay_photo:group:')
local voice   = redis:exists(Sonic..'replay_voice:group:')
local imation   = redis:exists(Sonic..'replay_animation:group:')
local audio   = redis:exists(Sonic..'replay_audio:group:')
local sticker   = redis:exists(Sonic..'replay_sticker:group:')
local video   = redis:exists(Sonic..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(Sonic..'replay:all',Sonic..'replay_photo:group:',Sonic..'replay_voice:group:',Sonic..'replay_animation:group:',Sonic..'replay_audio:group:',Sonic..'replay_sticker:group:',Sonic..'replay_video:group:')
return " ⋆  ⇽ تم مسح كل الردود العامه ."
else
return " ⋆  ⇽ لا يوجد ردود عامه ليتم مسحها . "
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:set(Sonic..'delrdall:'..msg.sender_user_id_,true) 
return " حسنًا عزيزي ، \nالان ارسل الرد لمسحها من  المجموعات ."
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
redis:set(Sonic..'delrd:'..msg.sender_user_id_,true)
return "حسنًا عزيزي ، \nالان ارسل الرد لمسحها من  للمجموعه ."
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local names   = redis:hkeys(Sonic..'replay:'..msg.chat_id_)
local photo   = redis:hkeys(Sonic..'replay_photo:group:'..msg.chat_id_)
local voice   = redis:hkeys(Sonic..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:hkeys(Sonic..'replay_animation:group:'..msg.chat_id_)
local audio   = redis:hkeys(Sonic..'replay_audio:group:'..msg.chat_id_)
local sticker   = redis:hkeys(Sonic..'replay_sticker:group:'..msg.chat_id_)
local video   = redis:hkeys(Sonic..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return ' لا يوجد ردود مضافه حاليا :\n' 
end
local ii = 1
local message = 'ردود البوت في المجموعه  :\n\n'
for i=1, #photo   do message = message ..ii..' - *{* '..  photo[i]..' *}_*( صوره  ) \n'    ii = ii + 1 end
for i=1, #names   do message = message ..ii..' - *{* '..  names[i]..' *}_*( نص  ) \n'    ii = ii + 1 end
for i=1, #voice   do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه  ) \n'    ii = ii + 1 end
for i=1, #imation   do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه  ) \n' ii = ii + 1 end
for i=1, #audio   do message = message ..ii..' - *{* '..  audio[i]..' *}_*( صوتيه  ) \n'  ii = ii + 1 end
for i=1, #sticker   do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق  ) \n'    ii = ii + 1 end
for i=1, #video   do message = message ..ii..' - *{* '..  video[i]..' *}_*( فيديو   ) \n' ii = ii + 1 end
return message..'\n'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه 🗨' then
if not msg.SudoBase then return "هذا الامر للمطور الاساسي فقط ." end
local names   = redis:hkeys(Sonic..'replay:all')
local photo   = redis:hkeys(Sonic..'replay_photo:group:')
local voice   = redis:hkeys(Sonic..'replay_voice:group:')
local imation   = redis:hkeys(Sonic..'replay_animation:group:')
local audio   = redis:hkeys(Sonic..'replay_audio:group:')
local sticker   = redis:hkeys(Sonic..'replay_sticker:group:')
local video   = redis:hkeys(Sonic..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return ' ⋆  ⇽ لا يوجد ردود مضافه حاليًا ' 
end
local ii = 1
local message = 'الردود العامه في البوت :   :\n\n'
for i=1, #photo   do message = message ..ii..' - *{* '..  photo[i]..' *}_*( صوره  ) \n'   ii = ii + 1 end
for i=1, #names   do message = message ..ii..' - *{* '..  names[i]..' *}_*( نص  ) \n'   ii = ii + 1 end
for i=1, #voice   do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه  ) \n'   ii = ii + 1 end
for i=1, #imation   do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه  ) \n'ii = ii + 1 end
for i=1, #audio   do message = message ..ii..' - *{* '..  audio[i]..' *}_*( صوتيه  ) \n' ii = ii + 1 end
for i=1, #sticker   do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق  ) \n'   ii = ii + 1 end
for i=1, #video   do message = message ..ii..' - *{* '..  video[i]..' *}_*( فيديو   ) \n'ii = ii + 1 end
return message..'\n'
end


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
redis:setex(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(Sonic..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "حسنًا , الان ارسل كلمه الرد \n-"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(Sonic..'namebot:witting'..msg.sender_user_id_,300,true)
return"⋆  ⇽ حسنًا عزيزي  \n الان ارسل الاسم  للبوت ."
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 〈 Seystem 〉\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖 〈 Memory 〉\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾 〈 HardDisk 〉\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️ 〈 Processor 〉\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*👨🏾‍🔧 〈 Server[_]Login 〉\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌 〈 Uptime 〉  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟l 〈 نظام التشغيل 〉\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖l 〈 الذاكره العشوائيه 〉\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾l 〈 وحـده الـتـخـزيـن 〉\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️l 〈 الـمــعــالــج 〉\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*👨🏾‍🔧l 〈 الــدخــول 〉\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌l 〈 مـده تـشغيـل الـسـيـرفـر 〉  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
return [[
‌‌‏‌‌‏‌‌‌‌‏                                    
⋆  الاوامر العامـه‌‏ :
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ م1 ⇽ اوامر الإداره .‌‏
  ⋆ م2 ⇽ اوامر اعدادات المجمّوعه .‌‏
    ⋆ م3 ⇽ اوامر الحِمايـه .
    ⋆ م4 ⇽ اوامر الخِدمـه .
    ⋆ م5 ⇽ اوامر التسـليه .
  ⋆ م6 ⇽ اوامر التعَطيل و التفَعيل .
    ⋆ م7 ⇽ اوامر الوضع للمجموعه .
    ⋆ م المطور ⇽ اوامر آلمـطـور .
  ⋆   اوامر الرد ⇽ لاضـافة‌‏ رد مـعين .
    ⋆ الوسائط ⇽ لمعرفه الاعدادات 
    ⋆ الاعدادات ⇽ اعدادات المجموعه .
    ⋆ السورس ⇽ سورس البوت
    ⋆ المطور  ⇽ مطور البوت
   ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ قناةالسـورس ⇽ @Source_Sonic
  ⋆ يُـوزر المّـطور ⇽  ]]..SUDO_USER..[[ ]]
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local text =[[
  ١ ⋆ اوامـر الرفع و التنزيل .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ رفع ⟷ تنزيل مـدير .
  ⋆ رفع ⟷  تنزيل ادمن .
  ⋆ رفع ⟷ تنزيل مميز .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
   ٢ ⋆ اوامـر المسح للمنشئ .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ مسح الادمنـيـه ⇽ لمسح الادمنيه
  ⋆ مسح المميزين ⇽ لمسح المميزين 
  ⋆ مسح المـــدراء ⇽ لمسح المدراء 
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ٣ ⋆ اوامـر الحظـر والطــرد والتقييد .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ حظر بالرد ⟷ بالمعرف ⇽ لحظر العضو
  ⋆ الغاء الحظر بالرد ⟷ بالمعرف ⇽ لالغاء الحظر 
  ⋆ طرد بالرد ⟷ بالمعرف ⇽ لطرد العضو
  ⋆ كتم بالرد ⟷ بالمعرف ⇽ لكتم العضو 
  ⋆ الغاء الكتم بالرد ⟷ بالمعرف ⇽ لالغاء الكتم 
   ⋆ تقييد بالرد  ⟷ بالمعرف ⇽ لتقييد العضو
  ⋆ فك التقييد  بالرد ⟷ بالمعرف ⇽ لالغاء تقييد العضو
   ⋆ منع + الكلمه  ⇽ لمنع الكلمه
  ⋆ الغاء منع ⇽ لالغاء منع الكلمه
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ قناةالسـورس ⇽  @Source_Sonic
  ⋆ يـوزر المّـطور ⇽ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local text = [[
  ⋆ اوامر رؤية الاعدادات
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
   ⋆ الـرابـط ⇽ لعرض الرابط 
   ⋆ انشاء رابط ⇽ لِستخراج رابط جديد 
   ⋆ الادمنيه ⇽ لعرض الادمنيه
   ⋆ القوانين ⇽ لعرض القوانين 
   ⋆ الوسائط ⇽ لعرض اعدادات الميديا
   ⋆ الحمايـه ⇽ لعرض كل الاعدادات
 ⋆ المــدراء ⇽ لعرض الاداريين
 ⋆ المكتومين ⇽ لعـرض المكتومين 
 ⋆ المحظورين ⇽ لعرض المحظورين
 ⋆ الاعدادات ⇽ لعرض اعدادات المجموعه 
 ⋆ المجموعه ⇽ لعرض معلومات المجموعه
 ⋆ تغير امر + الامر ⇽ لتغير اوامر البوت 
   ⋆ مسح امر + الامر ⇽ لمسح الامر المضاف
 ⋆ قائمـه الاوامر ⇽ لمعرفه الاوامرالمضافه 
 ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ قناةالسـورس ⇽ @Source_Sonic
 ⋆ يُـوزر المّـطور ⇽ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local text = [[
  ١ ⋆ اوامر حمايـة المجموعه
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
   ⋆ قفل ⟷ فتح ⇽ الكُل 
   ⋆ قفل ⟷ فتح ⇽ التـاك
   ⋆ قفل ⟷ فتح ⇽ الفيـديـــو
   ⋆ قفل ⟷ فتح ⇽ الصــــــــور 
   ⋆ قفل ⟷ فتح ⇽ الملصقات
   ⋆ قفل ⟷ فتح ⇽ المتحركه
   ⋆ قفل ⟷ فتح ⇽ البصمــات
   ⋆ قفل ⟷ فتح ⇽ الدردشـــه
 ⋆ قفل ⟷ فتح ⇽ الــروابـــط
   ⋆ قفل ⟷ فتح ⇽ البـــوتــات
   ⋆ قفل ⟷ فتح ⇽ التعــديــل
   ⋆ قفل ⟷ فتح ⇽ المعرفــات
   ⋆ قفل ⟷ فتح ⇽ الكـــلايـش
   ⋆ قفل ⟷ فتح ⇽ التـــكـــــرار
   ⋆ قفل ⟷ فتح ⇽ الجــهـــــات
   ⋆ قفل ⟷ فتح ⇽ الانـــلايــن
   ⋆ قفل ⟷ فتح ⇽ التوجيــــه
   ⋆ قفل ⟷ فتح ⇽ الدخول بالرابط
   ⋆ قفل ⟷ فتح ⇽ البوتات بالطرد
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
   ٢ ⋆ القفل بالتقييـد
                                               
 ⋆ قفل ⟷ فتح ⇽ الــصــــــور بالتقييـد
   ⋆ قفل ⟷ فتح ⇽ الــروابــط بالتقييـد 
   ⋆ قفل ⟷ فتح ⇽ المتحركه بالتقييـد
   ⋆ قفل ⟷ فتح ⇽ الفيـــديــو بالتقييد
   ⋆ قفل ⟷ فتح ⇽ التوجيــه بالتقييــد
 
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
 ⋆ قناةالسـورس ⇽ @Source_Sonic
   ⋆ يُـوزر المّـطور ⇽ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local text = [[
  ⋆  اوامر الخدمــه .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
  ⋆ ايـدي ⇽ لعرض صورتك + معلوماتك
  ⋆ ايديـي  ⇽ لعرض ايديك 
  ⋆ ايدي بالرد ⇽ لعرض ايدي الشخص
  ⋆ الرابط  ⇽ لظهور رابط المجموعه
  ⋆ جهاتي ⇽ لمعرفه عدد جهاتك
  ⋆ الالعاب ⇽ لعرض العاب البوت
  ⋆ نقاطي  ⇽ لمعرفه عدد نقاطك
  ⋆ بيع نقاطي  + العدد ⇽ لبيع نقاطك
  ⋆ معلوماتي ⇽ لعرض معلوماتك
  ⋆ السورس  ⇽ لعرض سورس البوت
  ⋆ الرتبه بالرد ⇽ لمعرفه رتبه الشخص
  ⋆ التفاعل ⇽ بالمعرف او بالرد لمعرفه تفاعل الشخص
  ⋆ كشف بالمعرف او بالرد ⇽ لمعرفه معلومات حسابه
  ⋆ كشف البوتات ⇽ لاظهار عدد البوتات الموجوده بالمجموعه
  ⋆ طرد البوتات ⇽ لطرد كل البوتات
  ⋆ طرد المحذوفين ⇽ لطرد الحسابات المحذوفه
  ⋆ رابط الحذف ⇽ لحذف حساب التليجرام
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
  ⋆ قناةالسـورس ⇽ @Source_Sonic
  ⋆ يُـوزر المّـطور ⇽ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م5' then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local text =[[
  ⋆ اوامـر التسليـه .
  ⋆ مرحباً عزيزي 
  ⋆ إليـك اوامر التسليـه كـ التالي
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  
  ⋆ رفع ⟷ تنزيل ⇽ تـــاج 
  ⋆ رفع ⟷ تنزيل ⇽ زوجتي 
  ⋆ رفع ⟷ تنزيل ⇽ حمار 
  ⋆ رفع ⟷ تنزيل ⇽ كلب  
  ⋆ رفع ⟷ تنزيل ⇽ مطرب 
  ⋆ رفع ⟷ تنزيل ⇽ درج 
  ⋆ رفع ⟷ تنزيل ⇽ زاحف 
  ⋆ رفع ⟷ بقلبي تنزيل ⇽ من قلبي 
  ⋆ طلاق ⟷ زواج 
  
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  
  ⋆ قناةالسـورس ⇽ @Source_Sonic
   ⋆ يُـوزر المّـطور ⇽ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م6' then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local text = [[
  ⋆ اوامـر التعطِيل و التفعِيل .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ تفعيل ⟷ تعطيل ⇽ الرفــع 
  ⋆ تفعيل ⟷ تعطيل ⇽ الردود 
  ⋆ تفعيل ⟷ تعطيل ⇽ الالعـاب
  ⋆ تفعيل ⟷ تعطيل ⇽ التحذير 
  ⋆ تفعيل ⟷ تعطيل ⇽ الترحيب 
  ⋆ تفعيل ⟷ تعطيل ⇽ الايدي 
  ⋆ تفعيل ⟷ تعطيل ⇽ الايدي بالصوره 
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  ⋆ قناةالسـورس ⇽  @Source_Sonic
  ⋆ يُـوزر المّـطور ⇽ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م7' then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
local text = [[
  ⋆ اوامر الوضع للمجمّوعة :

  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  
  ⋆ ضع رابـط ⇽ لوضع رابط 
  ⋆ ضع اســـم ⇽ لوضع اســم 
  ⋆ ضع صوره ⇽ لوضع صوره 
  ⋆ ضع وصـف ⇽ لوضع وصف 
  ⋆ ضع القوانيــن ⇽ لوضع القوانين 
  ⋆ ضع الترحيب ⇽ لوضع ترحيــب 
  ⋆ ضع تكرار +العدد ⇽ لوضع تكرار 
  
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
  
  ⋆ قناةالسـورس ⇽ @Source_Sonic
  ⋆ يُـوزر المّـطور ⇽ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "⋆  ⇽ للمطور الاساسي فقط  .." end
local text = [[
⋆  ⇽  ❬اوامـر المطـور❭ 
⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
- تفعيـل «» ❬لتفعيل البوت ❭
- تعطيل «» ❬لتعطيل البوت ❭
- اسم بوتك + غادر «» ❬لطرد البوت❭
- رفع منشى «» ❬رفع منشى بالبوت❭
⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
- اذاعه «» ❬لنشر رساله لكل المجموعات❭
- اذاعه خاص «» ❬ لنشر رساله لكل المشتركين خاص❭
- اذاعه عام «» ❬لنشر رساله لكل المجموعات والخاص❭
- اذاعه عام بالتوجيه «» ❬لنشر منشور قناتك بابتوجيه للكل❭
- تنظيف المجموعات«»  ❬لمسح المجموعات الوهميه❭
- تنظيف المشتركين «» ❬لمسح المشتركين الوهميين❭
@Source_Sonic

مطور البوت : ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "⋆  ⇽ هذا الامر يخص :\n المدير ⇽ المنشئ ⇽ المطور فقط  \n⋆ " end
local text = [[⋆  ⇽ ❬جميع اوامر الردود ❭

- الردود «» لعرض الردود المثبته
- اضف رد «» لأضافه رد جديد
- مسح رد «» الرد المراد مسحه
- مسح الردود «» لمسح كل الردود
- الردود العامه «» لمعرف الردود المثبته عام 
- اضف رد عام «» لاضافه رد لكل المجموعات
- مسح رد عام  «» لمسح الرد العام 
- مسح الردود العامه «» لمسح كل ردود العامه
@Source_Sonic

مطور البوت : ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
if not redis:get(Sonic..'lave_me'..msg.chat_id_) then 
return "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." المغادره بالتاكيد تم تفعيلها ." 
else 
redis:del(Sonic..'lave_me'..msg.chat_id_) 
return "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم تفعيل المغادره ." 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "  ⋆  ⇽ هذا الامر يخص :\n الادمن ⇽ المدير ⇽ المنشئ ⇽ المطور فقط \n⋆" end
if redis:get(Sonic..'lave_me'..msg.chat_id_) then 
return "⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." المغادره من قبل البوت بالتأكيد معطله ." 
else
redis:set(Sonic..'lave_me'..msg.chat_id_,true)  
return " ⋆  ⇽ أهلًا عزيزي "..msg.TheRankCmd.." تم تعطيل المغادره من قبل البوت ." 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(Sonic..'lave_me'..msg.chat_id_) then
if msg.Admin then return "⋆  ⇽ لا استطيع طرد المدراء والادمنيه والمنشئين . " end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"اهلًا عزيزي , لقد تم طردك من المجموعه بامر منك \n اذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\n فهذا رابط المجموعه \n│"..Flter_Markdown(redis:get(Sonic..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(Sonic..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_," لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ لا استطيع طردك لانك مشرف في المجموعه  .")
end
end)
return false
end
end

end 

if MsgText[1] == "سورس" or MsgText[1]=="السورس" then
return [[
    
✧ SouRce Sonic ✧
 ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
• 𝒅𝒆𝒗 >> [˹ 𝙰𝙻𝙰𝙼𝚈𖤝.](t.me/Alamy3)
⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
• 𝒅𝒆𝒗 >> [˹ 𝙰𝙻𝙻𝙰𝙼.](t.me/M_A_L_L_A_M)
⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
• • >> [˹ SouRce_Sonic𖤝.](t.me/SouRce_Sonic)
⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ 
⠀⠀
]]
end

if MsgText[1] == "التاريخ" then
return "\n تاريخ اليوم  : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "سحكاتي" then
return 'عدد تعديلاتك : ⇜ 〈 '..(redis:get(Sonic..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' 〉 \n🐾'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'سحكاتي'  then
local rfih = (redis:get(Sonic..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "عذرًا لا يوجد سحكات لك في البوت  " end
redis:del(Sonic..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "⋆  ⇽ تم مسح {* "..rfih.." *} من سحكاتك ."
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
if redis:get(Sonic..":UserNameChaneel") then
return "⋆  ⇽ اهلًا عزيزي المطور \n🔖╽الاشتراك بالتأكيد مفعل"
else
redis:setex(Sonic..":ForceSub:"..msg.sender_user_id_,350,true)
return "📑╿مرحبا بـك في نظام الاشتراك الاجباري\n🔖╽الان ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري ♻️" then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
local SubDel = redis:del(Sonic..":UserNameChaneel")
if SubDel == 1 then
return " ⋆  ⇽تم تعطيل الاشتراك الاجباري . \n✓"
else
return " ⋆  ⇽الاشتراك الاجباري بالفعل معطل . \n✓"
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري ⚠️" then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
local UserChaneel = redis:get(Sonic..":UserNameChaneel")
if UserChaneel then
return "🔖╿اهلا عزيزي المطور \n🔖╽الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n✓"
else
return " ⋆  ⇽لا يوجد قناة مفعله ع الاشتراك الاجباري. \n✓"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري 🔁" then
if not msg.SudoBase then return"هذاالامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(Sonic..":ForceSub:"..msg.sender_user_id_,350,true)
return "📑╿مرحبا بـك في نظام الاشتراك الاجباري\n🔖╽الان ارسل معرف قـنـاتـك"
end





end

local function dSonic(msg)



local getChatId = function(id)
  local chat = {}
  local id = tostring(id)
  if id:match("^-100") then
    local channel_id = id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getChannelFull = function(channel_id, cb)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb or dl_cb, nil)
end

local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end


if redis:get(Sonic..'welc'..msg.chat_id_) == 'on' then
if msg.content_.ID == 'MessageChatJoinByLink' then
function WelcomeByAddUser(BlaCk,Diamond)
local function setlinkgp(td,mrr619)
function gps(arg,data)

txt = (redis:get(Sonic..'welcome:msg'..msg.chat_id_) or '👋┓ اهلآ عزيزي '..(Diamond.first_name_ or '---')..'\n👥┫ المجموعه  '..(data.title_ or '---')..' \n🤫┫ احترام الادمنيه\n😡┫ ممنوع طلب الرتب\n🤐┫ ممنوع السب والكفران \n😒┫ ممنوع التكلم بالطائفيه\n🙏┫ الاعضاء '..mrr619.member_count_..' عضو\n👮‍┫ الادمنيه '..mrr619.administrator_count_..' \n⏱┫ وقت الانضمام :【*'..os.date("%H:%M:%S")..'*】\n📅┛ تاريخ الانضمام :【*'..os.date("%Y/%m/%d")..'*】\n')
txt = txt:gsub("{القوانين}", redis:get(Sonic..'rulse:msg'..msg.chat_id_) or "🔖¦ مرحبأ عزيري 👋🏻 القوانين كلاتي 👇🏻\n🔖¦ ممنوع نشر الروابط \n🔖¦ ممنوع التكلم او نشر صور اباحيه \n🔖¦ ممنوع  اعاده توجيه \n🔖¦ ممنوع التكلم بلطائفه \n🔖¦ الرجاء احترام المدراء والادمنيه 😅\n")
if Diamond.username_ then UserName = '@'..Diamond.username_ else UserName = '< لا يوجد معرف >' end
txt = txt:gsub("{المجموعه}",Flter_Markdown((redis:get(Sonic..'group:name'..msg.chat_id_) or '')))
local txt = txt:gsub("{المعرف}",UserName)
local txt = txt:gsub("{الاسم}",FlterName(Diamond.first_name_,20))
sendMsg(msg.chat_id_,msg.id_,txt)
end
getChat(msg.chat_id_,gps)
end
getChannelFull(msg.chat_id_,setlinkgp)
end
getUser(msg.sender_user_id_,WelcomeByAddUser)
end
end



local Text = msg.text
if Text then


if Text and (Text:match('(.*)')) and tonumber(msg.sender_user_id_) ~= 0 then
function dl_username(arg,data)
if data.username_ then
info = data.username_
else
info = data.first_name_
end
local hash = Sonic..'user_names:'..msg.sender_user_id_
redis:set(hash,info)
end
getUser(msg.sender_user_id_,dl_username)
end

------set cmd------
Black = msg.text 
mmd = redis:get(Sonic..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(Sonic..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(Sonic..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'اهلًا عزيزي \nتم تثبيت الامر الجديد')
redis:del(Sonic..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('تغير امر (.*)') then
if not msg.Kara then return "هذاالامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('تغير امر (.*)') 
redis:setex(Sonic..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ اهلًا بك عزيزي\nالامر الي تريد تغيره الي  >'..cmd..'< \nارسله الان . ')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.Kara then return "هذاالامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(Sonic..'CmD:'..msg.chat_id_,cmd)
redis:srem(Sonic..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_," ⋆  ⇽ اهلًا عزيزي\nالامر >"..cmd.."\n تم مسحه من قائمه الاوامر . ")
end
if Black == 'مسح قائمه الاوامر' or Black == 'مسح قائمه الاوامر' then
if not msg.Kara then return "هذاالامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
redis:del(Sonic..'CmD:'..msg.chat_id_)
redis:del(Sonic..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ اهلًا عزيزي تم مسح قائمه الاوامر .")
end
if Black == "قائمه الاوامر" then
if not msg.Kara then return "هذاالامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local CmDlist = redis:smembers(Sonic..'CmDlist:'..msg.chat_id_)
local t = '⋆  ⇽ قائمه الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(Sonic..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '⋆  ⇽ عزيزي لم تقم ب اضافه امر !'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if redis:get(Sonic..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,' ⋆ ⇽  تم تفعيل الترحيب سابقا')
else
sendMsg(msg.chat_id_,msg.id_,' ⋆ ⇽  تم تفعيل الترحيب')
redis:set(Sonic..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if redis:get(Sonic..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,' ⋆ ⇽  تم تعطيل الترحيب سابقا')
redis:set(Sonic..'welc'..msg.chat_id_,'off')
redis:del(Sonic..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,' ⋆ ⇽  تم تعطيل الترحيب')
end
end

if Text == "join on" and msg.SudoUser then
redis:set(Sonic..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(Sonic..'setchs') and msg.SudoUser then
redis:set(Sonic..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(Sonic..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUser then
sendMsg(msg.chat_id_,msg.id_,'ارسل معرفك بدون @')
redis:setex(Sonic..'setchs',120,true)
end


if Text == 'time' or Text == 'الوقت' and is_JoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}' 
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^تحويل ملصق$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ عزيزي المستخدم \nالامر فقط للصوره .')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == 'صوره' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,Sonic)   
if Sonic.content_.ID == "MessageSticker" then        
local bd = Sonic.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ عزيزي المستخدم \nالامر فقط للملصق .')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(Sonic..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(Sonic..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*📛│* تم حظرك من البوت بسبب التكرار \n🛠') 
end
redis:setex(Sonic..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then 

if msg.SudoBase then
local text = '⇽ مرحباً عزيـزي شكراً لك لاستخـدام سـورس سونيك  \nانت المطـور الاساسّي هنا \n⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆\n\n⋆  تسـتطـيع‌‏ التحكـم بكل الاوامر المـوجوده‌‏ بالكيبـورد الخاص بالبوت\n ⋆ فقط اضغـط ع الامر الذي تريد تنفيـذه .‌‏'
local keyboard = {
  {"ضع اسم للبوت","ضع صوره للترحيب"},
   {"تعطيل التواصل","تفعيل التواصل"},
  {"تعطيل البوت خدمي","تفعيل البوت خدمي","المطورين"},
   {"المشتركين","المجموعات","الاحصائيات"},
   {"اضف رد عام","الردود العامه"},
   {"اذاعه","اذاعه خاص"},
  {"اذاعه عام","اذاعه عام بالتوجيه"},
   {"تحديث","قائمه العام","ايديي"},
  {"تعطيل الاشتراك الاجباري","تفعيل الاشتراك الاجباري"},
  {"تغيير الاشتراك الاجباري","الاشتراك الاجباري"},
  {"تنظيف المشتركين","تنظيف المجموعات"},
   {"نسخه احتياطيه للمجموعات"},
   {"قناة السورس"},
   {"مٌـطورالسـورس"},
   {"الغاء الامر"}}
  return
send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(Sonic..'users',msg.sender_user_id_)
if redis:get(Sonic..'lock_service') then 
text = [[اهلًا انا بوت اسمي    []]..redis:get(Sonic..':NameBot:')..[[] 
‹ اختصّاصي احمي لك المجّموعه .
من الابوات الايرانيه والتوجيه وآلتكرار والخ ..

‹ لتفعيل البـوت اتبع الامور التاليه ..

١ ‹ اضف البوت الى المجموعه .
٢ ‹ ارفع البوت مشرف في المجموعه .
٣ ‹ وارسل تفعيل وسيتم تفعيل البوت ورفع مشرفياً القروب تلقائياً .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
قناةالسـورس ⇽ @Source_Sonic
‹ يُـوزر المّـطور  ⇽ ]]..SUDO_USER..[[
]]
else
text = [[اهلًا انا بوت اسمي []]..redis:get(Sonic..':NameBot:')..[[] 

‹ اختصّاصي احمي لك المجّموعه .
من الابوات الايرانيه والتوجيه وآلتكرار والخ ..

‹ لتفعيل البـوت اتبع الامور التاليه ..

١ ‹ اضف البوت الى المجموعه .
٢ ‹ ارفع البوت مشرف في المجموعه .
٣ ‹ وارسل تفعيل وسيتم تفعيل البوت ورفع مشرفياً القروب تلقائياً .
  ⋆ ⋆ ⋆ ⋆  ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆ ⋆
قناةالسـورس ⇽ @Source_Sonic
‹ يُـوزر المّـطور  ⇽ ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="مـطـور الـبـوت ",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(Sonic.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"تم ارسال الرسالة‌‏ \nالى : "..USERNAME.."⋆",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(Sonic..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽عذراً لا يمـكنك إرسـال { توجيه‌‏ ⇽ مـلصـق ⇽ فديو كام} .")
return false
end
redis:setex(Sonic.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"تم ارسال رسالتك الى المـطـور\nسيـتم الرد عليك في اقرب وقت\nمعرف المطور "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group ====================================
if redis:get(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(Sonic..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(Sonic..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(Sonic..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n   تم اضافت الرد  \n-')
elseif msg.photo then 
redis:hset(Sonic..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽تم اضافه صوره للرد بنجاح \nيمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه . ')
elseif msg.voice then
redis:hset(Sonic..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه بصمه صوت للرد بنجاح \n يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه .')
elseif msg.animation then
redis:hset(Sonic..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه متحركه للرد بنجاح  \n يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه . ')
elseif msg.video then
redis:hset(Sonic..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽تم اضافه فيديو للرد بنجاح \nيمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الفيديو الاتي .')
elseif msg.audio then
redis:hset(Sonic..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه للصوت للرد بنجاح \nيمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوت الاتي .')
elseif msg.sticker then
redis:hset(Sonic..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه ملصق للرد بنجاح \nيمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الملصق الاتي  . ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(Sonic..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(Sonic..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(Sonic..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ⋆  ⇽ تم اضافت الرد لكل المجموعات . ')
elseif msg.photo then 
redis:hset(Sonic..'replay_photo:group:',klma,photo_id)
redis:del(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه صوره للرد العام ✓\nيمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(Sonic..'replay_voice:group:',klma,voice_id)
redis:del(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه بصمه صوت للرد العام ✓\nيمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه .')
elseif msg.animation then
redis:hset(Sonic..'replay_animation:group:',klma,animation_id)
redis:del(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه متحركه للرد العام \n يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه .')
elseif msg.video then
redis:hset(Sonic..'replay_video:group:',klma,video_id)
redis:del(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه فيديو للرد العام ✓\nيمكنك ارسال ❴ ['..klma..'] ❵لاضهار الفيديو الاتي .')
elseif msg.audio then
redis:hset(Sonic..'replay_audio:group:',klma,audio_id)
redis:del(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه للصوت للرد العام ✓\n يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(Sonic..'replay_sticker:group:',klma,sticker_id)
redis:del(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اضافه ملصق للرد العام ✓\n يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الملصق الاتي ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
if redis:get(Sonic..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(Sonic..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ عذرا , هناك خطأ لديك المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"📑╿عذرا , لقد نسيت شيئا \n🔖╽يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(Sonic..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"🔖╿جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n📮╽على قناتك ⇜ ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"📑╿عذرا , عزيزي المطور \n🔖╽هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(Sonic..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(Sonic..'namebot:witting'..msg.sender_user_id_)
redis:set(Sonic..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ تم تغير اسم البوت  \n، الان اسمه "..Flter_Markdown(msg.text).." \n")
return false
end

if redis:get(Sonic..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(Sonic..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(Sonic..'replay_photo:group:',msg.text)
redis:hdel(Sonic..'replay_voice:group:',msg.text)
redis:hdel(Sonic..'replay_animation:group:',msg.text)
redis:hdel(Sonic..'replay_audio:group:',msg.text)
redis:hdel(Sonic..'replay_sticker:group:',msg.text)
redis:hdel(Sonic..'replay_video:group:',msg.text)
redis:setex(Sonic..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ جيد , يمكنك الان ارسال جوا ب الردالعام \n[[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]")
end
end

if redis:get(Sonic..'delrdall:'..msg.sender_user_id_) then
redis:del(Sonic..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(Sonic..'replay:all',msg.text)
local photo =redis:hget(Sonic..'replay_photo:group:',msg.text)
local voice = redis:hget(Sonic..'replay_voice:group:',msg.text)
local animation = redis:hget(Sonic..'replay_animation:group:',msg.text)
local audio = redis:hget(Sonic..'replay_audio:group:',msg.text)
local sticker = redis:hget(Sonic..'replay_sticker:group:',msg.text)
local video = redis:hget(Sonic..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(Sonic..'replay:all',msg.text)
redis:hdel(Sonic..'replay_photo:group:',msg.text)
redis:hdel(Sonic..'replay_voice:group:',msg.text)
redis:hdel(Sonic..'replay_audio:group:',msg.text)
redis:hdel(Sonic..'replay_animation:group:',msg.text)
redis:hdel(Sonic..'replay_sticker:group:',msg.text)
redis:hdel(Sonic..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n  ✓ تم مسح الرد . ')
end 
end 


if redis:get(Sonic..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(Sonic..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(Sonic..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "⋆  ⇽ تم وضع الوصف بنجاح  .\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n⋆")
end
if redis:get(Sonic..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(Sonic..'welcom:witting'..msg.sender_user_id_) 
redis:set(Sonic..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ تم وضع الترحيب بنجاح  ." )
end
if redis:get(Sonic..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(Sonic..'rulse:witting'..msg.sender_user_id_) 
redis:set(Sonic..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ مرحبآ عزيزي\nتم حفظ القوانين بنجاح ✓\nارسل [[ القوانين ]] لعرضها \n ✓')
end
if redis:get(Sonic..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(Sonic..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(Sonic..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(Sonic..'linkGroup'..msg.sender_user_id_,link) 
redis:set(Sonic..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'تم وضع الرابط الجديد بنجاح .. ')
end
if redis:get(Sonic..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(Sonic..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_," تم وضع الوصف بنجاح .")
end 
end,nil)
end


if redis:get(Sonic..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(Sonic..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(Sonic..'users')  
local groups = redis:smembers(Sonic..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'اهلا عزيزي المطور \n جاري نشر التوجيه للمجموعات وللمشتركين ...')      
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(Sonic..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اذاعه الكليشه بنجاح 🏌🏻\n🗣*│*للمـجمـوعآت » ❴ *'..#groups..'* ❵ قروب \n👥*╽* للمـشـترگين » ❴ '..#pv..' ❵ مـشـترگ ')
end

if redis:get(Sonic..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(Sonic..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(Sonic..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ اهلا عزيزي المطور \nجاري نشر الرساله للمشتركين ...')     
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(Sonic..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ عدد المشتركين : ❴ '..#pv..' ❵\n ، تم الاذاعه الى ❴ '..SenderOk..'  ❵ مشترك \n ✓') 
end
end)
end
end

if redis:get(Sonic..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(Sonic..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(Sonic..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'📑╿اهلا عزيزي المطور \n🔖╽جاري نشر الرساله للمجموعات ...')      
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '⋆  ⇽ تم حذف ❴ *'..NumGroupsDel..'* ❵ من قائمه الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ عدد المجموعات ❴ *'..#groups..'* ❵\n🗣*╽*تـم الاذاعه الى ❴ *'..AllGroupSend..'* ❵\n'..MsgTDel..'✓')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(Sonic..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(Sonic..':WELCOME_BOT'),[[⚜╿اهلا انآ بوت آسـمـي ]]..redis:get(Sonic..':NameBot:')..[[ ✓
👨🏻‍✈️│آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
📛╽مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...

🎭│مـعـرف الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ ⋆  
]])
return false
end 

if msg.forward_info and redis:get(Sonic..'fwd:'..msg.sender_user_id_) then
redis:del(Sonic..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(Sonic..'users')
local groups = redis:smembers(Sonic..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'📑╿اهلا عزيزي المطور \n🔖╽جاري نشر التوجيه للمجموعات وللمشتركين ...')     
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم اذاعه التوجيه بنجاح \n للمـجمـوعآت » ❴ *'..#groups..'* ❵\n للخآص » ❴ '..#pv..' ❵\n✓')      
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'مع السلامه')
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.ID == "MessagePhoto" and redis:get(Sonic..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(Sonic..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(Sonic..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ تم تغيير صـوره الترحيب للبوت .')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(Sonic..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(Sonic..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'⋆  ⇽ ليس لدي صلاحيه تغيير الصوره \n ، يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(Sonic..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(Sonic..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(Sonic..'replay:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(Sonic..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ جيد , يمكنك الان ارسال جواب الرد \n [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n✓")
end
end

if redis:get(Sonic..'delrd:'..msg.sender_user_id_) then
redis:del(Sonic..'delrd:'..msg.sender_user_id_)
local names   = redis:hget(Sonic..'replay:'..msg.chat_id_,msg.text)
local photo   = redis:hget(Sonic..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice   = redis:hget(Sonic..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(Sonic..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio   = redis:hget(Sonic..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker   = redis:hget(Sonic..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video   = redis:hget(Sonic..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(Sonic..'replay:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(Sonic..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n  ✓ تم مسح الرد - ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(Sonic..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(Sonic..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ عذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم .")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽  عذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت .")      
end
end,nil)
end
return false
end
redis:set(Sonic..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه ✓\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(Sonic..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"⋆  ⇽ قام  ["..UserName.."]\n بتغير اسم المجموعه  \n الى "..Flter_Markdown(msg.content_.title_).." \n✓") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(Sonic..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(Sonic..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(Sonic..'welcome:msg'..msg.chat_id_) or "🙋🏻‍♂│اهلن بك عزيزي {الاسم}\n🎟│معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين ♥\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n⚜│اسم الكروب » {المجموعه}")
if welcome then
rules = (redis:get(Sonic..'rulse:msg'..msg.chat_id_) or "👨🏻‍💻╿مرحبأ عزيري القوانين كلاتي 👇🏻\n♦️│ممنوع نشر الروابط\n⚠️│ممنوع التكلم او نشر صور اباحيه\n⚔│ممنوع  اعاده توجيه\n💭│ممنوع التكلم بلطائفه\n♥️╽الرجاء احترام المدراء والادمنيه 😅\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(Sonic..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(Sonic..'welcome:msg'..msg.chat_id_) or "🙋🏻‍♂│اهلن بك عزيزي {الاسم}\n🎟│معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين ♥\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n⚜│اسم الكروب » {المجموعه}")
if welcome then
rules = (redis:get(Sonic..'rulse:msg'..msg.chat_id_) or "👨🏻‍💻╿مرحبأ عزيري القوانين كلاتي 👇🏻\n♦️│ممنوع نشر الروابط\n⚠️│ممنوع التكلم او نشر صور اباحيه\n⚔│ممنوع  اعاده توجيه\n💭│ممنوع التكلم بلطائفه\n♥️╽الرجاء احترام المدراء والادمنيه ??\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(Sonic..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(Sonic..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(Sonic..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(Sonic..'welcome:get'..msg.chat_id_)
end
redis:setex(Sonic..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(Sonic..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(Sonic..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_Sonic = (redis:get(Sonic..'num_msg_Sonic'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_Sonic) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(Sonic..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_," - العضو » "..USERNAME.."\n    - قمـت بتگرآر آگثر مـن "..NUM_MSG_Sonic.." رسـآلهہ‌‏ , لذآ تم تقييدگ مـن آلمـجمـوعهہ‌‏ ✓\n",12,USERCAR) 
return false
end)
end 
redis:setex(Sonic..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,' ⋆  ⇽ صلاحياته منشئ القروب .')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'⋆  ⇽ مجرد عضو هنا .')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'📌╿الرتبة : مشرف 🍃\nوالصلاحيات هي ⇓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n📝╿تغير معلومات المجموعه ↞ 〈 '..info..' 〉\n📨│حذف الرسائل ↞ 〈 '..delete..' 〉\n🚷│حظر المستخدمين ↞ 〈 '..restrict..' 〉\n♻│دعوة مستخدمين ↞ 〈 '..invite..' 〉\n🔘│تثبيت الرسائل ↞ 〈 '..pin..' 〉\n🚸│اضافة مشرفين جدد ↞ 〈 '..promote..' 〉\n\n💠╽ملاحضه » علامة 〈  ꪜ 〉 تعني لديه الصلاحية وعلامة 〈 ✘ 〉 تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(Sonic..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) and not redis:get(Sonic..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع اعادة التوجيه  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(Sonic..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(Sonic..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(Sonic..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذرا الانلاين مقفول  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(Sonic..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(Sonic..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(Sonic..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿ممنوع ارسال الروابط  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(Sonic..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿ممنوع ارسال روابط الويب   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(Sonic..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿ممنوع ارسال التاك  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(Sonic..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿ممنوع ارسال المعرف   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(Sonic..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿ممنوع ارسال الماركدوان  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(Sonic..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿ممنوع ارسال روابط الويب   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(Sonic..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذراً ممنوع التعديل تم المسح \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(Sonic..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع ارسال الفيديو كام \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(Sonic..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع ارسال الصور  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(Sonic..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(Sonic..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع ارسال الفيديو  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(Sonic..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(Sonic..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
 if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع ارسال الملفات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(Sonic..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع ارسال الملصقات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(Sonic..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع ارسال الصور المتحركه  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(Sonic..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(Sonic..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
 if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️│عذرا ممنوع ارسال جهات الاتصال  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂│العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(Sonic..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
 if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذرا ممنوع ارسال الموقع  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(Sonic..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
 if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذرا ممنوع ارسال البصمات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(Sonic..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "│╿عذرا ممنوع لعب الالعاب  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(Sonic..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذرا ممنوع ارسال الصوت  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(Sonic..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذرا الكيبورد مقفول  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(Sonic..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ??')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذرا ممنوع ارسال الروابط  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(Sonic..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️╿عذرا ممنوع ارسال روابط الويب  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(Sonic..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*╿* لا يمكنني مسح الرساله المخالفه .\n🎟*╽* لست مشرف او ليس لدي صلاحيه  الحذف \n ')    
end
if redis:get(Sonic..'lock_woring'..msg.chat_id_) then
local msgx = "♦️╿عذرا ممنوع ارسال التاك او المعرف  \n📛"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂╽العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(Sonic..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(Sonic..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(Sonic..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(Sonic..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(Sonic..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(Sonic..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(Sonic..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(Sonic..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local su = {
  "امـر حبيبي المـطور ",
  "لبيـه مطوري الحلو ",
  "سَم مطـوري الحلو "}
  local ss97 = {
  "سَم يقلبي .","عييون البوت ، وقلبـه .",
  "امـر يعييني .",
  }
  local bs = {
  "مابوس 🌚💔",
  "اآآآم͠ــ.❤️😍ــو͠و͠و͠آ͠آ͠ح͠❤️عسسـل❤️",
  "الوجه ميساعد 😐✋",
  "ممممح😘ححح😍😍💋",
  "مابوس واحد خايس مثل هاذا 😁",
  "يععع تلعب نفسي 😷",
  "بي/ها جرب اخاف 😢",
  "استغفر الله فاسق 😒",
  }
  local ns = {
  "ارحـب عزيزي .",
  "اطلق هـاي .",
  "افخم هـاي .",
  }
  local sh = {
  "امـر عزيزي المطـور ",
  "ارحب يمطـوري الحِلو",
  "لبيـه ي مطوري",
  
  }
  local sss = {
  "بخير بحروفك .",
  "تمام يعييني .",
  "بخيير بشوفة حروفك .",
  }
  local dr = {
  "فمـانه يعيني .",
  "استودعتك الله . ",
  "انتبهـلك عييني .",
  }
  local nnn = {
  "سَم يقلبي .","عييون البوت ، وقلبـه .",
  "امـر يعييني .",
  }
  local lovm = {
  "اهيّـم فيك .",
  "اعششق حروفك .",
  "امـوت فقلبك .",
  }
  local song = {
  
  "-[عَـالم‌المُـوسيقى‌بصِيـغةMp3.⋆](https://t.me/FlassTas11)",
  "[-قـروب‌مِكس‌بنـات‌للسـوالف .🖤.](https://t.me/FlassTas11)",
  "[-جُزءيكابروجُزءينزف*.](https://t.me/FlassTas11)",
  
  }
  
  local he = {"لوكي وزاحف من ساع زحفلي وحضرته 😒","خوش ولد و ورده مال الله 💋🙄","يلعب ع البنات 🙄","ولد زايعته الكاع 😶🙊","صاك يخبل ومعضل","محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️","اموت عليه 🌝","هوه غير الحب مال اني 🤓❤️","مو خوش ولد صراحه ☹️","ادبسز وميحترم البنات","فد واحد قذر 🙄😒","ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️","مو خوش ولد ??",
  }
  local she = {"الكبد مال اني هيه","ختولي حبها","خانتني ويه صديقي 😔","بس لو الكفها اله اعضها 💔","خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒","جذابه ومنافقه سوتلي مشكله ويه الحب مالتي","ئووووووووف اموت ع ربها","7ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفوون","صديقتي وختي وروحي وحياتي","فد وحده منحرفه 😥","ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐","ام سحوره سحرت اخويا وعلكته 6 سنوات ??","ماحبها 🙁","بله هاي جهره تسئل عليها ؟","بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼","ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹",
  }
  
  local Text = msg.text
  local Text2 = Text:match("^"..Bot_Name.." (%d+)$")
  
  if msg.SudoUser and Text == Bot_Name and not Text2 then
  return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
  elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
  return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
  elseif Text:match("^قول (.*)$") then
  if utf8.len(Text:match("^قول (.*)$")) > 500 then 
  return sendMsg(msg.chat_id_,msg.id_,"| ما اقدر اقول اكثر من 500 حرف 🙌🏾")
  end
  local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
  if callback_Text and callback_Text == 'الاسم سبام ' then
  return sendMsg(msg.chat_id_,msg.id_,"| للاسف النص هذا مخالف ")
  else
  return sendMsg(msg.chat_id_,0,callback_Text) 
  end
  elseif Text:match("^"..Bot_Name.." اتفل(.*)$") and msg.SudoUser then
  if msg.reply_id then
  sendMsg(msg.chat_id_,msg.id_,'اوك سيدي 🌝')
  sendMsg(msg.chat_id_,msg.reply_id,'لك شنو هاذه ويهك ختفوووووووووو💦💦️️ بنص ويهك 😹') 
  else
  end
  elseif Text:match("^"..Bot_Name.." رزله(.*)$") and msg.SudoUser then
  if msg.reply_id then
  sendMsg(msg.chat_id_,msg.id_,'اوك سيدي ??')
  return sendMsg(msg.chat_id_,msg.reply_id,'تعال هيوو  😒 شو طالعه عينك ولسانك طويل سربوت  اشو تعال بله شنو هاذ ويهك هاذ 😳 كول بلعباس , 😅 لك #دي وتفو بعد لتندك بتاج راسك خوش حمبقلبي  👍🏿') 
  end
  elseif Text:match("^بوس(.*)$") then 
  if msg.reply_id then 
  return sendMsg(msg.chat_id_,msg.reply_id,bs[math.random(#bs)])
  else
  return sendMsg(msg.chat_id_,msg.id_,"")
  end 
  elseif msg.SudoUser and Text=="هاي" then 
  return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
  elseif not msg.SudoUser and Text=="هاي" then 
  return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
  elseif not msg.SudoUser and Text== "كيفك" or Text== "كيفك" or Text== "كيفكم" or Text== "كيفكم" or Text== "كيفكم" then
  return sendMsg(msg.chat_id_,msg.id_,sss[math.random(#sss)])
  elseif not msg.SudoUser and Text==" باي" or Text == "باي" then
  return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
  elseif not msg.SudoUser and Text==" بوت" or Text == "بوت" then
  return sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)])
  elseif msg.SudoUser and Text== "احبك" then 
  return sendMsg(msg.chat_id_,msg.id_,"موبكثـري")
  elseif msg.SudoUser and Text== "تحبني" or Text=="تحبني." then 
  return sendMsg(msg.chat_id_,msg.id_,"اعششق حروفك")
  elseif not msg.SudoUser and Text== "احبك" or Text=="حبك" then 
  return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
  elseif not msg.SudoUser and Text== "تحبني" then
  return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
  elseif Text== ".." or Text=="." then 
  return sendMsg(msg.chat_id_,msg.id_,song[math.random(#song)])
  elseif Text== "وش رأيك" or Text== "شنو رأيك" or Text== "وش رايك" then 
  return sendMsg(msg.chat_id_,msg.id_,he[math.random(#he)])
  elseif Text== "شنو رئيك بهاي" or Text=="شنو رئيك بيه" or Text== "شنو رئيك بهاذش" then 
  return sendMsg(msg.chat_id_,msg.id_,she[math.random(#she)])
  elseif Text=="مسيو" or Text=="مسيو" then
  if msg.Admin then 
  return sendMsg(msg.chat_id_,msg.id_,'ممـور يحلوي.')
  else 
  return sendMsg(msg.chat_id_,msg.id_,"ممـور يحلوي.") 
  end
  elseif Text== "العالمي" or Text== "عالمي" then return  sendMsg(msg.chat_id_,msg.id_,"[مطور سورس الهكر وسونيك ↯](https://t.me/Alamy3)")
  elseif Text== "سونيك" or Text== "سونيك" then return  sendMsg(msg.chat_id_,msg.id_,"[مطور سورس داني ↯](https://t.me/UU_IV)")
  elseif Text== "علام" or Text== "علام سونيك" then return  sendMsg(msg.chat_id_,msg.id_,"[مطور سورس سونيك ⚛](https://t.me/M_A_L_L_A_M)")
  elseif Text== "هايدي" or Text== "قلب العالمي" then return  sendMsg(msg.chat_id_,msg.id_,"[حبيبت العالمي ووبس ⚛](https://t.me/H_yah1)")
  elseif Text== "سورس سونيك" or Text== "سورس سونيك" then return  sendMsg(msg.chat_id_,msg.id_,"[افضل سورس مصري ⚛](https://t.me/SouRce_Sonic)")
  elseif Text== "تف" then return sendMsg(msg.chat_id_,msg.id_,"لو لا الحاضرين تفلت بخشمّك ")
  elseif Text== "مالك السورس" then return sendMsg(msg.chat_id_,msg.id_,"[⇽ نِـيدالزهرانَي](t.me/Slo09")
  elseif Text== "مطور السورس" then return sendMsg(msg.chat_id_,msg.id_,"[⇽ نِـيدالزهرانَي](t.me/Slo09")
  elseif Text== "نيد" then return sendMsg(msg.chat_id_,msg.id_,"[مطـور سورس دريـم](t.me/Slo09")
  elseif Text== "عزام" then return sendMsg(msg.chat_id_,msg.id_,"[مطـور سورس دريَـم](t.me/eeeel")
  elseif Text== "تعال" then return sendMsg(msg.chat_id_,msg.id_,"جـيتك")
  elseif Text== "الو"  then return sendMsg(msg.chat_id_,msg.id_,"ارحب")
  elseif Text== "وينك"  then return sendMsg(msg.chat_id_,msg.id_,"ف قـلبك")
  elseif Text== "منورين"  then return sendMsg(msg.chat_id_,msg.id_,"من بعـدك")
  elseif Text== "هاي"  then return sendMsg(msg.chat_id_,msg.id_,"اطلق هـاي ، افخـم هـاي .")
  elseif Text== "🙊"  then return sendMsg(msg.chat_id_,msg.id_,"قمنقلع")
  elseif Text== "😢"  then return sendMsg(msg.chat_id_,msg.id_,"شفيـه الحلو زعلان")
  elseif Text== "شلونك"  then return sendMsg(msg.chat_id_,msg.id_,"بخيـر يعيني ")
  elseif Text== "منور"  then return sendMsg(msg.chat_id_,msg.id_,"من بععد نـورك")
  elseif Text== "دوم" and not is_sudo then return sendMsg(msg.chat_id_,msg.id_,"يديـم مبسمّك")
  elseif Text== "امح"  then return sendMsg(msg.chat_id_,msg.id_,"عخـدك الحلو ")
  elseif Text== "شكرا" or Text== "ثكرا" then return  sendMsg(msg.chat_id_,msg.id_,"العفـو")
  elseif Text== " وين"  then return sendMsg(msg.chat_id_,msg.id_,"فقـلبك")
  elseif Text== "😍"  then return sendMsg(msg.chat_id_,msg.id_,"عيـونك اخر امالي .")
  elseif Text== "اكرهك"  then return sendMsg(msg.chat_id_,msg.id_,"تكـره اللي يحبك")
  elseif Text== "نتيكن؟" then return sendMsg(msg.chat_id_,msg.id_,"كم المـدة؟️")
  elseif Text== "طفش"  then return sendMsg(msg.chat_id_,msg.id_,"الله يرزقك بسـالفة.")
  elseif Text== "احبك."  then return sendMsg(msg.chat_id_,msg.id_,"موبكـثري.")
  elseif Text== "جيت" or Text=="جيت." then return  sendMsg(msg.chat_id_,msg.id_,"اطلق جـيه.")
  elseif Text== "اجلدك"  then return sendMsg(msg.chat_id_,msg.id_,"هـياط ادول .")
  elseif Text== "نايمين" then return sendMsg(msg.chat_id_,msg.id_,"علـيهم بالعافية .'")
  elseif Text== "موجودين" then return sendMsg(msg.chat_id_,msg.id_,"لبـيه امـر.")
  elseif Text== "جيت" then return sendMsg(msg.chat_id_,msg.id_,"اطلق جـيه .")
  elseif Text== " انت مين" or Text=="من انت" then return sendMsg(msg.chat_id_,msg.id_,"شتشـوف ؟")
  elseif Text== "كلخرا" or Text== "كل خرا" then return sendMsg(msg.chat_id_,msg.id_,"مخـليه لاشكالك .")
  elseif Text== "😔"  then return sendMsg(msg.chat_id_,msg.id_,"ليه الحِلو زعلان")
  elseif Text== "☹️"  then return sendMsg(msg.chat_id_,msg.id_,"شفيـه الحلو زعلان")
  elseif Text== "جيعان"  then return sendMsg(msg.chat_id_,msg.id_,"قوم كل")
  elseif Text== "خاصك"  then return sendMsg(msg.chat_id_,msg.id_,"الله لـنا")
  elseif Text== "اسكت"  then return sendMsg(msg.chat_id_,msg.id_,"مِن بععدك حلفت.")
  elseif Text== "اشتقت." or Text== "اشتقت" then return sendMsg(msg.chat_id_,msg.id_,"اكثـريعيني.")
  elseif Text== "كلزق" or Text== "كلزق." or Text== "كل زق" then return  sendMsg(msg.chat_id_,msg.id_,"مخـليه لك .")
  elseif Text:match(Bot_Name.."كيفك") then 
  return sendMsg(msg.chat_id_,msg.id_,"يـزين المهتم .")
  elseif Text== "فدوه"  then return sendMsg(msg.chat_id_,msg.id_,"مجـار من الفدا.")
  elseif Text== "احبك."  then return sendMsg(msg.chat_id_,msg.id_,"موبكثـري")
  elseif Text== "احبك"  then return sendMsg(msg.chat_id_,msg.id_,"موبكـثري")
  elseif Text== "يحلو"  then return sendMsg(msg.chat_id_,msg.id_,"امـريعيني")
  elseif Text== "😋"  then return sendMsg(msg.chat_id_,msg.id_,"يليل الليل.")
  elseif Text== "😡"  then  return sendMsg(msg.chat_id_,msg.id_,"وش فيـك."  )
  elseif Text== "مرحبا"  then return sendMsg(msg.chat_id_,msg.id_,"اهلاً عزيزي .")
  elseif Text== "سلام" or Text== "السلامم عليكم" or Text== "سلام عليكم" or Text=="سلامنن عليكم" or Text=="السلامن عليكم" then 
  return sendMsg(msg.chat_id_,msg.id_,"وعلـيك السلام عيني " )
  elseif Text== "هيه"  then return sendMsg(msg.chat_id_,msg.id_,"لبـيه" )
  elseif Text== "⋆ 🏻‍♂"  then return sendMsg(msg.chat_id_,msg.id_,"ع ويـن ي الحبيب")
  elseif Text== "واقف" then return sendMsg(msg.chat_id_,msg.id_,"لا جـالس")
  elseif Text== "ضايق"  then return sendMsg(msg.chat_id_,msg.id_,"سلامتـك")
  elseif Text== "ضايقه"  then return sendMsg(msg.chat_id_,msg.id_,"سـلامتك")
  elseif Text== "هلو" or Text== "هاي." or Text== "هاي" then return sendMsg(msg.chat_id_,msg.id_,"اطلق هـاي ، افخم هـاي .")
  elseif Text== "صدق"  then return sendMsg(msg.chat_id_,msg.id_,"بعمرك انا اكذب عليك")
  elseif Text== "موجود"  then return sendMsg(msg.chat_id_,msg.id_,"امـريقلبي")
  elseif Text== "تخليني"  then return sendMsg(msg.chat_id_,msg.id_,"اخليك بزاويه 380 درجه وانته تعرف الباقي")
  elseif Text== "فديتك." or Text== "فديتك"  then return  sendMsg(msg.chat_id_,msg.id_,"مجـار من الففدا " )
  elseif Text== "مساعدة"  then return sendMsg(msg.chat_id_,msg.id_,"لعرض قائمة المساعدة اكتب الاوامر 🌚❤️")
  elseif Text== "زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"ممره.")
  elseif Text== "حلو"  then return sendMsg(msg.chat_id_,msg.id_,"موبحلاوتك")
  elseif Text== "تبادل"  then return sendMsg(msg.chat_id_,msg.id_,"قـيدام")
  elseif Text== "عاش"  then return sendMsg(msg.chat_id_,msg.id_,"تعيـش ايامك")
  elseif Text== "ورده" or Text== "وردة" then return sendMsg(msg.chat_id_,msg.id_,"تشـم عطرها")
  elseif Text== "شسمك"  then return sendMsg(msg.chat_id_,msg.id_,"وش تـشوف؟")
  elseif Text== "فديت" or Text=="فطيت" then return sendMsg(msg.chat_id_,msg.id_,"مجـار من الففدا")
  elseif Text== "وخري" or Text== "وخر" then return  sendMsg(msg.chat_id_,msg.id_,"ع كيـفك الدنيا")
  elseif Text== "حبيبي" or Text=="حبي" then return  sendMsg(msg.chat_id_,msg.id_,"امـريقلبي")
  elseif Text== "حبيبتي" then return sendMsg(msg.chat_id_,msg.id_,"ف الخـاص مو هنا ")
  elseif Text== "حياتي" then return sendMsg(msg.chat_id_,msg.id_,"احب حيـاتك")
  elseif Text== "عمري" then return sendMsg(msg.chat_id_,msg.id_,"يحمي عممرك")
  elseif Text== "اسكت" then return sendMsg(msg.chat_id_,msg.id_,"اكيـه")
  elseif Text== "بتحبني" then return sendMsg(msg.chat_id_,msg.id_,"بعشـقك")
  elseif Text== "اقول" or Text=="اقولك" or Text=="اقولك." then return sendMsg(msg.chat_id_,msg.id_,"جعـل م يقول غييرك")
  elseif Text== "موجود" then return sendMsg(msg.chat_id_,msg.id_,"امـريعيني")
  elseif Text== "اكلك" then return sendMsg(msg.chat_id_,msg.id_,"جععل م ياكلني غيرك")
  elseif Text== "فدوه" or Text=="فدوة" or Text=="فدا." or Text=="فدا" then  
  return sendMsg(msg.chat_id_,msg.id_,"مجـار من الفدا")
  elseif Text== "جبر."  or Text== "جبر" then return sendMsg(msg.chat_id_,msg.id_,"مبـسمّك الحِلو")
  elseif Text== "اشكرك" then return sendMsg(msg.chat_id_,msg.id_,"ف خدمـتك يقلبي")
  elseif Text== "وين"  then return sendMsg(msg.chat_id_,msg.id_,"عقـلبك الحلو")
  elseif Text== "ولد"  or Text==  "الو" or Text==  "هيه" then return sendMsg(msg.chat_id_,msg.id_,"امـريقلبي")
  elseif Text== "اطردني"  then return sendMsg(msg.chat_id_,msg.id_,"من فـوق يعيني ")
  elseif Text== "جبر"  then return sendMsg(msg.chat_id_,msg.id_,"مبسمّك الحلو")
  elseif Text== "وش اسمك"  then return sendMsg(msg.chat_id_,msg.id_,"شتـشوف ؟")
  elseif Text== "انا"  then return sendMsg(msg.chat_id_,msg.id_,"شفـيك انت؟")
  elseif Text== "نورت"  then return sendMsg(msg.chat_id_,msg.id_,"مِن بععدك")
  elseif Text== "نورتي"  then return sendMsg(msg.chat_id_,msg.id_,"النـور نورك")
  elseif Text== "منورين."  then return sendMsg(msg.chat_id_,msg.id_,"نـور الحاضرين يعيني")
  elseif Text== "رفع درج"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم رفع العضو الى درج بنجاح\n←تمت إضافته إلى قائمه الدروج\n⋆")
  elseif Text== "تنزيل درج"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم تنزيل العضو من درج  القروب\n←تمت ازالته من قائمة الدروج\n⋆")
  elseif Text== "رفع كلب"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم رفع العضو إلى كلب بنجاح\n←تمت إضافته إلى قائمه الكلاب\n⋆")
  elseif Text== "رفع مطرب"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم رفع العضو الى مطرب بنجاح\n←تمت إضافته إلى قائمه المطربين\n⋆")
  elseif Text== "تنزيل مطرب"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم تنزيل المطرب بنجاح\n←تمت ازالته من قائمه المطربين\n⋆")
  elseif Text== "تنزيل كلب"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي \n←تم تنزيل الكب بنجاح\n←تمت إزالته من قائمه الكلاب\n⋆")
  elseif Text== "تنزيل زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم تنزيل الولد الزاحف بنجاح\n←تمت ازالته من قائمه  الهياط\n⋆")
  elseif Text== "رفع حمار"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم رفع الحمار بنجاح\n←الان اصبح حمار القروب \n⋆")
  elseif Text== "تنزيل حمار"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم تنزيل الحماربنجاح\n←تمت ٳزالته من قائمة الحمير🐐\n⋆")
  elseif Text== "رفع بقلبي"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم رفع العضو داخل قلبك\n\n⋆")
  elseif Text== "تنزيل من قلبي"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم تنزيله من داخل قلبك\n←تمت ازالته من قائمه القلوب \n⋆")
  elseif Text== "رفع تاج"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهـلا عزيزي\n←تم رفع العضو لقائمة التاج بنجاح  \n←اصبح خط احمر \n⋆")
  elseif Text== "تنزيل تاج"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهـلا عزيزي\n←تم تنزيل العضو \n←من قائمة ألتـاج بنجاح \n⋆")
  elseif Text== "رفع زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم رفع العضوه الى زوجتك بنجاح\nالآن يمكنكم أخذ راحتكم\n⋆")
  elseif Text== "تنزيل زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم تنزيل الدلخه زوجتك بنجاح\nالآن انتم مطلقان\n⋆")
  elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم زواجكم الاثنين بنجاح\n←الآن يمكنكم أخذ راحتكم\n⋆")
  elseif Text== "طلاق"  then return sendMsg(msg.chat_id_,msg.id_,"⋆اهــلا عزيزي\n←تم طلاق العضو بنجاح\n←الآن هو مطلق امشي قمنقلع \n⋆")
  elseif Text== "اوامر التسليه"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏┄─┅══┅─┄\n ⇽ مرحباً عزيزي\nإليـك اوامر التسلـيه كـ التالي\n┄─┅═ـ═┅─┄\n رفع ⇽ تنزيل  تـاج \n رفع ⇽ تنزيل ⇽ زوجتي\nرفع ⇽ تنزيل ⇽ حمار\n رفع ⇽ تنزيل ⇽ كلب\n رفع ⇽ تنزيل ⇽ مطرب\nرفع ⇽ تنزيل ⇽ درج\nرفع ⇽ تنزيل ⇽ زاحف \nرفع ⇽ بقلبي تنزيل ⇽ من قلبي\nطلاق ⇽ زواج \n➖")

elseif Text== "اقرالي دعاء" then 
return sendMsg(msg.chat_id_,msg.id_,"الله ياخذك .")
elseif Text== "ايديي" or Text=="ايدي 🆔" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"⋆ ⇽ آضـغط على آلآيدي ليتم آلنسـخ\n\n "..USERNAME.." ⇾ ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="عطني رابط الحذف" or Text=="هات رابط الحذف" or Text=="رابط الحذف" or Text=="رابط الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
رابط الحذف في جميع مواقع التواصل ✒
فكر قبل ان تخود خزوق
⇨⇨⇨⇨ 𝒔𝒐𝒖𝒓𝒄𝒆 𝒔𝒐𝒏𝒊𝒄 ⇦⇦⇦⇦
 ✒ رابط حذف  [Telegram](https://my.telegram.org/auth?to=delete) ܁
 ✒ رابط حذف [instagram](https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/) ܁
 ✒ رابط حذف [Facebook](https://www.facebook.com/help/deleteaccount) ܁
 ✒ رابط حذف [Snspchat](https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount) ܁
]] )
--=====================================
elseif Text== "انجب" or Text== "نجب" or Text=="جب" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"")
else 
return sendMsg(msg.chat_id_,msg.id_,"")
end 
end 




end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:get('kar') then
redis:setex('kar',86400,true) 
json_data = '{"BotID": '..Sonic..',"UserBot": "'..Bot_User..'","Groups" : {'
local All_Groups_ID = redis:smembers(Sonic..'group:ids')
for key,GroupS in pairs(All_Groups_ID) do
local NameGroup = (redis:get(Sonic..'group:name'..GroupS) or '')
NameGroup = NameGroup:gsub('"','')
NameGroup = NameGroup:gsub([[\]],'')
if key == 1 then
json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
else
json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
end
local admins = redis:smembers(Sonic..'admins:'..GroupS)
if #admins ~= 0 then
json_data =  json_data..',"Admins" : {'
for key,value in pairs(admins) do
local info = redis:hgetall(Sonic..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end

local creators = redis:smembers(Sonic..':MONSHA_BOT:'..GroupS)
if #creators ~= 0 then
json_data =  json_data..',"Creator" : {'
for key,value in pairs(creators) do
local info = redis:hgetall(Sonic..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end
local creator = redis:smembers(Sonic..':KARA_BOT:'..GroupS)
if #creator ~= 0 then
json_data =  json_data..',"Kara" : {'
for key,value in pairs(creator) do
local info = redis:hgetall(Sonic..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end

local owner = redis:smembers(Sonic..'owners:'..GroupS)
if #owner ~= 0 then
json_data =  json_data..',"Owner" : {'
for key,value in pairs(owner) do
local info = redis:hgetall(Sonic..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end
json_data =  json_data.."}"
end
local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
Save_Data:write(json_data..'}}')
Save_Data:close()
sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","⋆ ملف نسخه تلقائيه\n⋆  اليك مجموعاتك » { "..#All_Groups_ID.." }\n⋆ للبوت » "..Bot_User.."\n⋆ التاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
end
if redis:get(Sonic..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(Sonic..'ExpireDate:'..msg.chat_id_)
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'🕵🏼️‍♀️╿انتهى الاشتراك في احد المجموعات ✋🏿\n👨🏾‍🔧│المجموعه : '..FlterName(redis:get(Sonic..'group:name'..msg.chat_id_))..'🍃\n💂🏻‍♀️╽ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'🕵🏼️‍♀️╿انتهى الاشتراك البوت✋🏿\n💂🏻‍♀️│سوف اغادر المجموعه فرصه سعيده 👋🏿\n👨🏾‍🔧╽او راسل المطور للتجديد '..SUDO_USER..' 🍃')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(Sonic..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'🕵🏼️‍♀️╿باقي يوم واحد وينتهي الاشتراك ✋🏿\n👨🏾‍🔧╽راسل المطور للتجديد '..SUDO_USER..'\n📛')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 


return {
Sonic = {
"^(تقييد)$",
"^(تقييد) (%d+)$",
"^(تقييد) (@[%a%d_]+)$",
"^(فك التقييد)$",
"^(فك التقييد) (%d+)$",
"^(فك التقييد) (@[%a%d_]+)$",
"^(فك تقييد)$",
"^(فك تقييد) (%d+)$",
"^(فك تقييد) (@[%a%d_]+)$",
"^(ضع شرط التفعيل) (%d+)$",
"^(التفاعل)$",
"^(التفاعل) (@[%a%d_]+)$",
"^([iI][dD])$",
"^(تفعيل الايدي بالصوره)$",
"^(تعطيل الايدي بالصوره)$",
"^(تعطيل الرفع)$",
"^(تفعيل الرفع)$",
"^(قفل الدخول بالرابط)$",
"^(فتح الدخول بالرابط)$", 
"^(ايدي)$",
"^(ايدي) (@[%a%d_]+)$",
"^(كشف)$",
"^(كشف) (%d+)$",
"^(كشف) (@[%a%d_]+)$",
'^(رفع مزه)$',
'^(رفع مزه) (@[%a%d_]+)$',
'^(رفع مزه) (%d+)$',
'^(تنزيل مزه)$',
'^(تنزيل مزه) (@[%a%d_]+)$',
'^(تنزيل مزه) (%d+)$',
'^(رفع جني)$',
'^(رفع جني) (@[%a%d_]+)$',
'^(رفع جني) (%d+)$',
'^(تنزيل جني)$',
'^(تنزيل جني) (@[%a%d_]+)$',
'^(تنزيل جني) (%d+)$',
'^(رفع زق)$',
'^(رفع زق) (@[%a%d_]+)$',
'^(رفع زق) (%d+)$',
'^(تنزيل زق)$',
'^(تنزيل زق) (@[%a%d_]+)$',
'^(تنزيل زق) (%d+)$',
'^(رفع مميز)$',
'^(رفع مميز) (@[%a%d_]+)$',
'^(رفع مميز) (%d+)$',
'^(تنزيل مميز)$',
'^(تنزيل مميز) (@[%a%d_]+)$',
'^(تنزيل مميز) (%d+)$',
'^(رفع ادمن)$',
'^(رفع ادمن) (@[%a%d_]+)$',
'^(رفع ادمن) (%d+)$',
'^(تنزيل ادمن)$',
'^(تنزيل ادمن) (@[%a%d_]+)$',
'^(تنزيل ادمن) (%d+)$', 
'^(رفع مطي)$',
'^(تنزيل مطي)$', 
'^(رفع زاحف)$',
'^(تنزيل زاحف)$', 
'^(رفع المدير)$',
'^(رفع مدير)$', 
'^(رفع مدير) (@[%a%d_]+)$',
'^(رفع المدير) (@[%a%d_]+)$',
'^(رفع المدير) (%d+)$',
'^(رفع مدير) (%d+)$',
'^(رفع منشى اساسي)$',
'^(رفع منشئ اساسي)$',
'^(رفع منشئ اساسي) (@[%a%d_]+)$',
'^(رفع منشى اساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي)$',
'^(تنزيل منشى اساسي)$',
'^(تنزيل منشئ اساسي) (%d+)$',
'^(تنزيل منشى اساسي) (%d+)$',
'^(تنزيل منشى اساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
'^(رفع منشى)$',
'^(رفع منشئ)$',
'^(رفع منشئ) (@[%a%d_]+)$',
'^(رفع منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ)$',
'^(تنزيل منشى)$',
'^(تنزيل منشئ) (%d+)$',
'^(تنزيل منشى) (%d+)$',
'^(تنزيل منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ) (@[%a%d_]+)$',
'^(تنزيل المدير)$',
'^(تنزيل مدير)$',
'^(تنزيل مدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (%d+)$',
'^(تنزيل مدير) (%d+)$',
 '^(صلاحياته)$',
 '^(صلاحياتي)$',
'^(صلاحياته) (@[%a%d_]+)$',
'^(قفل) (.+)$',
'^(فتح) (.+)$',
'^(تفعيل)$',
'^(تفعيل) (.+)$',
'^(تعطيل)$',
'^(تعطيل) (.+)$',
'^(ضع تكرار) (%d+)$',
"^(مسح)$",
"^(مسح) (.+)$",
'^(منع) (.+)$',
'^(الغاء منع) (.+)$',
"^(حظر عام)$",
"^(حظر عام) (@[%a%d_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام)$",
"^(الغاء العام) (@[%a%d_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء عام)$",
"^(الغاء عام) (@[%a%d_]+)$",
"^(الغاء عام) (%d+)$",
"^(حظر)$",
"^(حظر) (@[%a%d_]+)$",
"^(حظر) (%d+)$",
"^(الغاء الحظر)$", 
"^(الغاء الحظر) (@[%a%d_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء حظر)$", 
"^(الغاء حظر) (@[%a%d_]+)$",
"^(الغاء حظر) (%d+)$",
"^(طرد)$",
"^(طرد) (@[%a%d_]+)$",
"^(طرد) (%d+)$",
"^(كتم)$",
"^(كتم) (@[%a%d_]+)$",
"^(كتم) (%d+)$",
"^(الغاء الكتم)$",
"^(الغاء الكتم) (@[%a%d_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء كتم)$",
"^(الغاء كتم) (@[%a%d_]+)$",
"^(الغاء كتم) (%d+)$",
"^(رفع مطور)$",
"^(رفع مطور) (@[%a%d_]+)$",
"^(رفع مطور) (%d+)$",
"^(تنزيل مطور)$",
"^(تنزيل مطور) (%d+)$",
"^(تنزيل مطور) (@[%a%d_]+)$",
"^(تعطيل) (-%d+)$",
"^(الاشتراك) ([123])$",
"^(الاشتراك)$",
"^(تنزيل الكل)$", 
"^(شحن) (%d+)$",
"^(المجموعه)$",
"^(كشف البوت)$",
"^(انشاء رابط)$",
"^(ضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(رابط)$",
"^(الرابط)$",
"^(ضع رابط)$",
"^(رابط خاص)$",
"^(الرابط خاص)$",
"^(القوانين)$",
"^(ضع القوانين)$",
"^(ضع قوانين)$",
"^(ضع تكرار)$",
"^(ضع التكرار)$",
"^(الادمنيه)$",
"^(منشن للكل)$",
"^(منشن للحلوين)$",
"^(منشن)$",
"^(قائمه المنع)$",
"^(المدراء)$",
"^(المميزين)$",
"^(المكتومين)$",
"^(ضع الترحيب)$",
"^(الترحيب)$",
"^(المنشى الاساسي)$",
"^(المنشئ الاساسي)$",
"^(المحظورين)$",
"^(ضع اسم)$",
"^(ضع صوره)$",
"^(ضع وصف)$",
"^(طرد البوتات)$",
"^(كشف البوتات)$",
"^(طرد المحذوفين)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(احصائياتي)$",
"^(معلوماتي)$",
"^(مسح معلوماتي)$",
"^(موقعي)$",
"^(رفع الادمنيه)$",
"^(صوره الترحيب)$",
"^(ضع وصف المطور)$",
"^(المطور)$",
"^(شرط التفعيل)$",
"^(قائمه المجموعات)$",
"^(المجموعات)$",
"^(المجموعات 🌋)$",
"^(المشتركين)$",
"^(المشتركين Ⓜ)$",
"^(اذاعه)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$",
"^(اذاعه عام بالتوجيه 📣)$", 
"^(اذاعه خاص 🗣)$", 
"^(اذاعه عام 📢)$", 
"^(اذاعه 🗣)$", 
"^(قائمه العام)$",
"^(قائمه العام 📜)$",
"^(المطورين)$",
"^(المطورين 🔥)$",
"^(فحص بوتي)$",
"^(test)$",
"^(ايديي🆔)$",
"^(قناة السورس 📡)$",
"^(الاحصائيات)$",
"^(الاحصائيات 💥)$",
"^(اضف رد عام)$",
"^(اضف رد عام ➕)$",
"^(مسح الردود)$",
"^(مسح الردود العامه)$",
"^(ضع اسم للبوت)$",
"^(مسح الصوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(الردود العامه)$",
"^(الردود العامه 🗨)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس 🔂)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(تنظيف المجموعات 🗑)$",
"^(تنظيف المشتركين 🗑)$",
"^(رتبتي)$",
"^(ضع اسم للبوت ©)$",
"^(ضع صوره للترحيب 🌄)$",
"^(ضع صوره للترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر ✖️)$",
"^(الرتبه)$",
"^(الغاء)$",
"^(سحكاتي)$",
"^(اسمي)$",
"^(التاريخ)$",
"^(/[Ss]tore)$",
"^(اصدار السورس)$",
"^(الاصدار)$",
"^(server)$",
"^(السيرفر)$",
"^(فحص البوت)$", 
"^(نسخه احتياطيه للمجموعات)$",
"^(رفع نسخه الاحتياطيه)$", 
"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(تفعيل الاشتراك الاجباري ☑)$", 
"^(تعطيل الاشتراك الاجباري ♻️)$", 
"^(تغيير الاشتراك الاجباري 🔁)$", 
"^(الاشتراك الاجباري ⚠️)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 









"^(السورس)$",
"^(سورس)$",
"^(م المطور)$", 
"^(اوامر الرد)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(م4)$",
"^(م5)$",
"^(م6)$",
"^(م7)$",
 
 
 },
 iSonic = iSonic,
 dSonic = dSonic,
 }
