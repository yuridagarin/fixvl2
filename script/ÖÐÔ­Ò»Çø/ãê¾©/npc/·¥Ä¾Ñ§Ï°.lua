-- =========================================
-- File : ��ԭһ�����꾩����ľѧϰ.lua
-- Name : ��һ��
-- ID   : 0, 1
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL 	= 1925			-- �����������
TASK49_BEGGING    	= 1933			-- 49����������ʼ��ʾ
FORGETMAIN_NUM    	= 1940			-- ���������ܴ���
FORGETOHTER_NUM		= 1941			-- ���������ܴ���

strName = "";
strTitle = "";

--*****************************************MAIN����*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
	if random(1,30) == 1 then
		NpcChat(GetTargetNpc(),"Mu�n l�m v� kh� t�t c� linh kh�, ph�i d�ng nguy�n li�u t�t!");
	end;
	strName = GetTargetNpcName();
	if (strName=="" or strName==nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: ";
	
	-------------------------------------------��������-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."��n <color=yellow>C�p 10<color> c� th� ��n <color=yellow>Th�nh ��<color> g�p <color=yellow>Du Ph��ng ��i phu<color> t�m hi�u <color=yellow>k� n�ng s�ng<color>!", 0)
        TaskTip("��n c�p 10 c� th� ��n Th�nh �� t�m Du Ph��ng ��i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 3) then
        Talk(1, "QUSTION",strTitle.."Ng�u T� T� ph�i ng��i t�i ph�i kh�ng? T�t qu�! Mau gi�p ta gi�i ��p th�c m�c n�y!")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu�n h�c ��n c�y ph�i kh�ng? Hi�n ch�a ph�i l�c, ta kh�ng th� d�y ng��i.", 0)
    	return
    end;
    
	----------------------------------76�������䷽����----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail);
	local nTaskState_tieshan = GetTask(TASK_COOKING_TIESHAN);
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU);
		
	--���ϵ���Ⱦ�ľ����
	if nSkillGenre == 1 and nSkillDetail == 7 and nSkillLevel >= 79 then
		--��δ����һ���Ի�
		if nTaskState_tieshan == 2 then
			cooking_tieshan_005()
			return
		--���費Ѱ����ľм����������
		elseif nTaskState_tieshan == 3 then
			cooking_tieshan_006()
			return
		--δ���������ظ���Ϣ
		elseif nTaskState_tieshan == 4 then
			cooking_tieshan_007()
			return
		end
	end
		
	--�Ʒ�ϵ�����������
	if nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79 then
		--������ħ���
		if nTaskState_chiwu == 1 and GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) ~= 1 then
			juju_chiwu_003()
			return
		--δ������ľ�������ε���
		elseif nTaskState_chiwu == 2 or GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) == 1 and nTaskState_chiwu ~= 3 then
			juju_chiwu_004()
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
	Say(strTitle.."Chi�n s� di�n ra li�n mi�n nguy�n li�u g� cung �ng kh�ng k�p ��y ���c xem l� c� h�i t�t cho ch�ng ta l�m gi�u, th�ch kh�ng?",
		7,
		"H�c k� n�ng ��n c�y/luaLearnLifeSkill",
		"Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level",
		"�i H�ng An l�nh (s� c�p)/GotoWorld_Confirm1",
		"�i H�i Ti�n l�nh (trung c�p)/GotoWorld_Confirm2",
		"�i Th��ng Long l�nh (cao c�p)/GotoWorld_Confirm3",
		--"������ľ����/forget_life_skill",
		"T�m hi�u ��n c�y/Info",
		"R�i kh�i/Main_Exit")
end;


-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 1) > 0) then
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
		Say(strTitle.."Ng��i ch�a h�c k� n�ng ��n c�y? Ta kh�ng th� gi�p ng��i.", 0)
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
	
	if (GetLifeSkillLevel(0, 1) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 1)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(517, 0)
				Msg2Player("K� n�ng ��n c�y c�a b�n �� b�")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;


-- ѧϰ�����============================================================================
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H�m� Th�n th� c�a ng��i c�n k�m l�m. H�y ra ngo�i th�nh tu luy�n ��n c�p 10 h�y ��n t�m ta!", 0)
		return
	end

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - ��ľ
	if (GetLifeSkillLevel(0, 1) > 0) then
        Say (strTitle.."B�n �� h�c k� n�ng ��n c�y!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B�n �� h�c 2 K� n�ng thu th�p, kh�ng th� h�c th�m n�a!",0)
		return
	end

    Say(strTitle.."Ng��i mu�n h�c k� n�ng <color=yellow>��n c�y<color> ch�?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end

--ѧϰ����
function LearnYes()
	if (GetLifeSkillLevel(0, 1) > 0) then
		Say (strTitle.."B�n �� h�c k� n�ng ��n c�y!", 0)
	else
		if (LearnLifeSkill(0, 1, 1, 79, 0)) then
			AddItem(0, 200, 14, 1, 1)
        	Msg2Player("B�n �� h�c k� n�ng ��n c�y, nh�n ���c Thi�t ph�.")
    	end
	end
end
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."Ngh� k� r�i h�y ��n!", 0)
end


-- ȷ��ȥ��Ӧ�һ��ص�=========================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."Ng��i mu�n ��n<color=yellow>H�ng An L�nh<color> ��n c�y kh�ng? N�i �� c� nhi�u nhi�u <color=yellow>T�ng m�c<color>, <color=yellow>D��ng m�c<color>, <color=yellow>Sam m�c<color> v� <color=yellow>Thi�t m�c<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(710,1707,3385)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>H�i Ti�n L�nh<color> ��n c�y kh�ng? N�i �� c� nhi�u <color=yellow>Ng� ��ng<color>, <color=yellow>Tr�ng M�c<color> v� <color=yellow>Ch��ng m�c<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(715,1496,2998)",
		"Kh�ng �i ��u/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Th��ng Long L�nh<color> ��n c�y kh�ng? N�i �� c� nhi�u <color=yellow>Thi�t Tuy�n m�c<color>, <color=yellow>Ba La m�c<color> v� <color=yellow>��n m�c<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!  ",
		2,
		"Ta mu�n �i/#GotoWorld(720,1705,3350)",
		"Kh�ng �i ��u/Main_Exit");
end;
-- ȥ��Ӧ�Ĺһ��ص�
function GotoWorld(MapID, x, y)
		CleanInteractive();
		LeaveTeam();
		SetFightState(0);
		
		NewWorld(MapID,x,y);
end;

-- ���������Ϣ
function Info()
	Say(strTitle.."<color=yellow>��n c�y<color> l� m�t trong <color=yellow>6<color> k� n�ng thu th�p. H�c ���c k� n�ng n�y m�i nh�n ���c nguy�n li�u <color=yellow>ch� t�o v� kh�<color>. Ng��i c� th� ��n <color=yellow>ti�m t�p h�a<color> mua c�ng c� ��n c�y <color=yellow>s� c�p<color> sau �� ra ngo�i r�ng ��n c�y. N�u �i v�o nh�ng khu v�c quy ��nh c�n ��n <color=yellow>Ng� c�c<color> mua <color=yellow>Th�n N�ng ��n<color>.", 0);
end;

-- ʲôҲ�����Ŀպ���
function Main_Exit()
end;

--******************************************�������񲿷�*****************************************
function QUSTION()
		Say(strTitle.."C�u h�i 1: S� d�ng k� n�ng thu th�p b�ng c�ch n�o?",4,
		"1. M� giao di�n s� d�ng k� n�ng./QUS_ERROR",
		"2. T�i �i�m thu th�p m� giao di�n k� n�ng/QUS_ERROR",
		"3. C� c�ng c� t��ng �ng, t�i �i�m thu th�p m� giao di�n k� n�ng ho�c d�ng ph�m t�t thu th�p b�n d��i/QUS2_GOTO",
		"4. Xem nh� ta ch�a ��n qua!/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."C�u h�i 2: K� n�ng n�o sau ��y ���c xem thu th�p?",4,
		"1. H�i thu�c, Thu�c da, Ch� t�o binh kh� d�i, N�u n��ng, Luy�n b�a, ��n c�y, Canh t�c/QUS_ERROR",
		"2. ��n c�y, ��o kho�ng, Canh t�c, Thu�c da, H�i thu�c, K�o t�/QUS3_GOTO",
		"3. Ch� t�o binh kh� d�i, luy�n b�a, ch� t�o K� m�n binh kh�, ch� t�o binh kh� ng�n, n�u n��ng, ch� d��c, ch� t�o H� gi�p/QUS_ERROR",
		"4. Ch� t�o K� m�n binh kh�, ch� t�o binh kh� ng�n, n�u n��ng, ch� d��c, Thu�c da, H�i thu�c, K�o t�/QUS_ERROR")
end
function QUS3_GOTO()
		Say(strTitle.."C�u h�i 3: Mu�n c� nguy�n li�u l�m ��u b�p th� n�n l�m g�?",4,
		"1. Thu�c da/QUS_ERROR",
		"2. Canh t�c/QUS4_GOTO",
		"3. H�i thu�c/QUS_ERROR",
		"4. ��n c�y/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."C�u h�i 4: ��n c�y c�n �em theo g�?",4,
		"1. H�i th�nh ph�/QUS_ERROR",
		"2. H�i huy�t ��n/QUS_ERROR",
		"3. T�n g�u/QUS_ERROR",
		"4. Thi�t ph�/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."C�u h�i 5: Ta mu�n ��n m�t �t g�, th� n�i xem ta ��n trong bao l�u?",4,
		"1. 6 gi�/QUS_ERROR",
		"2. 8 gi�/QUS_ERROR",
		"3. 10 gi�/QUS_ERROR",
		"4. C� th� thu th�p th�i gian l�u h�n/QUS_PASS")
end

function QUS_PASS()
		Say(strTitle.."Gi�i qu�! �� hi�u c� b�n v� k� n�ng s�ng r�i ��! Gi� c� th� t�m c�c s� ph� h�c k� n�ng kh�c.",0)
		SetTask(ID_LEARNLIFESKILL,15)
		TaskTip("B�n c� th� ��n g�p c�c NPC h�c k� n�ng s�ng")
end

function QUS_ERROR()
		Say(strTitle.."Ng��i ch�a hi�u l�m th� ph�i! V� t�m <color=yellow>V�n Du ��o nh�n<color> th� xem!",0)
end

function update_max_skill_level()
	Say(strTitle..format("M� r�ng c�p k� n�ng s�n xu�t c�n k� n�ng thu th�p ��t c�p 79 ��ng th�i ti�u hao %d V�ng", 1000), 
		2, "��ng �/update_max_skill_level_ensure", "T�i h� ch� xem qua th�i/Main_Exit")
end

function update_max_skill_level_ensure()
	local nGen = 0;
	local nSkillId = 1;
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