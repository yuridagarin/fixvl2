--任务
--地点：汴京府  任务：天门阵任务结点6
--策划：樊万松  2004.03.
--append by lizhi
--2005-8-8 11:26

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_汴京\\task_main.lua");
Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\practice\\practice_main.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName  = "<color=green>Dng M玭 Gi竜 Ch?<color=green> : "
function main()
	local nTaskValue = FN_GetTaskState(FN_YM);
	local nTaskValuem = FN_GetTaskState(FN_YMM);
	  
	if (GetSex() == 1) then
		if ((nTaskValue > 0) and (nTaskValue < 7)) then
			Say("Ngi n t譵 <color=yellow>Dng T玭 B秓<color> nh?!",0);
			return
		end;
		if (nTaskValue == 7) then 
			task_115();
			return
		end;
		if (nTaskValue>=9) then
			fix_ym();
			return
	    end;
	end;
		
	if (GetSex() == 2) then
		if ((nTaskValuem > 0) and (nTaskValuem < 7)) then
			Say("Ngi n t譵 <color=yellow>M閏 Qu? Anh<color> nh?!",0);
			return		
		end;
		if (nTaskValuem == 7) then 
			task_015();
			return
		end;
	    if (nTaskValuem>=9) then
			fix_ym();
			return
		end;
	end; 
	main_new();
end;

-- 师门任务相关
function about_faction_task()
	Say("C? chuy謓 g? v藋?",
		3,
		"Ta mu鑞 c鑞g hi課 cho s? m玭 (nhi謒 v? s? m玭)/start_faction_tasklink",
		"Ta mu鑞 tra xem  c鑞g hi課./check_query_faction_contri",
		"Ta mu鑞 t譵 hi觰  c鑞g hi課 s? m玭./shimenshuoming")
--		"我要修复师门任务无法完成的问题/repair_faction_bug")
end;

-- 修复杀怪任务无法完成的bug
function repair_faction_bug()
	Say("G莕 y c玭g vi謈 r蕋 nhi襲, ta qu猲 nhi謒 v? c馻 ngi r錳. Xem nh? l莕 n祔 ta th? ngi! B﹜ gi? ta gi髉 ngi h駓 nhi謒 v? trc, nh璶g ph秈 tr? ngi 5 甶觤 c鑞g hi課 s? m玭, ngi x竎 nh ch璦?", 
		2,
		"Л頲, ta ng ?/confirm_repair_bug",
		"в ta ngh? c竎h kh竎/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("Ta  h駓 gi髉 ngi r錳!", 0)
end;

--天门阵任务与汴京任务接口
function sayhi()
  local nBjStep = GetTask(TASK_BJ_ID);    --汴京任务
  local UWorld1401 = GetTask(1401);
    
    if nBjStep >= 1 and nBjStep<=6 and UWorld1401 ~= 0 then
        local szSay = {
            "<sex> t譵 ta c? vi謈 g? kh玭g?",
            "Nhi謒 v? Bi謓 Kinh/bj_question",
            "Nhi謒 v? Thi猲 M玭 tr薾/tmz_question"
        }
        SelectSay(szSay);
        return
    end;
    
    if nBjStep >= 1 and nBjStep<=6 then
        bj_question();
        return
    end;
    
    if UWorld1401 ~= 0 then
        tmz_question();
        return
    end;
    --Talk(1,"","<color=green>佘太君<color>：契丹夜郎自大，岂容他踏入我大宋疆土！");     
end;



function bj_question()
    local nBjStep = 0;
    nBjStep = GetTask(TASK_BJ_ID);  --汴京系列任务的任务变量
    
    if (nBjStep == 1) then
        task_001_00();
        return
    elseif (nBjStep == 2) then
        task_002_00();
        return
    elseif (nBjStep == 3) then
        task_003_00();
        return
    elseif (nBjStep == 4) then
        task_004_01();
        return
    elseif (nBjStep == 5) then
        task_005_00();
        return
    elseif (nBjStep == 6) then
        task_006_00();
        return
    else
    	Talk(1,"","Gi芻 Khi誸 n t? cao t? i nh璶g kh玭g d? x﹎ ph筸 cng th? Чi T鑞g ta!")
    end;
end;

function tmz_question() --天门阵任务
    local UWorld1401 = GetTask(1401);
    if ( UWorld1401 == 40 )  then
    	Talk(6,"","T筰 h? v蕁 an Xa L穙 Th竔 Qu﹏!","Kh?! Kh?!  t?! Xin h醝 anh h飊g c? g? ch? gi竜!","T? nh? t筰 h? v鑞 s飊g k輓h Dng tng qu﹏, nay mu鑞 b竜 danh gia nh藀 Dng Gia qu﹏ gi誸 gi芻 Khi誸 n. N祇 ng? b? bi謙 ph竔 n Lng S琻 B筩, xin L穙 Th竔 Qu﹏ ph竔 t筰 h? n Nh筺 M玭 quan ti襫 tuy課!","H?! Chuy謓 n祔 d? th玦! Chuy謓 c馻 Dng Gia qu﹏, l穙 y c? th? t? quy誸! C? n鉯 l? ta ph竔 ngi 甶 s? d? d祅g u qu﹏!","Ti謓 th? ngi chuy觧 l阨 cho phu qu﹏ <color=red>Dng Nghi謕<color> c馻 ta ? <color=red>Nh筺 M玭 quan<color> r籲g: Ti觰 nh﹏ l閚g quy襫, h? t蕋 ph秈 ph? t礽."," t? L穙 Th竔 Qu﹏ chi誹 c?! Ti觰 nh﹏ nh蕋 nh chuy觧 l阨!")
        SetTask(1401,45)
        ----AddItem(0,0,0)
        Earn(1000)
        GivePlayerExp(SkeyTianmenzhen,"setaijun")
        ModifyReputation(12,0)
        --AddNote("去雁门关找杨业，为佘太君带话，并且打听山河社稷图的情报。")
        TaskTip("дn Nh筺 M玭 quan t譵 Dng Nghi謕 chuy觧 l阨 c馻 Xa Th竔 Qu﹏, ng th阨 h醝 th╩ tin t鴆 v? B秐  S琻 H? X? T綾!")
    	
    elseif ( UWorld1401  == 45  ) then
    		Talk(1,"","Gi髉 ta chuy觧 l阨 cho phu qu﹏ <color=red>Dng Nghi謕<color> ? <color=red>Nh筺 M玭 quan<color>!")	
    elseif ( UWorld1401  > 45  ) then
    	Talk(1,""," t? b籲g h鱱!")
    else
    	Talk(1,"","Gi芻 Khi誸 n t? cao t? i nh璶g kh玭g d? x﹎ ph筸 cng th? Чi T鑞g ta!")
    end
end;	
	
	
	
	
	
--end;

function intertangmen()		--加入门派
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0)  or (GetTask(1033)>0) then
		Say("Ngi s芻 m飅 giang h?! Dng m玭 ta kh玭g ti謓 thu nh薾!",0)
	elseif GetLevel() < 10 then	  --等级检测
		Say("Mu鑞 gia nh藀 qu﹏ Dng gia ph秈 c? th鵦 l鵦 nh蕋 nh. Ch璦 n <color=yellow>c蕄 10<color> sao c? th? g鉷 s鴆 cho Qu鑓 gia! C蕄 10 h穣 n t譵 ta!",0)
	elseif GetPlayerFaction() == 6 then	--门派检测
		Say("Ngi 阯g 阯g l?  t? Dng m玭, c遪 mu鑞 gia nh藀 g? n鱝?",0)
	elseif GetPlayerFaction() > 0 then	--门派检测
		Say("Ngi  gia nh藀 c竎 i m玭 ph竔, Dng m玭 kh玭g th? thu nh薾 Nh﹏ s? giang h?!",0)
	else
	  if GetSex()==2 then
		task_001();
		end;
		if GetSex()==1 then
		task_101();
		return
	  end
   end
end

function skilllearn()
	if GetPlayerFaction() ~= 6 then		--不是杨门弟子
		Say("Kh玭g ph秈  t? Dng M玭, chuy謓 c馻 Dng gia xin ch? xen v祇!",0)
	elseif  GetPlayerRoute() == 16 then 	--是杨门弟子但是还没有去拜师
		Say("Dng gia qu﹏ ta cung m? tinh th玭g. Dng gia Thng thi猲 h? bi誸 danh. H鋍 <color=yellow>Thng ph竝<color>, c? th? t譵 <color=yellow>Dng T玭 B秓<color>; H鋍 <color=yellow>Cung thu藅<color>, c? th? t譵 <color=yellow>M閏 Qu? Anh<color>.",0)
	elseif  GetPlayerRoute() == 17 then
		Say("Ngi theo <color=yellow>Dng M玭 thng k?<color>, h鋍 v? c玭g ph秈 t譵 Thng ph竝 gi竜 u <color=yellow>Dng T玭 B秓<color>.",0)
	elseif  GetPlayerRoute() == 18 then
		Say("Ngi theo<color=yellow>Dng M玭 cung k?<color>, h鋍 v? c玭g ph秈 t譵 Cung thu藅 gi竜 u <color=yellow>M閏 Qu? Anh<color>.",0)	
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 6 then
		Say("Kh玭g ph秈  t? Dng M玭, chuy謓 c馻 Dng gia xin ch? xen v祇!",0)
	else
		taskmain("Xa Th竔 Qu﹏", 5)
	end
end;				


function no()
--	Say("<color=green>佘太君<color>：fuck u！")
end;

function practice()
    if GetPlayerFaction() ~= 6 then
       Talk(1,"","Kh玭g ph秈  t? Dng M玭, chuy謓 c馻 Dng gia xin ch? xen v祇!");
    else
        if GetItemCount(2, 0, 350) >= 1 then  --师门令牌
            Say("C? mu鑞 v祇 hu蕁 luy謓 kh玭g?",2,"ng/practice_start","Sai/no");
        else
            Talk(1,"","Ngi kh玭g c? <color=yellow>l謓h b礽 c馻 Dng M玭<color>, kh玭g th? v祇 hu蕁 luy謓.");
        end;
    end;
end;

-- 杨门师门重复任务的入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 6) then						--不是杨门弟子
		Say("Kh玭g ph秈  t? Dng M玭, chuy謓 c馻 Dng gia kh玭g d竚 phi襫 b籲g h鱱!", 0)
	elseif (GetPlayerRoute() == 16) then 					--是杨门弟子但是还没有去拜师
		Say("H穣 n b竔 s? T玭 B秓 ho芻 Qu? Anh, r錳 h穣 n g苝 ta nh薾 nhi謒 v?!", 0)
	elseif (GetPlayerRoute() == 17) then
		task_main_entrance(TASK_ID_YANGMEN_QIANGQI);		-- 枪骑
	elseif (GetPlayerRoute() == 18) then
		task_main_entrance(TASK_ID_YANGMEN_GONGQI);			-- 弓骑
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
	
	if (GetPlayerFaction() ~= 6) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 gi竜, h穣 v? m玭 ph竔 c馻 ngi m? tra xem  c鑞g hi課 s? m玭 nh?. Giao di謓 F3 c騨g c? th? tra xem  c鑞g hi課 s? m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Xa Th竔 Qu﹏<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"Thi猲 Ba Dng ph?/know_qiyuan",
				"V? c玭g Thi猲 Ba Dng ph?/know_wugong",
				"襲 ki謓 nh藀 m玭/know_rumentiaojian",
				"Ta mu鑞 gia nh藀 Thi猲 Ba Dng ph?/intertangmen",
				"Ta mu鑞 l祄 nhi謒 v? S? M玭/about_faction_task",
				"Li猲 quan tu luy謓./practice",
				"Ta s緋 th祅h th﹏ n猲 ph秈 xu蕋 s?/#faction_graduate(6)",
				"Th╩ h醝 Th竔 Qu﹏/sayhi",
				}
	if (GetPlayerRoute() == 17) or  (GetPlayerRoute() == 18) then
		tinsert(selTab, 1, "Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 091130 then
		tinsert(selTab, 1, "е t? xin k輓h d﹏g s? ph? tr? hoa c骳 v? b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 6)");
	end
	Say(g_szInfoHead.."Thi猲 Ba Dng ph?, trung ngh躠 ki猲 cng, h誸 l遪g v? Чi T鑞g.",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."T鑞g Th竔 T玭g th竔 b譶h h璶g th辬h 4 n╩, T鑞g di謙 B綾 H竛, l謓h c玭g qui T鑞g, 頲 phong l祄 i tng qu﹏, tr蕁 gi? 秈 Ung M玭. Л頲 5 n╩ h璶g th辬h, th? nh? Li猽 ph竔 10 v筺 i qu﹏ nh Ung M玭, l骳  binh m? di tay l謓h c玭g ch? c? m蕐 ngh譶, s? d鬾g k? s竎h t藀 k輈h, nh tan 10 v筺 qu﹏ Li猽, Ung M玭 i th緉g, l謓h c玭g uy danh l蓎 l鮪g, nh? Li猽 n l骳 n祔 m韎 khi誴 s? trc Dng Gia Tr薾 K?. Thi猲 Ba Dng ph? vang danh thi猲 h? t? .");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Thao trng luy謓 v? c馻 Dng gia ph﹏ th祅h Thng K? v? Cung K?, t蕁 c玭g tr猲 ng鵤 (ng鵤 c? th? mua ? ch? Dng B礽 Phong). Thng K? ch? tr鋘g v祇 s鴆 m筺h t祅 ph?, Dng Gia Ph竝 c? th? t蕁 c玭g g莕 v? xa, chi猽 th鴆 d騨g m穘h l鵦 s竧 thng m筺h, chuy猲 v? t蕁 c玭g k? th? ? di謓 t輈h l韓, nhanh nh裯 nh? gi?, c? th? h鋍 v? c玭g tr蕁 ph竔 {Li猲 Ho祅 To祅 Long Thng}. Cung k? ch? tr鋘g t鑓  th﹏ ph竝, t蕁 c玭g li猲 t鬰 v祇 k? th?, c遪 c? th? to祅 l鵦 nh ra n ch? m筺g, s? trng t蕁 c玭g xa, c? th? h鋍 v? c玭g tr蕁 ph竔 {B? Vng Tng Ph鬾g Ti詎}."),g_szInfoHead..sf_ConvertColorString("S? ph? Thng K? l? Thng K? gi竜 u {Dng T玭 B秓}, s? ph? Cung K? l? Cung K? gi竜 u {M閏 Qu? Anh}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh玭g ph﹏ bi謙 nam n?, ph萴 h筺h 畂an ch輓h, ch璦 gia nh藀 bang m玭 kh竎, kh玭g ph秈 l? ph秐  c馻 phe ta u c? th? gia nh藀. Qu﹏ ta v? l頸 輈h qu鑓 gia, tri襲 nh, ngi gia nh藀 ph秈 ghi nh? 甶襲 n祔.");
end;