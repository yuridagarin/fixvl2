-- =========================================
-- File : XXX区，XX，集灵技能.lua
-- Name : 集灵学习
-- ID   : 0, 7
-- =========================================

Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

-- == 预定义的一些任务变量ID =======================
ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
FORGETOHTER_NUM			= 1941		-- 遗忘副技能次数
LEV_LEARNRECIPE			= 1926		-- 配方学习任务变量
LIFESKILL_STATE			= 1623		-- 学习集灵技能标记

-- == 全局使用的名字 =======================
strName = ""
strTitle = ""


-- == 默认入口函数 =========================
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
	
	    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c? th? n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k? n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c? th? n Th祅h Й t譵 Du Phng i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu鑞 h鋍 T藀 Linh ?? Hi謓 gi? ta ch璦 th? d箉 頲.", 0)
    	return
    end;
	
	Say(strTitle.."Ta ph竧 hi謓 ra n誹 d飊g huy誸 d辌h v? kho竛g th筩h c? th? tinh ch? th祅h Linh Huy誸 v? Linh Sa. Th? n祇, ngi c? mu鑞 th? kh玭g?",
		6,
		"H鋍 K? n╪g T藀 Linh/learn_magic_skill",
		" H璶g An l躰h (s? c蕄)/goto_world_1",
		" H閕 Ti猲 l躰h (trung c蕄)/goto_world_2",
		" Thng Long l躰h (cao c蕄)/goto_world_3",
		--"遗忘集灵技能/forget_life_skill",
		"Ta mu鑞 t譵 hi觰 nh鱪g g? li猲 quan n T藀 Linh/magic_info",
       	"R阨 kh醝/exit_dialog")
end;
	
-- == 什么都不做的退出对话 ===================
function exit_dialog()
end;


-- == 我想了解集灵的相关信息 ===================
function magic_info()
	Say(strTitle.."T藀 Linh l? k? n╪g l祄 ra nguy猲 li謚. Ch? y誹 d飊g huy誸 d辌h v? kho竛g th筩h  tinh ch? Linh Huy誸 v? Linh Sa. Ngi c? th? n <color=yellow>ti謒 t筽 h鉧<color> mua c玭g c? T藀 Linh <color=yellow>s? c蕄<color> sau  ra ngo礽 tinh luy謓. N誹 mu鑞 n s琻 L躰h nh? n <color=yellow>Ng? c竎<color> mua <color=yellow>Th莕 N玭g Кn<color> mang theo.", 0)
end;


-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 7) > 0) then
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
			"Khoan ! Ch? ta suy ngh? l筰!/exit_dialog")
	else
		Say(strTitle.."K? n╪g T藀 Linh ngi v蒼 ch璦 h鋍, ta kh玭g th? gi髉 頲 ngi.", 0)
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
	
	if (GetLifeSkillLevel(0, 7) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 7)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				Msg2Player("K? n╪g T藀 Linh ngi  qu猲 r錳")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh?!", 0)
		end
	end
end;

-- -------------------------------学习生活技能-------------------------------
function learn_magic_skill()
    if (GetLevel() < 10) then
        Say (strTitle.."H鮩? Th﹏ th? c馻 ngi c遪 k衜 l緈. H穣 ra ngo礽 th祅h tu luy謓 n c蕄 10 h穣 n t譵 ta!", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 收耕
	if (GetLifeSkillLevel(0, 7) > 0) then
        Say (strTitle.."Ngi  h鋍 頲 k? n╪g T藀 Linh!", 0)
		return
	end

	if GetLifeSkillsNum(0) >= 2 then
        Say (strTitle.."B筺  h鋍 2 K? n╪g thu th藀, kh玭g th? h鋍 th猰 n鱝!",0)
		return
	end

    Say(strTitle.."<color=yellow>K? n╪g T藀 Linh<color> s? gi髉 ngi c? th猰 nguy猲 li謚, c? mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/learn_yes",
    	"в ta suy ngh? l筰/exit_dialog")
end;
--学习集灵技能
function learn_yes()
	if (GetLifeSkillLevel(0, 7) > 0) then
		Say (strTitle.."B筺  h鋍 頲 k? n╪g T藀 Linh!", 0)
	else
		if (LearnLifeSkill(0, 7, 1, 79, 0)) then
        	Msg2Player("B筺  h鋍 頲 k? n╪g thu th藀: T藀 Linh.")
    	end
	end
end;


-- 确认去相应挂机地点
function goto_world_1()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>H璶g An L躰h<color> thu th藀 kh玭g? N琲  c? nhi襲 <color=yellow>Chu Sa<color>, <color=yellow>H綾 Khuy觧 Linh Huy誸<color>, <color=yellow>Ph? th筩h c竎 i m玭 ph竔<color>, <color=yellow>чn Gi竝 Th?<color> v? <color=yellow>Ph? th筩h c竎 i th祅h th?<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>.",
		2,
		"Ta mu鑞 甶/#goto_world(710,1707,3385)",
		"Kh玭g 甶 u/exit_dialog")
end;
function goto_world_2()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>H閕 Ti猲 L躰h<color> thu th藀 kh玭g? N琲  c? nhi襲 <color=yellow>B輈h Huy誸 Sa<color>, <color=yellow>Thanh ? Linh Huy誸<color>, <color=yellow>Ph? th筩h c竎 i m玭 ph竔<color> v? <color=yellow>чn Gi竝 Th?<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>.",
		2,
		"Ta mu鑞 甶/#goto_world(715,1496,2998)",
		"Kh玭g 甶 u/exit_dialog")
end;
function goto_world_3()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Thng Long L躰h<color> thu th藀 kh玭g? N琲  c? nhi襲 <color=yellow>Huy襫 H筩 Linh Huy誸<color> v? <color=yellow>Ph? th筩h c竎 i m玭 ph竔<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!  ",
		2,
		"Ta mu鑞 甶/#goto_world(720,1705,3350)",
		"Kh玭g 甶 u/exit_dialog")
end;
-- 去相应的挂机地点
function goto_world(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;

-- 根据玩家制符等级给予其相应的集灵技能等级
function Learn_life_skill()
	Say(strTitle.."Ngi l?  t? c馻V﹏ Du o nh﹏ ?? в ta xem t礽 ngh? ch? ph? c馻 ngi th? n祇 trc khi truy襫 k? n╪g T藀 Linh. Nh璶g nh? l? ta ch? truy襫 m閠 l莕 th玦 y.",
		2,
		"Xin ki觤 tra k? n╪g T藀 Linh c馻 t筰 h?./Panduan_life_skill",
		"Kh玭g c莕 u/exit_dialog")
end;


function Panduan_life_skill()

local nLifeLevel = GetLifeSkillLevel(1,8);

	if GetTask(LIFESKILL_STATE) == 1 then
		Say(strTitle.."Ngi mau qu猲 qu?! Ta  d箉 cho ngi 1 l莕 r錳, kh玭g ph秈 d箉 l筰 l莕 n鱝 ch??", 0)
		return
	end

	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 1) then
			LearnLifeSkill(0, 7, nLifeLevel, 79, 0)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T藀 Linh")
    	SetTask(LIFESKILL_STATE,1);
    else
       Say(strTitle.."Ngi kh玭g ph秈 l? ch? ph? s? ta kh玭g c遪 c竎h n祇 kh竎.", 0)
    end
   end
end