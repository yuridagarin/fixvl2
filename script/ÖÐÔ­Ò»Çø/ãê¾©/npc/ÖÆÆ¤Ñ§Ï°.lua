-- =========================================
-- File : ��ԭһ�����꾩����Ƥѧϰ.lua
-- Name : ���Ի�
-- ID   : 0, 2
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �䷽ѧϰ�������
LEVELTASKID49			= 518		-- ��������ȹ
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

	
 ------------------------------------------��ʾ���76�������䷽����-------------------------
 	local nGene, nSKIllId = GetMainLifeSkill()
 	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nSKIllId <= 8 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId)
		return
	end
	
---------------------------------------------���Ի�-------------------------------------------
	Say(strTitle.."Ngh� n�y c�n giao ti�p v�i mu�n th�, s�ng gi� tuy l�n nh�ng ph�n th��ng b�o ��p c�ng kh�ng nh�. Mu�n h�c thu�c da kh�ng?",
		7,
		"H�c k� n�ng thu�c da/luaLearnLifeSkill",
		"Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level",
		"��n Kh�ng Tang s�n (s� c�p)/GotoWorld_Confirm1",
		"��n C�n Ng� s�n (trung c�p)/GotoWorld_Confirm2",
		"��n T� Tang s�n (cao c�p)/GotoWorld_Confirm3",
		--"������Ƥ����/forget_life_skill",
		"T�m hi�u thu�c da/Info",
		"R�i kh�i/Main_Exit")
end;



-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 2) > 0) then
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
		Say(strTitle.."Ng��i ch�a h�c k� n�ng thu�c da, ta kh�ng th� gi�p ng��i!", 0)
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
	
	if (GetLifeSkillLevel(0, 2) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 2)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("B�n �� b� k� n�ng thu�c da")				
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

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - ��Ƥ
	if (GetLifeSkillLevel(0, 2) > 0) then
        Say (strTitle.."Ng��i h�c ���c k� n�ng thu�c da!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B�n �� h�c 2 K� n�ng thu th�p, kh�ng th� h�c th�m n�a!",0)
		return
	end

	Say(strTitle.."B�ng h�u mu�n h�c k� n�ng <color=yellow>thu�c da<color> ch�?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end;
--ѧϰ����
function LearnYes()
	if (GetLifeSkillLevel(0, 2) > 0) then
		Say (strTitle.."B�n h�c ���c k� n�ng thu�c da!", 0)
	else
		if (LearnLifeSkill(0, 2, 1, 79, 0)) then
			AddItem(0, 200, 12, 1, 1)
        	Msg2Player("B�n h�c ���c k� n�ng thu�c da, nh�n ���c Ch� B� �ao.")
    	end
	end
end
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."H�y suy ngh� k� r�i quay l�i ��y nh�!",0)
end



-- ȥ��Ӧ�һ��ص�
function GotoWorld_Confirm1()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Kh�ng Tang S�n<color> thu�c da kh�ng? N�i �� c� nhi�u nhi�u <color=yellow>S�i<color>, <color=yellow>H�<color>, <color=yellow>R�n<color> v� <color=yellow>C�o<color>, ng��i n�n s� d�ng <color=yellow>Th�n N�ng ��n<color> m�i c� th� thu�c da.",
		2,
		"Ta mu�n �i/#GotoWorld(712,1472,2918)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>C�n Ng� S�n<color> thu�c da kh�ng? N�i �� c� nhi�u nhi�u <color=yellow>B�ch h�<color>, <color=yellow>G�u<color> v� <color=yellow>Loan �i�u<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(717,1736,2906)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng��i mu�n �i <color=yellow>T� Tang s�n<color> thu�c da ph�i kh�ng? � �� c� r�t nhi�u <color=yellow>s� t�<color>, <color=yellow>Chu T��c<color> v� <color=yellow>Linh Ngao<color> xu�t hi�n, nh� k� ng��i ph�i s� d�ng <color=yellow>Th�n N�ng ��n<color> m�i c� th� thu�c da.",
		2,
		"Ta mu�n �i/#GotoWorld(722,1748,3420)",
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
	Say(strTitle.."<color=yellow>Thu�c da<color> l� m�t trong <color=yellow>6<color> k� n�ng thu th�p. H�c ���c k� n�ng n�y m�i c� ���c nguy�n li�u <color=yellow>ch� y<color>. Ng��i c� th� ��n <color=yellow>ti�m t�p h�a<color> mua c�ng c� thu�c da <color=yellow>s� c�p<color> sau �� ra ngo�i ��nh th�. Mu�n v�o c�c khu v�c quy ��nh c�n ��n <color=yellow>Ng� c�c<color> mua <color=yellow>Th�n N�ng ��n<color>.", 0)
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
	local nSkillId = 2;
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
