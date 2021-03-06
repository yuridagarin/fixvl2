-- =========================================
-- File : 中原一区，汴京，制皮学习.lua
-- Name : 张猎户
-- ID   : 0, 2
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 配方学习任务变量
LEVELTASKID49			= 518		-- 花笼百鸟裙
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

	
 ------------------------------------------提示玩家76级武器配方任务-------------------------
 	local nGene, nSKIllId = GetMainLifeSkill()
 	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nSKIllId <= 8 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId)
		return
	end
	
---------------------------------------------主对话-------------------------------------------
	Say(strTitle.."Ngh? n祔 c莕 giao ti誴 v韎 mu玭 th?, s鑞g gi? tuy l韓 nh璶g ph莕 thng b竜 p c騨g kh玭g nh?. Mu鑞 h鋍 thu閏 da kh玭g?",
		7,
		"H鋍 k? n╪g thu閏 da/luaLearnLifeSkill",
		"Mu鑞 h鋍k? n╪g cao c蕄 h琻/update_max_skill_level",
		"дn Kh玭g Tang s琻 (s? c蕄)/GotoWorld_Confirm1",
		"дn C玭 Ng? s琻 (trung c蕄)/GotoWorld_Confirm2",
		"дn T? Tang s琻 (cao c蕄)/GotoWorld_Confirm3",
		--"遗忘制皮技能/forget_life_skill",
		"T譵 hi觰 thu閏 da/Info",
		"R阨 kh醝/Main_Exit")
end;



-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 2) > 0) then
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
		Say(strTitle.."Ngi ch璦 h鋍 k? n╪g thu閏 da, ta kh玭g th? gi髉 ngi!", 0)
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
	
	if (GetLifeSkillLevel(0, 2) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 2)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("B筺  b? k? n╪g thu閏 da")				
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

	-- 判断是否已经学会了采集技能 - 制皮
	if (GetLifeSkillLevel(0, 2) > 0) then
        Say (strTitle.."Ngi h鋍 頲 k? n╪g thu閏 da!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B筺  h鋍 2 K? n╪g thu th藀, kh玭g th? h鋍 th猰 n鱝!",0)
		return
	end

	Say(strTitle.."B籲g h鱱 mu鑞 h鋍 k? n╪g <color=yellow>thu閏 da<color> ch??",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh? l筰/LearnNo")
end;
--学习技能
function LearnYes()
	if (GetLifeSkillLevel(0, 2) > 0) then
		Say (strTitle.."B筺 h鋍 頲 k? n╪g thu閏 da!", 0)
	else
		if (LearnLifeSkill(0, 2, 1, 79, 0)) then
			AddItem(0, 200, 12, 1, 1)
        	Msg2Player("B筺 h鋍 頲 k? n╪g thu閏 da, nh薾 頲 Ch? B? 產o.")
    	end
	end
end
--取消学习技能
function LearnNo()
    Say (strTitle.."H穣 suy ngh? k? r錳 quay l筰 y nh?!",0)
end



-- 去相应挂机地点
function GotoWorld_Confirm1()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Kh玭g Tang S琻<color> thu閏 da kh玭g? N琲  c? nhi襲 nhi襲 <color=yellow>S鉯<color>, <color=yellow>H?<color>, <color=yellow>R緉<color> v? <color=yellow>C竜<color>, ngi n猲 s? d鬾g <color=yellow>Th莕 N玭g Кn<color> m韎 c? th? thu閏 da.",
		2,
		"Ta mu鑞 甶/#GotoWorld(712,1472,2918)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>C玭 Ng? S琻<color> thu閏 da kh玭g? N琲  c? nhi襲 nhi襲 <color=yellow>B筩h h?<color>, <color=yellow>G蕌<color> v? <color=yellow>Loan 觰<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(717,1736,2906)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ngi mu鑞 甶 <color=yellow>T? Tang s琻<color> thu閏 da ph秈 kh玭g? ?  c? r蕋 nhi襲 <color=yellow>s? t?<color>, <color=yellow>Chu Tc<color> v? <color=yellow>Linh Ngao<color> xu蕋 hi謓, nh? k? ngi ph秈 s? d鬾g <color=yellow>Th莕 N玭g n<color> m韎 c? th? thu閏 da.",
		2,
		"Ta mu鑞 甶/#GotoWorld(722,1748,3420)",
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
	Say(strTitle.."<color=yellow>Thu閏 da<color> l? m閠 trong <color=yellow>6<color> k? n╪g thu th藀. H鋍 頲 k? n╪g n祔 m韎 c? 頲 nguy猲 li謚 <color=yellow>ch? y<color>. Ngi c? th? n <color=yellow>ti謒 t筽 h鉧<color> mua c玭g c? thu閏 da <color=yellow>s? c蕄<color> sau  ra ngo礽 nh th?. Mu鑞 v祇 c竎 khu v鵦 quy nh c莕 n <color=yellow>Ng? c竎<color> mua <color=yellow>Th莕 N玭g Кn<color>.", 0)
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
	local nSkillId = 2;
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
