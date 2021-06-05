-- =========================================
-- File : XXX����XX���ƿ㼼��.lua
-- Name : �ƿ㼼��
-- ID   : 1, 9
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
		NpcChat(GetTargetNpc(),"��ng qu�n l� tr� linh kh� m� trang b� c� th� dung n�p l� c� h�n!");
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
    	Say(strTitle.."Mu�n h�c may h� y �? L�c n�y ta ch�a d�y ���c", 0)
    	return
    end;
	
	local strtab = {
		"H�c k� n�ng may h� y/learn_shoes_skill",
		"H�c c�ch ph�i ch� m�i/learn_new_recipe",
		"H�c ph�i ch� trang b� Linh ��/learnLtEquip",
		"Qu�n k� n�ng may h� y/forget_life_skill",
--		"Nh�ng �i�u li�n quan v� trang b� B�t Qu�i/bagua",
		"T�m hi�u v�t ph� gia/dating"	
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 9) == 79 then
		tinsert(strtab, "Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level");
	end 
	tinsert(strtab,"R�i kh�i/exit_dialog");  		
	Say(strTitle.."Ta b�nh sinh r�t th�ch ch� t�o h� gi�p, c� c�n ta gi�p g� kh�ng?",
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


-- == �����ƿ㼼�� ===========================
function forget_life_skill()
	if (GetLifeSkillLevel(1, 9) > 0) then
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
		Say(strTitle.."Ng��i v�n ch�a h�c k� n�ng may h� y �? Ta s� gi�p ng��i", 0)
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
	
	if (GetLifeSkillLevel(1, 9) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 9)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(RECIPE_SEX, 0)
				Msg2Player("K� n�ng may h� y ng��i �� qu�n r�i")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;

-- == ѧϰ�ƿ㼼�� ===========================
function learn_shoes_skill()
	if (GetLevel() < 10) then
		Say(strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B�ng h�u �� h�c k� n�ng s�n xu�t, mu�n h�c k� n�ng m�i c�n ph�i b� k� n�ng c�.", 0)
    	return
	end

	Say(strTitle.."<color=yellow>K� n�ng may h� y<color> s� l� k� n�ng s�n xu�t, ng��i c� mu�n h�c kh�ng?",
    	2,
    	"Ta mu�n h�c/learn_as_main",
    	"�� ta suy ngh� l�i/exit_dialog")
end;
-- == ѡ���п㻹��Ů�� ====
function learn_as_main()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."K� n�ng may h� y g�m: <color=yellow>h� y nam<color> v� <color=yellow>h� y n�<color>, ng��i mu�n h�c lo�i n�o?",
			3,
			"May h� y nam/choose_man",
			"May h� y n�/choose_women",
			"�� ta suy ngh�./exit_dialog")
	end
end;
-- == ѡ��������װ֯�� ====
function choose_man()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B�n h�c ���c ph�i ch�: k� n�ng may h� y")
      		
      		AddRecipe(323)
      		Msg2Player("B�n h�c ���c ph�i ch�: Lang b� y")
			AddRecipe(324)
			Msg2Player("B�n h�c ���c ph�i ch�: Trang ph�c Nh� �")
			AddRecipe(325)
			Msg2Player("B�n h�c ���c ph�i ch�: H� b� y")
			AddRecipe(326)
			Msg2Player("B�n h�c ���c ph�i ch�: Khinh Gi�p y")
			AddRecipe(341)
			Msg2Player("B�n h�c ���c ph�i ch�: M�ng Ng�u y")
			AddRecipe(342)
			Msg2Player("B�n h�c ���c ph�i ch�: Kim T� y")
			AddRecipe(343)
			Msg2Player("B�n h�c ���c ph�i ch�: H�o D�ng Trang")
			AddRecipe(344)
			Msg2Player("B�n h�c ���c ph�i ch�: Kim L� Trang")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;
-- == ѡ��Ů����װ֯�� ====
function choose_women()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B�n h�c ���c ph�i ch�: k� n�ng may h� y")
    		
    		AddRecipe(359)
    		Msg2Player("B�n h�c ���c ph�i ch�: H�c Nhung T� Trang")
			AddRecipe(360)
			Msg2Player("B�n h�c ���c ph�i ch�: B�ch V�n T� Trang")
			AddRecipe(361)
			Msg2Player("B�n h�c ���c ph�i ch�: V� Luy�n T� Trang")
			AddRecipe(362)
			Msg2Player("B�n h�c ���c ph�i ch�: H�a Ho�n T� Trang")
			AddRecipe(377)
			Msg2Player("B�n h�c ���c ph�i ch�: Phong Tr�n T� Trang")
			AddRecipe(378)
			Msg2Player("B�n h�c ���c ph�i ch�: Linh V�n T� Trang")
			AddRecipe(379)
			Msg2Player("B�n h�c ���c ph�i ch�: Phi H�ng T� Trang")
			AddRecipe(380)
			Msg2Player("B�n h�c ���c ph�i ch�: Phong V� T� Trang")
			
		    SetTask(LEV_LEARNRECIPE, 10)
		    SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;



-- == ѧϰ�µ��䷽ ===========================
function learn_new_recipe()
	local nLevel = GetLifeSkillLevel(1, 9)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."K� n�ng may h� y g�m: <color=yellow>h� y nam<color> v� <color=yellow>h� y n�<color>, ng��i mu�n h�c lo�i n�o?",
			3,
			"May h� y nam/recipe_man",
			"May h� y n�/recipe_women",
			"�� ta suy ngh�./exit_dialog")
		return
	end
	
	-- ��װ�䷽����
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(327)
			Msg2Player("B�n h�c ���c ph�i ch�: D� H�nh Trang")
			AddRecipe(328)
			Msg2Player("B�n h�c ���c ph�i ch�: H�a T��ng Trang")
			AddRecipe(345)
			Msg2Player("B�n h�c ���c ph�i ch�: Du Hi�p Trang")
			AddRecipe(346)
			Msg2Player("B�n h�c ���c ph�i ch�: H� B� K�nh Trang")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(329)
			Msg2Player("B�n h�c ���c ph�i ch�: X�ch Lang Trang")
			AddRecipe(330)
			Msg2Player("B�n h�c ���c ph�i ch�: Trang ph�c Nh� �")
			AddRecipe(347)
			Msg2Player("B�n h�c ���c ph�i ch�: C�m Lan y")
			AddRecipe(348)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh S��ng Trang")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(331)
			Msg2Player("B�n h�c ���c ph�i ch�: Long B� y")
			AddRecipe(332)
			Msg2Player("B�n h�c ���c ph�i ch�: Huy�n �nh y")
			AddRecipe(349)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Phong Trang")
			AddRecipe(350)
			Msg2Player("B�n h�c ���c ph�i ch�: B� �n Trang")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(333)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Lang y")
			AddRecipe(334)
			Msg2Player("B�n h�c ���c ph�i ch�: Phi Ng� y")
			AddRecipe(351)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n S�ch y")
			AddRecipe(352)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n L�i y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(335)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh V�n y")
			AddRecipe(336)
			Msg2Player("B�n h�c ���c ph�i ch�: B�ch L�n y")
			AddRecipe(353)
			Msg2Player("B�n h�c ���c ph�i ch�: Nhu C��ng y")
			AddRecipe(354)
			Msg2Player("B�n h�c ���c ph�i ch�: Cu�ng Vi�m y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(337)
			Msg2Player("B�n h�c ���c ph�i ch�: S�t Ki�p Trang")
			AddRecipe(338)
			Msg2Player("B�n h�c ���c ph�i ch�: � T�m y")
			AddRecipe(355)
			Msg2Player("B�n h�c ���c ph�i ch�: Huy�t H� y")
			AddRecipe(356)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n C��ng y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!", 0)
		end
		
	-- Ůװ�䷽����
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(363)
			Msg2Player("B�n h�c ���c ph�i ch�: Luy�n Gi�p T� y")
			AddRecipe(364)
			Msg2Player("B�n h�c ���c ph�i ch�: S� Man T� y")
			AddRecipe(381)
			Msg2Player("B�n h�c ���c ph�i ch�: H�m Tr�n T� y")
			AddRecipe(382)
			Msg2Player("B�n h�c ���c ph�i ch�: B�ch H� T� y")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(365)
			Msg2Player("B�n h�c ���c ph�i ch�: C�m Anh T� y")
			AddRecipe(366)
			Msg2Player("B�n h�c ���c ph�i ch�: V�n H� T� y")
			AddRecipe(383)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n T�m T� y")
			AddRecipe(384)
			Msg2Player("B�n h�c ���c ph�i ch�: Kh�i La T� y")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(367)
			Msg2Player("B�n h�c ���c ph�i ch�: To�n Kim Gi�p y")
			AddRecipe(368)
			Msg2Player("B�n h�c ���c ph�i ch�: H�ng V�n T� y")
			AddRecipe(385)
			Msg2Player("B�n h�c ���c ph�i ch�: V� Th�n T� y")
			AddRecipe(386)
			Msg2Player("B�n h�c ���c ph�i ch�: Linh Lung T� y")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(369)
			Msg2Player("B�n h�c ���c ph�i ch�: L�i Th�n y")
			AddRecipe(370)
			Msg2Player("B�n h�c ���c ph�i ch�: Thi�n M� y")
			AddRecipe(387)
			Msg2Player("B�n h�c ���c ph�i ch�: B�ch Chi�n y")
			AddRecipe(388)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�n N� y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(371)
			Msg2Player("B�n h�c ���c ph�i ch�: Ph� Tr�n y")
			AddRecipe(372)
			Msg2Player("B�n h�c ���c ph�i ch�: Ph�t V�n y")
			AddRecipe(389)
			Msg2Player("B�n h�c ���c ph�i ch�: V� Linh y")
			AddRecipe(390)
			Msg2Player("B�n h�c ���c ph�i ch�: T�n Hoa y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(373)
			Msg2Player("B�n h�c ���c ph�i ch�: H� Khi�u y")
			AddRecipe(374)
			Msg2Player("B�n h�c ���c ph�i ch�: Th�i Thanh y")
			AddRecipe(391)
			Msg2Player("B�n h�c ���c ph�i ch�: H�ng Ng�c y")
			AddRecipe(392)
			Msg2Player("B�n h�c ���c ph�i ch�: Xu�t V�n y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 9)
	if nLevel >= 79 then
    	AddRecipe(1139)
    	AddRecipe(1140)
    	AddRecipe(1141)
    	AddRecipe(1142)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Trang (S�t th��ng)"))
    	AddRecipe(1143)
    	AddRecipe(1144)
    	AddRecipe(1145)
    	AddRecipe(1146)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Trang  (Ngo�i c�ng)"))
    	AddRecipe(1147)
    	AddRecipe(1148)
    	AddRecipe(1149)
    	AddRecipe(1150)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Trang (N�i k�ch)"))
	else
    	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
	end
end

-- == ѡ���Ҳ�ϰ�п����켼�� ====
function recipe_man()
	AddRecipe(323)
    Msg2Player("B�n h�c ���c ph�i ch�: Lang b� y")
	AddRecipe(324)
	Msg2Player("B�n h�c ���c ph�i ch�: Trang ph�c Nh� �")
	AddRecipe(325)
	Msg2Player("B�n h�c ���c ph�i ch�: H� b� y")
	AddRecipe(326)
	Msg2Player("B�n h�c ���c ph�i ch�: Khinh Gi�p y")
	AddRecipe(341)
	Msg2Player("B�n h�c ���c ph�i ch�: M�ng Ng�u y")
	AddRecipe(342)
	Msg2Player("B�n h�c ���c ph�i ch�: Kim T� y")
	AddRecipe(343)
	Msg2Player("B�n h�c ���c ph�i ch�: H�o D�ng Trang")
	AddRecipe(344)
	Msg2Player("B�n h�c ���c ph�i ch�: Kim L� Trang")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;
-- == ѡ���Ҳ�ϰŮ�����켼�� ====
function recipe_women()
	AddRecipe(359)
    Msg2Player("B�n h�c ���c ph�i ch�: H�c Nhung T� Trang")
	AddRecipe(360)
	Msg2Player("B�n h�c ���c ph�i ch�: B�ch V�n T� Trang")
	AddRecipe(361)
	Msg2Player("B�n h�c ���c ph�i ch�: V� Luy�n T� Trang")
	AddRecipe(362)
	Msg2Player("B�n h�c ���c ph�i ch�: H�a Ho�n T� Trang")
	AddRecipe(377)
	Msg2Player("B�n h�c ���c ph�i ch�: Phong Tr�n T� Trang")
	AddRecipe(378)
	Msg2Player("B�n h�c ���c ph�i ch�: Linh V�n T� Trang")
	AddRecipe(379)
	Msg2Player("B�n h�c ���c ph�i ch�: Phi H�ng T� Trang")
	AddRecipe(380)
	Msg2Player("B�n h�c ���c ph�i ch�: Phong V� T� Trang")
		
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 2)
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=green>T� Quy�n C� N��ng<color>: <color=red>Trang b� b�t qu�i<color> l� s� tr��ng c�a ta + M�c th� v� l�o L�u � T��ng D��ng, nh�ng t�t nh�t n�n h�i qua C�ng D� Th� gia tr��c, c�n n�u mu�n bi�t chi ti�t v� trang b� <color=yellow>kh�m n�m Linh th�ch<color> th� g�p ta l� ��ng ng��i r�i!",
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
	if GetLifeSkillLevel(1, 9) < 79 then
		Talk(1,"",format("Hi�n t�i c�p k� n�ng s�n xu�t ch�a ��t c�p %d, kh�ng th� m� r�ng c�p gi�i h�n k� n�ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng�n l��ng kh�ng �� %d v�ng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 9, 99);
	Msg2Player("Ch�c m�ng c�p gi�i h�n k� n�ng s�n xu�t �� ��t c�p 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end