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
Sonic..'replay_animation:group:'..msg.chat_id_,Sonic..'replay_audio:group:'..msg.chat_id
if الفيـديـالالعاب لعرض العاب ال
