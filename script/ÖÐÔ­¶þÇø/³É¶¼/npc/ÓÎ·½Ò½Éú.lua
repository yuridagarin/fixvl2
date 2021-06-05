-- =========================================
-- File : ��ԭ�������ɶ����η�ҽ��.lua
-- Name : �η�ҽ��
-- ID   : 1, 6
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �����������
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�������
TASK49_BEGGING			= 1933		-- ��������ʼ
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
    if (GetTask(ID_LEARNLIFESKILL) > 3 and GetTask(ID_LEARNLIFESKILL) < 15) then
		SetTask(ID_LEARNLIFESKILL, 0)
		TaskTip(" �� gi�p b�n s�a nhi�m v� T�n Th�-k� n�ng s�ng, xin h�y b�t ��u l�i.")
		return
	end
    if (GetLevel() < 10) then
		Say(strTitle.."B�n tr�! Mu�n h�c k� n�ng s�ng? Ch� ng��i ��t ��n c�p 10 h�y quay l�i t�m ta!", 0)
		return
    elseif (GetTask(ID_LEARNLIFESKILL) >= 0 and GetTask(ID_LEARNLIFESKILL) < 15 and GetLevel() >= 10) then
		Talk(2, "NewLifeSkills", 
			 strTitle.."��n r�i �? Mu�n ra giang h� c�n ph�i h�c h�i nhi�u. Ta s� ch� cho ng��i nh�ng k� n�ng c� b�n, tr��c ti�n l� k� n�ng s�n xu�t g�m: <color=yellow>Ch� t�o binh kh� d�i, ch� t�o binh kh� ng�n, ch� t�o k� m�n binh kh�, may h� gi�p, may trang ph�c, may n�n, n�u n��ng, luy�n ��n v� ch� ph�<color>.",
			 strTitle.."Ch� t�o v�t ph�m c�n ph�i c� k� n�ng v� nguy�n li�u. Ch� t�o 3 lo�i <color=yellow>Binh kh�<color> c�n k�t h�p v�i c�c k� n�ng<color=yellow>��n c�y<color> v� <color=yellow>��o kho�ng<color> �� cung c�p nguy�n li�u. Ch� t�o <color=yellow>H� gi�p, Trang ph�c v� N�n<color> c�n k�t h�p k� n�ng <color=yellow>Thu�c da <color> v� <color=yellow>K�o t�<color>. Mu�n <color=yellow>N�u n��ng<color> c�n ph�i bi�t <color=yellow>Canh t�c<color> �� l�m ra nguy�n li�u. Mu�n <color=yellow>Luy�n ��n<color> c�n k� n�ng <color=yellow>H�i thu�c<color>. <color=yellow>Ch� ph�<color> ph�i bi�t <color=yellow>T�p Linh<color> �� cung c�p nguy�n li�u.")
		if (GetTask(ID_LEARNLIFESKILL) == 0) then
			SetTask(ID_LEARNLIFESKILL, 1)
			TaskTip("B�n h�y ��n Tuy�n Ch�u t�m L� Phong Thu")
		end
		return
    end
    
--------------------------------------------���Ի�-------------------------------------------
	Say(strTitle.."Ta ch�nh l� Du Ph��ng ��i phu n�i danh thi�n h�, tinh th�ng y thu�t, kh�ng bi�t ta c� th� gi�p g�?",
		4,
		"H�c k� n�ng Ch� d��c/luaLearnLifeSkill",
		"H�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�/learn_all_recipe",
		"H�y k� n�ng Ch� d��c/forget_life_skill",
		"R�i kh�i/SayHello")
end;


-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."Ng��i mu�n h�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�?",
		5,
		"H�c c�ch ph�i ch� m�i/luaLearnRecipe",
		"H�c c�ch ph�i ch� d�nh cho ho�t ��ng cu�i tu�n/Weekend",
		"Xem nh�n ���c nhi�m v� v� kh� c�p 76 kh�ng/get_76_task",
		"H�c c�ch ph�i ch� c�p 76/relearn_76_recipe",
		"R�i kh�i/SayHello")
end;


-- ����76���䷽����
function get_76_task()
----------------------------------76�������䷽���پ�ʯ����----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
		
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--��δ�����䷽����
		if nTaskState_heiwu == 0 then
			medicine_heiwu_001()
			return
		--�Ͻ�ҩƷ
		elseif nTaskState_heiwu == 1 then
			medicine_heiwu_002()
			return
		--δ����󹤶Ի�
		elseif nTaskState_heiwu == 2 then
			medicine_heiwu_004()
			return
		--ѧ����پ�ʯ�䷽
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_009()
			return
		end 
	end
		
	--��ʾ���76�������䷽����
	if nSkillGenre == 1 and nSkillDetail ~= 6 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B�n ch�a �� �i�u ki�n nh�n nhi�m v� ph�i ch� c�p 76.", 0)
end;


-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nGene == 1 and nSkillID == 6) then
		if (GetTask(1602) == 5 and nLevel >= 79) then
			AddRecipe(805)
			Msg2Player("B�n h�c ���c ph�i ch�: H�c � Tinh Th�ch")
		else
			Say("B�n ch�a ho�n th�nh nhi�m v� ph�i ch� c�p 76 c�a k� n�ng Ch� d��c!", 0)
		end
	else
		Say("B�n ch�a h�c k� n�ng: <color=yellow>Ch� d��c<color>!", 0)
	end
end;


-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(1, 6) > 0) then
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
		Say(strTitle.."Ng��i ch�a h�c k� n�ng Ch� d��c! Ta kh�ng th� gi�p ng��i.", 0)
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
	
	if (GetLifeSkillLevel(1, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(RESET_ERROR, 0)
				SetTask(1602, 0);						--���79�������䷽����
				Msg2Player("K� n�ng Ch� d��c c�a b�n �� h�y.")				
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
	--�����
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--����19:00 - 24:00��ʲô����
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end
end;


--**********************************************����ѧϰ����***************************************
--����ѧϰѡ��
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.",0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B�ng h�u �� h�c k� n�ng s�n xu�t, mu�n h�c k� n�ng m�i c�n ph�i b� k� n�ng c�.", 0)
    	return
	end
    
	Say(strTitle.."<color=yellow>L�m thu�c<color> l� k� n�ng s�ng m�i c�a b�n, b�n x�c nh�n mu�n h�c?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end

--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 6, 1, 79, 1)) then
        	Msg2Player("B�n �� h�c k� n�ng s�ng: ch� thu�c v� nh�n ���c m�t �t nguy�n li�u s� c�p.")
        	AddItem(1,2,8,9)
        	AddItem(1,2,1,3)
	   		
	   		AddRecipe(3)
        	Msg2Player("B�n h�c ���c ph�i ch�: Kim S�ng t�n")
        	AddRecipe(8)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ti�u Ho�n ��n")
    	    SetTask(LEV_LEARNRECIPE,10)
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
--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nLevel >= 1) then
		if GetTask(LEV_LEARNRECIPE)>=20 and HaveLearnRecipe(234)==0 then
			AddRecipe(234)
            Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
		elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
        elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(234)==0 then
        	AddRecipe(234)
            Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            AddRecipe(240)
            Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
		elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            AddRecipe(240)
            Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
        elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            AddRecipe(240)
            Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
            AddRecipe(237)
            Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
            AddRecipe(247)
            Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
        elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            AddRecipe(240)
            Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
            AddRecipe(237)
            Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
            AddRecipe(247)
            Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
            AddRecipe(242)
            Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tr�ng Th�t Hoa t�n")
        elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
            AddRecipe(239)
            Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
            AddRecipe(244)
            Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
            AddRecipe(235)
            Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
            AddRecipe(245)
            Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
            AddRecipe(240)
            Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
            AddRecipe(246)
            Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
            AddRecipe(236)
            Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
            AddRecipe(241)
            Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
            AddRecipe(237)
            Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
            AddRecipe(247)
            Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
            AddRecipe(242)
            Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tr�ng Th�t Hoa t�n")
            AddRecipe(238)
            Msg2Player("B�n h�c ���c ph�i ch�: B�n Tinh Nguy�t ��n")
            AddRecipe(243)
            Msg2Player("B�n h�c ���c ph�i ch�: ��i Nh�t D��ng T�n")
            AddRecipe(248)
            Msg2Player("B�n h�c ���c ph�i ch�: Thi�n V��ng B� T�m ��n")    
		elseif nLevel>=1 and GetTask(LEV_LEARNRECIPE)==0 then
       		AddRecipe(3)
        	Msg2Player("B�n h�c ���c ph�i ch�: Kim S�ng t�n")
        	AddRecipe(8)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ti�u Ho�n ��n")
    	    SetTask(LEV_LEARNRECIPE,10)
        elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(4)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Huy�t t�n")
        	AddRecipe(13)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thanh T�m t�n")
        	AddRecipe(234)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�ch Nh�t ��n")
        	AddRecipe(239)
        	Msg2Player("B�n h�c ���c ph�i ch�: �ch D��ng t�n")
        	AddRecipe(244)
        	Msg2Player("B�n h�c ���c ph�i ch�: Gi�i ��c ��n")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(9)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ho�n D��ng ��n")
        	AddRecipe(14)
        	Msg2Player("B�n h�c ���c ph�i ch�: �ch Kh� t�n")
        	AddRecipe(235)
        	Msg2Player("B�n h�c ���c ph�i ch�: To�n Sinh ��n")
        	AddRecipe(245)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ch� Th�y ��n")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(5)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�ch V�n t�n")
        	AddRecipe(240)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Kim t�n")
        	AddRecipe(246)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�i V�n ��n")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(10)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��i Ho�n ��n")
        	AddRecipe(15)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�c Linh t�n")
        	AddRecipe(236)
        	Msg2Player("B�n h�c ���c ph�i ch�: Chi�u H�n ��n")
        	AddRecipe(241)
        	Msg2Player("B�n h�c ���c ph�i ch�: B� Thi�n t�n")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(6)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n H��ng C�m T�c")
        	AddRecipe(11)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nh�t Nguy�n Ph�c Th�y ��n")
        	AddRecipe(237)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� D�ch ��n")
        	AddRecipe(247)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�n Nguy�n Ch�nh Kh� ��n")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(16)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� Hoa Ng�c L� Ho�n")
        	AddRecipe(7)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�c Ng�c �o�n T�c cao")
        	AddRecipe(12)
        	Msg2Player("B�n h�c ���c ph�i ch�: V�n V�t Quy Nguy�n ��n")
        	AddRecipe(242)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tr�ng Th�t Hoa t�n")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
	    	AddRecipe(17)
        	Msg2Player("B�n h�c ���c ph�i ch�: Sinh Sinh H�a T�n")
        	AddRecipe(238)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�n Tinh Nguy�t ��n")
        	AddRecipe(243)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��i Nh�t D��ng T�n")
        	AddRecipe(248)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n V��ng B� T�m ��n")
        	SetTask(LEV_LEARNRECIPE,80)
       	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(238)==0 then
        	AddRecipe(238)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�n Tinh Nguy�t ��n")
        	AddRecipe(243)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��i Nh�t D��ng T�n")
        	AddRecipe(248)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n V��ng B� T�m ��n")
    	else
        	Say (strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
      	end
    end
end;


--�Լ��ܵ�˵����Ϣ
function Weekend()
    if (GetLifeSkillLevel(1,6) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."Ph�a tr��c �ang chi�n tranh, ta s� truy�n cho v�i c�ch ch� thu�c �� ng��i l�m thu�c gi�p c�c binh s� tr� th��ng!")
    	AddRecipe(232)
    	Msg2Player("B�n �� h�c ph�i ph��ng m�i--Qu�n D�ng Y D��c!")
    else
    	Say(strTitle.."Ng��i ch�a h�c k� n�ng Ch� d��c ho�c th�i gian ch�a ��n, ta kh�ng th� truy�n th� ph��ng ph�p ph�i ch� cho ng��i.", 0)
    end
end

--ȡ������
function SayHello()
end

function NewLifeSkills()
	Talk(2, "",
		 strTitle.."X�a c� Can T��ng M�c T� x� th�n r�n ki�m. Ng��i mu�n ��c th�nh m�t m�n kh�i gi�p tuy�t th� ho�c th�n binh, cho d� ng��i c� ph�i ph��ng ��c nh�t v� nh� ch� d�a v�o nguy�n li�u ph� th�ng kh�ng th� l�m ra trang b� t�t. Trong qu� tr�nh l�m ng��i c�n ph�i cho v�o m�t s� <color=yellow>v�t li�u<color> v�i ch�ng lo�i v� s� l��ng kh�c nhau, nh� th� m�i c� th� l�m ra c�c ph�m. Ng��i h�y nh� t�i �a ch� c� th� th�m v�o <color=yellow>10 lo�i<color> v�t li�u.",
		 "���c r�i! L�o ��y tin r�ng ng��i �� hi�u bi�t ch�t �t v� k� n�ng s�n xu�t, m�i ng��i <color=yellow>ch� c� th� h�c m�t k� n�ng s�n xu�t<color>. Gi� ng��i h�y ��n <color=yellow>Tuy�n Ch�u t�m L� Phong Thu<color>, nguy�n nh�n th� ��n �� kh�c bi�t.")
	return
end;

