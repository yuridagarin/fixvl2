-- =========================================
-- File : ��ԭ�������ɶ����ո�ѧϰ.lua
-- Name : �����
-- ID   : 0, 3
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �����������
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
	if (GetTask(ID_LEARNLIFESKILL) < 1) then
        Say(strTitle.."��n <color=yellow>C�p 10<color> c� th� ��n <color=yellow>Th�nh ��<color> g�p <color=yellow>Du Ph��ng ��i phu<color> t�m hi�u <color=yellow>k� n�ng s�ng<color>!", 0)
        TaskTip("��n c�p 10 c� th� ��n Th�nh �� t�m Du Ph��ng ��i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 1) then
        Talk(1, "QUSTION",strTitle.."Ng��i �� ��n r�i, kh�o nghi�m th�i")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu�n h�c k� n�ng canh t�c �? Ch�a ��n l�c d�y cho ng��i ��u!", 0)
    	return
    end
    
	----------------------------��ʾ���76�������䷽����--------------------------
	local nGene, nSkillID = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nGene, nSkillID)
	if (nGene == 1 and nSkillID <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillID)
		return
	end
	
	---------------------------------------------���Ի�------------------------------------------
	Say(strTitle.."G�n ��y ho�ng th��ng ban th�nh ch�, mu�n gia t�ng ph�t tri�n canh t�c! Sao? Ng��i c� mu�n tham gia ��i qu�n canh n�ng?",
		6,
		"H�c k� n�ng canh t�c/luaLearnLifeSkill",
		"��n Thanh Th�y th�n (s� c�p)/GotoWorld_Confirm1",
		"��n Doanh D�n th�n (trung c�p)/GotoWorld_Confirm2",
		"��n Lam Nh�c th�n (cao c�p)/GotoWorld_Confirm3",
		--"�����ո�����/forget_life_skill",
		"Ta mu�n t�m hi�u th�ng tin canh t�c/Info",
       	"R�i kh�i/Main_Exit"
		);

end;


-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 3) > 0) then
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
		Say(strTitle.."Ng��i kh�ng h�c k� n�ng canh t�c sao? Ta kh�ng th� gi�p g� cho ng��i!", 0)
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
	
	if (GetLifeSkillLevel(0, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(516, 0)
				Msg2Player("K� n�ng canh t�c c�a ng��i �� b� h�y b�.")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;


-- -------------------------------ѧϰ�����-------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."H�m� Th�n th� c�a ng��i c�n k�m l�m. H�y ra ngo�i th�nh tu luy�n ��n c�p 10 h�y ��n t�m ta!", 0)
		return
	end

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - �ո�
	if (GetLifeSkillLevel(0, 3) > 0) then
        Say (strTitle.."B�n tr�! Ng��i �� h�c ���c t�t c� k� n�ng canh t�c!", 0)
		return
	end

    Say(strTitle.."<color=yellow>Canh t�c<color> s� l� k� n�ng thu th�p m�i c�a b�n. B�n c� mu�n h�c kh�ng?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end;
--ѧϰ����
function LearnYes(MaxLvl,nMain)
	if (GetLifeSkillLevel(0, 3) > 0) then
		Say (strTitle.."B�n �� h�c t�t c� k� n�ng Canh t�c!", 0)
	else
		if (LearnLifeSkill(0, 3, 1, 79, 0)) then
			AddItem(0, 200, 13, 1, 1)
        	Msg2Player("B�n �� h�c ���c k� n�ng thu th�p: Canh t�c. Nh�n ���c Cu�c")
    	end
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."Ngh� k� r�i h�y ��n!",0)
end



-- ȷ��ȥ��Ӧ�һ��ص�
function GotoWorld_Confirm1()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Thanh Th�y Th�n<color> canh t�c �? N�i �� c�  <color=yellow>Quang Th�ng Ma<color>, <color=yellow>M�c nh�<color>, <color=yellow>Khuynh ly ��u<color>, <color=yellow>Th�ch khu�n<color>, <color=yellow>Nhi�u minh ��u<color>, <color=yellow>M�ng tr�c<color>, <color=yellow>Dung tr�ch c�c<color> v� <color=yellow>H� ti�u<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(713,1477,2948)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Doanh D�n Th�n<color> canh t�c �? N�i �� c� nhi�u <color=yellow>M�a<color>, <color=yellow>Di�n Tinh M�ch<color> v� <color=yellow>Thu�n h�a m�ch<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(718,1708,3405)",
		"Kh�ng �i ��u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Lam Nh�c Th�n<color> canh t�c �? N�i �� c� nhi�u <color=yellow>Du long t�c<color>, <color=yellow>Ph�ng Quan T�c<color> v� <color=yellow>Dao Chi T�c<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(723,1700,3448)",
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
	Say(strTitle.."<color=yellow>Canh t�c<color>l� m�t trong <color=yellow>6<color> k� n�ng thu th�p, h�c ���c k� n�ng n�y m�i c� ���c nguy�n li�u <color=yellow>N�u n��ng<color>. Ng��i c� th� ��n <color=yellow>ti�m t�p h�a<color> mua c�ng c� canh t�c <color=yellow>s� c�p<color> sau �� ra ngo�i canh t�c. N�u mu�n ��n c�c th�n quy ��nh nh� ��n <color=yellow>Ng� c�c<color> mua <color=yellow>Th�n N�ng ��n<color> mang theo.", 0)
end;
-- ʲôҲ�����Ŀպ���
function Main_Exit()
end;


--******************************************�������񲿷�*****************************************
--�����������⺯��
function QUSTION()
		Say(strTitle.."C�u h�i th� 1: Kh�o nghi�m n�m b�t v� thuy�t minh s� d�ng k� n�ng s�n xu�t?",4,
		"1. M� giao di�n s� d�ng k� n�ng./QUS_ERROR",
		"2. H�c xong c�ch ph�i ch� m�i m� giao di�n s� d�ng k� n�ng./QUS_ERROR",
		"3. H�c ���c c�ch gh�p, t�p h�p �� v�t li�u c�n thi�t, sau �� m� giao di�n s� d�ng k� n�ng./QUS2_GOTO",
		"4. Ng��i �ang xem th��ng tr� tu� c�a ta �?/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."C�u h�i th� 2: Lo�i n�o d��i ��y l� k� n�ng s�n xu�t?",4,
		"1. H�i thu�c, Thu�c da, Ch� t�o binh kh� d�i, N�u n��ng, Luy�n b�a, ��n c�y, Canh t�c/QUS_ERROR",
		"2. ��n c�y, ��o kho�ng, Canh t�c, Thu�c da, H�i thu�c, K�o t�/QUS_ERROR",
		"3. Ch� t�o binh kh� d�i, luy�n b�a, ch� t�o K� m�n binh kh�, ch� t�o binh kh� ng�n, n�u n��ng, ch� d��c, ch� t�o H� gi�p/QUS3_GOTO",
		"4. Ch� t�o K� m�n binh kh�, ch� t�o binh kh� ng�n, n�u n��ng, ch� d��c, Thu�c da, H�i thu�c, K�o t�/QUS_ERROR")
end

function QUS3_GOTO()
		Say(strTitle.."C�u h�i th� 3: S� tr��ng c�a L�u Nh�t Ph� b�ng h�u ta l� ��n c�y, v�y v�t li�u h�n l�y ���c d�ng l�m g�?",4,
		"1. Ch� t�o binh kh� d�i v� H� gi�p/QUS_ERROR",
		"2. N�u n��ng v� Ch� t�o k� m�n binh kh�/QUS_ERROR",
		"3. Ch� t�o k� m�n binh kh� v� binh kh� ng�n/QUS4_GOTO",
		"4. Ch� t�o h� gi�p v� luy�n b�a/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."Ta mu�n m�t m�nh chu du thi�n h�, t� gi�m ��nh trang b� cho m�nh. V�y nh�ng k� n�ng n�y h�c � ��u?",4,
		"1. Ch� t�o h� gi�p/QUS_ERROR",
		"2. Ch� d��c/QUS_ERROR",
		"3. N�u n��ng/QUS_ERROR",
		"4. Luy�n b�a/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."C�u h�i th� 5: Trong qu� tr�nh ch� t�o v� kh� c� th� th�m v�o c�c v�t li�u l�m m�nh th�m t�nh n�ng c�a v� kh�. Xin h�i c� th� th�m v�o t�i �a bao nhi�u lo�i v�t li�u?",4,
		"1. 6 lo�i/QUS_ERROR",
		"2. 8 lo�i/QUS_ERROR",
		"3. 10 lo�i/QUS_PASS",
		"4. 12 lo�i/QUS_ERROR")
end
function QUS_PASS()
		Say(strTitle.."B�ng h�u qu� nhi�n phi ph�m. Ti�p theo, h�y ��n <color=yellow>Bi�n Kinh<color> t�m <color=yellow>V�n Du ��o nh�n<color> c� v�i v�n �� mu�n th�nh gi�o!",0)
		SetTask(ID_LEARNLIFESKILL,2)
		TaskTip("T�m V�n Du ��o nh�n � Bi�n Kinh")
end
function QUS_ERROR()
		Say(strTitle.."Xem ra ng��i ch�a hi�u g� v� k� n�ng s�n xu�t. H�y ��n th�nh gi�o <color=yellow>Du Ph��ng ��i phu<color> �i!",0)
end

