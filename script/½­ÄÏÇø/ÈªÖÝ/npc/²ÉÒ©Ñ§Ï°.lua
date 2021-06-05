-- =========================================
-- File : ��ԭһ�����꾩����ҩѧϰ.lua
-- Name : ��ҩʦ
-- ID   : 0, 4
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL	= 1925		-- �䷽ѧϰ�������
LEVELTASKID49		= 516		-- ����ת���
TASK49_BEGGING		= 1933		-- 49����������ʼ��ʾ
FORGETMAIN_NUM		= 1940		-- ���������ܴ���
FORGETOHTER_NUM		= 1941		-- ���������ܴ���

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
    
	--��ʾ���76�������䷽����
	local nGene,nSKIllId = GetMainLifeSkill()
	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId);
		return
	end	

---------------------------------------------���Ի�-------------------------------------------
    Say(strTitle.."N�m nay chi�n lo�n li�n mi�n, giang h� hi�m �c. Bi�t ch�t y thu�t c� th� t� lo cho m�nh v� gi�p �� ng��i kh�c! Th�t l� nh�t c� l��ng ti�n!",
		6,
		"H�c k� n�ng h�i thu�c./luaLearnLifeSkill",
		"��n Nam H�e c�c (s� c�p)/GotoWorld_Confirm1",
		"��n H�m U c�c (trung c�p)/GotoWorld_Confirm2",
		"��n Hi�n Vi�n c�c (cao c�p)/GotoWorld_Confirm3",
		--"������ҩ����/forget_life_skill",
		"Ta mu�n t�m hi�u tin t�c v� h�i thu�c./Info",
		"R�i kh�i/Main_Exit");
end;

-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(0, 4) > 0) then
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
		Say(strTitle.."Ng��i ch�a h�c k� n�ng h�i thu�c, ta kh�ng th� gi�p ng��i!", 0)
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
	
	if (GetLifeSkillLevel(0, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 4)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("Ng��i �� h�y k� n�ng h�i thu�c.")				
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

	-- �ж��Ƿ��Ѿ�ѧ���˲ɼ����� - ��ҩ
	if (GetLifeSkillLevel(0, 4) > 0) then
        Say (strTitle.."B�n tr�! Ng��i �� h�c ���c t�t c� k� n�ng h�i thu�c!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B�n �� h�c 2 K� n�ng thu th�p, kh�ng th� h�c th�m n�a!",0)
		return
	end
	
	Say(strTitle.."<color=yellow>H�i thu�c<color> s� l� k� n�ng thu th�p m�i c�a ng��i! Ng��i c� mu�n h�c kh�ng?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end;
--ѧϰ����
function LearnYes()
	if (GetLifeSkillLevel(0, 4) > 0) then
		Say (strTitle.."Ng��i �� h�c ���c t�t c� k� n�ng h�i thu�c!", 0)
	else
		if (LearnLifeSkill(0, 4, 1, 79, 0)) then
			AddItem(0, 200, 16, 1, 1)
        	Msg2Player("B�n h�c ���c k� n�ng thu th�p: H�i thu�c v� nh�n ���c cu�c thu�c.")
    	end
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say (strTitle.."Ngh� k� r�i h�y ��n!", 0)
end;



-- ȷ��ȥ��Ӧ�һ��ص�=====================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Nam H�e c�c<color> h�i thu�c kh�ng? N�i �� c� nhi�u <color=yellow>Ba ��u<color>, <color=yellow>T�ng H�ng Hoa<color>, <color=yellow>C�t C�nh<color> v� <color=yellow>Ho�ng li�n<color>. Nh� mang theo <color=yellow>Cu�c thu�c<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(714, 1511, 3004)",
		"Kh�ng �i ��u/Main_Exit");
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>H�m U c�c<color> h�i thu�c kh�ng? N�i �� c� nhi�u <color=yellow>X�c ve<color>, <color=yellow>�i�n th�t<color> v� <color=yellow>Xuy�n s�n gi�p<color>. Nh� mang theo <color=yellow>Cu�c thu�c<color>!",
		2,
		"Ta mu�n �i/#GotoWorld(719, 1708, 3396)",
		"Kh�ng �i ��u/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng��i mu�n ��n <color=yellow>Hi�n Vi�n c�c<color> h�i thu�c kh�ng? N�i �� c� nhi�u <color=yellow>X� h��ng<color>, <color=yellow>gan g�u<color> v� <color=yellow>Nh�n s�m<color>. Nh� l�y <color=yellow>cu�c thu�c<color> m�i c� th� h�i thu�c!",	2,
		"Ta mu�n �i/#GotoWorld(724, 1721, 3386)",
		"Kh�ng �i ��u/Main_Exit");
end;
-- ȥ��Ӧ�Ĺһ��ص�
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
				
		NewWorld(MapID,x,y)
end;


-- ���������Ϣ
function Info()
	Say(strTitle.."<color=yellow>H�i thu�c<color> l� m�t trong <color=yellow>6<color> k� n�ng thu th�p trong h� th�ng k� n�ng s�ng. H�c ���c k� n�ng n�y c� th� nh�n ���c v�t li�u <color=yellow>luy�n ��n<color>. Ng��i c� th� ��n <color=yellow>ti�m t�p h�a<color> mua c�ng c� h�i thu�c <color=yellow>s� c�p<color> �� l�n n�i t�m thu�c!", 0);
end;

-- ʲôҲ�����Ŀպ���
function Main_Exit()
end;

