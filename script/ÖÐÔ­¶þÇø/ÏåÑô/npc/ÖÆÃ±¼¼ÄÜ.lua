-- =========================================
-- File : XXX����XX��ͷ��֯��.lua
-- Name : ͷ��֯��
-- ID   : 1, 10
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")

-- == Ԥ�����һЩ�������ID =======================
ID_LEARNLIFESKILL		= 1925		-- �����������
LEV_LEARNRECIPE			= 1926		-- �䷽ѧϰ�����¼
RECIPE_SEX				= 1935		-- �䷽ѧϰ��Ůѡ��
FORGETMAIN_NUM			= 1940		-- ���������ܴ���

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
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Linh th�ch � v� tr� n�o th� kh�m tr�n trang b� c� v� tr� t��ng �ng, kh�ng th� kh�m l�n!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."��n <color=yellow>C�p 10<color> c� th� ��n <color=yellow>Th�nh ��<color> g�p <color=yellow>Du Ph��ng ��i phu<color> t�m hi�u <color=yellow>k� n�ng s�ng<color>!", 0)
        TaskTip("��n c�p 10 c� th� ��n Th�nh �� t�m Du Ph��ng ��i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Mu�n h�c may n�n �? Gi� th� ch�a th� h�c ���c!", 0)
    	return
    end;
	
	local strtab = {
		"H�c may n�n/learn_cap_skill",
		"H�c c�ch ph�i ch� m�i/learn_new_recipe",
		"H�c ph�i ch� trang b� Linh ��/learnLtEquip",
		"Qu�n c�ch may n�n r�i/forget_life_skill",
--		"Nh�ng �i�u li�n quan v� trang b� B�t Qu�i/bagua",
		"T�m hi�u v�t ph� gia/dating"
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
--		tinsert(strtab,"ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 10) == 79 then
		tinsert(strtab, "Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level");
	end 
	tinsert(strtab,"R�i kh�i/exit_dialog"); 			
	Say(strTitle.."Ngh� n�y ta h�c t� nh� n�n r�t tinh th�ng, c� c�n ta gi�p g� kh�ng?",
		getn(strtab),
		strtab)
end;


-- == ʲô���������˳��Ի� ===================
function exit_dialog()
end;


-- == ����������������Ϣ ===================
function dating()
	Say(strTitle.."Ng��i ��t trang b� v�o sau �� th�m nguy�n li�u, s� c� m�n �� nh� �.", 0)
end;


-- == ����ͷ��֯�� ===========================
function forget_life_skill()
	if (GetLifeSkillLevel(1, 10) > 0) then
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
			"Khoan ��! Ch� ta suy ngh� l�i!/exit_dialog")
	else
		Say(strTitle.."Ng��i ch�a h�c may n�n �?", 0)
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
	
	if (GetLifeSkillLevel(1, 10) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
			AbandonLifeSkill(1, 10)
			SetTask(LEV_LEARNRECIPE, 0)
			SetTask(RECIPE_SEX, 0)
			Msg2Player("Ng��i �� qu�n c�ch may n�n r�i")				
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;

-- == ѧϰͷ��֯�� ===========================
function learn_cap_skill()
	if (GetLevel() < 10) then
		Say(strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B�ng h�u �� h�c k� n�ng s�n xu�t, mu�n h�c k� n�ng m�i c�n ph�i b� k� n�ng c�.", 0)
    	return
	end

	Say(strTitle.."<color=yellow>May n�n<color> c�ng l� m�t k� n�ng ch� t�o m�i, c� mu�n h�c kh�ng?",
    	2,
    	"Ta mu�n h�c/learn_as_main",
    	"�� ta suy ngh� l�i/exit_dialog")
end;
-- == ѡ����ñ���컹��Ůñ���� ====
function learn_as_main()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."May n�n c�<color=yellow>may n�n nam<color> v� <color=yellow>may n�n n�<color>, ng��i mu�n h�c lo�i n�o?",
			3,
			"May n�n nam/choose_man",
			"May n�n n�/choose_women",
			"�� ta suy ngh�./exit_dialog")
	end
end;
-- == ѡ����ñ���� ====
function choose_man()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 10, 1, 79, 1)) then
      Msg2Player("B�n h�c ���c k� n�ng: May n�n")
      		
      AddRecipe(251)
      Msg2Player("B�n h�c ���c ph�i ch�: Anh H�ng C�n")
			AddRecipe(252)
			Msg2Player("B�n h�c ���c ph�i ch�: C�m B� c�n")
			AddRecipe(253)
			Msg2Player("B�n h�c ���c ph�i ch�: M�n Nguy�t L�p")
			AddRecipe(254)
			Msg2Player("B�n h�c ���c ph�i ch�: Kim Phong Qu�n")
			AddRecipe(269)
			Msg2Player("B�n h�c ���c ph�i ch�: Ng�u B� ��u C�n")
			AddRecipe(270)
			Msg2Player("B�n h�c ���c ph�i ch�: Kim �i�u c�n")
			AddRecipe(271)
			Msg2Player("B�n h�c ���c ph�i ch�: V� Th�ng Sa M�o")
			AddRecipe(272)
			Msg2Player("B�n h�c ���c ph�i ch�: Ho�ng Tr� Th�c C�n")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;
-- == ѡ��Ůñ���� ====
function choose_women()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 10, 1, 79, 1)) then
      Msg2Player("B�n h�c ���c k� n�ng: May n�n")
    		
    	AddRecipe(287)
    	Msg2Player("B�n h�c ���c ph�i ch�: Ph�ng Phong L�p")
			AddRecipe(288)
			Msg2Player("B�n h�c ���c ph�i ch�: T� Th�y L�p")
			AddRecipe(289)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng K�t")
			AddRecipe(290)
			Msg2Player("B�n h�c ���c ph�i ch�: San H� tr�m")
			AddRecipe(305)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�m M�c Th�c Tr�m")
			AddRecipe(306)
			Msg2Player("B�n h�c ���c ph�i ch�: Ng�n Linh Tr�m")
			AddRecipe(307)
			Msg2Player("B�n h�c ���c ph�i ch�: Qu� Di�n Th�c c�n")
			AddRecipe(308)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh Lam C�n")
			
		  SetTask(LEV_LEARNRECIPE, 10)
		  SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;



-- == ѧϰ�µ��䷽ ===========================
function learn_new_recipe()
	local nLevel = GetLifeSkillLevel(1, 10)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."May n�n c�<color=yellow>may n�n nam<color> v� <color=yellow>may n�n n�<color>, ng��i mu�n h�c lo�i n�o?",
			3,
			"May n�n nam/recipe_man",
			"May n�n n�/recipe_women",
			"�� ta suy ngh�./exit_dialog")
		return
	end
	
	-- ��װ�䷽����
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(255)
			Msg2Player("B�n h�c ���c ph�i ch�: M�ng Di�n C�n")
			AddRecipe(256)
			Msg2Player("B�n h�c ���c ph�i ch�: Hoa D��ng C�n")
			AddRecipe(273)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n M�c C�n")
			AddRecipe(274)
			Msg2Player("B�n h�c ���c ph�i ch�: Nh��c Th�y L�p")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(257)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Tuy�n L�p")
			AddRecipe(258)
			Msg2Player("B�n h�c ���c ph�i ch�: D�t �n Qu�n")
			AddRecipe(275)
			Msg2Player("B�n h�c ���c ph�i ch�: Chu T��c Th�c C�n")
			AddRecipe(276)
			Msg2Player("B�n h�c ���c ph�i ch�: H�i Th�n K�t")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(259)
			Msg2Player("B�n h�c ���c ph�i ch�: H�ng L�ng C�n")
			AddRecipe(260)
			Msg2Player("B�n h�c ���c ph�i ch�: H�ng V�n Th�c ��i")
			AddRecipe(277)
			Msg2Player("B�n h�c ���c ph�i ch�: ��nh Qu�c T� C�n")
			AddRecipe(278)
			Msg2Player("B�n h�c ���c ph�i ch�: M�t Nh�n Di�n Tr�o")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(261)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh Sa Nh�n Tr�o")
			AddRecipe(262)
			Msg2Player("B�n h�c ���c ph�i ch�: X�ch Tinh Nh�n Tr�o")
			AddRecipe(279)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n S�ch Kim Kh�i")
			AddRecipe(280)
			Msg2Player("B�n h�c ���c ph�i ch�: Ng� Qu� C�n")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(263)
			Msg2Player("B�n h�c ���c ph�i ch�: Phi V�n L�p")
			AddRecipe(264)
			Msg2Player("B�n h�c ���c ph�i ch�: Tuy�t B�o Qu�n")
			AddRecipe(281)
			Msg2Player("B�n h�c ���c ph�i ch�: Tinh cang Chi�n Kh�i")
			AddRecipe(282)
			Msg2Player("B�n h�c ���c ph�i ch�: L�i Tr� Di�n")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(265)
			Msg2Player("B�n h�c ���c ph�i ch�: S�n Qu� Di�n")
			AddRecipe(266)
			Msg2Player("B�n h�c ���c ph�i ch�: M�t Th�n Qu�n")
			AddRecipe(283)
			Msg2Player("B�n h�c ���c ph�i ch�: Chung Qu� Di�n")
			AddRecipe(284)
			Msg2Player("B�n h�c ���c ph�i ch�: D� Th�n C�n")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		  Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!", 0)
		end
		
	-- Ůװ�䷽����
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(291)
			Msg2Player("B�n h�c ���c ph�i ch�: B�n Th�ch K�t")
			AddRecipe(292)
			Msg2Player("B�n h�c ���c ph�i ch�: Kh�ng T��c Tr�m")
			AddRecipe(309)
			Msg2Player("B�n h�c ���c ph�i ch�: Lam �i�p Th�c C�n")
			AddRecipe(310)
			Msg2Player("B�n h�c ���c ph�i ch�: B�ch H�ng Tr�m")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(293)
			Msg2Player("B�n h�c ���c ph�i ch�: Chu T��c Ph�t K�t")
			AddRecipe(294)
			Msg2Player("B�n h�c ���c ph�i ch�: ��ng X� Tr�m")
			AddRecipe(311)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n C� Th�c Tr�m")
			AddRecipe(312)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n La Thoa")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(295)
			Msg2Player("B�n h�c ���c ph�i ch�: Minh �i�p K�t")
			AddRecipe(296)
			Msg2Player("B�n h�c ���c ph�i ch�: Kim Ph�ng Tr�m")
			AddRecipe(313)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Phong Th�c Tr�m")
			AddRecipe(314)
			Msg2Player("B�n h�c ���c ph�i ch�: V�n M�ng Thoa")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(297)
			Msg2Player("B�n h�c ���c ph�i ch�: ��a Ki�t Qu�n")
			AddRecipe(298)
			Msg2Player("B�n h�c ���c ph�i ch�: �o�t H�n")
			AddRecipe(315)
			Msg2Player("B�n h�c ���c ph�i ch�: Phi �i�u")
			AddRecipe(316)
			Msg2Player("B�n h�c ���c ph�i ch�: H�ng C�c")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(299)
			Msg2Player("B�n h�c ���c ph�i ch�: Nh�t Mi�n")
			AddRecipe(300)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n �")
			AddRecipe(317)
			Msg2Player("B�n h�c ���c ph�i ch�: B�o T��ng")
			AddRecipe(318)
			Msg2Player("B�n h�c ���c ph�i ch�: Phong L�i")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(301)
			Msg2Player("B�n h�c ���c ph�i ch�: Tu La Ph�")
			AddRecipe(302)
			Msg2Player("B�n h�c ���c ph�i ch�: Chu T��c")
			AddRecipe(319)
			Msg2Player("B�n h�c ���c ph�i ch�: Vu H�m")
			AddRecipe(320)
			Msg2Player("B�n h�c ���c ph�i ch�: Tru�ng Sinh")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 10)
	if nLevel >= 79 then
    	AddRecipe(1131)
    	AddRecipe(1132)
    	AddRecipe(1133)
    	AddRecipe(1134)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� M�o"))
	else
    	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
	end
end

-- == ѡ���Ҳ�ϰ��ñ���켼�� ====
function recipe_man()
	AddRecipe(251)
    Msg2Player("B�n h�c ���c ph�i ch�: Anh H�ng C�n")
	AddRecipe(252)
	Msg2Player("B�n h�c ���c ph�i ch�: C�m B� c�n")
	AddRecipe(253)
	Msg2Player("B�n h�c ���c ph�i ch�: M�n Nguy�t L�p")
	AddRecipe(254)
	Msg2Player("B�n h�c ���c ph�i ch�: Kim Phong Qu�n")
	AddRecipe(269)
	Msg2Player("B�n h�c ���c ph�i ch�: Ng�u B� ��u C�n")
	AddRecipe(270)
	Msg2Player("B�n h�c ���c ph�i ch�: Kim �i�u c�n")
	AddRecipe(271)
	Msg2Player("B�n h�c ���c ph�i ch�: V� Th�ng Sa M�o")
	AddRecipe(272)
	Msg2Player("B�n h�c ���c ph�i ch�: Ho�ng Tr� Th�c C�n")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;
-- == ѡ���Ҳ�ϰŮñ���켼�� ====
function recipe_women()
    AddRecipe(287)
    Msg2Player("B�n h�c ���c ph�i ch�: Ph�ng Phong L�p")
	AddRecipe(288)
	Msg2Player("B�n h�c ���c ph�i ch�: T� Th�y L�p")
	AddRecipe(289)
	Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng K�t")
	AddRecipe(290)
	Msg2Player("B�n h�c ���c ph�i ch�: San H� tr�m")
	AddRecipe(305)
	Msg2Player("B�n h�c ���c ph�i ch�: Tr�m M�c Th�c Tr�m")
	AddRecipe(306)
	Msg2Player("B�n h�c ���c ph�i ch�: Ng�n Linh Tr�m")
	AddRecipe(307)
	Msg2Player("B�n h�c ���c ph�i ch�: Qu� Di�n Th�c c�n")
	AddRecipe(308)
	Msg2Player("B�n h�c ���c ph�i ch�: Thanh Lam C�n")
		
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 2)
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=green>Minh S� Ph�<color>: <color=red>Trang b� b�t qu�i<color> l� ta c�ng huynh �� M�c gia v� l�o L�u � T��ng D��ng, �� to�n l�c c�ng nhau nghi�n c�u ra t�m huy�t. L�m th� n�o nh�n ���c nh�ng m�n c� linh th�ch ng��i �i h�i truy�n nh�n s� r�, n�u ng��i mu�n t�m hi�u l�m th� n�o ch� t�o ���c <color=yellow>trang b�<color> kh�m linh th�ch, th� ��n ch� ta t�m hi�u nh�.",
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
	if GetLifeSkillLevel(1, 10) < 79 then
		Talk(1,"",format("Hi�n t�i c�p k� n�ng s�n xu�t ch�a ��t c�p %d, kh�ng th� m� r�ng c�p gi�i h�n k� n�ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng�n l��ng kh�ng �� %d v�ng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 10, 99);
	Msg2Player("Ch�c m�ng c�p gi�i h�n k� n�ng s�n xu�t �� ��t c�p 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end