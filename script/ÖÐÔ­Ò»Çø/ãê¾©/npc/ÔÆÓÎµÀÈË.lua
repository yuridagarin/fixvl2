-- =========================================
-- File : ��ԭһ�����꾩�����ε���.lua
-- Name : ���ε���
-- ID   : 1, 8
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

ID_LEARNLIFESKILL		= 1925		-- �����������
TASK49_BEGGING			= 1933		-- 49����������ʼ��ʾ
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�������
FORGETMAIN_NUM			= 1940		-- ���������ܴ���
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
strName = "";
strTitle = "";

--*****************************************MAIN����*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-------------------------------------------��������-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 2) then
		Say(strTitle.."��n <color=yellow>C�p 10<color> c� th� ��n <color=yellow>Th�nh ��<color> g�p <color=yellow>Du Ph��ng ��i phu<color> t�m hi�u <color=yellow>k� n�ng s�ng<color>!", 0)
    	TaskTip("��n c�p 10 c� th� ��n Th�nh �� t�m Du Ph��ng ��i phu.")        
		return    
    elseif (GetTask(ID_LEARNLIFESKILL) >= 2 and GetTask(ID_LEARNLIFESKILL) < 15) then
		Talk(3, 
			 "",
			 strTitle.."Ta s� gi�i th�ch ��i n�t v� k� n�ng thu th�p cho b�ng h�u r�.",
			 strTitle.."K� n�ng thu th�p g�m: <color=yellow>��n c�y, ��o kho�ng, Canh t�c, Thu�c da, T�p linh, H�i thu�c v� K�o t�<color>. K� n�ng thu th�p c�n c� khu v�c v� c�ng c� t��ng �ng m�i c� th� s� d�ng. <color=yellow>��n c�y c�n c� Thi�t ph�; ��o kho�ng c�n c� Cu�c chim; Canh t�c c�n c� Cu�c; Thu�c da c�n Ch� b� �ao; T�p linh c�n Ph�p kh�; H�i thu�c c�n Cu�c thu�c; K�o t� c�n Con thoi<color>.",
			 strTitle.."Ch� � m�i c�ng c� ��u c� �� b�n nh�t ��nh. Gi� b�ng h�u c� th� v� <color=yellow>Bi�n Kinh<color> gi�i th�ch cho <color=yellow>L�u Nh�t Ph�<color>.")
		if (GetTask(ID_LEARNLIFESKILL) == 2) then
			SetTask(ID_LEARNLIFESKILL, 3)
			TaskTip("T�m L�u Nh�t Ph� � Bi�n Kinh")
		end
		return
    end
	
 ---------------------------------------------���Ի�-------------------------------------------
	Say(strTitle.."Ta l� V�n Du ��o Nh�n, tinh th�ng k� thu�t ng��i c�n ta gi�p g� kh�ng? Nghe n�i c�c ��o s� � Tuy�n Ch�u ph�t hi�n m�t lo�i ph� th�ch m�i t�t h�n c�a ta r�t nhi�u. Ng��i th� ��n �� xem.",
		4,
		"H�c k� n�ng luy�n b�a/luaLearnLifeSkill",
		"H�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�/learn_all_recipe",
		"B� k� n�ng luy�n b�a/forget_life_skill",
		"R�i kh�i/SayHello")
end;

-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."Ng��i mu�n h�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�?",
		7,
		"H�c c�ch ph�i ch� m�i/luaLearnRecipe",
		"H�c c�ch ph�i ch� d�nh cho ho�t ��ng cu�i tu�n/Weekend",
		"Ph��ng ph�p ph�i ch� m�i/luaResLearnRecipe",
		"Xem nh�n ���c nhi�m v� v� kh� c�p 76 kh�ng/get_76_task",
		"H�c c�ch ph�i ch� c�p 76/relearn_76_recipe",
		"H�c s�a ph�i ch�/Reset_Learn",
		"R�i kh�i/SayHello")
end;

-- ����76���䷽����
function get_76_task()
 ----------------------------------76�������䷽�����������----------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU);
		
	if nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79 then
		--��δ�����䷽����
		if nTaskState_chiwu == 0 then
			juju_chiwu_001()
			return
		--����ȥ��ħ����ĶԻ�
		elseif nTaskState_chiwu == 1 then
			juju_chiwu_002()
			return
		--�ͻغ���ʯ������ľ��ѧ���䷽
		elseif nTaskState_chiwu == 2 then
			juju_chiwu_007()
			return			
		end 
	end
		
	--��ʾ���76�������䷽����
	if nSkillGenre == 1 and nSkillDetail ~= 8 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B�n ch�a �� �i�u ki�n nh�n nhi�m v� ph�i ch� c�p 76.", 0)
end;


-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (nGene == 1 and nSkillID == 8) then
		if (GetTask(1605) == 3 and nLevel >= 79) then
			AddRecipe(808)
			Msg2Player("B�n h�c ���c ph�i ch�: X�ch � Linh Ph�")
		else
			Say("B�n ch�a l�m nhi�m v� ph�i ch� c�p 76", 0)
		end
	else
		Say("B�n ch�a h�c k� n�ng: <color=yellow>Luy�n b�a<color>!", 0)
	end
end;

-- ���������
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- ������
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."��y l� l�n th� "..(nForgetTimes + 1).." l�n b� k� n�ng s�n xu�t, m�t "..nShouldPay.." l��ng, ng��i suy ngh� k� ch�a?",
			2,
			"Ta �� quy�t ��nh r�i!/forget_now",
			"Khoan ��! Ch� ta suy ngh� l�i!/SayHello")
	else
		Say(strTitle.."Ng��i ch�a h�c k� n�ng luy�n b�a? Ta kh�ng th� gi�p ng��i!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- ������
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 8)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(515, 0)
				SetTask(1601, 0);--���79�������䷽����
				SetTask(1605, 0);--���79�������䷽����
				Msg2Player("B�n �� b� k� n�ng luy�n b�a")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;

----------------------------------------ʱ���ж��ű�----------------------------------------
--�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;
--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H")
	nMin = date("%M")
	return tonumber(nHour), tonumber(nMin)
end;
--19 - 23��59��
function CheckTime(day)
	if (WEEKEND_SWITCH == 0) then
		return 0
	end
	if (day ~= GetWeekDay()) then
		return 0
	end
	--����19:00 - 24:00��ʲô����
	local nBegin = 19 * 60
	local nEnd = 24 * 60
	local nHour, nMin = GetLocalTime()
	local nValue = nHour * 60 + nMin
	if (nValue >= nBegin and nValue <= nEnd) then
		return 1
	else
		return 0
	end
end;


----------------------------����ѧϰѡ��--------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
    	Say (strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.", 0)
    	return
	end
	
    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."B�ng h�u �� h�c k� n�ng s�n xu�t, mu�n h�c k� n�ng m�i c�n ph�i b� k� n�ng c�.", 0)
    	return
    end
    
	Say(strTitle.."B�ng h�u mu�n h�c k� n�ng <color=yellow>luy�n b�a<color>?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end;
--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if LearnLifeSkill(1, 8, 1, 79, 1) then
        	AddItem(2, 1, 901, 30)
        	Msg2Player("H�c ���c k� n�ng s�ng: Ch� ph� v� nh�n ���c 30 Bi�n kinh th�ch.")
	    end
    
    		AddRecipe(36)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� Bi�n Kinh")
    		AddRecipe(37)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� Th�nh ��")
    		AddRecipe(38)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� Tuy�n Ch�u")
    	SetTask(LEV_LEARNRECIPE, 10)
    	
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."H�y suy ngh� k� r�i quay l�i ��y nh�!", 0)
end

--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
    		AddRecipe(36)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� Bi�n Kinh")
    		AddRecipe(37)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� Th�nh ��")
    		AddRecipe(38)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� Tuy�n Ch�u")
    		SetTask(LEV_LEARNRECIPE, 10)
    	elseif (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
	    	AddRecipe(29)
    		Msg2Player("B�n h�c ���c ph�i ch�: Gi�m ��nh ph� (c�p 1)")
    		AddRecipe(39)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� T��ng D��ng")    		
    		AddRecipe(226)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�i ph� D��ng Ch�u")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
        	AddRecipe(30)
        	Msg2Player("B�n h�c ���c ph�i ch�: Gi�m ��nh ph� (c�p 2)")
        	AddRecipe(41)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��i L� H�i ph�")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
        	AddRecipe(31)
        	Msg2Player("B�n h�c ���c ph�i ch�: Gi�m ��nh ph� (c�p 3)")
        	AddRecipe(947)
        	Msg2Player("B�n h�c ���c ph�i ch�: V� �ang H�i ph�")
        	AddRecipe(948)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�i Bang H�i ph�")
        	AddRecipe(949)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�u L�m H�i ph�")
        	AddRecipe(950)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nga My H�i ph�")
        	AddRecipe(952)
        	Msg2Player("B�n h�c ���c ph�i ch�: ���ng M�n H�i ph�")
        	AddRecipe(953)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� ��c H�i ph�")
        	AddRecipe(954)
        	Msg2Player("B�n h�c ���c ph�i ch�: D��ng M�n H�i ph�")          	 
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(32)
        	Msg2Player("B�n h�c ���c ph�i ch�: Gi�m ��nh ph� (c�p 3)")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(33)
        	Msg2Player("B�n h�c ���c ph�i ch�: Gi�m ��nh ph� (c�p 5)")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(34)
        	Msg2Player("B�n h�c ���c ph�i ch�: Gi�m ��nh ph� (c�p 6)")
        	AddRecipe(951)
        	Msg2Player("B�n h�c ���c ph�i ch�: T�p linh ph�")
        	SetTask(LEV_LEARNRECIPE,70)
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(35)
        	Msg2Player("B�n h�c ���c ph�i ch�: Gi�m ��nh ph� (c�p 7)")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!", 0)
    	end
    end
end;

--�Լ��ܵ�˵����Ϣ
function Weekend()
    if (GetLifeSkillLevel(1, 8) >= 1 and 
    	(CheckTime(0) == 1 or CheckTime(5) == 1 or CheckTime(6) == 1)) then
    	Say(strTitle.."Tu�n l� ho�ng kim �� ��n, ta ��y c� ph��ng ph�p ph�i ch� ��c bi�t l�m ���c gi�y b�a qu�n d�ng r�t c� �ch cho ti�n tuy�n!", 0)
    	AddRecipe(231)
    	Msg2Player("B�n h�c ���c c�ch ph�i ch� m�i - Gi�y b�a qu�n d�ng!")
    else
    	Say(strTitle.."Ng��i ch�a h�c luy�n b�a ho�c ch�a ��ng l�c n�n ta kh�ng th� truy�n th�.", 0)
    end
end

--ȡ������
function SayHello()
end

--�޸��䷽
function Reset_Learn()
	if (GetLifeSkillLevel(1, 8) >= 1) then
		SetTask(LEV_LEARNRECIPE, 0)
		Talk(1, "", strTitle.."Ph�i ch� c�a ng��i �� ���c tu s�a, m�i 10 c�p c� th� h�c c�ch ph�i ch� m�i.")
		return	
	else
		Talk(1, "", strTitle.."��ng h�ng g�t ta!")
	end
end

--���µ��䷽
function luaResLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(947)
        	Msg2Player("B�n h�c ���c ph�i ch�: V� �ang H�i ph�")
        	AddRecipe(948)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�i Bang H�i ph�")
        	AddRecipe(949)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�u L�m H�i ph�")
        	AddRecipe(950)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nga My H�i ph�")
        	AddRecipe(952)
        	Msg2Player("B�n h�c ���c ph�i ch�: ���ng M�n H�i ph�")
        	AddRecipe(953)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� ��c H�i ph�")
        	AddRecipe(954)
        	Msg2Player("B�n h�c ���c ph�i ch�: D��ng M�n H�i ph�") 
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(947)
        	Msg2Player("B�n h�c ���c ph�i ch�: V� �ang H�i ph�")
        	AddRecipe(948)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�i Bang H�i ph�")
        	AddRecipe(949)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�u L�m H�i ph�")
        	AddRecipe(950)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nga My H�i ph�")
        	AddRecipe(952)
        	Msg2Player("B�n h�c ���c ph�i ch�: ���ng M�n H�i ph�")
        	AddRecipe(953)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� ��c H�i ph�")
        	AddRecipe(954)
        	Msg2Player("B�n h�c ���c ph�i ch�: D��ng M�n H�i ph�") 
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(947)
        	Msg2Player("B�n h�c ���c ph�i ch�: V� �ang H�i ph�")
        	AddRecipe(948)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�i Bang H�i ph�")
        	AddRecipe(949)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�u L�m H�i ph�")
        	AddRecipe(950)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nga My H�i ph�")
        	AddRecipe(952)
        	Msg2Player("B�n h�c ���c ph�i ch�: ���ng M�n H�i ph�")
        	AddRecipe(953)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� ��c H�i ph�")
        	AddRecipe(954)
        	Msg2Player("B�n h�c ���c ph�i ch�: D��ng M�n H�i ph�") 
        	AddRecipe(951)
        	Msg2Player("B�n h�c ���c ph�i ch�: T�p linh ph�")        	
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(947)
        	Msg2Player("B�n h�c ���c ph�i ch�: V� �ang H�i ph�")
        	AddRecipe(948)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�i Bang H�i ph�")
        	AddRecipe(949)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�u L�m H�i ph�")
        	AddRecipe(950)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nga My H�i ph�")
        	AddRecipe(952)
        	Msg2Player("B�n h�c ���c ph�i ch�: ���ng M�n H�i ph�")
        	AddRecipe(953)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� ��c H�i ph�")
        	AddRecipe(954)
        	Msg2Player("B�n h�c ���c ph�i ch�: D��ng M�n H�i ph�") 
        	AddRecipe(951)
        	Msg2Player("B�n h�c ���c ph�i ch�: T�p linh ph�")
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 80) then
        	AddRecipe(947)
        	Msg2Player("B�n h�c ���c ph�i ch�: V� �ang H�i ph�")
        	AddRecipe(948)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�i Bang H�i ph�")
        	AddRecipe(949)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�u L�m H�i ph�")
        	AddRecipe(950)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nga My H�i ph�")
        	AddRecipe(952)
        	Msg2Player("B�n h�c ���c ph�i ch�: ���ng M�n H�i ph�")
        	AddRecipe(953)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� ��c H�i ph�")
        	AddRecipe(954)
        	Msg2Player("B�n h�c ���c ph�i ch�: D��ng M�n H�i ph�") 
        	AddRecipe(951)
        	Msg2Player("B�n h�c ���c ph�i ch�: T�p linh ph�")
    	else
        	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!", 0)
    	end
    end
end;

function Huan_Fushi()
	if GetItemCount(0,200,29)>0 then 
		Say("Ng��i c� mu�n ��i Bi�n Kinh Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Bianjingzhuanhuan",
		"�� ta suy ngh� l�i!/SayHello"
		)
	elseif GetItemCount(0,200,30)>0 then 
		Say("Ng��i c� mu�n ��i Th�nh �� Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Chengduzhuanhuan",
		"�� ta suy ngh� l�i!/SayHello"
		)
	elseif GetItemCount(0,200,31)>0 then 
		Say("Ng��i c� mu�n ��i Tuy�n Ch�u Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Quanzhouzhuanhuan",
		"�� ta suy ngh� l�i!/SayHello"
		)
	elseif GetItemCount(0,200,32)>0 then 
		Say("Ng��i c� mu�n ��i T��ng D��ng Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Xiangyangzhuanhuan",
		"�� ta suy ngh� l�i!/SayHello"
		)
	elseif GetItemCount(0,200,34)>0 then 
		Say("Ng��i c� mu�n ��i ��i L� Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Dalizhuanhuan",
		"�� ta suy ngh� l�i!/SayHello"
		)
	elseif GetItemCount(0,200,35)>0 then 
		Say("Ng��i c� mu�n ��i D��ng Ch�u Th�ch kh�ng?",
		2,
		"��ng v�y, ta mu�n ��i /Yangzhouzhuanhuan",
		"�� ta suy ngh� l�i!/SayHello"
		)
	else Say("Ng��i kh�ng mang theo t�m Ph� Th�ch c� �? Hay l� b� qu�n ch� th� kh� r�i.",
		1,
		"�� ta �i l�y!/SayHello"
		)		
	end;
end;

function Bianjingzhuanhuan()
		DelItem(0,200,29,1)
		AddItem(2,1,901,20)
end;

function Chengduzhuanhuan()
		DelItem(0,200,30,1)
		AddItem(2,1,902,20)
end;

function Quanzhouzhuanhuan()
		DelItem(0,200,31,1)
		AddItem(2,1,903,20)
end;

function Xiangyangzhuanhuan()
		DelItem(0,200,32,1)
		AddItem(2,1,904,20)
end;

function Dalizhuanhuan()
		DelItem(0,200,34,1)
		AddItem(2,1,906,20)
end;

function Yangzhouzhuanhuan()
		DelItem(0,200,35,1)
		AddItem(2,1,907,20)
end;