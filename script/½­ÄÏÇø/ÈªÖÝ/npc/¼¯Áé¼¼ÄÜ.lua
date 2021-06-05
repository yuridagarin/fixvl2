-- =========================================
-- File : XXX����XX�����鼼��.lua
-- Name : ����ѧϰ
-- ID   : 0, 7
-- =========================================

Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

-- == Ԥ�����һЩ�������ID =======================
ID_LEARNLIFESKILL		= 1925		-- �����������
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�������
LIFESKILL_STATE			= 1623		-- ѧϰ���鼼�ܱ��

-- == ȫ��ʹ�õ����� =======================
strName = ""
strTitle = ""


-- == Ĭ����ں��� =========================
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
	
	    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."��n <color=yellow>C�p 10<color> c� th� ��n <color=yellow>Th�nh ��<color> g�p <color=yellow>Du Ph��ng ��i phu<color> t�m hi�u <color=yellow>k� n�ng s�ng<color>!", 0)
        TaskTip("��n c�p 10 c� th� ��n Th�nh �� t�m Du Ph��ng ��i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu�n h�c T�p Linh �? Hi�n gi� ta ch�a th� d�y ���c.", 0)
    	return
    end;
	
	Say(strTitle.."Ta ph�t hi�n ra n�u d�ng huy�t d�ch v� kho�ng th�ch c� th� tinh ch� th�nh Linh Huy�t v� Linh Sa. Th� n�o, ng��i c� mu�n th� kh�ng?",
		6,
		"H�c K� n�ng T�p Linh/learn_magic_skill",
		"�i H�ng An l�nh (s� c�p)/goto_world_1",
		"�i H�i Ti�n l�nh (trung c�p)/goto_world_2",
		"�i Th��ng Long l�nh (cao c�p)/goto_world_3",
		--"�������鼼��/forget_life_skill",
		"Ta mu�n t�m hi�u nh�ng g� li�n quan ��n T�p Linh/magic_info",
       	"R�i kh�i/exit_dialog")
end;
	
-- == ʲô���������˳��Ի� ===================
function exit_dialog()
end;


-- == �����˽⼯��������Ϣ ===================
function magic_info()
	Say(strTitle.."T�p Linh l� k� n�ng l�m ra nguy�n li�u. Ch� y�u d�ng huy�t d�ch v� kho�ng th�ch �� tinh ch� Linh Huy�t v� Linh Sa. Ng��i c� th� ��n <color=yellow>ti�m t�p h�a<color> mua c�ng c� T�p Linh <color=yellow>s� c�p<color> sau �� ra ngo�i tinh luy�n. N�u mu�n ��n s�n L�nh nh� ��n <color=yellow>Ng� c�c<color> mua <color=yellow>Th�n N�ng ��n<color> mang theo.", 0)
end;


-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 7) > 0) then
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
			"Khoan ��! Ch� ta suy ngh� l�i!/exit_dialog")
	else
		Say(strTitle.."K� n�ng T�p Linh ng��i v�n ch�a h�c, ta kh�ng th� gi�p ���c ng��i.", 0)
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
	
	if (GetLifeSkillLevel(0, 7) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 7)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				Msg2Player("K� n�ng T�p Linh ng��i �� qu�n r�i")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;

-- -------------------------------ѧϰ�����-------------------------------
function learn_magic_skill()
    if (GetLevel() < 10) then
        Say (strTitle.."H�m� Th�n th� c�a ng��i c�n k�m l�m. H�y ra ngo�i th�nh tu luy�n ��n c�p 10 h�y ��n t�m ta!", 0)
		return
	end

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - �ո�
	if (GetLifeSkillLevel(0, 7) > 0) then
        Say (strTitle.."Ng��i �� h�c ���c k� n�ng T�p Linh!", 0)
		return
	end

	if GetLifeSkillsNum(0) >= 2 then
        Say (strTitle.."B�n �� h�c 2 K� n�ng thu th�p, kh�ng th� h�c th�m n�a!",0)
		return
	end

    Say(strTitle.."<color=yellow>K� n�ng T�p Linh<color> s� gi�p ng��i c� th�m nguy�n li�u, c� mu�n h�c kh�ng?",
    	2,
    	"Ta mu�n h�c/learn_yes",
    	"�� ta suy ngh� l�i/exit_dialog")
end;
--ѧϰ���鼼��
function learn_yes()
	if (GetLifeSkillLevel(0, 7) > 0) then
		Say (strTitle.."B�n �� h�c ���c k� n�ng T�p Linh!", 0)
	else
		if (LearnLifeSkill(0, 7, 1, 79, 0)) then
        	Msg2Player("B�n �� h�c ���c k� n�ng thu th�p: T�p Linh.")
    	end
	end
end;


-- ȷ��ȥ��Ӧ�һ��ص�
function goto_world_1()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>H�ng An L�nh<color> thu th�p kh�ng? N�i �� c� nhi�u <color=yellow>Chu Sa<color>, <color=yellow>H�c Khuy�n Linh Huy�t<color>, <color=yellow>Ph� th�ch c�c ��i m�n ph�i<color>, <color=yellow>��n Gi�p Th�<color> v� <color=yellow>Ph� th�ch c�c ��i th�nh th�<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>.",
		2,
		"Ta mu�n �i/#goto_world(710,1707,3385)",
		"Kh�ng �i ��u/exit_dialog")
end;
function goto_world_2()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>H�i Ti�n L�nh<color> thu th�p kh�ng? N�i �� c� nhi�u <color=yellow>B�ch Huy�t Sa<color>, <color=yellow>Thanh � Linh Huy�t<color>, <color=yellow>Ph� th�ch c�c ��i m�n ph�i<color> v� <color=yellow>��n Gi�p Th�<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>.",
		2,
		"Ta mu�n �i/#goto_world(715,1496,2998)",
		"Kh�ng �i ��u/exit_dialog")
end;
function goto_world_3()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Th��ng Long L�nh<color> thu th�p kh�ng? N�i �� c� nhi�u <color=yellow>Huy�n H�c Linh Huy�t<color> v� <color=yellow>Ph� th�ch c�c ��i m�n ph�i<color>. Nh� mang theo <color=yellow>Th�n N�ng ��n<color>!  ",
		2,
		"Ta mu�n �i/#goto_world(720,1705,3350)",
		"Kh�ng �i ��u/exit_dialog")
end;
-- ȥ��Ӧ�Ĺһ��ص�
function goto_world(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;

-- ��������Ʒ��ȼ���������Ӧ�ļ��鼼�ܵȼ�
function Learn_life_skill()
	Say(strTitle.."Ng��i l� �� t� c�aV�n Du ��o nh�n �? �� ta xem t�i ngh� ch� ph� c�a ng��i th� n�o tr��c khi truy�n k� n�ng T�p Linh. Nh�ng nh� l� ta ch� truy�n m�t l�n th�i ��y.",
		2,
		"Xin ki�m tra k� n�ng T�p Linh c�a t�i h�./Panduan_life_skill",
		"Kh�ng c�n ��u/exit_dialog")
end;


function Panduan_life_skill()

local nLifeLevel = GetLifeSkillLevel(1,8);

	if GetTask(LIFESKILL_STATE) == 1 then
		Say(strTitle.."Ng��i mau qu�n qu�! Ta �� d�y cho ng��i 1 l�n r�i, kh�ng ph�i d�y l�i l�n n�a ch�?", 0)
		return
	end

	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 1) then
			LearnLifeSkill(0, 7, nLifeLevel, 79, 0)
    	Msg2Player("B�n h�c ���c ph�i ch�: T�p Linh")
    	SetTask(LIFESKILL_STATE,1);
    else
       Say(strTitle.."Ng��i kh�ng ph�i l� ch� ph� s� ta kh�ng c�n c�ch n�o kh�c.", 0)
    end
   end
end