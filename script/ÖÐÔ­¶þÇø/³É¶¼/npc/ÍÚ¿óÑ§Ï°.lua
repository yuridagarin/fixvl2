-- =========================================
-- File : ��ԭ�������ɶ����ڿ�ѧϰ.lua
-- Name : ����
-- ID   : 0, 5
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �䷽ѧϰ�������
LEVELTASKID49			= 517		-- ������������
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
    
    
	----------------------------------76�������䷽����----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU)
	
	--��ҩϵ���پ�ʯ�䷽����
	if (nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79) then
		--�����ɫ��ĩ
		if (nTaskState_heiwu == 2) then
			medicine_heiwu_005()
			return
		--δȥ��Ī��
		elseif (nTaskState_heiwu == 3) then
			medicine_heiwu_006()
			return
		--δ����ʯ�����η�ҽ��
		elseif (nTaskState_heiwu == 4) then
			medicine_heiwu_007()
			return
		end
	end
	
	--�Ʒ�ϵ�����������
	if (nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79) then
		--������ħ���
		if (nTaskState_chiwu == 1 and 
			GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) ~= 1) then
			juju_chiwu_005()
			return
		--δ������ʯ�������ε���
		elseif (nTaskState_chiwu == 2 or 
				GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) == 1 and 
				nTaskState_chiwu ~= 3) then
			juju_chiwu_006()
			return
		end
	end
		
	--��ʾ���76�������䷽����
	if (nSkillGenre == 1 and nSkillDetail <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then
		weapon_76_recipe_tip(nSkillDetail)
		return
	end	
	
---------------------------------------------���Ի�-------------------------------------------
	Say(strTitle.."B�n tr�! Th�y ng��i th�n th� tr�ng ki�n, ti�n ph��ng �ang c�n nhi�u binh kh�, hay l� h�y theo ta c�ng h�p s�c b�o qu�c!",
		7,
		"H�c k� n�ng ��o kho�ng/luaLearnLifeSkill",
		"Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level",
		"��n Th�ch M�n ��ng (s� c�p)/GotoWorld_Confirm1",
		"��n Linh Nham ��ng (trung c�p)/GotoWorld_Confirm2",
		"��n Huy�n Tinh ��ng (cao c�p)/GotoWorld_Confirm3",
		--"�����ڿ���/forget_life_skill",
		"Ta mu�n t�m hi�u th�ng tin li�n quan ��o kho�ng/Info",
    	"R�i kh�i/Main_Exit")
end;



-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 5) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- ������
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."��y l� l�n th� "..(nForgetTimes + 1)..", ng��i h�y k� n�ng thu th�p, ta ph�i thu"..nShouldPay.." l��ng, ng��i suy ngh� k� ch�a?",
			2,
			"Ta �� quy�t ��nh r�i!/forget_now",
			"Khoan ��! Ch� ta suy ngh� l�i!/SayHello")
	else
		Say(strTitle.."Ng��i �� h�c k� n�ng ��o kho�ng? Ta kh�ng th� gi�p ng��i.", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- ������
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
				Msg2Player("K� n�ng ��o kho�ng c�a b�n �� h�y")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;




--**********************************************����ѧϰ����***************************************
-- ѧϰ�����
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H�m� Th�n th� c�a ng��i c�n k�m l�m. H�y ra ngo�i th�nh tu luy�n ��n c�p 10 h�y ��n t�m ta!", 0)
		return
	end

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - �ڿ�
	if (GetLifeSkillLevel(0, 5) > 0) then
        Say (strTitle.."B�n tr�! Ng��i �� h�c ���c k� n�ng ��o kho�n.", 0)
		return
	end
	
	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B�n �� h�c 2 K� n�ng thu th�p, kh�ng th� h�c th�m n�a!",0)
		return
	end

    Say(strTitle.."<color=yellow>��o kho�ng<color> s� l� k� n�ng thu th�p m�i c�a ng��i, ng��i x�c nh�n mu�n h�c?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end;
--ѧϰ����
function LearnYes()
	if (GetLifeSkillLevel(0, 5) > 0) then
		Say (strTitle.."B�n �� h�c k� n�ng ��o kho�ng!", 0)
	else
		if (LearnLifeSkill(0, 5, 1, 79, 0)) then
			AddItem(0, 200, 11, 1, 1)
        	Msg2Player("B�n �� h�c ���c k� n�ng thu th�p: ��o kho�ng. Nh�n ���c Cu�c chim.")
    	end
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."Ngh� k� r�i h�y ��n!", 0)
end



-- ȷ��ȥ��Ӧ�һ��ص�
function GotoWorld_Confirm1()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Th�ch M�n ��ng<color> ��o kho�ng �? N�i �� c� <color=yellow>Tinh Thi�t<color>, <color=yellow>B�ch luy�n c��ng<color>, <color=yellow>� kim<color> v� <color=yellow>H�n thi�t<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(711,1728,3383)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Linh Nham ��ng<color> ��o kho�ng �? N�i �� c� <color=yellow>Th�i b�ch tinh kim<color>, <color=yellow>Huy�n thi�t<color> v� <color=yellow>Thi�n Thanh<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(716,1694,3032)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Huy�n Tinh ��ng<color> ��o kho�ng �? N�i �� c� <color=yellow>H�c � th�ch<color>, <color=yellow>X�ch thi�t<color> v� <color=yellow>V�n m�u<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(721,1688,3333)",
		"Kh�ng �i ��u/Main_Exit")
end;
-- ȥ��Ӧ�Ĺһ��ص�
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;


-- ���������Ϣ
function Info()
	Say(strTitle.."<color=yellow>��o kho�ng<color> l� m�t trong <color=yellow>6<color> k� n�ng thu th�p, h�c ���c k� n�ng n�y m�i c� ���c nguy�n li�u <color=yellow>ch� t�o v� kh�<color>. Ng��i c� th� ��n <color=yellow>ti�m t�p h�a<color> mua c�ng c� ��o kho�ng <color=yellow>s� c�p<color>, sau �� ra ngo�i ��o kho�ng. N�u mu�n v�o khu v�c khai kho�ng nh� ��n <color=yellow>Ng� c�c<color> mua <color=yellow>Th�n N�ng ��n<color> mang theo.", 0)
end;
-- ʲôҲ�����Ŀպ���
function Main_Exit()
end;

function update_max_skill_level()
	Say(strTitle..format("M� r�ng c�p k� n�ng s�n xu�t c�n k� n�ng thu th�p ��t c�p 79 ��ng th�i ti�u hao %d V�ng", 1000), 
		2, "��ng �/update_max_skill_level_ensure", "T�i h� ch� xem qua th�i/Main_Exit")
end

function update_max_skill_level_ensure()
	local nGen = 0;
	local nSkillId = 5;
	local nMaxLevel = GetLifeSkillMaxLevel(nGen, nSkillId);
	if nMaxLevel > 79 then
		Talk(1,"",format("Hi�n t�i c�p k� n�ng thu th�p �� ��t gi�i h�n c�p %d", nMaxLevel))
		return 0;
	end
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("Hi�n t�i c�p k� n�ng thu th�p ch�a ��t c�p %d, kh�ng th� m� r�ng c�p gi�i h�n k� n�ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng�n l��ng kh�ng �� %d v�ng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	Msg2Player("Ch�c m�ng c�p gi�i h�n k� n�ng thu th�p �� ��t c�p 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

