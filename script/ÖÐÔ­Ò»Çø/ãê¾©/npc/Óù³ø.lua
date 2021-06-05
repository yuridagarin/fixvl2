-- =========================================
-- File : ��ԭһ�����꾩������.lua
-- Name : ����
-- ID   : 1, 7
-- =========================================
Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�������
LEVELTASKID49			= 516		-- ����������
TASKID_LIFESKILL_FLG	= 1932		-- 49������������
TASK_GATHER_FLAG		= 1931 		-- ������Ʒ�ɼ���ʾ
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
	Say (strTitle.."Ta l� ��u b�p n�i ti�ng trong thi�n h�, ng��i b�n tr� c�n gi�p g� kh�ng?",
	4,
	"H�c k� n�ng n�u n��ng/luaLearnLifeSkill",
	"H�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�/learn_all_recipe",
	"B� k� n�ng n�u n��ng/forget_life_skill",
	"R�i kh�i/SayHello11")
end;


-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."Ng��i mu�n h�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�?",
		6,
		"H�c c�ch ph�i ch� m�i/luaLearnRecipe",
		"H�c c�ch ph�i ch� d�nh cho ho�t ��ng cu�i tu�n/Weekend",
		"Xem nh�n ���c nhi�m v� v� kh� c�p 76 kh�ng/get_76_task",
		"H�c c�ch ph�i ch� c�p 76/relearn_76_recipe",
		"H�c s�a ph�i ch�/Reset_Learn",
		"R�i kh�i/SayHello11")
end;


-- ����76���䷽����
function get_76_task()
	----------------------------------76�������䷽���Ⱦ�ľ����----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail);
	local nTaskState_tieshan = GetTask(TASK_COOKING_TIESHAN)
		
	if nSkillGenre == 1 and nSkillDetail == 7 and nSkillLevel >= 79 then
		--��δ�����䷽����
		if nTaskState_tieshan == 0 then
			cooking_tieshan_001()
			return
		--�Ͻ��Ʋ�
		elseif nTaskState_tieshan == 1 then
			cooking_tieshan_002()
			return
		--δ����һ���Ի�
		elseif nTaskState_tieshan == 2 then
			cooking_tieshan_004()
			return
		--�Ͻ���ȻԭƤ������ľѧ�����Ⱦ�ľ�䷽
		elseif nTaskState_tieshan == 4 then
			cooking_tieshan_008()
			return
		end 
	end
		
	--��ʾ���76�������䷽����
	if (nSkillGenre == 1 and nSkillDetail ~= 7 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
	end	
	
	Say("B�n ch�a �� �i�u ki�n nh�n nhi�m v� ph�i ch� c�p 76.", 0)
end;



-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 7)
	if (nGene == 1 and nSkillID == 7) then
		if (GetTask(1603) == 5 and nLevel >= 79) then
			AddRecipe(806)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Phi�n Tinh M�c")
		else
			Say("B�n ch�a l�m nhi�m v� ph�i ch� n�u n��ng c�p 76!", 0)
		end
	else
		Say("B�n ch�a h�c k� n�ng <color=yellow>N�u n��ng<color>!", 0)
	end
end;

-- ���������
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 7) then
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
		Say(strTitle.."Ng��i ch�a h�c k� n�ng n�u n��ng? Ta kh�ng th� gi�p ng��i!", 0)
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
	if (nGene == 1 and nSkillID == 7) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 7)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
        		SetTask(RESET_ERROR,0)
        		SetTask(1603,0);					--���79�������䷽����
				Msg2Player("B�n �� b� k� n�ng n�u n��ng")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;

------------------------------------------ʱ���ж��ű�----------------------------------------
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
	end;
end;   


--**********************************************������Ϣ****************************************
function Dating()
    Say (strTitle.."B�n tr�! N�u n��ng kh�ng d� ch�t n�o ��u!",0)
end


--**********************************************����ѧϰ����***************************************
--����ѧϰѡ��
function luaLearnLifeSkill()
	local nGene,nSKIllId = GetMainLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.", 0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."B�ng h�u �� h�c k� n�ng s�n xu�t, mu�n h�c k� n�ng m�i c�n ph�i b� k� n�ng c�.", 0)
    	return
    end
   
	Say(strTitle.."B�ng h�u mu�n h�c k� n�ng <color=yellow>N�u n��ng<color> ch�?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end
--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
		if LearnLifeSkill(1, 7, 1, 79, 1) then
			Msg2Player("B�n h�c ���c k� n�ng n�u n��ng, nh�n ���c nguy�n li�u s� c�p.")
			AddItem(1, 3, 19, 9)
			AddItem(1, 3, 9, 6)
	    end
	    
	    AddRecipe(18)
	    Msg2Player("B�n h�c ���c ph�i ch�: C�m n�m")
	    AddRecipe(25)
	    Msg2Player("B�n h�c ���c ph�i ch�: Thi�u �ao t�")
	    SetTask(LEV_LEARNRECIPE, 10)
	    
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."H�y suy ngh� k� r�i quay l�i ��y nh�!",0)
end



--**********************************************�䷽ѧϰ����***************************************
--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 7)
	if (nLevel >= 1) then 
		if (GetTask(LEV_LEARNRECIPE) >= 20 and HaveLearnRecipe(215) == 0) then
			AddRecipe(215)
        	Msg2Player("B�n h�c ���c ph�i ch�: M�ng x�o")
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
        	AddRecipe(18)
	    	Msg2Player("B�n h�c ���c ph�i ch�: C�m n�m")
	    	AddRecipe(25)
	    	Msg2Player("B�n h�c ���c ph�i ch�: Thi�u �ao t�")
	    	SetTask(LEV_LEARNRECIPE, 10)
    	elseif (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
        	AddRecipe(19)
        	Msg2Player("B�n h�c ���c ph�i ch�: M�n th�u")
        	AddRecipe(26)
        	Msg2Player("B�n h�c ���c ph�i ch�: N� Nhi h�ng")
        	AddRecipe(215)
        	Msg2Player("B�n h�c ���c ph�i ch�: M�ng x�o")
        	SetTask(LEV_LEARNRECIPE, 20)
    	elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
        	AddRecipe(22)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� Qu� ��u")
        	SetTask(LEV_LEARNRECIPE, 30)
    	elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
        	AddRecipe(20)
        	Msg2Player("B�n h�c ���c ph��ng ph�p l�m B�nh x�p")
        	AddRecipe(27)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��o Hoa h��ng")
        	SetTask(LEV_LEARNRECIPE, 40)
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(23)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��u x�o")
        	SetTask(LEV_LEARNRECIPE, 50)
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(21)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�nh bao th�t")
        	AddRecipe(28)
        	Msg2Player("B�n h�c ���c ph�i ch�: T�y M�ng t�u")
        	SetTask(LEV_LEARNRECIPE, 60)
        elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(24)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�i x�o t�i")
        	SetTask(LEV_LEARNRECIPE, 70)
        elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 70) then
    	  	AddRecipe(218)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�m chi�n tr�ng")
        	SetTask(LEV_LEARNRECIPE, 80)
        else 
        	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
    	end
    end
end;

--�޸��䷽
function Reset_Learn()
	if (GetLifeSkillLevel(1, 7) >= 1) then
		SetTask(LEV_LEARNRECIPE, 0)
		Talk(1, "", strTitle.."Ph�i ch� c�a ng��i �� ���c tu s�a, m�i 10 c�p c� th� h�c c�ch ph�i ch� m�i.")
		return	
	else
		Talk(1, "", strTitle.."��ng h�ng g�t ta!")
	end
end

--��ĩ�
function Weekend()
	if (GetLifeSkillLevel(1,7) >= 1 and 
		(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Say(strTitle.."D�ng ph��ng ph�p ph�i ch� ��c bi�t c�a ta c� th� l�m ���c nhi�u l��ng th�c cung c�p cho ti�n tuy�n!", 0)
    	AddRecipe(233)
    	Msg2Player("B�n h�c ���c c�ch ph�i ch� m�i - L��ng th�c qu�n d�ng!")
    else
    	Say(strTitle.."Ng��i ch�a h�c k� n�ng n�u n��ng ho�c ch�a ��n gi�, ta kh�ng th� truy�n th�.", 0)
    end
end

--************************************************ͨ�ô���**************************************
--�պ���
function SayHello()	
end
