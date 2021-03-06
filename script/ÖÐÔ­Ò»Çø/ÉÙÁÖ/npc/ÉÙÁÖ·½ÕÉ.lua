--在玄慈处加入少林，接师门任务
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- 门派任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_江津村\\task_main.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --修炼的脚本
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76级武器生活技能任务脚本
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Thi誹 L﹎ Gi竜 Ch? <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_SL);
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76级武器配方学习任务
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),1) ~= 1 then
		weapon_76_talk(1,nSkillDetail)
		return
	end
	
	if (nTaskValue==0) then
		main_new();
		return
	elseif (nTaskValue < 7) then
		Say("C? th? nh? th? n祇, th? ch? g苝 Huy襫 Minh  h醝", 0);
		return
	elseif (nTaskValue == 7) then
		task_014();
		return
	elseif (nTaskValue >= 9) then
		fix_sl();
		return
	else
		main_new();
	end
end;

-- 师门任务相关
function about_faction_task()
	Say("A Di У Ph藅!",
		3,
		"Ta mu鑞 c鑞g hi課 cho s? m玭 (nhi謒 v? s? m玭)/start_faction_tasklink",
		"Ta mu鑞 tra xem  c鑞g hi課./check_query_faction_contri",
		"Ta mu鑞 t譵 hi觰  c鑞g hi課 s? m玭./shimenshuoming")
--		"我要修复师门任务无法完成的问题/repair_faction_bug")
end;

-- 修复杀怪任务无法完成的bug
function repair_faction_bug()
	Say("C玭g vi謈 b薾 r閚, ta qu猲 nhi謒 v? c馻 ngi r錳. Xem nh? l莕 n祔 ta th? ngi! B﹜ gi? ta gi髉 ngi h駓 nhi謒 v? trc, nh璶g ph秈 tr? ngi 5 甶觤 c鑞g hi課 s? m玭, ngi x竎 nh ch璦??", 
		2,
		"Л頲, ta ng ?/confirm_repair_bug",
		"в ta ngh? c竎h kh竎/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("Ta  h駓 gi髉 ngi r錳!", 0)
end;

function intershaolin()		--加入门派
	if ((GetTask(1002) > 0) or 
		(GetTask(1003) > 0) or 
		(GetTask(1004) > 0) or 
		(GetTask(1005) > 0) or 
		(GetTask(1031) > 0) or 
		(GetTask(1032) > 0) or 
		(GetTask(1033) > 0)) then --入门任务检测
		Say("Th? ch?  c? ? gia nh藀 m玭 ph竔 kh竎, b莕 t╪g y kh玭g ti詎.", 0);
	elseif GetSex() == 2 then	--性别检测
		Say("Trong t? to祅 nam nh﹏, kh玭g thu nh薾 <color=yellow>n? gi韎<color>, m阨 th? ch? 甶 n琲 kh竎!", 0);
	elseif GetLevel() < 10 then	--等级检测
		Say("Ъng c蕄 th? ch? kh玭g , t <color=yellow>c蕄 10<color> n t譵 ta!", 0);
	elseif GetPlayerFaction() == 1 then	--门派检测
		Say("Ngi  l?  t? Thi誹 L﹎, n y g﹜ r鑙 l祄 g??", 0);
	elseif GetPlayerFaction() > 1 then	--门派检测
		Say("Th? ch?  c? m玭 ph竔 ng tr猽 gh裲 l穙 n筽!", 0);
	else
		task_001();
		return
	end
end;

function gettask()
	if GetPlayerFaction() ~= 1 then
		Say("Th? ch? kh玭g ph秈  t? b鎛 ph竔, kh玭g d竚 l祄 phi襫!", 0);
	else
		taskmain("Huy襫 T?", 1)
	end
end;


function no()
    local nStep = GetTask(TASK_JJC);
    if nStep == 20 then
        task_20_00();
        return
    elseif nStep == 21 then
        task_21_00();
        return
    elseif nStep == 30 then
        task_30_00();
        return
    end;
    
	Say("A Di У Ph藅!");
end;

function practice()
    if GetPlayerFaction() ~= 1 then
       Talk(1, "", "Th? ch? kh玭g ph秈  t? c馻 Thi誹 L﹎, kh玭g th? n y tu luy謓.");
    else
        if GetItemCount(2, 0, 205) >= 1 then  --师门令牌
            Say("C? ph秈 v祇 y tu luy謓?",
            	2,
            	"ng/practice_start",
            	"Sai/no_practice");
        else
            Talk(1, "", "Ngi kh玭g c? <color=yellow>l謓h b礽 s? m玭 Thi誹 L﹎<color>, kh玭g th? v祇 tu luy謓.");
        end;
    end;
end;

function no_practice()
	Say("A Di У Ph藅!");
end;

-- 少林师门重复任务的入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 1) then
		Say("Ch? c?  t? Thi誹 L﹎ m韎 c? th? c鑞g hi課 cho b鎛 ph竔.", 0);
	elseif (GetPlayerRoute() == 1) then 
		Say("Ngi n猲 n c竎 m玭 ph竔 kh竎 b竔 s? h鋍 v?, c鑞g hi課 s鴆 l鵦 c馻 m譶h.!", 0);
	elseif (GetPlayerRoute() == 2) then
		task_main_entrance(TASK_ID_SHAOLIN_SUJIA);			-- 俗家
	elseif (GetPlayerRoute() == 3) then
		task_main_entrance(TASK_ID_SHAOLIN_CHANSENG);		-- 禅僧
	else
		task_main_entrance(TASK_ID_SHAOLIN_WUSENG);			-- 武僧
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
	
	if (GetPlayerFaction() ~= 1) then
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 gi竜, h穣 v? m玭 ph竔 c馻 ngi m? tra xem  c鑞g hi課 s? m玭 nh?. Giao di謓 F3 c騨g c? th? tra xem  c鑞g hi課 s? m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Huy襫 T?<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"Thi誹 L﹎ ph竔/know_qiyuan",
				"V? c玭g Thi誹 L﹎ ph竔/know_wugong",
				"襲 ki謓 nh藀 m玭/know_rumentiaojian",
				"Ta mu鑞 gia nh藀 Thi誹 L﹎/intershaolin",
				"Ta mu鑞 l祄 nhi謒 v? S? M玭/about_faction_task",
				"Li猲 quan tu luy謓./practice",
				"Ta s緋 th祅h th﹏ n猲 ph秈 xu蕋 s?/#faction_graduate(1)",
				"V蕁 an Phng Trng/no",
				}
	if (GetPlayerRoute() == 2) or (GetPlayerRoute() == 3) or (GetPlayerRoute() == 4) then
		tinsert(selTab, 1, "Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");		
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "е t? xin k輓h d﹏g s? ph? tr? hoa c骳 v? b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 1)");
	end
	Say(g_szInfoHead.."A di  ph藅! Thi誹 L﹎ t? x璦 nay y猲 t辬h, ch? g﹜ 錸 祇, l祄 phi襫 n thi謓 nh﹏.",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Ng魕 Hi誹 V╪ д th竔 h遖 19 n╩, Thi猲 Tr骳 T╪g Nh﹏ B箃 У t? T﹜ T筺g n trung nguy猲, 頲 Hi誹 V╪ д qu? tr鋘g. B箃 У nh譶 th蕐 Tung S琻 nh? m閠 a hoa sen, b蘮 l藀 t? ? , m? ra Thi誹 L﹎. 30 n╩ sau, Nam Thi猲 Tr骳 T╪g Nh﹏ Чt Ma n Thi誹 L﹎, truy襫 d箉 Thi襫 c玭g, v? ngh?, Thi誹 L﹎ ng祔 m閠 h璶g th辬h. u th阨 Л阯g, T莕 Vng L? Th? D﹏ v? Vng Th? Sung chi課 tranh ? L筩 Dng, ba th竛g r遪g ch璦 d鴗,  m阨 30 Thi誹 L﹎ v? t╪g xu蕋 tr薾, li襫 gi祅h th緉g l頸, Thi誹 L﹎ vang danh thi猲 h? t? .");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Thi誹 L﹎ c? 72 tuy謙 k?, 3 阯g v? h鋍. V? t╪g {N閕 c玭g}, luy謓 Thi誹 L﹎ Quy襫 Cc V? Ngh?, s? trng v? chi猽 th鴆 li猲 ho祅, g﹜ s竧 thng cho i th? ? di謓 r閚g, c? th? h鋍 v? c玭g tr蕁 ph竔 {Nh? Lai Th莕 Chng}. T鬰 gia {G﹏ c鑤}, luy謓 Thi誹 L﹎ o C玭 V? Ngh?, m筺h v? ph遪g ng?, c? n╪g l鵦 ph遪g ng? cao ? c? ly g莕, c? th? h鋍 v? c玭g tr蕁 ph竔 {D辌h c﹏ kinh}. Thi襫 t玭g {n閕 c玭g}, luy謓 Thi誹 L﹎ N閕 Gia V? Ngh?, d飊g thi襫 trng t蕁 c玭g xa, c? th? h鋍 v? c玭g tr蕁 ph竔 {T葃 t駓 kinh}."),g_szInfoHead..sf_ConvertColorString("S? ph? v? t╪g l? Чt Ma Л阯g Th? T鋋 {Huy襫 Kh? Чi S瓆, s? ph? t鬰 gia l? Ban Nhc Л阯g Th? T鋋 {Huy襫 Bi Чi S瓆; s? ph? thi襫 t╪g l? T祅g Kinh C竎 Th? T鋋 {Huy襫 H玦 Чi S瓆."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Thi誹 L﹎ t? khi khai t玭g n nay, ch? thu nam  t?, ch璦 gia nh藀 m玭 ph竔 kh竎, kh玭g ph秈 ph秐  Thi誹 L﹎ u c? th? nh藀 m玭. Thi誹 L﹎ c? 5 i khi誸: S竧 sinh, v鋘g ng?, d﹎ t?, th﹗ o, hu﹏ t鰑,  t? Thi誹 L﹎ ph秈 tu﹏ th? tuy謙 i. 30 ti觰 khi誸, kh玭g 頲 xem nh?.");
end;
