Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --修炼的脚本
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_江津村\\task_main.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76级武器生活技能任务脚本
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>C竔 Bang Gi竜 Ch? <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_GB)
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76级武器配方学习任务
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),5) ~= 1 then
		weapon_76_talk(5,nSkillDetail)
		return
	end

	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_008();
		return
	elseif (nTaskValue==1) then
		Say("C? ru th辴 h穣  c竎 huynh  trong bang d飊g trc! Ta l? bang ch?, ng lo cho ta!",0);
		return
	elseif (nTaskValue>=3) then
		fix_gb()
		return
	else
		main_new();
	end
end;

-- 师门任务相关
function about_faction_task()
	Say("Kh? kh?! Ngi t譵 L穙 Khi誹 H鉧 c? chuy謓 chi?",
		3,
		"Ta mu鑞 c鑞g hi課 cho s? m玭 (nhi謒 v? s? m玭)/start_faction_tasklink",
		"Ta mu鑞 tra xem  c鑞g hi課./check_query_faction_contri",
		"Ta mu鑞 t譵 hi觰  c鑞g hi課 s? m玭./shimenshuoming")
--		"我要修复师门任务无法完成的问题/repair_faction_bug")
end;

-- 修复杀怪任务无法完成的bug
function repair_faction_bug()
	Say("B鎛 bang c玭g vi謈 r蕋 nhi襲, ta qu猲 nhi謒 v? c馻 ngi r錳. Xem nh? l莕 n祔 ta th? ngi! B﹜ gi? ta gi髉 ngi h駓 nhi謒 v? trc, nh璶g ph秈 tr? ngi 5 甶觤 c鑞g hi課 s? m玭, ngi x竎 nh ch璦?", 
		2,
		"Л頲, ta ng ?/confirm_repair_bug",
		"в ta ngh? c竎h kh竎/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("Ta  h駓 gi髉 ngi r錳!", 0)
end;

function intergaibang()		--加入门派
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0)  or (GetTask(1033)>0) then --入门任务检测
		Say("B籲g h鱱  c? ? n m玭 ph竔 kh竎, C竔 Bang ta c騨g kh玭g ti謓 gi? ch﹏!",0)
	elseif GetLevel() < 10 then	--等级检测
		Say("Khi誹 H鉧 T? cu閏 s鑞g thanh b莕, s鑞g i lang b箃! B籲g h鱱 kh玭g t譵 頲 u! Chi b籲g <color=yellow>c蕄 10<color> h穣 n!",0)
	elseif GetPlayerFaction() == 4 then	
		Say("Ti觰 Khi誹 H鉧 T?! L筰 n gi髉 vui cho bang ch? ?? C遪 kh玭g mau 甶 t譵 Khi誹 H鉧 K? cho ta!?",0)
	elseif GetPlayerFaction() > 0 then	
		Say("Ch糿g ph秈 ngi  c? m玭 ph竔 r錳 sao?",0)
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 4 then
		Say("Kh玭g ph秈  t? C竔 Bang, kh玭g th? h鋍 頲 v? c玭g b鎛 ph竔!",0)
	elseif  GetPlayerRoute() == 10 then 
		Say("Bang ch髇g C竔 Bang ta chia l祄 2 ph竔 <color=yellow>T辬h Y<color> v? <color=yellow>? Y<color>. V? c玭g T辬h Y ph竔 do H? C玭 trng l穙 <color=yellow>M? T辬h Sinh<color> truy襫 th?. V? c玭g ? Y ph竔 do Tr? B竧 trng l穙 <color=yellow>T鑞g Nguy猲 An<color> truy襫 th?. H穣 suy ngh? c萵 th薾, ch鋘 h? ph竔 r錳 t譵 c竎 trng l穙 th豱h gi竜 v? c玭g!",0)
	elseif  GetPlayerRoute() == 11 then
		Say("е t? <color=yellow>T辬h Y<color> n猲 t譵 <color=yellow>M? trng l穙<color> h鋍 v? c玭g m韎 ng!",0)
	else 
		Say("е t? <color=yellow>? Y<color> n猲 t譵 <color=yellow>T鑞g trng l穙<color> h鋍 v? c玭g m韎 ng!",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 4 then
		Say("Ngi ch糿g ph秈  t? C竔 Bang, Khi誹 H鉧 T? ta ch糿g d竚 l祄 phi襫!",0)
	else
		taskmain("Long T筰 Thi猲", 4)
	end
end;				


function no()
    local nStep = GetTask(TASK_JJC);
    if nStep == 31 then
        task_31_00();
        return
    end;
end;


function StartTask001()
	local strMain = {
		"C? vi謈 g? kh玭g?",
		"Ta ph鬾g l謓h T鑞g Giang i ca ? Lng S琻 B筩 nh? Long Bang ch? ph竔 cao th? n ch? ng? quan binh!",
		"M竨 ch箉 ru閠 m襪, ta nh蕋 nh s? ra tay gi髉 s鴆. Nh璶g g莕 y, v鮝 l骳 C竔 Bang ta s緋 c? h祅h Hi猲 Vi猲 i h閕, c遪 nhi襲 vi謈 ph秈 l祄, e l祬.",
		"T筰 h? c? th? gi髉 頲 g? kh玭g?",
		"H穣 gi髉 ta t譵 10 b譶h T髖 M閚g T鰑  t? ch鴆 i h閕! C? h祅h xong ta s? gi髉 s鴆 cho T鑞g i ca!",
		"Л頲! Ta 甶 t譵 ngay y!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("S琻 tr筰 Long T筰 Thi猲");
	TaskTip("T譵 10 b譶h T髖 M閚g T鰑 cho C竔 Bang m? Hi猲 Vi猲 i h閕!")
end


function FinishTask001()
local strMain = {
	"Long bang ch?! H穣 nh薾 l蕐 10 b譶h T髖 M閚g T鰑!",
	"T鑤 l緈! B籲g h鱱 qu? nhi猲 tr鋘g ch? t輓, C竔 Bang ta c騨g kh玭g ph? l遪g. B籲g h鱱 c? tr? v? n鉯 v韎 T鑞g u l躰h, c? h祅h xong Hi猲 Vi猲 i h閕, C竔 Bang ta s? n ngay!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("S琻 tr筰 Long T筰 Thi猲")
	CTask:PayAward("S琻 tr筰 Long T筰 Thi猲")
end;

function practice()
    if GetPlayerFaction() ~= 4 then
       Talk(1,"","Kh玭g ph秈  t? b鎛 bang, kh玭g th? v祇 bang tu luy謓!");
    else
        if GetItemCount(2, 0, 208) >= 1 then  --师门令牌
            Say("V祇 tu luy謓 ph秈 kh玭g?",2,"ng/practice_start","Sai/no_practice");
        else
            Talk(1,"","Ngi ch璦 c? <color=yellow>C竔 Bang s? m玭 l謓h b礽<color>, kh玭g th? b? quan tu luy謓!");
        end;
    end;
end;

function no_practice()

end;

-- 丐帮师门重复任务的入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 4) then
		Say("Kh玭g ph秈  t? C竔 Bang, sao c? th? c鑞g hi課 cho ta!", 0);
	elseif (GetPlayerRoute() == 10) then 
		Say("Chi b籲g h穣 n c竎 trng l穙 c馻 b鎛 bang b竔 s? h鋍 ngh?, r錳 h穣 nh薾 nhi謒 v?!", 0);
	elseif (GetPlayerRoute() == 11) then
		task_main_entrance(TASK_ID_GAIBANG_JINGYI);			-- 净衣
	else 
		task_main_entrance(TASK_ID_GAIBANG_WUYI);			-- 污衣
	end
end;

function shimenshuoming()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s? m玭<color>: \n <color=yellow>ч c鑞g hi課 s? m玭<color>: Th玭g qua vi謈 ho祅 th祅h nhi謒 v? S? M玭 t n m閠 ng c蕄 nh蕋 nh, b筺 c? th? nh薾 頲 trang ph鬰 ho芻 v? kh? c馻 S? M玭. \n <color=yellow>Gi韎 h筺  c鑞g hi課 s? m玭<color>: Hi謓 nay  c鑞g hi課 S? M玭 kh玭g b? h筺 ch?, ch? c莕 ho祅 th祅h nhi謒 v? th? c? th? n﹏g cao  c鑞g hi課. \n <color=yellow>S? ki謓 V? L﹎<color>: L祄 xong nhi謒 v? c? nh s? nh薾 th猰 m閠 nhi謒 v? ng蓇 nhi猲, ho祅 th祅h s? nh薾 頲 50 甶觤 c鑞g hi課 S? m玭 v? c? kh? n╪g nh薾 頲 m藅 t辌h s? m玭.", 
			1,
			"Trang k?/shuoming2")		
end;

function shuoming2()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s? m玭<color>: \n <color=yellow>Gi韎 h筺 ng c蕄  c鑞g hi課 S? M玭<color>: Ъng c蕄 kh竎 nhau th? 甶觤 t輈h l騳  c鑞g hi課 c騨g kh玭g gi鑞g nhau. ч c鑞g hi課 S? M玭 c祅g cao c祅g n﹏g cao ng c蕄 c馻 m譶h, t? sau c蕄 75 th? kh玭g c遪 gi韎 h筺  c鑞g hi課 n鱝. \n <color=yellow>觤 kinh nghi謒 ng蓇 nhi猲<color>. L祄 nhi襲 nhi謒 v? s? m玭  c鑞g hi課 c祅g cao 甶觤 kinh nghi謒 c祅g nhi襲. 觤 c鑞g hi課 <3000 <color=yellow>觤 kinh nghi謒 tng i<color>, >3000 <color=yellow>甶觤 kinh nghi謒 c祅g nhi襲<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- 没有加入门派
		Say("Mu鑞 l祄 nhi謒 v? s? m玭 trc ti猲 ph秈 gia nh藀 b鎛 gi竜. Sau  h穣 gia nh藀 trng ph竔, r錳 quay l筰 ch? ta nh薾 nhi謒 v?. Sau khi ho祅 th祅h nhi謒 v? s? m玭 s? nh薾 頲  c鑞g hi課 s? m玭, t輈h l騳  c鑞g hi課 nh蕋 nh c? th? mua v藅 ph萴 b? truy襫 b鎛 m玭.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 4) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 gi竜, h穣 v? m玭 ph竔 c馻 ngi m? tra xem  c鑞g hi課 s? m玭 nh?. Giao di謓 F3 c騨g c? th? tra xem  c鑞g hi課 s? m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Long T筰 Thi猲<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"Ngu錸 g鑓 C竔 Bang/know_qiyuan",
				"V? c玭g C竔 Bang/know_wugong",
				"襲 ki謓 nh藀 m玭/know_rumentiaojian",
				"Ta mu鑞 gia nh藀 C竔 Bang/intergaibang",
				"Ta mu鑞 l祄 nhi謒 v? S? M玭/about_faction_task",
				"Li猲 quan tu luy謓./practice",
				"Ta s緋 th祅h th﹏ n猲 ph秈 xu蕋 s?/#faction_graduate(4)",
				"Tham ki課 Bang ch?/no",
				}
	if (GetPlayerRoute() == 11) or (GetPlayerRoute() == 12) then
		tinsert(selTab, 1, "Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "е t? xin k輓h d﹏g s? ph? tr? hoa c骳 v? b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 4)");
	end
	Say(g_szInfoHead.."M閠 n琲 l魀 x魀 nh? th? n祔, mong lng th? cho!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Th阨 i n祇 c騨g y d穣 ╪ m祔, nh鱪g ngi b? n筺, thu? m? l筰 cao, n筺 n閕 chi課 li猲 mi猲, th? l鵦 C竔 Bang c騨g t?  m? r閚g, h? m閠 l遪g m閠 d? ch鑞g ngo筰 x﹎, ph竧 huy bang ph竔.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("C竔 Bang ph﹏ th祅h 2 h? ? Y v? T辬h Y. T辬h Y chuy猲 luy謓 v? ngo筰 c玭g, chuy猲 v? C竔 Bang Chng Ph竝, chi猽 th鴆 ch? tr鋘g v? t蕁 c玭g, d飊g quy襫 nh ra n ch? m筺g, c? th? h鋍 頲 v? c玭g tr蕁 ph竔 {Gi竛g Long Th藀 B竧 Chng}. ? Y ch? tr鋘g th﹏ ph竝 nhanh nh裯, chuy猲 v? C竔 Bang C玭 Ph竝, quy襫 b鎛g nhanh nh裯 甶猽 luy謓, d飊g  c萿 b鎛g t蕁 c玭g k? th?, c? th? h鋍 v? c玭g tr蕁 ph竔 {Ф C萿 C玭 Tr薾}."),g_szInfoHead..sf_ConvertColorString("S? ph? T辬h Y l? B鎛g trng l穙 {M? T辬h Sinh}, S? ph? ? Y l? Chng B竧 trng l穙 {T鑞g Nguy猲 An}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh玭g ph﹏ bi謙 nam n?, xu蕋 th﹏, ch? c莕 kh玭g l祄 甶襲 竎, kh玭g gia nh藀 bang ph竔 kh竎, kh玭g ph秈 l? ph秐  c馻 b鎛 ph竔.  m祔 th? c莕 quy t綾 g? ch?? Ch? c莕 tu﹏ theo qui nh c馻 b鎛 m玭, v? i ngh躠 d﹏ t閏, b秓 v? x? t綾.");
end;