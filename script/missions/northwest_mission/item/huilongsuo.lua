-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北剧情关卡门票 回龙索 Script
-- By StarryNight
-- 2::7/12/19 PM :4:18

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
".{Th玭g tin v藅 ph萴}: {H錳 Long S竎h} v鑞 l? c玭g c? c馻 k? cp m?, d飊g  m? c? quan b猲 trong. L? v藅  v祇 {Ho祅g L╪g m藅 o}.\n.{мa 甶觤 s? d鬾g}: N琲 Th? m? nh﹏ 產ng canh gi? l╪g m?, t? i 3-5 l璾 ph竔 kh竎 nhau, d飊g H錳 Long S竎h m? m藅 o.\n.{襲 ki謓 s? d鬾g}: Th祅h vi猲 trong i u ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩.\n.{H筺 ch? s? d鬾g}: Tu莕 n祔 b筺  th? qua kh竚 ph? T﹜ v鵦{"..nFinishNum.."} l莕, c遪 c? th? kh竚 ph? {"..nPlayNum.."} l莕.",
	}
	
	TalkEx("",strTalk);
	
end