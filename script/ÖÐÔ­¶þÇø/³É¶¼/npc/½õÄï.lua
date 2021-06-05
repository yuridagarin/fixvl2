-- =========================================
-- File : ��ԭ�������ɶ�������.lua
-- Name : ����
-- ID   : 1, 5
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")
--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �䷽ѧϰ�������
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�����¼
LEVELTASKID49			= 518		-- ��������ȹ
RECIPE_SEX				= 1935		-- �䷽ѧϰ��Ůѡ��
RESET_ERROR				= 1938		-- �޸����������ʾ
TASK49_BEGGING			= 1933		-- 49����������ʼ��ʾ
FORGETMAIN_NUM			= 1940		-- ���������ܴ���
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
strName = "";
strTitle = "";

--*****************************************MAIN����*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Mu�n l�m trang b� c� linh kh� cao, nh�t ��nh ph�i th�m v�t ph�m c� gi� tr� cao v�o!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-----------------------------------------��������-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."��n <color=yellow>C�p 10<color> c� th� ��n <color=yellow>Th�nh ��<color> g�p <color=yellow>Du Ph��ng ��i phu<color> t�m hi�u <color=yellow>k� n�ng s�ng<color>!", 0)
		TaskTip("��n c�p 10 c� th� ��n Th�nh �� t�m Du Ph��ng ��i phu.")       
		return 
	end

---------------------------------------------���Ի�-------------------------------------------
	local strtab = {
		"H�c k� n�ng ch� t�o h� gi�p./luaLearnLifeSkill",
		"H�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�/learn_all_recipe",
		"H�y b� k� n�ng ch� t�o h� gi�p./forget_life_skill",
--		"Nh�ng �i�u li�n quan v� trang b� B�t Qu�i/bagua",
		"T�m hi�u v�t ph� gia/Dating"
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 5) == 79 then
		tinsert(strtab, "Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level");
	end 
	tinsert(strtab,"R�i kh�i/SayHello");
	Say(strTitle.."Ta ch�nh l� C�m N��ng, tinh th�ng ngh� may v�, b�ng h�u c�n g� xin c� n�i?",
		getn(strtab),
		strtab)
end;

-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."Ng��i mu�n h�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�?",
		7,
		"H�c c�ch ph�i ch� m�i/luaLearnRecipe",
		"H�c ph�i ch� trang b� Linh ��/learnLtEquip",
		"H�c c�ch ph�i ch� d�nh cho ho�t ��ng cu�i tu�n/Weekend",
		"Xem nh�n ���c nhi�m v� v� kh� c�p 76 kh�ng/get_76_task",
		"H�c c�ch ph�i ch� c�p 76/relearn_76_recipe",
		"H�c c�ch ph�i ch� y ph�c cao c�p s� m�n nam kh�i ng� C�i Bang � y./GB_Cloth",
		"R�i kh�i/SayHello")
end;


-- ����76���䷽����
function get_76_task()
 ----------------------------------76�������䷽ɽʨ��Ƥ����----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI)
		
	if (nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79) then
		--��δ�����䷽����
		if nTaskState_shanshi == 0 then
			weave_shanshi_001()
			return
		--��δ��Ůװ���ϰ�Ի�
		elseif nTaskState_shanshi == 1 or nTaskState_shanshi == 2 then
			weave_shanshi_002()
			return
		--�Ӵ�������ظ�����
		elseif nTaskState_shanshi == 3 then
			weave_shanshi_007()
			return
		--��δ��ƴ����Ի�
		elseif nTaskState_shanshi == 4 then
			weave_shanshi_008()
			return
		--����5ƥ�ڲ�˿��ѧ��ɽʨ��Ƥ�䷽
		elseif nTaskState_shanshi == 5 then
			weave_shanshi_011()
			return			
		end 
	end
		
	--��ʾ���76�������䷽����
	if (nSkillGenre == 1 and nSkillDetail ~= 5 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	Say("B�n ch�a �� �i�u ki�n nh�n nhi�m v� ph�i ch� c�p 76.", 0)
end;


-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 5)
	if (nGene == 1 and nSkillID == 5) then
		if (GetTask(1604) == 6 and nLevel >= 79) then
			AddRecipe(807)
			Msg2Player("B�n h�c ���c ph�i ch�: S�n S� Tinh B�")
		else
			Say("B�n ch�a l�m nhi�m v� ch� t�o h� gi�p c�p 76", 0)
		end
	else
		Say("B�n ch�a h�c k� n�ng:<color=yellow>Ch� t�o h� gi�p<color>!", 0)
	end
end;



-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(1, 5) > 0) then
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
		Say(strTitle.."Ng��i ch�a h�c k� n�ng ch� t�o h� gi�p? Ta kh�ng th� gi�p ng��i!", 0)
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
	
	if (GetLifeSkillLevel(1, 5) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 5)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(518, 0)
				SetTask(RECIPE_SEX, 0)
				SetTask(1604, 0);			--���79�������䷽����				
				Msg2Player("B�n �� b� k� n�ng ch� t�o h� gi�p.")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;



 ------------------------------------------ʱ���ж�--------------------------------------------
 --�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;

--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
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


--**********************************************����ѧϰ����***************************************
--����ѧϰѡ��
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
		Say(strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B�ng h�u �� h�c k� n�ng s�n xu�t, mu�n h�c k� n�ng m�i c�n ph�i b� k� n�ng c�.", 0)
    	return
	end

	Say(strTitle.."B�ng h�u mu�n h�c k� n�ng <color=yellow>Ch� t�o h� gi�p<color> �?",
    	2,
    	"Ta mu�n h�c/LearnAsMain",
    	"�� ta suy ngh� l�i/LearnNo")
end

function LearnAsMain()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."Ch� t�o h� gi�p c� 2 lo�i: <color=yellow>Nam y<color> v� <color=yellow>N� y<color>, ng��i mu�n h�c lo�i n�o?",
		3,
		"Nam y./ChooseMan",
		"N� y./ChooseWomen",
		"�� ta suy ngh�./LearnNo")
	end
end

function RecipeMan()
  AddRecipe(145)
  Msg2Player("B�n h�c ���c ph�i ch�: T� Kh�m B� Y")
	AddRecipe(146)
	Msg2Player("B�n h�c ���c ph�i ch�: B�n Long T�")
	AddRecipe(147)
	Msg2Player("B�n h�c ���c ph�i ch�: Th��ng Lang Y")
	AddRecipe(148)
	Msg2Player("B�n h�c ���c ph�i ch�: Y�m T�m Gi�p")
	AddRecipe(163)
	Msg2Player("B�n h�c ���c ph�i ch�: Th� ��u H� Ki�n")
	AddRecipe(164)
	Msg2Player("B�n h�c ���c ph�i ch�: C�m Ti C�n")
	AddRecipe(165)
	Msg2Player("B�n h�c ���c ph�i ch�: H�o Hi�p Y")
	AddRecipe(166)
	Msg2Player("B�n h�c ���c ph�i ch�: Kim Ng�c Tr� Sam")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;

function RecipeWomen()
	AddRecipe(181)
	Msg2Player("B�n h�c ���c ph�i ch�: T� Nhung Th��ng")
	AddRecipe(182)
	Msg2Player("B�n h�c ���c ph�i ch�: T�m �n Th��ng")
	AddRecipe(183)
	Msg2Player("B�n h�c ���c ph�i ch�: V� Luy�n Th��ng")
	AddRecipe(184)
	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Ma Th��ng")
	AddRecipe(199)
	Msg2Player("B�n h�c ���c ph�i ch�: T� K�nh Sam")
	AddRecipe(200)
	Msg2Player("B�n h�c ���c ph�i ch�: Linh V�n Th��ng")
	AddRecipe(201)
	Msg2Player("B�n h�c ���c ph�i ch�: C�n Qu�c Sam")
	AddRecipe(202)
	Msg2Player("B�n h�c ���c ph�i ch�: Phong V� Th��ng")
			
  SetTask(LEV_LEARNRECIPE, 10)
  SetTask(RECIPE_SEX, 2)
end;

--ѧϰ����
function ChooseMan()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 5, 1, 79, 1)) then
      Msg2Player("B�n �� h�c k� n�ng s�ng: ch� t�o h� gi�p, nh�n ���c 3 s�i sa tuy�n.")
      AddItem(2, 2, 62, 3)
      		
      AddRecipe(145)
      Msg2Player("B�n h�c ���c ph�i ch�: T� Kh�m B� Y")
			AddRecipe(146)
			Msg2Player("B�n h�c ���c ph�i ch�: B�n Long T�")
			AddRecipe(147)
			Msg2Player("B�n h�c ���c ph�i ch�: Th��ng Lang Y")
			AddRecipe(148)
			Msg2Player("B�n h�c ���c ph�i ch�: Y�m T�m Gi�p")
			AddRecipe(163)
			Msg2Player("B�n h�c ���c ph�i ch�: Th� ��u H� Ki�n")
			AddRecipe(164)
			Msg2Player("B�n h�c ���c ph�i ch�: C�m Ti C�n")
			AddRecipe(165)
			Msg2Player("B�n h�c ���c ph�i ch�: H�o Hi�p Y")
			AddRecipe(166)
			Msg2Player("B�n h�c ���c ph�i ch�: Kim Ng�c Tr� Sam")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;

function ChooseWomen()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 5, 1, 79, 1)) then
  		Msg2Player("B�n �� h�c k� n�ng s�ng: ch� t�o h� gi�p, nh�n ���c 3 s�i sa tuy�n.")
  		AddItem(2, 2, 62, 3)
    		
  		AddRecipe(181)
  		Msg2Player("B�n h�c ���c ph�i ch�: T� Nhung Th��ng")
			AddRecipe(182)
			Msg2Player("B�n h�c ���c ph�i ch�: T�m �n Th��ng")
			AddRecipe(183)
			Msg2Player("B�n h�c ���c ph�i ch�: V� Luy�n Th��ng")
			AddRecipe(184)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Ma Th��ng")
			AddRecipe(199)
			Msg2Player("B�n h�c ���c ph�i ch�: T� K�nh Sam")
			AddRecipe(200)
			Msg2Player("B�n h�c ���c ph�i ch�: Linh V�n Th��ng")
			AddRecipe(201)
			Msg2Player("B�n h�c ���c ph�i ch�: C�n Qu�c Sam")
			AddRecipe(202)
			Msg2Player("B�n h�c ���c ph�i ch�: Phong V� Th��ng")
			
	    SetTask(LEV_LEARNRECIPE, 10)
	    SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say(strTitle.."H�y suy ngh� k� r�i quay l�i ��y nh�!", 0)
end

--**********************************************�䷽ѧϰ����***************************************
--ѧϰ�µ��䷽,��Ϊ��װѧϰ��Ůװѧϰ
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 5)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."Ch� t�o h� gi�p c� 2 lo�i: <color=yellow>Nam y<color> v� <color=yellow>N� y<color>, ng��i mu�n h�c lo�i n�o?",
			3,
			"Nam y./RecipeMan",
			"N� y./RecipeWomen",
			"�� ta suy ngh�./LearnNo")
		return
	end
	
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(167)
			Msg2Player("B�n h�c ���c ph�i ch�: L�c L�m trang")
			AddRecipe(168)
			Msg2Player("B�n h�c ���c ph�i ch�: Ho�ng H� b� y")
			AddRecipe(149)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n H�nh ph�c")
			AddRecipe(150)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh S��ng b�o")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(169)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n Ng�u h� gi�p")
			AddRecipe(170)
			Msg2Player("B�n h�c ���c ph�i ch�: T� Thanh S��ng Hoa sam")
			AddRecipe(151)
			Msg2Player("B�n h�c ���c ph�i ch�: Tham Lam y")
			AddRecipe(152)
			Msg2Player("B�n h�c ���c ph�i ch�: X�ch ��ng tr�")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(171)
			Msg2Player("B�n h�c ���c ph�i ch�: C� Nhi�m kh�ch y")
			AddRecipe(172)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Nh�n b� trang")
			AddRecipe(153)
			Msg2Player("B�n h�c ���c ph�i ch�: Nhuy�n Kim y")
			AddRecipe(154)
			Msg2Player("B�n h�c ���c ph�i ch�: Th��ng Lan y")
			SetTask(LEV_LEARNRECIPE,40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(173)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n S�ch kim gi�p")
			AddRecipe(174)
			Msg2Player("B�n h�c ���c ph�i ch�: L�i Ng�n Gi�p")
			AddRecipe(155)
			Msg2Player("B�n h�c ���c ph�i ch�: Lam K�nh b� gi�p")
			AddRecipe(156)
			Msg2Player("B�n h�c ���c ph�i ch�: X�ch Long b�o")
			SetTask(LEV_LEARNRECIPE,50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(175)
			Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Huy�n kim gi�p")
			AddRecipe(176)
			Msg2Player("B�n h�c ���c ph�i ch�: H�a Th� Th�nh sam")
			AddRecipe(158)
			Msg2Player("B�n h�c ���c ph�i ch�: B�ng T�m Tr� sam")
			AddRecipe(157)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Lang y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(177)
			Msg2Player("B�n h�c ���c ph�i ch�: Huy�t H� Qu� V��ng kh�i")
			AddRecipe(159)
			Msg2Player("B�n h�c ���c ph�i ch�: S�n Qu� Huy�t y")
			AddRecipe(178)
			Msg2Player("B�n h�c ���c ph�i ch�: Long B� � kim y")
			AddRecipe(160)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Gi�ng b�o")
			SetTask(LEV_LEARNRECIPE,70)
		else
		    Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!", 0)
		end
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(185)
			Msg2Player("B�n h�c ���c ph�i ch�: Luy�n Gi�p th��ng")
			AddRecipe(186)
			Msg2Player("B�n h�c ���c ph�i ch�: C�n Hoa th��ng")
			AddRecipe(203)
			Msg2Player("B�n h�c ���c ph�i ch�: M�t V�n sam")
			AddRecipe(204)
			Msg2Player("B�n h�c ���c ph�i ch�: V� ��u th��ng")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(187)
			Msg2Player("B�n h�c ���c ph�i ch�: C�m Anh th��ng")
			AddRecipe(188)
			Msg2Player("B�n h�c ���c ph�i ch�: N� Ki�t th��ng")
			AddRecipe(205)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n T�m gi�p y")
			AddRecipe(206)
			Msg2Player("B�n h�c ���c ph�i ch�: Kh�i La th��ng")
			SetTask(LEV_LEARNRECIPE,30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(189)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh Linh th��ng")
			AddRecipe(190)
			Msg2Player("B�n h�c ���c ph�i ch�: H�ng Ngh� th��ng")
			AddRecipe(207)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n C�ng ��u y")
			AddRecipe(208)
			Msg2Player("B�n h�c ���c ph�i ch�: Linh Lung th��ng")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(191)
			Msg2Player("B�n h�c ���c ph�i ch�: L�n Quang gi�p y")
			AddRecipe(192)
			Msg2Player("B�n h�c ���c ph�i ch�: H� C� v� y")
			AddRecipe(209)
			Msg2Player("B�n h�c ���c ph�i ch�: Th� V��ng ��u y")
			AddRecipe(210)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�i Hoa th��ng")
			SetTask(LEV_LEARNRECIPE,50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(193)
			Msg2Player("B�n h�c ���c ph�i ch�: Minh Quang gi�p y")
			AddRecipe(194)
			Msg2Player("B�n h�c ���c ph�i ch�: Ngh� Th��ng v� y")
			AddRecipe(211)
			Msg2Player("B�n h�c ���c ph�i ch�: Ngh�ch V�n ��u y")
			AddRecipe(212)
			Msg2Player("B�n h�c ���c ph�i ch�: C�m V�n th��ng")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(195)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Y")
			AddRecipe(196)
			Msg2Player("B�n h�c ���c ph�i ch�: Phi Thi�n th�i th��ng")
			AddRecipe(213)
			Msg2Player("B�n h�c ���c ph�i ch�: V� Song ��u y")
			AddRecipe(214)
			Msg2Player("B�n h�c ���c ph�i ch�: Ng� Th�i ngh� th��ng")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 5)
	if nLevel >= 79 then
    	AddRecipe(1135)
    	AddRecipe(1136)
    	AddRecipe(1137)
    	AddRecipe(1138)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Y"))
	else
    	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
	end
end

--�Լ��ܵ�˵����Ϣ
function Weekend()
    if (GetLifeSkillLevel(1, 5) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."Ti�n tuy�n chi�n tranh �c li�t, ta c� 1 c�ch ch� t�o h� gi�p r�t ��c ��o, mu�n truy�n th� cho ng��i, ng��i h�y ch� t�o chi�n gi�p chi vi�n cho ti�n tuy�n gi�p �� tri�u ��nh!")
    	AddRecipe(230)
    	Msg2Player("B�n h�c ���c ph�i ch�-- qu�n d�ng kh�i gi�p!")
    else
    	Talk(1,"",strTitle.."Ng��i v�n ch�a h�c k� n�ng ch� t�o h� gi�p ho�c ch�a �� kinh nghi�m, ta kh�ng th� truy�n th� c�ch ph�i ch� n�y.")
    end
end;

--ȡ������
function SayHello()
end

--�������Ϣ
function Dating()
	Talk(1, "", strTitle.."Mu�n ch� t�o 1 binh kh� tuy�t th� v� song, c�n ph�i b� th�m nhi�u v�t ph� gia, ng��i h�y th� b� th�m 1 s� v�t li�u t�t, c� th� s� r�n ���c nh�ng v� kh� c� m�t kh�ng hai.")
end

--��ѧؤ�������·��䷽
function GB_Cloth()
	if (HaveLearnRecipe(871) > 0 and HaveLearnRecipe(873) > 0 and 
		HaveLearnRecipe(874) > 0 and HaveLearnRecipe(872) == 0) then
		AddRecipe(872)
		Msg2Player("B�n h�c ���c c�ch l�m: T� Ngh�a th��ng")
	end
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang b� b�t qu�i<color> l� ta c�ng huynh �� M�c gia v� l�o L�u � T��ng D��ng, �� to�n l�c c�ng nhau nghi�n c�u ra t�m huy�t. L�m th� n�o nh�n ���c nh�ng m�n c� linh th�ch ng��i �i h�i truy�n nh�n s� r�, n�u ng��i mu�n t�m hi�u l�m th� n�o ch� t�o ���c <color=yellow>trang b�<color> kh�m linh th�ch, th� ��n ch� ta t�m hi�u nh�.",
	4,
	"L�m sao ch� t�o trang b� c� l� kh�m n�m/kongzhuangbeizhizuo",
	"V�t ph�m th�m v�o c� t�c d�ng g�/tianjiawu",
	"L�m sao trang b� ���c ch� t�o th�nh trang b� B�t Qu�i/xiangqianzhuyi",
	"��n h�i th�m th�i m�!/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R�t ��n gi�n, qua nghi�n c�u c�a b�n ta, c�i ti�n ph��ng ph�p ch� t�o ta truy�n th� cho c�c ng��i, b�y gi� ng��i �ang thu th�p nguy�n li�u � khu v�c thu th�p, nh�ng trang b� ch� t�o ra c� m�c linh kh� t�i �a v� c� th� c� l� kh�m n�m, nh�ng m� c�ng ch�nh v� v�y, nh�ng trang b� c� thu�c t�nh linh kh� kh�ng c�n ch� t�o ���c n�a.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V�n v�t tr�n th� gian ��u c� gi� tr� ri�ng, gi� tr� t�y v�o linh kh� �t hay nhi�u, khi ch� t�o trang b� t�ng v�t ph�m th�m v�o, c� th� t�ng m�c linh kh� t�i �a v� t�ng s� l� kh�m n�m linh th�ch tr�n trang b�. M�c linh kh� t�i �a c�a trang b� quy�t ��nh m�c linh kh� �� kh�m n�m linh th�ch, v� s� l� quy�t ��nh n� c� th� kh�m bao nhi�u linh th�ch, c� th� th�nh thu�c t�nh b�t qu�i hay kh�ng, cho n�n n�u ���c th� c� g�ng th�m v�i v�t c� gi� tr�.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."� tr�n �� nh�c ��n r�i, tr�n trang b� c� m�c linh kh� t�i �a v� l� kh�m n�m, 1 trang b� kh�m <color=yellow>3 vi�n<color> linh th�ch, khi m�c linh kh� c�a 3 vi�n linh th�ch b�ng v�i m�c linh kh� t�i �a c�a trang b�, s� h�nh th�nh trang b� thu�c t�nh b�t qu�i. Linh th�ch l� s� l� th� m�c linh kh� �m, Linh th�ch l� s� ch�n th� m�c linh kh� d��ng, n�u th� t� Linh Th�ch ���c kh�m kh�ng gi�ng nhau, th� trang b� c� thu�c t�nh b�t qu�i kh�c nhau, tr�n \'B�t qu�i B�o �i�n\' d�nh cho h�u du� c�a C�ng D� Th� Gian c� ghi r�t r� l�m th� n�o �� ch� t�o 1 trang b� c� thu�c t�nh b�t qu�i mong mu�n, c� th�i gian th� xem.")
end

function update_max_skill_level()
	Say(strTitle..format("M� r�ng c�p k� n�ng s�n xu�t c�n k� n�ng thu th�p ��t c�p 79 ��ng th�i ti�u hao %d V�ng", 1000), 
		2, "��ng �/update_max_skill_level_ensure", "T�i h� ch� xem qua th�i/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 5) < 79 then
		Talk(1,"",format("Hi�n t�i c�p k� n�ng s�n xu�t ch�a ��t c�p %d, kh�ng th� m� r�ng c�p gi�i h�n k� n�ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng�n l��ng kh�ng �� %d v�ng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 5, 99);
	Msg2Player("Ch�c m�ng c�p gi�i h�n k� n�ng s�n xu�t �� ��t c�p 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end