-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC唐葫芦Script
-- By StarryNight
-- 2007/08/07 PM 4:07

-- 好多糖葫芦啊。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--一般情况下的对话
	strTalk = {
		{"K裲 H? L? do ta l祄 chua chua ng鋞 ng鋞, c? th? coi la ngon nh蕋 Чi T鑞g."},
		{"X﹗ K裲 H? L? l? ph秈 ch鋘 頲 qu? s琻 tra k輈h thc b籲g nhau, ghim tr猲 kh骳 g? tr玭g nh? c﹜ con."},
		{"Kh竎h quan th? qua b╪g tr蕁 Л阯g H? L? ch璦? N誹 c? th? h鋍 頲 c竎h l祄 l筺h c馻 T﹜ T筺g th? k裲 h? l?  s? tr? th祅h m鉵 ngon c馻 nh﹏ gian."},
		}
	local i = random(1,getn(strTalk));
	
	local  tSay = aah_GetSayDialog(95);
	if tSay and getn(tSay) ~= 0 then
		tinsert(tSay, "T筰 h? ch? xem qua th玦/do_nothing");
		Say(strTalk[i][1], getn(tSay), tSay);
		return 0;
	end
	
	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- 西北区20分支1_11兵不厌诈----------------------------------
	
	--与唐葫芦对话买糖葫芦
	if nStep_XBTask_01 == 54 then
		task_020_04_0();
		return
	end
	
	--未取得10个冰糖葫芦 补发触发器
	if nStep_XBTask_01 == 55 then
		task_020_04_1();
		return
	end

	TalkEx("",strTalk[i]);
	return
	
end;

function do_nothing()
end
