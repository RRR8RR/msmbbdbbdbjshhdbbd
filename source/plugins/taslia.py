from pyrogram import Client, filters
from config import *
import asyncio
#سورس رنثون بيمسي - @BxxBxxL


def get_name(msg):
    if msg.from_user.last_name:
        last_name = msg.from_user.last_name
    else:
        last_name = ""
    if msg.from_user.first_name:
        first_name = msg.from_user.first_name
    else:
        first_name = ""
    return f"[{first_name} {last_name}](tg://user?id={msg.from_user.id})"


async def listaa(c, table, text):
    txx = f"{text}\n"
    ii = 1
    for i in table:
        try:
            x = await c.get_users(i)
            if x.username:
                username = f"@{x.username}"
            else:
                username = i
        except:
            username = i
        txx += f"{ii} - {username} \n"
        ii += 1
    return txx


@Client.on_message(filters.command("زواج$", prefixes=f".") & filters.me & filters.reply)
async def zawg(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز تتجوز نفسك ؟")
    r.sadd(f"{sudo_id}zwag", msg.reply_to_message.from_user.id)
    txx = f"⎉ تم زواجك من {get_name(msg.reply_to_message)} \n⎉ مبروك"
    await msg.edit(txx)


@Client.on_message(filters.command("طلاق$", prefixes=f".") & filters.me & filters.reply)
async def tlak(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ هتطلق نفسك ؟")
    r.srem(f"{sudo_id}zwag", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم طلاقك منه بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح زوجاتي$", prefixes=f".") & filters.me)
async def del_zawgaty(c, msg):
    r.delete(f"{sudo_id}zwag")
    txx = f"⎉ تم مسح زوجاتك بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("زوجاتي$", prefixes=f".") & filters.me)
async def zawgaty(c, msg):
    list1 = r.smembers(f"{sudo_id}zwag")
    txx = await listaa(c, list1, "==== قائمـة زوجاتك =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع مطي$", prefixes=f".") & filters.me & filters.reply)
async def khwl(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك مطي ؟")
    r.sadd(f"{sudo_id}khwlt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه مطي بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل مطي$", prefixes=f".") & filters.me & filters.reply)
async def unkhwl(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}khwlt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة المطايا بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح المطايا$", prefixes=f".") & filters.me)
async def del_khwlaty(c, msg):
    r.delete(f"{sudo_id}khwlt")
    txx = f"⎉ تم مسح المطايا بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("المطايا$", prefixes=f".") & filters.me)
async def khwlaty(c, msg):
    list1 = r.smembers(f"{sudo_id}khwlt")
    txx = await listaa(c, list1, "==== قائمـة المطايا =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع وقح$", prefixes=f".") & filters.me & filters.reply)
async def ars(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك وقح ؟")
    r.sadd(f"{sudo_id}arst", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه وقح بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل وقح$", prefixes=f".") & filters.me & filters.reply)
async def unars(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}arst", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة الوقحين بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح الوقحين$", prefixes=f".") & filters.me)
async def del_arsaty(c, msg):
    r.delete(f"{sudo_id}arst")
    txx = f"⎉ تم مسح الوقحين بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("الوقحين$", prefixes=f".") & filters.me)
async def arsaty(c, msg):
    list1 = r.smembers(f"{sudo_id}arst")
    txx = await listaa(c, list1, "==== قائمـة الوقحين =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع قرد$", prefixes=f".") & filters.me & filters.reply)
async def dog(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك قرد ؟")
    r.sadd(f"{sudo_id}dogt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه قرد بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل قرد$", prefixes=f".") & filters.me & filters.reply)
async def undog(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}dogt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة القرود بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح القرود$", prefixes=f".") & filters.me)
async def del_dogaty(c, msg):
    r.delete(f"{sudo_id}dogt")
    txx = f"⎉ تم مسح القرود بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("القرود$", prefixes=f".") & filters.me)
async def dogaty(c, msg):
    list1 = r.smembers(f"{sudo_id}dogt")
    txx = await listaa(c, list1, "==== قائمـة القرود =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع اخويا$", prefixes=f".") & filters.me & filters.reply)
async def motaw(c, msg):
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك اخويا ؟")
    r.sadd(f"{sudo_id}motawt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه اخويا بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل اخويا$", prefixes=f".") & filters.me & filters.reply)
async def unmotaw(c, msg):
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}motawt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة اخواتي بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح اخواتي$", prefixes=f".") & filters.me)
async def del_motawaty(c, msg):
    r.delete(f"{sudo_id}motawt")
    txx = f"⎉ تم مسح اخواتي بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("اخواتي$", prefixes=f".") & filters.me)
async def motawaty(c, msg):
    list1 = r.smembers(f"{sudo_id}motawt")
    txx = await listaa(c, list1, "==== قائمـة اخواتي =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع بقلبي$", prefixes=f".") & filters.me & filters.reply)
async def kalpy(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك بقلبي ؟")
    r.sadd(f"{sudo_id}kalpyt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه بقلبي بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل بقلبي$", prefixes=f".") & filters.me & filters.reply)
async def unkalpy(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}kalpyt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة القلوب بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح القلوب$", prefixes=f".") & filters.me)
async def del_kalpyaty(c, msg):
    r.delete(f"{sudo_id}kalpyt")
    txx = f"⎉ تم مسح القلوب بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("القلوب$", prefixes=f".") & filters.me)
async def kalpyaty(c, msg):
    list1 = r.smembers(f"{sudo_id}kalpyt")
    txx = await listaa(c, list1, "==== قائمـة القلوب =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع مطور$", prefixes=f".") & filters.me & filters.reply)
async def gay(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك مطور ؟")
    r.sadd(f"{sudo_id}gayt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه مطور بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل مطور$", prefixes=f".") & filters.me & filters.reply)
async def ungay(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}gayt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة المطورين بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح المطورين$", prefixes=f".") & filters.me)
async def del_gayaty(c, msg):
    r.delete(f"{sudo_id}gayt")
    txx = f"⎉ تم مسح المطورين بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("المطورين$", prefixes=f".") & filters.me)
async def gayaty(c, msg):
    list1 = r.smembers(f"{sudo_id}gayt")
    txx = await listaa(c, list1, "==== قائمـة المطورين =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع ابني$", prefixes=f".") & filters.me & filters.reply)
async def abny(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك ابني ؟")
    r.sadd(f"{sudo_id}abnyt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه ابني بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل ابني$", prefixes=f".") & filters.me & filters.reply)
async def unabny(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}abnyt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة اولادي بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح اولادي$", prefixes=f".") & filters.me)
async def del_abnyaty(c, msg):
    r.delete(f"{sudo_id}abnyt")
    txx = f"⎉ تم مسح اولادي بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("اولادي$", prefixes=f".") & filters.me)
async def abnyaty(c, msg):
    list1 = r.smembers(f"{sudo_id}abnyt")
    txx = await listaa(c, list1, "==== قائمـة اولادي =====")
    await msg.edit(txx)


@Client.on_message(filters.command("رفع بنتي$", prefixes=f".") & filters.me & filters.reply)
async def banty(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ انت عبيط عاوز ترفع نفسك بنتي ؟")
    r.sadd(f"{sudo_id}bantyt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم رفعه بنتي بنجاح  "
    await msg.edit(txx)


@Client.on_message(filters.command("تنزيل بنتي$", prefixes=f".") & filters.me & filters.reply)
async def unbanty(c, msg):
    if msg.reply_to_message.from_user.id in sudo_command:
        return await msg.edit("⎉ لا يمكنـك استخـدام الأمـر علـى مبرمجين السورس")
    if msg.reply_to_message.sender_chat:
        return await msg.edit("⎉ عـذرًا هذه قنـاة؟!")
    if msg.reply_to_message.from_user.id == sudo_id:
        return await msg.edit("⎉ عـذرًا .. لا يمكنك رفع نفسك؟! ؟")
    r.srem(f"{sudo_id}bantyt", msg.reply_to_message.from_user.id)
    txx = f"⎉ العضو {get_name(msg.reply_to_message)} \n⎉ تم تنزيله من قائمـة بناتي بنجاح ✅"
    await msg.edit(txx)


@Client.on_message(filters.command("مسح بناتي$", prefixes=f".") & filters.me)
async def del_bantyaty(c, msg):
    r.delete(f"{sudo_id}bantyt")
    txx = f"⎉ تم مسح بناتي بنجاح"
    await msg.edit(txx)


@Client.on_message(filters.command("بناتي$", prefixes=f".") & filters.me)
async def bantyaty(c, msg):
    list1 = r.smembers(f"{sudo_id}bantyt")
    txx = await listaa(c, list1, "==== قائمـة بناتي =====")
    await msg.edit(txx)

@Client.on_message(filters.command("هنضحك", prefixes=f".") & filters.me)
async def hantk(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/61")

@Client.on_message(filters.command("مينفعش", prefixes=f".") & filters.me)
async def munfh(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/58")

@Client.on_message(filters.command("عاوزين نعملك بني ادم", prefixes=f".") & filters.me)
async def benia(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/59")

@Client.on_message(filters.command("ي حوستي السوده", prefixes=f".") & filters.me)
async def hbtyb(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/60")
     
@Client.on_message(filters.command("هنضحك حاضر", prefixes=f".") & filters.me)
async def hanthkh(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/61")

@Client.on_message(filters.command("انا تعبان ي حامد", prefixes=f".") & filters.me)
async def tabn(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/62")
     
@Client.on_message(filters.command("نعم انها المخدرات", prefixes=f".") & filters.me)
async def mkdrt(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/63")
     
@Client.on_message(filters.command("قول كلام غير ده", prefixes=f".") & filters.me)
async def klmq(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/64")
     
@Client.on_message(filters.command("ءنا عملت ءيه", prefixes=f".") & filters.me)
async def inaem(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/65")
     
@Client.on_message(filters.command("عيب يجدعان", prefixes=f".") & filters.me)
async def ygdan(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/66")
     
@Client.on_message(filters.command("هتتحرقو في نار جهنم", prefixes=f".") & filters.me)
async def nurga(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/67")
     
@Client.on_message(filters.command("يالي هتتحرقو", prefixes=f".") & filters.me)
async def hthrq(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/70")
     
@Client.on_message(filters.command("احترمي نفسك يوليه", prefixes=f".") & filters.me)
async def yoluh(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/71")
     
@Client.on_message(filters.command("في رمضان", prefixes=f".") & filters.me)
async def ramdan(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/72")
     
@Client.on_message(filters.command("مش عارف اقوم", prefixes=f".") & filters.me)
async def qomk(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/73")
     
@Client.on_message(filters.command("دمك خفيف اوي", prefixes=f".") & filters.me)
async def kfuf(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/76")
     
@Client.on_message(filters.command("لا تقتل المتعه ي مسلم", prefixes=f".") & filters.me)
async def moslam(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/78")
     
@Client.on_message(filters.command("يختاااي", prefixes=f".") & filters.me)
async def yktuy(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/83")
     
@Client.on_message(filters.command("بيكدب", prefixes=f".") & filters.me)
async def bukdb(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/84")
     
@Client.on_message(filters.command("احنا جامدين اوي", prefixes=f".") & filters.me)
async def kmden(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/86")
     
@Client.on_message(filters.command("اي الهبل دا", prefixes=f".") & filters.me)
async def alhbl(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/87")
     
@Client.on_message(filters.command("فاشل فاشل", prefixes=f".") & filters.me)
async def fashal(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/32")
     
@Client.on_message(filters.command("اجمد كدا متعيطش", prefixes=f".") & filters.me)
async def mtyts(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/33")
     
@Client.on_message(filters.command("يا لاهاوي", prefixes=f".") & filters.me)
async def lahay(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/35")
     
@Client.on_message(filters.command("دا اي الهم دا", prefixes=f".") & filters.me)
async def alhmdi(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/36")
     
@Client.on_message(filters.command("هعوره", prefixes=f".") & filters.me)
async def horahl(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/37")
     
@Client.on_message(filters.command("تاخد نفس عميق", prefixes=f".") & filters.me)
async def amuqo(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/39")
     
@Client.on_message(filters.command("ربنا نصرني", prefixes=f".") & filters.me)
async def nsrne(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/41")
     
@Client.on_message(filters.command("لو معايا خنجرين", prefixes=f".") & filters.me)
async def kngren(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/43")
     
@Client.on_message(filters.command("اماااال", prefixes=f".") & filters.me)
async def amall(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/48")
     
@Client.on_message(filters.command("خخ امال", prefixes=f".") & filters.me)
async def kkamal(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/50")
     
@Client.on_message(filters.command("اهلا بيكم", prefixes=f".") & filters.me)
async def ahlbukm(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/52")
     
@Client.on_message(filters.command("اخلاقك العاليه دي", prefixes=f".") & filters.me)
async def klqkal(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/53")
     
@Client.on_message(filters.command("علـى مهلك", prefixes=f".") & filters.me)
async def alamah(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/54")
     
@Client.on_message(filters.command("خبر اي ي مرا", prefixes=f".") & filters.me)
async def marad(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/55")
     
@Client.on_message(filters.command("انا بيه بن بيه", prefixes=f".") & filters.me)
async def buhbn(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/3")
     
@Client.on_message(filters.command("اتكلم بادب يولد", prefixes=f".") & filters.me)
async def yboy(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/4")
     
@Client.on_message(filters.command("انا رمضان جانا يعم", prefixes=f".") & filters.me)
async def gana(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/5")
     
@Client.on_message(filters.command("انت مش مظبوط ياض", prefixes=f".") & filters.me)
async def mzbot(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/11")
     
@Client.on_message(filters.command("ي حلو ي جميل", prefixes=f".") & filters.me)
async def gmual(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/18")
     
@Client.on_message(filters.command("خلصانه", prefixes=f".") & filters.me)
async def klsana(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/22")
     
@Client.on_message(filters.command("انا في دوامه", prefixes=f".") & filters.me)
async def doama(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/25")
     
@Client.on_message(filters.command("مش اسمحلك", prefixes=f".") & filters.me)
async def asmahlk(c, msg):    
     await msg.reply_voice("https://t.me/MemesVoices/31")