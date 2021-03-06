-- =========================================
-- File : 中原二区，成都，收耕学习.lua
-- Name : 李丰收
-- ID   : 0, 3
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
TASK49_BEGGING			= 1933		-- 晋级任务开始
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘主技能次数
strName = "";
strTitle = "";

--*****************************************MAIN函数*******************************************
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
	
	-------------------------------------------新手任务-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 1) then
        Say(strTitle.."дn <color=yellow>C蕄 10<color> c? th? n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k? n╪g s鑞g<color>!", 0)
        TaskTip("дn c蕄 10 c? th? n Th祅h Й t譵 Du Phng i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 1) then
        Talk(1, "QUSTION",strTitle.."Ngi  n r錳, kh秓 nghi謒 th玦")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu鑞 h鋍 k? n╪g canh t竎 ?? Ch璦 n l骳 d箉 cho ngi u!", 0)
    	return
    end
    
	----------------------------提示玩家76级武器配方任务--------------------------
	local nGene, nSkillID = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nGene, nSkillID)
	if (nGene == 1 and nSkillID <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillID)
		return
	end
	
	---------------------------------------------主对话------------------------------------------
	Say(strTitle.."G莕 y ho祅g thng ban th竛h ch?, mu鑞 gia t╪g ph竧 tri觧 canh t竎! Sao? Ngi c? mu鑞 tham gia i qu﹏ canh n玭g?",
		6,
		"H鋍 k? n╪g canh t竎/luaLearnLifeSkill",
		"дn Thanh Th駓 th玭 (s? c蕄)/GotoWorld_Confirm1",
		"дn Doanh D﹏ th玭 (trung c蕄)/GotoWorld_Confirm2",
		"дn Lam Nh筩 th玭 (cao c蕄)/GotoWorld_Confirm3",
		--"遗忘收耕技能/forget_life_skill",
		"Ta mu鑞 t譵 hi觰 th玭g tin canh t竎/Info",
       	"R阨 kh醝/Main_Exit"
		);

end;


-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 3) > 0) then
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
		Say(strTitle.."Ngi kh玭g h鋍 k? n╪g canh t竎 sao? Ta kh玭g th? gi髉 g? cho ngi!", 0)
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
	
	if (GetLifeSkillLevel(0, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(516, 0)
				Msg2Player("K? n╪g canh t竎 c馻 ngi  b? h駓 b?.")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh?!", 0)
		end
	end
end;


-- -------------------------------学习生活技能-------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H鮩? Th﹏ th? c馻 ngi c遪 k衜 l緈. H穣 ra ngo礽 th祅h tu luy謓 n c蕄 10 h穣 n t譵 ta!", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 收耕
	if (GetLifeSkillLevel(0, 3) > 0) then
        Say (strTitle.."B筺 tr?! Ngi  h鋍 頲 t蕋 c? k? n╪g canh t竎!", 0)
		return
	end

    Say(strTitle.."<color=yellow>Canh t竎<color> s? l? k? n╪g thu th藀 m韎 c馻 b筺. B筺 c? mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh? l筰/LearnNo")
end;
--学习技能
function LearnYes(MaxLvl,nMain)
	if (GetLifeSkillLevel(0, 3) > 0) then
		Say (strTitle.."B筺  h鋍 t蕋 c? k? n╪g Canh t竎!", 0)
	else
		if (LearnLifeSkill(0, 3, 1, 79, 0)) then
			AddItem(0, 200, 13, 1, 1)
        	Msg2Player("B筺  h鋍 頲 k? n╪g thu th藀: Canh t竎. Nh薾 頲 Cu鑓")
    	end
	end
end;
--取消学习技能
function LearnNo()
    Say (strTitle.."Ngh? k? r錳 h穣 n!",0)
end



-- 确认去相应挂机地点
function GotoWorld_Confirm1()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Thanh Th駓 Th玭<color> canh t竎 ?? N琲  c?  <color=yellow>Quang Th玭g Ma<color>, <color=yellow>M閏 nh?<color>, <color=yellow>Khuynh ly u<color>, <color=yellow>Th筩h khu萵<color>, <color=yellow>Nhi評 minh u<color>, <color=yellow>M╪g tr骳<color>, <color=yellow>Dung tr筩h c鑓<color> v? <color=yellow>H? ti猽<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(713,1477,2948)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Doanh D﹏ Th玭<color> canh t竎 ?? N琲  c? nhi襲 <color=yellow>M輆<color>, <color=yellow>Di猲 Tinh M筩h<color> v? <color=yellow>Thu莕 h遖 m筩h<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(718,1708,3405)",
		"Kh玭g 甶 u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ngi mu鑞 n <color=yellow>Lam Nh筩 Th玭<color> canh t竎 ?? N琲  c? nhi襲 <color=yellow>Du long t骳<color>, <color=yellow>Ph鬾g Quan T骳<color> v? <color=yellow>Dao Chi T骳<color>. Nh? mang theo <color=yellow>Th莕 N玭g Кn<color>!",
		2,
		"Ta mu鑞 甶/#GotoWorld(723,1700,3448)",
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
	Say(strTitle.."<color=yellow>Canh t竎<color>l? m閠 trong <color=yellow>6<color> k? n╪g thu th藀, h鋍 頲 k? n╪g n祔 m韎 c? 頲 nguy猲 li謚 <color=yellow>N蕌 nng<color>. Ngi c? th? n <color=yellow>ti謒 t筽 h鉧<color> mua c玭g c? canh t竎 <color=yellow>s? c蕄<color> sau  ra ngo礽 canh t竎. N誹 mu鑞 n c竎 th玭 quy nh nh? n <color=yellow>Ng? c竎<color> mua <color=yellow>Th莕 N玭g Кn<color> mang theo.", 0)
end;
-- 什么也不做的空函数
function Main_Exit()
end;


--******************************************新手任务部分*****************************************
--新手任务问题函数
function QUSTION()
		Say(strTitle.."C﹗ h醝 th? 1: Kh秓 nghi謒 n緈 b総 v? thuy誸 minh s? d鬾g k? n╪g s秐 xu蕋?",4,
		"1. M? giao di謓 s? d鬾g k? n╪g./QUS_ERROR",
		"2. H鋍 xong c竎h ph鑙 ch? m韎 m? giao di謓 s? d鬾g k? n╪g./QUS_ERROR",
		"3. H鋍 頲 c竎h gh衟, t藀 h頿  v藅 li謚 c莕 thi誸, sau  m? giao di謓 s? d鬾g k? n╪g./QUS2_GOTO",
		"4. Ngi 產ng xem thng tr? tu? c馻 ta ??/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."C﹗ h醝 th? 2: Lo筰 n祇 di y l? k? n╪g s秐 xu蕋?",4,
		"1. H竔 thu鑓, Thu閏 da, Ch? t筼 binh kh? d礽, N蕌 nng, Luy謓 b颽, цn c﹜, Canh t竎/QUS_ERROR",
		"2. цn c﹜, Уo kho竛g, Canh t竎, Thu閏 da, H竔 thu鑓, K衞 t?/QUS_ERROR",
		"3. Ch? t筼 binh kh? d礽, luy謓 b颽, ch? t筼 K? m玭 binh kh?, ch? t筼 binh kh? ng緉, n蕌 nng, ch? dc, ch? t筼 H? gi竝/QUS3_GOTO",
		"4. Ch? t筼 K? m玭 binh kh?, ch? t筼 binh kh? ng緉, n蕌 nng, ch? dc, Thu閏 da, H竔 thu鑓, K衞 t?/QUS_ERROR")
end

function QUS3_GOTO()
		Say(strTitle.."C﹗ h醝 th? 3: S? trng c馻 L璾 Nh蕋 Ph? b籲g h鱱 ta l? n c﹜, v藋 v藅 li謚 h緉 l蕐 頲 d飊g l祄 g??",4,
		"1. Ch? t筼 binh kh? d礽 v? H? gi竝/QUS_ERROR",
		"2. N蕌 nng v? Ch? t筼 k? m玭 binh kh?/QUS_ERROR",
		"3. Ch? t筼 k? m玭 binh kh? v? binh kh? ng緉/QUS4_GOTO",
		"4. Ch? t筼 h? gi竝 v? luy謓 b颽/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."Ta mu鑞 m閠 m譶h chu du thi猲 h?, t? gi竚 nh trang b? cho m譶h. V藋 nh鱪g k? n╪g n祔 h鋍 ? u?",4,
		"1. Ch? t筼 h? gi竝/QUS_ERROR",
		"2. Ch? dc/QUS_ERROR",
		"3. N蕌 nng/QUS_ERROR",
		"4. Luy謓 b颽/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."C﹗ h醝 th? 5: Trong qu? tr譶h ch? t筼 v? kh? c? th? th猰 v祇 c竎 v藅 li謚 l祄 m筺h th猰 t輓h n╪g c馻 v? kh?. Xin h醝 c? th? th猰 v祇 t鑙 產 bao nhi猽 lo筰 v藅 li謚?",4,
		"1. 6 lo筰/QUS_ERROR",
		"2. 8 lo筰/QUS_ERROR",
		"3. 10 lo筰/QUS_PASS",
		"4. 12 lo筰/QUS_ERROR")
end
function QUS_PASS()
		Say(strTitle.."B籲g h鱱 qu? nhi猲 phi ph祄. Ti誴 theo, h穣 n <color=yellow>Bi謓 Kinh<color> t譵 <color=yellow>V﹏ Du o nh﹏<color> c? v礽 v蕁  mu鑞 th豱h gi竜!",0)
		SetTask(ID_LEARNLIFESKILL,2)
		TaskTip("T譵 V﹏ Du o nh﹏ ? Bi謓 Kinh")
end
function QUS_ERROR()
		Say(strTitle.."Xem ra ngi ch璦 hi觰 g? v? k? n╪g s秐 xu蕋. H穣 n th豱h gi竜 <color=yellow>Du Phng i phu<color> 甶!",0)
end

