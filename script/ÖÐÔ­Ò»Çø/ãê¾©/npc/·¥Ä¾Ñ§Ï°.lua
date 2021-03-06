-- =========================================
-- File : 中原一区，汴京，伐木学习.lua
-- Name : 刘一斧
-- ID   : 0, 1
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL 	= 1925			-- 新手任务变量
TASK49_BEGGING    	= 1933			-- 49级晋级任务开始标示
FORGETMAIN_NUM    	= 1940			-- 遗忘主技能次数
FORGETOHTER_NUM		= 1941			-- 遗忘副技能次数

strName = "";
strTitle = "";

--*****************************************MAIN函数*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
	if random(1,30) == 1 then
		NpcChat(GetTargetNpc(),"Mu鑞 l祄 v? kh? t鑤 c? linh kh?, ph秈 d飊g nguy猲 li謚 t鑤!");
	end;
	strName = GetTargetNpcName();
	if (strName=="" or strName==nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: ";
	
	-------------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c? th? n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k? n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c? th? n Th祅h Й t譵 Du Phng i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 3) then
        Talk(1, "QUSTION",strTitle.."Ng璾 T? T? ph竔 ngi t韎 ph秈 kh玭g? T鑤 qu?! Mau gi髉 ta gi秈 p th綾 m綾 n祔!")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu鑞 h鋍 n c﹜ ph秈 kh玭g? Hi謓 ch璦 ph秈 l骳, ta kh玭g th? d箉 ngi.", 0)
    	return
    end;
    
	----------------------------------76级武器配方任务----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail);
	local nTaskState_tieshan = GetTask(TASK_COOKING_TIESHAN);
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU);
		
	--烹饪系铁扇精木任务
	if nSkillGenre == 1 and nSkillDetail == 7 and nSkillLevel >= 79 then
		--尚未与刘一斧对话
		if nTaskState_tieshan == 2 then
			cooking_tieshan_005()
			return
		--交予不寻常的木屑和醉生梦死
		elseif nTaskState_tieshan == 3 then
			cooking_tieshan_006()
			return
		--未到御厨处回复消息
		elseif nTaskState_tieshan == 4 then
			cooking_tieshan_007()
			return
		end
	end
		
	--制符系赤钨灵符任务
	if nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79 then
		--交予驱魔灵符
		if nTaskState_chiwu == 1 and GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) ~= 1 then
			juju_chiwu_003()
			return
		--未将菩提木交予云游道人
		elseif nTaskState_chiwu == 2 or GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) == 1 and nTaskState_chiwu ~= 3 then
			juju_chiwu_004()
			return
		end
	end
		
	--提示玩家76级武器配方任务
	if (nSkillGenre == 1 and nSkillDetail <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
		return
	end

  ---------------------------------------------主对话-------------------------------------------
	Say(strTitle.."Chi課 s? di詎 ra li猲 mi猲 nguy猲 li謚 g? cung 鴑g kh玭g k辮 y 頲 xem l? c? h閕 t鑤 cho ch髇g ta l祄 gi祏, th輈h kh玭g?",
		7,
		"H鋍 k? n╪g n c﹜/luaLearnLifeSkill",
		"Mu鑞 h鋍k? n╪g cao c蕄 h琻/update_max_skill_level",
		" H璶g An l躰h (s? c蕄)/GotoWorld_Confirm1",
		" H閕 Ti猲 l躰h (trung c蕄)/GotoWorld_Confirm2",
		" Thng Long l躰h (cao c蕄)/GotoWorld_Confirm3",
		--"遗忘伐木技能/forget_life_skill",
		"T譵 hi觰 n c﹜/Info",
		"R阨 kh醝/Main_Exit")
end;


-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 1) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l? l莕 th? "..(nForgetTimes + 1)..", ngi h駓 k? n╪g thu th藀, ta ph秈 thu"..nShouldPay.." lng, ngi suy ngh? k? ch璦?",
			2,
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch? ta suy ngh? l筰!/SayHello")
	else
		Say(strTitle.."Ngi ch璦 h鋍 k? n╪g n c﹜? Ta kh玭g th? gi髉 ngi.", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(0, 1) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 1)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(517, 0)
				Msg2Player("K? n╪g n c﹜ c馻 b筺  b?")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh?!", 0)
		end
	end
end;


-- 学习生活技能============================================================================
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H鮩? Th﹏ th? c馻 ngi c遪 k衜 l緈. H穣 ra ngo礽 th祅h tu luy謓 n c蕄 10 h穣 n t譵 ta!", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 伐木
	if (GetLifeSkillLevel(0, 1) > 0) then
        Say (strTitle.."B筺  h鋍 k? n╪g n c﹜!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B筺  h鋍 2 K? n╪g thu th藀, kh玭g th? h鋍 th猰 n鱝!",0)
		return
	end

    Say(strTitle.."Ngi mu鑞 h鋍 k? n╪g <color=yellow>n c﹜<color> ch??",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh? l筰/LearnNo")
end

--学习技能
function LearnYes()
	if (GetLifeSkillLevel(0, 1) > 0) then
		Say (strTitle.."B筺  h鋍 k? n╪g n c﹜!", 0)
	else
		if (LearnLifeSkill(0, 1, 1, 79, 0)) then
			AddItem(0, 200, 14, 1, 1)
        	Msg2Player("B筺  h鋍 k? n╪g n c﹜, nh薾 頲 Thi誸 ph?.")
    	end
	end
end
--取消学习技能
function LearnNo()
    Say (strTitle.."Ngh? k? r錳 h穣 n!", 0)
end


-- 确认去相应挂机地点=========================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."Ngi mu鑞 n<color=yellow>H璶g An L躰h<color> n c﹜ kh玭g? N琲  c? nhi襲 nhi襲 <color=yellow>T飊g m閏<color>, <color=yellow>Dng m閏<color>, <color=yellow>Sam m閏<color> v? <color=yellow>Thi誸 m閏<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(710,1707,3385)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>H閕 Ti猲 L躰h<color> n c﹜ kh玭g? N琲  c? nhi襲 <color=yellow>Ng? уng<color>, <color=yellow>Tr飊g M閏<color> v? <color=yellow>Chng m閏<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(715,1496,2998)",
		"Kh玭g 甶 u/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Thng Long L躰h<color> n c﹜ kh玭g? N琲  c? nhi襲 <color=yellow>Thi誸 Tuy課 m閏<color>, <color=yellow>Ba La m閏<color> v? <color=yellow>Уn m閏<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!  ",
		2,
		"Ta mu鑞 甶/#GotoWorld(720,1705,3350)",
		"Kh玭g 甶 u/Main_Exit");
end;
-- 去相应的挂机地点
function GotoWorld(MapID, x, y)
		CleanInteractive();
		LeaveTeam();
		SetFightState(0);
		
		NewWorld(MapID,x,y);
end;

-- 介绍相关信息
function Info()
	Say(strTitle.."<color=yellow>цn c﹜<color> l? m閠 trong <color=yellow>6<color> k? n╪g thu th藀. H鋍 頲 k? n╪g n祔 m韎 nh薾 頲 nguy猲 li謚 <color=yellow>ch? t筼 v? kh?<color>. Ngi c? th? n <color=yellow>ti謒 t筽 h鉧<color> mua c玭g c? n c﹜ <color=yellow>s? c蕄<color> sau  ra ngo礽 r鮪g n c﹜. N誹 甶 v祇 nh鱪g khu v鵦 quy nh c莕 n <color=yellow>Ng? c竎<color> mua <color=yellow>Th莕 N玭g Кn<color>.", 0);
end;

-- 什么也不做的空函数
function Main_Exit()
end;

--******************************************新手任务部分*****************************************
function QUSTION()
		Say(strTitle.."C﹗ h醝 1: S? d鬾g k? n╪g thu th藀 b籲g c竎h n祇?",4,
		"1. M? giao di謓 s? d鬾g k? n╪g./QUS_ERROR",
		"2. T筰 甶觤 thu th藀 m? giao di謓 k? n╪g/QUS_ERROR",
		"3. C? c玭g c? tng 鴑g, t筰 甶觤 thu th藀 m? giao di謓 k? n╪g ho芻 d飊g ph輒 t総 thu th藀 b猲 di/QUS2_GOTO",
		"4. Xem nh? ta ch璦 n qua!/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."C﹗ h醝 2: K? n╪g n祇 sau y 頲 xem thu th藀?",4,
		"1. H竔 thu鑓, Thu閏 da, Ch? t筼 binh kh? d礽, N蕌 nng, Luy謓 b颽, цn c﹜, Canh t竎/QUS_ERROR",
		"2. цn c﹜, Уo kho竛g, Canh t竎, Thu閏 da, H竔 thu鑓, K衞 t?/QUS3_GOTO",
		"3. Ch? t筼 binh kh? d礽, luy謓 b颽, ch? t筼 K? m玭 binh kh?, ch? t筼 binh kh? ng緉, n蕌 nng, ch? dc, ch? t筼 H? gi竝/QUS_ERROR",
		"4. Ch? t筼 K? m玭 binh kh?, ch? t筼 binh kh? ng緉, n蕌 nng, ch? dc, Thu閏 da, H竔 thu鑓, K衞 t?/QUS_ERROR")
end
function QUS3_GOTO()
		Say(strTitle.."C﹗ h醝 3: Mu鑞 c? nguy猲 li謚 l祄 u b誴 th? n猲 l祄 g??",4,
		"1. Thu閏 da/QUS_ERROR",
		"2. Canh t竎/QUS4_GOTO",
		"3. H竔 thu鑓/QUS_ERROR",
		"4. цn c﹜/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."C﹗ h醝 4: n c﹜ c莕 甧m theo g??",4,
		"1. H錳 th祅h ph?/QUS_ERROR",
		"2. H錳 huy誸 n/QUS_ERROR",
		"3. T竛 g蓇/QUS_ERROR",
		"4. Thi誸 ph?/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."C﹗ h醝 5: Ta mu鑞 n m閠 輙 g?, th? n鉯 xem ta n trong bao l﹗?",4,
		"1. 6 gi?/QUS_ERROR",
		"2. 8 gi?/QUS_ERROR",
		"3. 10 gi?/QUS_ERROR",
		"4. C? th? thu th藀 th阨 gian l﹗ h琻/QUS_PASS")
end

function QUS_PASS()
		Say(strTitle.."Gi醝 qu?! Х hi觰 c? b秐 v? k? n╪g s鑞g r錳 ! Gi? c? th? t譵 c竎 s? ph? h鋍 k? n╪g kh竎.",0)
		SetTask(ID_LEARNLIFESKILL,15)
		TaskTip("B筺 c? th? n g苝 c竎 NPC h鋍 k? n╪g s鑞g")
end

function QUS_ERROR()
		Say(strTitle.."Ngi ch璦 hi觰 l緈 th? ph秈! V? t譵 <color=yellow>V﹏ Du o nh﹏<color> th? xem!",0)
end

function update_max_skill_level()
	Say(strTitle..format("M? r閚g c蕄 k? n╪g s秐 xu蕋 c莕 k? n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng ?/update_max_skill_level_ensure", "T筰 h? ch? xem qua th玦/Main_Exit")
end

function update_max_skill_level_ensure()
	local nGen = 0;
	local nSkillId = 1;
	local nMaxLevel = GetLifeSkillMaxLevel(nGen, nSkillId);
	if nMaxLevel > 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k? n╪g thu th藀  t gi韎 h筺 c蕄 %d", nMaxLevel))
		return 0;
	end
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k? n╪g thu th藀 ch璦 t c蕄 %d, kh玭g th? m? r閚g c蕄 gi韎 h筺 k? n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k? n╪g thu th藀  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end