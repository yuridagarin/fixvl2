-- =========================================
-- File : ��ԭ�������ɶ�����˿ѧϰ.lua
-- Name : �ƴ���
-- ID   : 0, 6
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- ���������ʾ�����ű��в��ĸ�ֵ��
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
	if random(1,30) == 1 then
		NpcChat(GetTargetNpc(),"Mu�n l�m c�ng c� ph�ng v� c� linh kh�, nh�t ��nh ph�i d�ng t� t�t m�i ���c!");
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
    

 ----------------------------------76�������䷽ɽʨ��Ƥ����----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI)
		
	if (nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79) then
		--��ƴ����Ի�
		if (nTaskState_shanshi == 4) then
			weave_shanshi_009()
			return
		--δ��ȥ�ظ�����
		elseif (nTaskState_shanshi == 5) then
			weave_shanshi_010()
			return
		end
	end
		
	--��ʾ���76�������䷽����
	if (nSkillGenre == 1 and nSkillDetail <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
		return
	end		

---------------------------------------------���Ի�-------------------------------------------
	Say(strTitle.."T�m ���c Thi�n T�m Ti l� l� t��ng duy nh�t c�a cu�c ��i ta, ��ng ti�c ta �� gi� r�i kh�ng th� tr�o ��o v��t su�i, ch� c� th� g�i g�m tr�ch nhi�m n�y cho b�n tr� c�c ng��i, mu�n h�c c�ch k�o t� kh�ng?",
		7,
		"��ng �/luaLearnLifeSkill",
		"Mu�n h�c k� n�ng cao c�p h�n/update_max_skill_level",
		"��n Kh�ng Tang s�n (s� c�p)/GotoWorld_Confirm1",
		"��n C�n Ng� s�n (trung c�p)/GotoWorld_Confirm2",
		"��n T� Tang s�n (cao c�p)/GotoWorld_Confirm3",
		--"������˿����/forget_life_skill",
		"T�m hi�u k�o t�/Info",
    	"R�i kh�i/Main_Exit")
end;


-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 6) > 0) then
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
		Say(strTitle.."Ng��i ch�a h�c k� n�ng k�o t�? Ta kh�ng th� gi�p ng��i!", 0)
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
	
	if (GetLifeSkillLevel(0, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("K� n�ng k�o t� c�a ng��i �� h�y")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;



------------------------------------------ ѧϰ�����--------------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H�m� Th�n th� c�a ng��i c�n k�m l�m. H�y ra ngo�i th�nh tu luy�n ��n c�p 10 h�y ��n t�m ta!", 0)
		return
	end

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - ��˿
	if (GetLifeSkillLevel(0, 6) > 0) then
        Say (strTitle.."B�n tr�! Ng��i �� h�c xong k� n�ng k�o t�!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B�n �� h�c 2 K� n�ng thu th�p, kh�ng th� h�c th�m n�a!",0)
		return
	end

	Say(strTitle.."Ng��i mu�n h�c k� n�ng <color=yellow>k�o t�<color>?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end;
--ѧϰ����
function LearnYes()
	if (GetLifeSkillLevel(0, 6) > 0) then
		Say (strTitle.."B�n �� h�c k� n�ng k�o t�!", 0)
	else
		if (LearnLifeSkill(0, 6, 1, 79, 0)) then
			AddItem(0, 200, 15, 1, 1)
        	Msg2Player("B�n �� h�c k� n�ng K�o t� v� nh�n ���c 1 Con thoi")
    	end
	end
end
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."Ngh� k� r�i h�y ��n!", 0)
end


---------------------------------- ȷ��ȥ��Ӧ�һ��ص�----------------------------------------
function GotoWorld_Confirm1()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Kh�ng Tang S�n<color> k�o t� �? N�i �� c� nhi�u <color=yellow>Th� <color>, <color=yellow>T�m<color>, <color=yellow>Ng� s�c tr�ng<color> v� <color=yellow>Lang Chu<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(712,1472,2918)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>C�n Ng� S�n<color> k�o t� �? N�i �� c� nhi�u <color=yellow>Huy�t t�m<color>, <color=yellow>Linh Chu<color> v� <color=yellow>Kim t�<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(717,1736,2906)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."B�y gi� ng��i mu�n ��n <color=yellow>T� Tang s�n<color> k�o t� �? � �� c� r�t nhi�u <color=yellow>L�nh Tr�ng<color>, <color=yellow>Thi�n T�m<color> v� <color=yellow>Th� V�n<color>, ng��i ph�i d�ng <color=yellow>Th�n N�ng ��n<color> m�i c� th� k�o t�.",
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
	Say(strTitle.."<color=yellow>K�o t�<color> l� m�t trong <color=yellow>6<color> k� n�ng thu th�p c�a h� th�ng k� n�ng s�ng, sau khi h�c k� n�ng n�y nh�n ���c nguy�n li�u <color=yellow>ch� �o<color>. Ng��i c� th� ��n <color=yellow>ti�m t�p h�a<color> mua d�ng c� thu�c da <color=yellow>s� c�p<color> sau �� b�t ��u k�o t�. N�u mu�n l�n n�i k�o t� ph�i v�o <color=yellow>Ng� c�c<color> mua <color=yellow>Th�n N�ng ��n<color> s� d�ng m�i ���c.", 0)
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
	local nSkillId = 6;
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

