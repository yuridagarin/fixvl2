-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 磁沙罗盘 Script
-- By StarryNight
-- 2007/12/19 PM 04:18

-- 幸福，其实就是那些不经意间被遗忘的片段。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")

function OnUse()

local nFinishNum = 0;
	if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq() then
		nFinishNum = GetTask(Mission_login_times_TaskID)
	end
local nPlayNum = 10-nFinishNum;
local strTalk = {
".{Th玭g tin v藅 ph萴}: {La b祅} d飊g  d? 阯g trong sa m筩, ti誧 r籲g khi n t薾 c飊g sa m筩 s? m蕋 甶 t? t輓h. V藅 d飊g  v祇 {T薾 c飊g sa m筩}.\n.{мa 甶觤 s? d鬾g}: B筩h Thi猲 Th祅h ? T薾 c飊g sa m筩, t? i 3-5 ngi l璾 ph竔 kh竎 nhau, a la b祅 cho h緉 l? c? th? v祇.\n.{襲 ki謓 s? d鬾g}: Th祅h vi猲 trong i ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩\n.{H筺 ch? s? d鬾g}: Tu莕 n祔 b筺  kh竚 ph? T﹜ v鵦{"..nFinishNum.."} l莕, c遪 c? th? kh竚 ph? {"..nPlayNum.."} l莕.",
	}
	
	TalkEx("",strTalk);
	
end