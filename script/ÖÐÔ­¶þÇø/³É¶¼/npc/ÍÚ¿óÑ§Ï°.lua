-- =========================================
-- File : 中原二区，成都，挖矿学习.lua
-- Name : 代矿工
-- ID   : 0, 5
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 配方学习任务变量
LEVELTASKID49			= 517		-- 吞龙宝刀任务
TASK49_BEGGING			= 1933		-- 49级晋级任务开始标示
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘主技能次数
strName = "";
strTitle = "";


--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	
	-----------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c? th? n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k? n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c? th? n Th祅h Й t譵 Du Phng i phu.")
        return 
    end
    
    
	----------------------------------76级武器配方任务----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU)
	
	--制药系黑钨精石配方任务
	if (nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79) then
		--交予黑色粉末
		if (nTaskState_heiwu == 2) then
			medicine_heiwu_005()
			return
		--未去找莫大
		elseif (nTaskState_heiwu == 3) then
			medicine_heiwu_006()
			return
		--未将玄石交予游方医生
		elseif (nTaskState_heiwu == 4) then
			medicine_heiwu_007()
			return
		end
	end
	
	--制符系赤钨灵符任务
	if (nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79) then
		--交予驱魔灵符
		if (nTaskState_chiwu == 1 and 
			GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) ~= 1) then
			juju_chiwu_005()
			return
		--未将黑钨石交予云游道人
		elseif (nTaskState_chiwu == 2 or 
				GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) == 1 and 
				nTaskState_chiwu ~= 3) then
			juju_chiwu_006()
			return
		end
	end
		
	--提示玩家76级武器配方任务
	if (nSkillGenre == 1 and nSkillDetail <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then
		weapon_76_recipe_tip(nSkillDetail)
		return
	end	
	
---------------------------------------------主对话-------------------------------------------
	Say(strTitle.."B筺 tr?! Th蕐 ngi th﹏ th? tr竛g ki謓, ti襫 phng 產ng c莕 nhi襲 binh kh?, hay l? h穣 theo ta c飊g h頿 s鴆 b竜 qu鑓!",
		7,
		"H鋍 k? n╪g o kho竛g/luaLearnLifeSkill",
		"Mu鑞 h鋍k? n╪g cao c蕄 h琻/update_max_skill_level",
		"дn Th筩h M玭 ng (s? c蕄)/GotoWorld_Confirm1",
		"дn Linh Nham ng (trung c蕄)/GotoWorld_Confirm2",
		"дn Huy襫 Tinh ng (cao c蕄)/GotoWorld_Confirm3",
		--"遗忘挖矿技能/forget_life_skill",
		"Ta mu鑞 t譵 hi觰 th玭g tin li猲 quan o kho竛g/Info",
    	"R阨 kh醝/Main_Exit")
end;



-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 5) > 0) then
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
		Say(strTitle.."Ngi  h鋍 k? n╪g o kho竛g? Ta kh玭g th? gi髉 ngi.", 0)
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
	
	if (GetLifeSkillLevel(0, 5) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 5)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("K? n╪g o kho竛g c馻 b筺  h駓")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh?!", 0)
		end
	end
end;




--**********************************************技能学习部分***************************************
-- 学习生活技能
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H鮩? Th﹏ th? c馻 ngi c遪 k衜 l緈. H穣 ra ngo礽 th祅h tu luy謓 n c蕄 10 h穣 n t譵 ta!", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 挖矿
	if (GetLifeSkillLevel(0, 5) > 0) then
        Say (strTitle.."B筺 tr?! Ngi  h鋍 頲 k? n╪g o kho竛.", 0)
		return
	end
	
	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B筺  h鋍 2 K? n╪g thu th藀, kh玭g th? h鋍 th猰 n鱝!",0)
		return
	end

    Say(strTitle.."<color=yellow>Уo kho竛g<color> s? l? k? n╪g thu th藀 m韎 c馻 ngi, ngi x竎 nh薾 mu鑞 h鋍?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh? l筰/LearnNo")
end;
--学习技能
function LearnYes()
	if (GetLifeSkillLevel(0, 5) > 0) then
		Say (strTitle.."B筺  h鋍 k? n╪g o kho竛g!", 0)
	else
		if (LearnLifeSkill(0, 5, 1, 79, 0)) then
			AddItem(0, 200, 11, 1, 1)
        	Msg2Player("B筺  h鋍 頲 k? n╪g thu th藀: Уo kho竛g. Nh薾 頲 Cu鑓 chim.")
    	end
	end
end;
--取消学习技能
function LearnNo()
    Say (strTitle.."Ngh? k? r錳 h穣 n!", 0)
end



-- 确认去相应挂机地点
function GotoWorld_Confirm1()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Th筩h M玭 чng<color> o kho竛g ?? N琲  c? <color=yellow>Tinh Thi誸<color>, <color=yellow>B竎h luy謓 cng<color>, <color=yellow>? kim<color> v? <color=yellow>H祅 thi誸<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(711,1728,3383)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Linh Nham ng<color> o kho竛g ?? N琲  c? <color=yellow>Th竔 b筩h tinh kim<color>, <color=yellow>Huy襫 thi誸<color> v? <color=yellow>Thi猲 Thanh<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(716,1694,3032)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Huy襫 Tinh ng<color> o kho竛g ?? N琲  c? <color=yellow>H綾 ? th筩h<color>, <color=yellow>X輈h thi誸<color> v? <color=yellow>V﹏ m蓇<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(721,1688,3333)",
		"Kh玭g 甶 u/Main_Exit")
end;
-- 去相应的挂机地点
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;


-- 介绍相关信息
function Info()
	Say(strTitle.."<color=yellow>Уo kho竛g<color> l? m閠 trong <color=yellow>6<color> k? n╪g thu th藀, h鋍 頲 k? n╪g n祔 m韎 c? 頲 nguy猲 li謚 <color=yellow>ch? t筼 v? kh?<color>. Ngi c? th? n <color=yellow>ti謒 t筽 h鉧<color> mua c玭g c? o kho竛g <color=yellow>s? c蕄<color>, sau  ra ngo礽 o kho竛g. N誹 mu鑞 v祇 khu v鵦 khai kho竛g nh? n <color=yellow>Ng? c竎<color> mua <color=yellow>Th莕 N玭g Кn<color> mang theo.", 0)
end;
-- 什么也不做的空函数
function Main_Exit()
end;

function update_max_skill_level()
	Say(strTitle..format("M? r閚g c蕄 k? n╪g s秐 xu蕋 c莕 k? n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng ?/update_max_skill_level_ensure", "T筰 h? ch? xem qua th玦/Main_Exit")
end

function update_max_skill_level_ensure()
	local nGen = 0;
	local nSkillId = 5;
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

