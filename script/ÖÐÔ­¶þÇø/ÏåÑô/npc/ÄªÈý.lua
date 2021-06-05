-- =========================================
-- File : ��ԭ������������Ī��.lua
-- Name : Ī��
-- ID   : 1, 4
--2007-02-28��̫����������
--�������ݣ�̫������Ī���ĶԻ�������
--�߻��ˣ�����
--�����д�ˣ��峤
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua");
--̫����������
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\lingshi_task.lua")
taixu_jwl_taskID = 998
taixu_jwl_iron_up_num = 996							--�ύ��������
taixu_jwl_list = {
	{"Th�i H� Huy�n Ng�c",29,"C�u Thi�n Huy�n Ng�c",129},
	{"Th�i H� Huy�n ��i ",30,"C�u Thi�n Huy�n ��i",130},
	{"Th�i H� Huy�n Ho�n",31,"C�u Thi�n Huy�n Ho�n",131},
	{"Th�i H� Huy�n B�i",32,"C�u Thi�n Huy�n B�i",132},
	{"Th�i H� Huy�n Gi�i",33,"C�u Thi�n Huy�n Gi�i",133},
	{"Th�i H� Huy�n ��i",34,"C�u Thi�n Huy�n ��i",134},
	{"Th�i H� Huy�n Th�ch",35,"C�u Thi�n Huy�n Th�ch",135}
}
mystery_goods_list = {
	{"Ch�n th�",2,1,112},
	{"T� kh�ng Th�y",2,1,114},
	{"Ph� Thi�n Cung",2,1,115},
	{"X��ng r�ng",2,1,116},
	{"T�y Ti�n C�c",2,1,117},
	{"Thi V��ng L�c C�t",2,1,118},
	{"Thi Kh� B�nh",2,1,119},
	{"Qu�n T�",2,1,120},
	{"T�i Phi Ng�",2,1,121},
	{"B�nh Song Tinh",2,1,122},
	{"X��ng s�",2,1,124},
	{"T� H�n ��nh",2,1,125},
	{"L�p Ho�n",2,1,126},
	{"D�i ��c",2,1,127},
	{"Quan m�o",2,1,128},
	{"M�t S�t L�nh",2,1,129},
	{"Ch�n Thi�n Tuy�t",2,1,130},
	{"Di�u",2,1,132},
	{"Con r�i",2,1,133},
	{"T�o Ng�n",2,1,134},
	{"Hoa Th�ch C��ng",2,1,135},
	{"D�u �en",2,1,136},
	{"Tr��ng Th�nh K�nh",2,1,137},
	{"B�n ch� T�t Th�ng",2,1,138},
	{"Kh� S�n ch�",2,1,140},
	{"L�i Vi�m Kim Sa",2,1,146},
	{"Thi�n Y V� Phong",2,1,147}
}
taixu_jwl_up_met_table = {
	{2,1,533,"Tinh luy�n B�ng Th�ch",2500,1000,0,100,2,1,562,"C��ng h�a tinh kim"},
	{2,1,533,"Tinh luy�n B�ng Th�ch",50,20,0,50,2,1,560,"C��ng h�a tinh kim s� c�p"},
	{2,1,560,"C��ng h�a tinh kim s� c�p",50,20,0,30,2,1,561,"C��ng h�a tinh kim trung c�p"},
	{2,1,561,"C��ng h�a tinh kim trung c�p",50,20,0,20,2,1,562,"C��ng h�a tinh kim"}
}
--����

--*****************************************���峣����Ԥ����*********************************
ID_LEARNLIFESKILL			= 1925
LEV_LEARNRECIPE				= 1926		-- �䷽ѧϰ�������
LEVELTASKID49				= 517		-- ������������
TASKID_LIFESKILL_FLG		= 1932		-- 49������������
TASK_GATHER_FLAG			= 1931		-- ������Ʒ�ɼ���ʾ
TASK49_BEGGING				= 1933		-- 49����������ʼ��ʾ
FORGETMAIN_NUM				= 1940		-- ���������ܴ���
FORGETOHTER_NUM				= 1941		-- ���������ܴ���
HaveWeekend					= 1938		-- ��ĩ�䷽ѧϰ�������
strName = "";
strTitle = "";

--*****************************************MAIN����*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Tuy ng��i c� th� theo ta h�c c�ch ch� t�o trang b� c� linh kh�, nh�ng mu�n t�m hi�u trang b� B�t Qu�i, ng��i n�n �i t�m ng��i c�a C�ng D� Th� Gia!");
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
    
 ---------------------------------------------���Ի�-------------------------------------------
	--̫����������
	local taixu_task_step = GetTask(taixu_jwl_taskID)
	local taixu_dia_mo3 = ""
	--����
	if taixu_task_step == nil or taixu_task_step == 0 then
	    local strtab = {
	    	"H�c k� n�ng ch� t�o K� M�n binh kh�/luaLearnLifeSkill",
	    	"H�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�/learn_all_recipe",
	    	"Qu�n k� n�ng ch� t�o K� M�n binh kh�/forget_life_skill",
--	    	"Nh�ng �i�u li�n quan v� trang b� B�t Qu�i/bagua",
			"H�c c�ch l�m v� kh� linh kh� c�p 76/xinwuqi",
	    	"T�m hi�u v�t ph� gia/Dating"
	       	}
			if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
				tinsert(strtab,"ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/task_new3");
			end
			if GetLifeSkillMaxLevel(1, 4) == 79 then
				tinsert(strtab, "Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level");
			end 
			tinsert(strtab,"R�i kh�i/SayHello");  		    	
	    Say(strTitle.."D�ng h� ta n�i ti�ng b�i ngh� ��c ki�m, ng��i c� c�n ta gi�p g� kh�ng?",
	    	getn(strtab),
	    	strtab)
	else 
		local qijin_get_flag = BigGetItemCount(2,1,563)
		local qianghua_jin_get_flag = BigGetItemCount(2,1,562)
		if taixu_task_step == 1 then
			taixu_dia_mo3 = "Ta c�n t�ng c�p trang s�c Th�i H�/taixu_jwl_dia_step1"
		elseif qianghua_jin_get_flag == 0 then
			taixu_dia_mo3 = "Ta c�n luy�n c��ng h�a tinh kim/taixu_jwl_up_iron"
		elseif qianghua_jin_get_flag ~= 0 and qijin_get_flag == 0 then
			taixu_dia_mo3 = "Ta mu�n nh�n Thi�t ch�y/mo3_hammer_add"
		elseif qianghua_jin_get_flag ~= 0 and qijin_get_flag ~= 0 then
			taixu_dia_mo3 = "K� Kim ta �� mang ��n r�i, b�t ��u luy�n th�i./taixu_jwl_up_jwl"
		end
	  local strtab = {
	    	"H�c k� n�ng ch� t�o K� M�n binh kh�/luaLearnLifeSkill",
	    	"H�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�/learn_all_recipe",
	    	"Qu�n k� n�ng ch� t�o K� M�n binh kh�/forget_life_skill",
	    	"T�m hi�u v�t ph� gia/Dating",
			"H�c c�ch l�m v� kh� linh kh� c�p 76/xinwuqi",
				taixu_dia_mo3
	       }
			if GetTask(TASK_LINGSHI_ID) == 2 then
				tinsert(strtab,"ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/task_new3");
			end
			if GetLifeSkillMaxLevel(1, 4) == 79 then
				tinsert(strtab, "Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level");
			end 
			tinsert(strtab,"R�i kh�i/SayHello");  	    	  	  
	    Say(strTitle.."D�ng h� ta n�i ti�ng b�i ngh� ��c ki�m, ng��i c� c�n ta gi�p g� kh�ng?",
	    	getn(strtab),
	    	strtab);		
	end
end;


-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."Ng��i mu�n h�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�?",
		8,
		"H�c c�ch ph�i ch� m�i/luaLearnRecipe",
		"H�c ph�i ch� trang b� Linh ��/learnLtEquip",
		"H�c ph�i ch� v� kh� Th�y Y�n/learnCyEquip",
		"H�c c�ch ph�i ch� d�nh cho ho�t ��ng cu�i tu�n/Weekend",
		"Xem nh�n ���c nhi�m v� v� kh� c�p 76 kh�ng/get_76_task",
		"H�c c�ch ph�i ch� c�p 76/relearn_76_recipe",
		"Ph�i gh�p B� H�c Tr�o/luaLearnRecipeZhua",
		"R�i kh�i/SayHello")
end;


-- ����76���䷽����
function get_76_task()
	----------------------------------------76�������䷽����-------------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_76 = GetTask(TASK_76WEAPON)
		
	if (nSkillGenre == 1 and nSkillDetail == 4 and nSkillLevel >= 79) then
		--��δ�����䷽����
		if nTaskState_76 == 0 then
			weapon_76_001(3);
			return
		--�Ͻ�����
		elseif nTaskState_76 == 1 then
			weapon_76_002(3);
			return
		--δ����λ���ŶԻ�
		elseif nTaskState_76 == 2 then
			weapon_76_004(3);
			return
		--�Ѿ�����λ���ŶԻ�
		elseif nTaskState_76 == 3 then
			weapon_76_005(3);
			return
		--ѡ��ѧϰ����ķ���
		elseif nTaskState_76 == 4 then
			weapon_76_choice(3);
			return
		end 
	end
		
	--��ʾ���76�������䷽����
	if (nSkillGenre == 1 and nSkillDetail ~= 4 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail)
	end
	
	Say("B�n ch�a �� �i�u ki�n nh�n nhi�m v� ph�i ch� c�p 76.", 0)
end;


-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 4)
	if (nGene == 1 and nSkillID == 4) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(796) == 0 and 
				HaveLearnRecipe(798) == 0 and 
				HaveLearnRecipe(799) == 0 and 
				HaveLearnRecipe(802) == 0 and 
				HaveLearnRecipe(803) == 0) then
				Say("H�y ch�n 1 lo�i v� kh� b�n mu�n h�c c�ch ch� t�o:",
					6,
					"�m kh�/learn_long_1",   
					"C�m/learn_long_2",  
					"B�t/learn_long_3",    
					"Cung/learn_long_4",
					"Tr�o/learn_long_5",
					"Ta suy ngh� l�i/SayHello")
			else
				Say("B�n �� h�c ���c ph��ng ph�p ph�i ch� m�i!", 0)
			end
		else
			Say("B�n v�n ch�a ho�n th�nh nhi�m v� ch� t�o K� M�n binh kh�!", 0)
		end
	else
		Say("B�n v�n ch�a h�c k� n�ng s�ng:<color=yellow>ch� t�o K� M�n binh kh�<color>!", 0)
	end
end;
-- ����
function learn_long_1()
	AddRecipe(796)
	Msg2Player("B�n h�c ���c ph�i ch�: M�n Thi�n Hoa V�")
end;
-- ��
function learn_long_2()
	AddRecipe(798)
	Msg2Player("B�n h�c ���c ph�i ch�: Hi Nh�n C�m")
end;
-- ��
function learn_long_3()
	AddRecipe(799)
	Msg2Player("B�n h�c ���c ph�i ch�: Th�n H�nh")
end;
-- ��
function learn_long_4()
	AddRecipe(802)
	Msg2Player("B�n h�c ���c ph�i ch�: Th�n Cung")
end;
-- צ
function learn_long_5()
	AddRecipe(803)
	Msg2Player("B�n h�c ���c ph�i ch�: M�nh H�")
end;



-- ���������
function forget_life_skill()
	if (GetLifeSkillLevel(1, 4) > 0) then
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
		Say(strTitle.."Ng��i v�n ch�a h�c k� n�ng ch� t�o K� M�n binh kh�? Ta gi�p ng��i nh�!", 0)
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
	
	if (GetLifeSkillLevel(1, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
			AbandonLifeSkill(1, 4)
			SetTask(LEV_LEARNRECIPE, 0)
			SetTask(LEVELTASKID49, 0)
			SetTask(1600, 0);				--���79�������䷽����
			SetTask(1601, 0);				--���79�������䷽����
			Msg2Player("K� n�ng ch� t�o binh kh� k� m�n c�a b�n �� qu�n.")				
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
	end
end;
--**********************************************������Ϣ****************************************
--��ĩ�
function Weekend()
	if (GetLifeSkillLevel(1,4) >= 1) then
		if (GetTask(HaveWeekend) == 1) then
        	Say(strTitle.."Ng��i �� h�c h�t c�c k� n�ng � ch� ta r�i!", 0)
       	elseif (CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1) then
    		Say(strTitle.."Th�i th� lo�n l�c, trang b� cho m�nh m�t k� n�ng c�ng kh�ng th�a ��u, ta s� gi�p ng��i!", 0)
   		  	AddRecipe(229)
   		  	Msg2Player("B�n h�c ���c k� n�ng m�i_Qu�n D�ng Ti�n Nang")
   		  	SetTask(HaveWeekend,1)
		end
	else
    	Say(strTitle.."Ng��i v�n ch�a h�c ch� t�o K� M�n binh kh� ho�c th�i gian ch�a ��n, ta kh�ng th� truy�n th� k� n�ng n�y cho ng��i.", 0)
    end
end
--**********************************************����ѧϰ����***************************************
--����ѧϰѡ��
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
		Say(strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.", 0)
  		return
	end
 	
    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B�ng h�u �� h�c k� n�ng s�n xu�t, mu�n h�c k� n�ng m�i c�n ph�i b� k� n�ng c�.", 0)
    	return
	end
  
	Say(strTitle.."<color=yellow>ch� t�o K� M�n binh kh�<color> l� k� n�ng s�n xu�t m�i, ng��i c� mu�n h�c kh�ng?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end
--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 4, 1, 79, 1)) then
			Msg2Player("B�n h�c ���c k� n�ng s�n xu�t: ch� t�o K� M�n binh kh� v� nh�n ���c 3 H�c Kim Ph�n.")
			AddItem(2,2,59,3)
		    
		    AddRecipe(110)
		    Msg2Player("B�n h�c ���c ph�i ch�: Li�u Di�p �ao")
		    AddRecipe(111)
		    Msg2Player("B�n h�c ���c ph�i ch�: �o�n Tr��ng ti�u")
		    AddRecipe(121)
		    Msg2Player("B�n h�c ���c ph�i ch�: Ng�c V�n c�m")
		    AddRecipe(122)
		    Msg2Player("B�n h�c ���c ph�i ch�: Kinh ��o c�m")
		    AddRecipe(132)
		    Msg2Player("B�n h�c ���c ph�i ch�: Ph�n Quan b�t")
		    AddRecipe(133)
		    Msg2Player("B�n h�c ���c ph�i ch�: Chi�t Xung b�t")
		    AddRecipe(760)
		    Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
		    AddRecipe(761)
		    Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
		    AddRecipe(771)
		    Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t tr�o")
		    AddRecipe(772)
		    Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang tr�o")
		    SetTask(LEV_LEARNRECIPE, 10)
		end
	else
		Say(strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.", 0)
	end
end;
--ȡ��ѧϰ����
function LearnNo()
    Say(strTitle.."H�y suy ngh� k� r�i quay l�i ��y nh�!", 0)
end
--**********************************************�䷽ѧϰ����***************************************
--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 4)
	if (nLevel >= 1) then
		if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(760) == 0) then
			AddRecipe(760)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			AddRecipe(761)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
		elseif GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			AddRecipe(761)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        	AddRecipe(762)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        	AddRecipe(763)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			AddRecipe(761)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        	AddRecipe(762)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        	AddRecipe(763)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        	AddRecipe(764)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			AddRecipe(761)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        	AddRecipe(762)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        	AddRecipe(763)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        	AddRecipe(764)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        	AddRecipe(765)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        	AddRecipe(766)
        	Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			AddRecipe(761)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
       		AddRecipe(762)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        	AddRecipe(763)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        	AddRecipe(764)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        	AddRecipe(765)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        	AddRecipe(766)
        	Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        	AddRecipe(767)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
      	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			AddRecipe(761)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        	AddRecipe(762)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        	AddRecipe(763)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        	AddRecipe(764)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        	AddRecipe(765)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        	AddRecipe(766)
        	Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        	AddRecipe(767)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
        	AddRecipe(768)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�n L�c")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
			AddRecipe(761)
			Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
        	AddRecipe(762)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        	AddRecipe(763)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        	AddRecipe(764)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        	AddRecipe(765)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        	AddRecipe(766)
        	Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        	AddRecipe(767)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
        	AddRecipe(768)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�n L�c")
        	AddRecipe(769)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xi Nha") 
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE)== 0) then
			AddRecipe(110)
		    Msg2Player("B�n h�c ���c ph�i ch�: Li�u Di�p �ao")
		    AddRecipe(111)
		    Msg2Player("B�n h�c ���c ph�i ch�: �o�n Tr��ng ti�u")
		    AddRecipe(121)
		    Msg2Player("B�n h�c ���c ph�i ch�: Ng�c V�n c�m")
		    AddRecipe(122)
		    Msg2Player("B�n h�c ���c ph�i ch�: Kinh ��o c�m")
		    AddRecipe(132)
		    Msg2Player("B�n h�c ���c ph�i ch�: Ph�n Quan b�t")
		    AddRecipe(133)
		    Msg2Player("B�n h�c ���c ph�i ch�: Chi�t Xung b�t")
		    AddRecipe(760)
		    Msg2Player("B�n h�c ���c ph�i ch�: Tr�c M�c Cung")
		    AddRecipe(761)
		    Msg2Player("B�n h�c ���c ph�i ch�: Thanh ��ng Cung")
		    AddRecipe(771)
		    Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t tr�o")
		    AddRecipe(772)
		    Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang tr�o")
		    SetTask(LEV_LEARNRECIPE, 10)    			  
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(112)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph� Di�t th�n ch�m")
        	AddRecipe(113)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� M�u Ly H�n ti�n")
        	AddRecipe(123)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�n L�i c�m")
        	AddRecipe(124)
        	Msg2Player("B�n h�c ���c ph�i ch�: Phi B�c Li�n ch�u")
        	AddRecipe(134)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xu�n Phong b�t")
        	AddRecipe(135)
        	Msg2Player("B�n h�c ���c ph�i ch�: Kinh L�i b�t")
        	AddRecipe(762)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tinh Thi�t Cung")
        	AddRecipe(763)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Nh�n Cung")
        	AddRecipe(773)
        	Msg2Player("B�n h�c ���c ph�i ch�: C� Quan tr�o")
        	AddRecipe(774)
        	Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng tr�o")
        	SetTask(LEV_LEARNRECIPE, 20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(114)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�c Huy�t th�n ch�m")
        	AddRecipe(125)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�i ��ng v�n v�t")
        	AddRecipe(136)
        	Msg2Player("B�n h�c ���c ph�i ch�: V� H�i b�t")
        	AddRecipe(764)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xuy�n T�m Cung")
        	AddRecipe(775)
        	Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
        	SetTask(LEV_LEARNRECIPE, 30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(115)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�c Phong ch�m")
        	AddRecipe(116)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� L� c�n kh�n")
        	AddRecipe(126)
        	Msg2Player("B�n h�c ���c ph�i ch�: Huy�n Nhai phi b�c")
        	AddRecipe(127)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�i Nguy�t thanh huy")
        	AddRecipe(137)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t b�t")
        	AddRecipe(138)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th� H�n b�t")
        	AddRecipe(765)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy Nguy�t Cung")
        	AddRecipe(766)
        	Msg2Player("B�n h�c ���c ph�i ch�: Di�t Di�m Cung")
        	AddRecipe(776)
        	Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
        	AddRecipe(777)
        	Msg2Player("B�n h�c ���c ph�i ch�: N� Di�m")
        	SetTask(LEV_LEARNRECIPE, 40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(117)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�m Sa X� �nh")
        	AddRecipe(118)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�t Tinh Th�u C�t ch�m")
        	AddRecipe(128)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Ti�u Ho�n b�i")
        	AddRecipe(129)
        	Msg2Player("B�n h�c ���c ph�i ch�: Hi�u Chung")
        	AddRecipe(139)
        	Msg2Player("B�n h�c ���c ph�i ch�: Long Thi�t")
        	AddRecipe(140)
        	Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
        	AddRecipe(767)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� Kim")
        	AddRecipe(778)
        	Msg2Player("B�n h�c ���c ph�i ch�: V�n Ki�p")
        	SetTask(LEV_LEARNRECIPE, 50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(119)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�t S�t Thi�n La")
        	AddRecipe(130)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c Kh�i")
        	AddRecipe(141)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph� Qu�n")
        	AddRecipe(768)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�n L�c")
        	AddRecipe(779)
        	Msg2Player("B�n h�c ���c ph�i ch�: D��ng Qu�n")
        	SetTask(LEV_LEARNRECIPE, 60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(120)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Ngo�i Phi Ti�n")
        	AddRecipe(131)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ti�u V�")
        	AddRecipe(142)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n C�")
        	AddRecipe(769)
        	Msg2Player("B�n h�c ���c ph�i ch�: Xi Nha")
        	AddRecipe(780)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�ng S��ng")
        	SetTask(LEV_LEARNRECIPE, 70)
    	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
    	  	AddRecipe(770)
        	Msg2Player("B�n h�c ���c ph�i ch�: Long Kh�u")
        	AddRecipe(781)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng� T�n")
        	SetTask(LEV_LEARNRECIPE, 80)
    	else
        	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!", 0)
    	end
    end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 4)
	if nLevel >= 79 then
    	AddRecipe(1117)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� ���ng M�n Ch�m"))
    	AddRecipe(1119)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Nga My ��n"))
    	AddRecipe(1123)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� V� �ang B�t"))
    	AddRecipe(1125)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� D��ng M�n Cung"))
    	AddRecipe(1127)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Ng� ��c Tr�o"))
    	AddRecipe(1129)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Th�y Y�n Phi�n"))
    	AddRecipe(1130)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Th�y Y�n ��ch"))
	else
    	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
	end
end

function learnCyEquip()
	local nLevel = GetLifeSkillLevel(1, 4)
	if nLevel >= 1 then
		AddRecipe(1090)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "�o�n Ti�u"))
    AddRecipe(1091)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "M�c Ti�u"))
    AddRecipe(1102)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "B�ch V�"))
    AddRecipe(1103)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Nh�n V�"))	
  end
	if nLevel >= 10 then
		AddRecipe(1092)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Tr�c Ti�u"))
    AddRecipe(1093)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "M�c Ti�u"))
    AddRecipe(1104)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "B�ch Ng�c"))
    AddRecipe(1105)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Hoa h�ng"))    
  end
	if nLevel >= 20 then
		AddRecipe(1094)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "T�t Ti�u"))
    AddRecipe(1106)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "��o Chi"))  
  end  
	if nLevel >= 30 then
		AddRecipe(1095)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "��ng Ti�u"))
    AddRecipe(1096)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Gi�c Th�ch"))
    AddRecipe(1107)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "T��c V�"))
    AddRecipe(1108)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Ng�n L�ng")) 
  end   
	if nLevel >= 40 then
		AddRecipe(1097)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Lam Linh"))
    AddRecipe(1098)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Huy�n H�ng"))
    AddRecipe(1109)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Kim M�ng"))
    AddRecipe(1110)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Ti�u H�n"))  
  end  
	if nLevel >= 50 then
		AddRecipe(1099)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Th�y Ng�c"))
    AddRecipe(1111)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Tuy�t H�n"))  
  end  
	if nLevel >= 60 then
		AddRecipe(1100)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Ng�n Ti"))
    AddRecipe(1112)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "�i�p Th�y"))  
  end  
	if nLevel >= 79 then
		AddRecipe(1101)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Minh B�ng"))
    AddRecipe(1113)
    Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Ng�c Doanh"))    
	end
end

--��ѧצ�䷽
function luaLearnRecipeZhua()
	local nLevel = GetLifeSkillLevel(1, 4);
	if (GetLifeSkillLevel(1, 4) > 1) then
    	if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(771) == 0) then
    		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
    	elseif (GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(771)==0) then
      		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
      		AddRecipe(773)
      		Msg2Player("B�n h�c ���c ph�i ch�: C� Quan Tr�o")
      		AddRecipe(774)
      		Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng Tr�o")
    	elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
      		AddRecipe(773)
      		Msg2Player("B�n h�c ���c ph�i ch�: C� Quan Tr�o")
      		AddRecipe(774)
      		Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng Tr�o")
      		AddRecipe(775)
      		Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
      	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
      		AddRecipe(773)
      		Msg2Player("B�n h�c ���c ph�i ch�: C� Quan Tr�o")
      		AddRecipe(774)
      		Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng Tr�o")
      		AddRecipe(775)
      		Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
      		AddRecipe(776)
      		Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
      		AddRecipe(777)
      		Msg2Player("B�n h�c ���c ph�i ch�: N� Di�m")
      	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
      		AddRecipe(773)
      		Msg2Player("B�n h�c ���c ph�i ch�: C� Quan Tr�o")
      		AddRecipe(774)
      		Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng Tr�o")
      		AddRecipe(775)
      		Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
      		AddRecipe(776)
      		Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
      		AddRecipe(777)
      		Msg2Player("B�n h�c ���c ph�i ch�: N� Di�m")
      		AddRecipe(778)
      		Msg2Player("B�n h�c ���c ph�i ch�: V�n Ki�p")
      	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
      		AddRecipe(773)
      		Msg2Player("B�n h�c ���c ph�i ch�: C� Quan Tr�o")
      		AddRecipe(774)
      		Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng Tr�o")
      		AddRecipe(775)
      		Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
      		AddRecipe(776)
      		Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
      		AddRecipe(777)
      		Msg2Player("B�n h�c ���c ph�i ch�: N� Di�m")
      		AddRecipe(778)
      		Msg2Player("B�n h�c ���c ph�i ch�: V�n Ki�p")
      		AddRecipe(779)
      		Msg2Player("B�n h�c ���c ph�i ch�: D��ng Du�n")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
      		AddRecipe(773)
      		Msg2Player("B�n h�c ���c ph�i ch�: C� Quan Tr�o")
      		AddRecipe(774)
      		Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng Tr�o")
      		AddRecipe(775)
      		Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
      		AddRecipe(776)
      		Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
      		AddRecipe(777)
      		Msg2Player("B�n h�c ���c ph�i ch�: N� Di�m")
      		AddRecipe(778)
      		Msg2Player("B�n h�c ���c ph�i ch�: V�n Ki�p")
      		AddRecipe(779)
      		Msg2Player("B�n h�c ���c ph�i ch�: D��ng Du�n")
      		AddRecipe(780)
      		Msg2Player("B�n h�c ���c ph�i ch�: Ng�ng S��ng")
      	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B�n h�c ���c ph�i ch�: H�c Thi�t Tr�o")
      		AddRecipe(772)
      		Msg2Player("B�n h�c ���c ph�i ch�: Tinh Cang Tr�o")
      		AddRecipe(773)
      		Msg2Player("B�n h�c ���c ph�i ch�: C� Quan Tr�o")
      		AddRecipe(774)
      		Msg2Player("B�n h�c ���c ph�i ch�: Phi Ho�ng Tr�o")
      		AddRecipe(775)
      		Msg2Player("B�n h�c ���c ph�i ch�: �m Th�ch")
      		AddRecipe(776)
      		Msg2Player("B�n h�c ���c ph�i ch�: R�ng s�i")
      		AddRecipe(777)
      		Msg2Player("B�n h�c ���c ph�i ch�: N� Di�m")
      		AddRecipe(778)
		    Msg2Player("B�n h�c ���c ph�i ch�: V�n Ki�p")
      		AddRecipe(779)
      		Msg2Player("B�n h�c ���c ph�i ch�: D��ng Du�n")
      		AddRecipe(780)
      		Msg2Player("B�n h�c ���c ph�i ch�: Ng�ng S��ng")
      		AddRecipe(781)
      		Msg2Player("B�n h�c ���c ph�i ch�: Ng� T�n")
      	end
	end
end;
--�������Ϣ
function Dating()
	Talk(1, "", strTitle.."Mu�n ch� t�o 1 binh kh� tuy�t th� v� song, c�n ph�i b� th�m nhi�u v�t ph� gia, ng��i h�y th� b� th�m 1 s� v�t li�u t�t, c� th� s� r�n ���c nh�ng v� kh� c� m�t kh�ng hai.")
end
--************************************************ͨ�ô���**************************************
--�պ���
function SayHello()	
end
--=================================================̫���������Ӻ���======================================
--******************************̫������Ի�****************************
function taixu_jwl_dia_step1()
	Talk(	4,"taixu_jwl_goods_need",
			"Mu�n t�ng c�p <color=yellow>Trang s�c Th�i H�<color> �? ��� ta xem�",
			"�..",
			"C� c�ch n�y c� th� th� xem, nh�ng c�n <color=yellow>1 m�nh C��ng h�a tinh kim<color>. <color=yellow>C��ng h�a tinh kim<color> ch� c� ���c th�ng qua vi�c<color=yellow>tinh luy�n B�ng Th�ch<color>, m�i l�n tinh luy�n nh� v�y ti�u hao m�t s� <color=yellow>ti�n v�ng<color> v� <color=yellow>Thi�n th�ch<color>",
			"Nh�ng nguy�n li�u sau ��y kh�ng th� thi�u trong vi�c t�ng c�p <color=yellow>Trang s�c Th�i H�<color>. <color=yellow>ti�n v�ng<color> t�ch t� tinh kh�, <color=yellow>Thi�n th�ch<color> t�ng c�p trang b�, <color=yellow>B�ng Th�ch<color> ��c binh kh� th�n binh"
		)
end
function taixu_jwl_goods_need()
	Talk(2,"taixu_jwl_up_inf_end",
		"Ng��i t�m <color=yellow>1 m�nh B�ng Th�ch<color>, <color=yellow>"..taixu_jwl_up_met_table[1][5].."   ho�ng kim <color>v�<color=yellow> "..taixu_jwl_up_met_table[1][6].."   thi�n th�ch <color>c�ng tinh luy�n s� thu ���c <color=yellow>c��ng h�a tinh kim<color>. N�u nh� b�n kh�ng mu�n m�t nhi�u ti�n �� mua nguy�n li�u th� c�ng c� th� ph�n ra l�m <color=yellow>3 l�n tinh luy�n<color>, m�i l�n c�n <color=yellow>"..taixu_jwl_up_met_table[2][5].."   ho�ng kim <color>v�<color=yellow> "..taixu_jwl_up_met_table[2][6].."  thi�n th�ch<color>. Tuy nhi�n c�ch n�y s� g�p r�t nhi�u nguy hi�m, ��c bi�t l� c� th� tinh luy�n th�t b�i.",
		"Nh�ng g� c�n n�i ta �� n�i h�t r�i, b�y gi� ch�ng ta b�t ��u luy�n <color=yellow>C��ng h�a tinh kim<color>."
	)
end
function taixu_jwl_up_inf_end()
	SetTask(taixu_jwl_taskID,2)
	TaskTip("T�m �� nguy�n li�u C��ng h�a tinh kim (v�ng, Thi�n th�ch) sau �� ��n g�p M�c Tam")
end
--*****************************̫����������ǿ������*******************************
function taixu_jwl_up_iron()
	Say("Ng��i mu�n luy�n 1 l�n C��ng h�a tinh kim hay ph�n th�nh nhi�u l�n?",
	6,
	"Ta mu�n d�ng m�nh B�ng Th�ch luy�n th�nh C��ng h�a tinh kim s� c�p (c� kh� n�ng th�t b�i)/#taixu_jwl_up(2)",
	"Ta mu�n d�ng C��ng h�a tinh kim s� c�p luy�n th�nh C��ng h�a tinh kim trung c�p (c� kh� n�ng th�t b�i)/#taixu_jwl_up(3)",
	"Ta mu�n C��ng h�a tinh kim trung c�p luy�n th�nh C��ng h�a tinh kim (c� kh� n�ng th�t b�i)/#taixu_jwl_up(4)",
	"Ta mu�n C��ng h�a tinh kim 1 l�n (Th�nh c�ng 100%)/#taixu_jwl_up_one_time()",
	"Ta mu�n t�m hi�u nguy�n li�u d�ng �� th� luy�n/taixu_jwl_up_needs",
	"�� suy ngh� l�i./end_dialog"
	)
end
--*************************************����ȷ�Ͻ���*********************************
function taixu_jwl_up_dtm(up_diff)
	Say("Th� luy�n"..taixu_jwl_up_met_table[up_diff][12].."C�n <color=yellow>1<color>B�ng Th�ch tinh luy�n, <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> m�nh Thi�n th�ch v� <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> ho�ng kim, <color=yellow>v� c�ng c� th� th�t b�i<color>, b�n c� ch�c mu�n tinh luy�n?",
	2,
	"Ta ��ng � th� luy�n"..taixu_jwl_up_met_table[up_diff][12].."/#taixu_jwl_up("..up_diff..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
function taixu_jwl_up_needs()
	Say("Ng��i c� th� ch�n th� luy�n 1 l�n ho�c chia l�m 3 l�n. Th� luy�n 1 l�n c�n <color=yellow>"..taixu_jwl_up_met_table[1][5].."<color> ho�ng kim v� <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> m�nh Thi�n th�ch. Th� luy�n 3 l�n c�n <color=yellow>"..taixu_jwl_up_met_table[2][5].."<color> ho�ng kim v� <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> Thi�n th�ch.",
	2,
	"Ta mu�n th� luy�n/taixu_jwl_up_iron",
	"Tho�t/end_dialog")
end
--******************************һ��������****************************
function taixu_jwl_up_one_time()
	local iron_num = GetTask(taixu_jwl_iron_up_num)
	if iron_num == nil then
		Talk(1,"","Th� luy�n C��ng h�a tinh kim 1 l�n c�n <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> m�nh Thi�n th�ch, n�u ng��i kh�ng �� Thi�n th�ch c�ng kh�ng sao, khi n�o t�m �� <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> ch�ng ta ti�p t�c th� luy�n n�o!")
		return
	elseif iron_num >= 0 and iron_num < taixu_jwl_up_met_table[1][6] then
		Say("Hi�n c�n <color=yellow>"..(taixu_jwl_up_met_table[1][6]-iron_num).."<color>Thi�n th�ch m�i c� th� th� luy�n? Ng��i c� ch�?",
		2,
		"Ta c� mang theo Thi�n th�ch ��y!/#up_iron("..(taixu_jwl_up_met_table[1][6]-iron_num)..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif iron_num >= taixu_jwl_up_met_table[1][6] then
		taixu_jwl_up(1)
	end
	
end
--******************************�����ύ*****************************
function up_iron(num_remain)
	local iron_num_take = GetItemCount(2,2,8)
	if iron_num_take == 0 then
		Talk(1,"","Thi�n th�ch ng��i mang theo kh�ng ��!")
		return
	end
	local del_flag = 0
	if iron_num_take > num_remain then
		del_flag = DelItem(2,2,8,num_remain)
		if del_flag ~= 1 then
			Talk(1,"","Thi�n th�ch ng��i mang theo kh�ng ��!")
			return
		else
			SetTask(taixu_jwl_iron_up_num,taixu_jwl_up_met_table[1][6])
			Say("Ng��i �� c� �� <color=yellow>"..num_remain.."<color>Thi�n th�ch, ��ng � th� luy�n ch�?",
			2,
			"B�t ��u th� luy�n/#taixu_jwl_up(1)",
			"Ta v�n ch�a chu�n b�/end_dialog")
		end
	else
		del_flag = DelItem(2,2,8,iron_num_take)
		if del_flag ~= 1 then
			Talk(1,"","Thi�n th�ch ng��i mang theo kh�ng ��!")
			return			
		else
			SetTask(taixu_jwl_iron_up_num,(taixu_jwl_up_met_table[1][6] - num_remain + iron_num_take))
			Talk(1,"","Ng��i �� c� �� <color=yellow>"..iron_num_take.."<color>Thi�n th�ch, c�n thi�u<color=yellow>"..(num_remain - iron_num_take).."<color>Thi�n th�ch, c� th� C��ng h�a tinh kim!")
			return
		end
	end
end
function taixu_jwl_up(up_step)
	--�����ռ���
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kho�ng tr�ng h�nh trang kh�ng ��, xin xem l�i!")
		return
	end
	--����Ҫ����Ʒ�Լ����ϼ��
	if taixu_jwl_up_goods_chk(up_step) == 0 then
		return
	end
	--����������ʼɾ��
	if Pay(taixu_jwl_up_met_table[up_step][5]*10000) ~= 1 then
		Talk(1,"","<color=yellow>ti�n v�ng<color> ng��i mang theo kh�ng ��!")
		return 0
	end
	if up_step == 1 and GetTask(taixu_jwl_iron_up_num) < taixu_jwl_up_met_table[1][6] then
		Talk(1,"","Thi�n th�ch ng��i mang kh�ng �� <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color>, kh�ng th� th� luy�n C��ng h�a tinh kim 1 l�n ���c!")
	end
	if DelItem(taixu_jwl_up_met_table[up_step][1],taixu_jwl_up_met_table[up_step][2],taixu_jwl_up_met_table[up_step][3],1) ~= 1 then
		Talk(1,"","X�c nh�n c� mang theo "..taixu_jwl_up_met_table[up_step][4])
		return 0
	end
	if up_step~= 1 and DelItem(2,2,8,taixu_jwl_up_met_table[up_step][6]) ~= 1  then
		Talk(1,"","<color=yellow>Thi�n th�ch<color> ng��i mang theo kh�ng ��<color=yellow>"..taixu_jwl_up_met_table[up_step][6].."<color>!")
		return 0
	end
	if random(1,100) <= taixu_jwl_up_met_table[up_step][8] then
		local add_flag = AddItem(taixu_jwl_up_met_table[up_step][9],taixu_jwl_up_met_table[up_step][10],taixu_jwl_up_met_table[up_step][11],1)
		if add_flag == 1 then
			if up_step == 1 or up_step == 4 then
				SetTask(taixu_jwl_taskID,3)
				SetTask(taixu_jwl_iron_up_num,0)
				Talk(7,"kill_liu_dia_start",
				"Th�nh c�ng r�i! <color=yellow>C��ng h�a tinh kim<color> �� luy�n th�nh!",
				"S� ph� �� luy�n th�nh c�ng <color=yellow>C��ng h�a tinh kim<color>, cho v�n b�i th� th�",
				"���c, nh�ng ��i ta m�t l�t",
				"�..",
				"�, v�n ch�a ���c. Ph��ng ph�p th� ��ng r�i nh�ng huy�n kh� v�n kh�ng t�ch t�. Kh�ng th�nh r�i�",
				"<color=yellow>Th� r�n L�u<color> � <color=yellow>T��ng D��ng <color>, ng��i bi�t ch�?",
				"<color=yellow>Th� r�n L�u<color>? Ng��i n�y n�i ti�ng nh� v�y ai l�i kh�ng bi�t ch�."
				)
			else
				Talk(1,"","Th�nh c�ng r�i!"..taixu_jwl_up_met_table[up_step][12].."�� luy�n ���c r�i!")
				return
			end
		else
			WriteLog("Nhi�m v� trang s�c Th�i H�_Ng��i ch�i:"..GetName().."Nh�n ���c"..taixu_jwl_up_met_table[up_step][12].."Th�t b�i, th�t b�i �:"..add_flag)
		end
	else
		Talk(1,"","��ng ti�c, l�n n�y luy�n kh�ng th�nh,"..taixu_jwl_up_met_table[up_step][4].."ph�i luy�n l�i th�i.")
		return
	end
end
--****************************��������Ҫ����Ʒ���*************************
function taixu_jwl_up_goods_chk(up_step)
	if GetItemCount(taixu_jwl_up_met_table[up_step][1],taixu_jwl_up_met_table[up_step][2],taixu_jwl_up_met_table[up_step][3]) == 0 then
		Talk(1,"","Ng��i c� mang theo <color=yellow>"..taixu_jwl_up_met_table[up_step][4].."<color>!")
		return 0
	elseif GetCash() < (taixu_jwl_up_met_table[up_step][5]*10000) then
		Talk(1,"","<color=yellow>ti�n v�ng<color> ng��i mang theo kh�ng ��!")
		return 0
	elseif up_step~= 1 and GetItemCount(2,2,8) < taixu_jwl_up_met_table[up_step][6] then
		Talk(1,"","<color=yellow>Thi�n th�ch<color> ng��i mang theo kh�ng ��!")
		return 0
	end
	return 1
end
--*********************************ɱ�������ĶԻ�**************************
function kill_liu_dia_start()
	Talk(4,"kill_liu_dia_1",
	"n�i v� tay ngh� th� l�o <color=yellow>Th� r�n L�u<color> n�y c�ng ch� ngang h�ng c� ta. Nh�ng l�o �y kh�ng h� nh�n �� t�. L�o th�ch s�u t�m k� kim d� th�ch, ta c�ng kh�ng c� c�m t�nh v�i l�o �y.",
	"Nghe n�i tr��c ��y l�o d�ng Thi�n th�ch B�ng Th�ch tinh luy�n n�n <color=yellow>K� Kim<color>. Khi luy�n trang s�c c� ���c K� Kim s� nhanh ch�ng t�ch t� huy�n kh�, m�c �� th�nh c�ng s� cao.",
	"�"..Zgc_pub_sex_name()..", ng��i t�m c�ch ti�p c�n <color=yellow>th� r�n L�u<color>"..Zgc_pub_sex_name().."�o�t ���c m�nh K� Kim c�a l�o ch�ng ta s� luy�n th�nh c�ng",
	"S� ph� n�i r�t c� l�, �� ta th� xem."
	)
end
function kill_liu_dia_1()
	Talk(4,"kill_liu_dia_2",
	"<color=yellow>Th� r�n L�u<color> c� t�nh nghi ng�, v� v�y m� Thi�n Th�ch B�ng Th�ch l�o gi�u � ngo�i th�nh, c� th� � ��u th� kh�ng ai bi�t ���c. Nh�ng ta bi�t m�i t�i t� <color=yellow>21:00-21:30<color> l�o ��u �i qua <color=yellow>Linh B�o S�n<color>."..Zgc_pub_sex_name().."Tr��c <color=yellow>21 gi�<color> m�i ng�y, ng��i c�m <color=yellow>Thi�t ch�y<color> c�a ta ��n <color=yellow>Linh B�o S�n<color> ��i, nh�t ��nh s� g�p <color=yellow>Th� r�n L�u<color>.",
	"L� sao, ta kh�ng hi�u!",
	"<color=yellow>Thi�t ch�y<color> c�a ta tr�ng b�nh th��ng nh�ng n� l� m�t d� b�o. <color=yellow>Th� r�n L�u<color> r�t th�ch, �� nhi�u l�n mua l�i nh�ng ta kh�ng b�n. L�o t�m c�ch �o�t n� nh�ng kh�ng ���c. L�n n�y �em ra d�, nh�t ��nh l�o s� xu�t hi�n."..Zgc_pub_sex_name().."Ch� c�n �o�t ���c <color=yellow>K� Kim<color> c�a l�o l� ���c r�i!",
	"Th� ra l� v�y! �� ta th� xem."
	)
end
function kill_liu_dia_2()
	Talk(3,"mo3_hammer_add",
	"Ch� c�n mang <color=yellow>Thi�t ch�y<color> c�a ta ��n <color=yellow>B�o Linh S�n<color> d� l�o L�u. Nh�ng"..Zgc_pub_sex_name().."v� c�ng c�a <color=yellow>Th� r�n L�u<color> r�t l�i h�i, ng��i ph�i c�n tr�ng."..Zgc_pub_sex_name().."N�u c� ���c ��ng ��i h� tr� th� qu� l� th��ng s�ch.",
	"C�n n�a, n�u tr��c �� �� c� ng��i ��nh b�i <color=yellow>Th� r�n L�u <color> r�i �t h�n <color=yellow>l�o<color> s� kh�ng xu�t hi�n ngay. Ng��i ph�i <color=yellow>lui t�i nhi�u l�n<color>, m�i l�n ph�i <color=yellow>��i m�t l�c<color>, m�i c� th� g�p ���c<color=yellow>l�o L�u<color>.",
	"�a t� M�c s� ph� �� ch� gi�o."
)
	TaskTip("D�ng Thi�t Ch�y c�a M�c Tam ��nh b�i th� r�n L�u �o�t K� Kim.")
end
--****************************����Ī���Ĵ���****************
function mo3_hammer_add()
	if BigGetItemCount(2,1,564) ~= 0 then
		Talk(1,"","Thi�t ch�y c�a ta c�ng ch�ng c� g� t�t l�m"..Zgc_pub_sex_name()..", hay c� d�ng ch�y c�a ng��i xem.")
		return
	end
	local add_flag = AddItem(2,1,564,1)
	Talk(1,"",Zgc_pub_sex_name().."Ng��i nh� m�i ng�y tr��c <color=yellow>21:00-21:30<color> ��n Linh B�o S�n, n�u kh�ng g�p <color=yellow>Th� r�n L�u<color>,"..Zgc_pub_sex_name().."C� th� ��n ch� ta nh�n")
	return
end
function taixu_jwl_up_jwl()
	local taixu_jwl_dia_list = {}
	for i = 1, getn(taixu_jwl_list) do
		taixu_jwl_dia_list[i] = "Ta mu�n th� luy�n"..taixu_jwl_list[i][1].."*/#taixu_jwl_chk("..i..")"
	end
	taixu_jwl_dia_list[getn(taixu_jwl_list)+1] = "�� ta suy ngh� l�i/end_dialog"
	Say("Ng��i ch�n lo�i <color=yellow>Trang s�c Th�i H�<color> n�o?",
	getn(taixu_jwl_dia_list),taixu_jwl_dia_list
	)
end
function taixu_jwl_chk(jwl_diff)
	--�����ռ���
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kho�ng tr�ng h�nh trang kh�ng ��, xin xem l�i!")
		return
	end
	--̫������Я�����
	if GetItemCount(0,102,taixu_jwl_list[jwl_diff][2]) == 0 then
		Talk(1,"","Ng��i kh�ng mang theo <color=yellow>"..taixu_jwl_list[jwl_diff][1].."<color> �!!")
		return
	end
	--ǿ������Я�����
	if GetItemCount(2,1,562) == 0 then
		Talk(1,"","Ng��i kh�ng mang <color=yellow>C��ng h�a tinh kim<color> �?")
		return
	end
	--���Я�����
	if GetItemCount(2,1,563) == 0 then
		Talk(1,"","Ng��i kh�ng c� <color=yellow>K� Kim c�a Th� r�n L�u<color> �?")
		return
	end
	--���ɾ�����
	local del_flag = DelItem(2,1,563,1)
	if del_flag ~= 1 then
		Talk(1,"","Ng��i kh�ng c� <color=yellow>K� Kim c�a Th� r�n L�u<color> �?")
		return		
	end
	--ǿ������ɾ�����
	del_flag = DelItem(2,1,562,1)
	if del_flag ~= 1 then
		Talk(1,"","Ng��i kh�ng mang <color=yellow>C��ng h�a tinh kim<color> �?")
		return
	end
	--̫������ɾ�����
	del_flag = DelItem(0,102,taixu_jwl_list[jwl_diff][2],1)
	if del_flag ~= 1 then
		Talk(1,"","Ng��i kh�ng mang theo <color=yellow>"..taixu_jwl_list[jwl_diff][1].."<color> �!!")
		return	
	end
	--װ������
	local add_flag = AddItem(0,102,taixu_jwl_list[jwl_diff][4],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		SetTask(taixu_jwl_taskID,0)
		Msg2SubWorld("Ch�c m�ng:"..GetName().." Ho�n th�nh nhi�m v� Trang s�c Th�i H�, s�"..taixu_jwl_list[jwl_diff][1].."T�ng c�p th�nh "..taixu_jwl_list[jwl_diff][3].."!")
		Talk(4,"",
			"Th�nh c�ng r�i!",
			"�"..Zgc_pub_sex_name()..", ��y m�i ��ng l� <color=yellow>Trang s�c Th�i H�<color>! Qu� l� tuy�t di�u!",
			"�a t� M�c ti�n b�i, l�n n�y n�u kh�ng c� ti�n b�i gi�p �� th�t kh�ng bi�t l�m sao.",
			"��u l� m�t nh�"..Zgc_pub_sex_name().."kh�ch kh� l�m g�. C�m l�y! Nh� ��ng l�m h� ��!"
		)
		WriteLog("Nhi�m v� trang s�c Th�i H�_Ng��i ch�i:"..GetName().."Nh�n ���c "..taixu_jwl_list[jwl_diff][2].."!")
	else
		WriteLog("Nhi�m v� trang s�c Th�i H�_Ng��i ch�i:"..GetName().."T�ng"..taixu_jwl_list[jwl_diff][2].." th�t b�i, k� hi�u:"..add_flag)
	end	
end
--======================================================����=============================================

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>trang b� b�t qu�i<color>l� huynh �� M�c gia ta v� l�o L�u � T��ng D��ng, C�m N��ng �� to�n l�c c�ng nhau nghi�n c�u ra t�m huy�t. L�m th� n�o nh�n ���c nh�ng m�n c� linh th�ch ng��i �i h�i truy�n nh�n s� r�, n�u ng��i mu�n t�m hi�u l�m th� n�o ch� t�o ���c <color=yellow>trang b�<color> kh�m linh th�ch, th� ��n ch� ta t�m hi�u nh�.",
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
function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 4)
	if (GetLifeSkillLevel(1, 4) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1013) == 0) then
        	AddRecipe(1006)
        	Msg2Player("B�n h�c ���c ph�i ch�: M�n Thi�n Hoa V�")
        	AddRecipe(1008)
        	Msg2Player("B�n h�c ���c ph�i ch�: Hi Nh�n C�m")
        	AddRecipe(1009)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�n H�nh")
        	AddRecipe(1012)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�n Cung")        	
        	AddRecipe(1013)
        	Msg2Player("B�n h�c ���c ph�i ch�: M�nh H�")
    end
end
end

function update_max_skill_level()
	Say(strTitle..format("M� r�ng c�p k� n�ng s�n xu�t c�n k� n�ng thu th�p ��t c�p 79 ��ng th�i ti�u hao %d V�ng", 1000), 
		2, "��ng �/update_max_skill_level_ensure", "T�i h� ch� xem qua th�i/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 4) < 79 then
		Talk(1,"",format("Hi�n t�i c�p k� n�ng s�n xu�t ch�a ��t c�p %d, kh�ng th� m� r�ng c�p gi�i h�n k� n�ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng�n l��ng kh�ng �� %d v�ng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 4, 99);
	Msg2Player("Ch�c m�ng c�p gi�i h�n k� n�ng s�n xu�t �� ��t c�p 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
