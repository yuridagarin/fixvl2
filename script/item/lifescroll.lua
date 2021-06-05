-- =========================================================
-- File: ���������Ľű�
-- Name: lifescroll.lua
-- ID:   2, 19, 1
-- Desc: ���Ѿ�ѧϰ�˵�����ܼ�¼�������������棬����ʹ���Ժ�ѧ��������������������
-- Creator: Tony(Jizheng)
-- Date: Aug 28th, 2006
-- =========================================================

strTabMainSkill = {"K� ngh� gia truy�n", "Ch� t�o binh kh� d�i", "Ch� t�o binh kh� ng�n", "Ch� t�o k� m�n binh kh�", 
				   "L�m h� gi�p", "Ch� thu�c", "N�u n��ng", "Ch� ph�", "H� trang", "��u qu�n"}
							 
strTabSubSkill = {"��n c�y", "L�m da", "Canh t�c",	"H�i thu�c", "��o kho�ng", "K�o t�", "T�p linh"}


-- ʹ����Ʒ��ʱ��Ĭ�ϵ���ں���
function OnUse(nIdx)
	local nScrollIndex = tonumber(nIdx)		-- ��ʹ�õ�����������Index
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollIndex)
	
	-- ����Ѿ���������ܵľ���
	if (nLifeSkillID > 0) then
		local strSayPrefix = "B�n ph�i s� d�ng s� tay s�ng, h�c k� n�ng <color=yellow>"
		local strSaySuffix = "<color>, k� n�ng ��t: <color=yellow>"..nLifeSkillLevel.."<color>, �i�m kinh nghi�m hi�n t�i l�: <color=yellow>"..nLifeSkillExp.."<color>. X�c ��nh ch�?"
		local strSay
		if (nLifeSkillType == 0) then
			strSay = strSayPrefix..strTabSubSkill[nLifeSkillID]..strSaySuffix
		else
			strSay = strSayPrefix..strTabMainSkill[nLifeSkillID]..strSaySuffix
		end
		
		Say(strSay,
			2,
			"H�c k� n�ng/#learn_skill("..nScrollIndex..")",
			"Suy ngh� l�i/exit_dialog")
		
	-- ����Ǹ��յľ���
	else
		EnterCatchLifeSkill(nScrollIndex)	-- ֪ͨ�������ȡ������ܵ�״̬
	end
end;

-- �������ȡ�����Ժ�Ĭ�ϵĻص�����
function OnCatchLifeSkill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	-- �������Ҫȡ�µ������
	if (nLifeSkillID > 0) then
		if (nLifeSkillType == 1 and nLifeSkillID == 1) then
			Say("<color=yellow>K� n�ng giang h�<color> kh�ng th� h�c t�y ti�n!", 0)
		end
		
		if (nLifeSkillType == 0) then
			Say("B�n x�c nh�n mu�n h�c k� n�ng thu th�p: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color> v� s� d�ng s� tay s�ng kh�ng?",
				2,
				"X�c nh�n/catch_life_skill",
				"T�m th�i kh�ng mu�n h�c/exit_dialog")
		else
			Say("B�n x�c nh�n mu�n h�c k� n�ng s�n xu�t: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color> v� s� d�ng s� tay s�ng kh�ng?",
				2,
				"X�c nh�n/catch_life_skill",
				"T�m th�i kh�ng mu�n h�c/exit_dialog")
		end
	end
end;

-- ��ʽ������ܴ��������
function catch_life_skill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	if (MakeALifeScroll() == 1) then
		if (nLifeSkillType == 1 and (nLifeSkillID == 5 or nLifeSkillID == 9 or nLifeSkillID == 10)) then	-- �������첹��ͼֽ
			pay_back_blueprints()
		end
		if (nLifeSkillType == 1 and (nLifeSkillID == 2 or nLifeSkillID == 3 or nLifeSkillID == 4)) then		-- ��������
			pay_back_weaponprints()
		end
		clean_task_values(nLifeSkillType, nLifeSkillID)
		AbandonLifeSkill(nLifeSkillType, nLifeSkillID)
		if (nLifeSkillType == 0) then
			Say("B�n �� h�c ���c k� n�ng thu th�p: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color> v� s� d�ng ���c s� tay s�ng.", 0)
		else
			Say("B�n �� h�c ���c k� n�ng s�n xu�t: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color> v� s� d�ng ���c s� tay s�ng.", 0)
		end
	end
end;


-- ʲô�������Ŀպ���
function exit_dialog()
end;

-- ȷ��Ҫѧϰ�����
function learn_skill(nScrollIndex)
	local nScrollItemIdx = tonumber(nScrollIndex)
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollItemIdx)

	-- ����Ƿ�����
	if (GetLevel() < 10 or GetTask(1925) ~= 15) then
		Say("B�n c�n ph�i ��t ��n c�p 10 v� ho�n th�nh nhi�m v� t�n th� m�i c� th� h�c k� n�ng s�ng!", 0)
		return
	end

	-- ����Ƿ�ѧ����	
	if (nLifeSkillType ~= 0) then		-- �Ǹ����ܣ������û��ѧ��һ���ļ���
	--	if (GetLifeSkillLevel(nLifeSkillType, nLifeSkillID) > 0) then
	--		Say("���Ѿ�ѧ��������ɼ����ܣ�Ҫ����ѧϰ��������������ȡ�µ�ǰ����ܣ�<color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>��", 0)
	--		return
	--	end
	--else								-- �������ܣ������û��ѧ���κ�һ��������
		if (GetLifeSkillsNum(1) >= 2) then
			Say("B�n �� h�c k� n�ng s�n xu�t! Mu�n h�c k� n�ng s�n xu�t m�i, ph�i x�a �i ho�c h�c l�i k� n�ng s�n xu�t v�n c�!", 0)
			return
		end
	end
	
	-- ����ɹ�ɾ����ָ������
	if (DelItemByIndex(nScrollItemIdx, 1) == 1) then
		if (nLifeSkillLevel <= 79) then
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 79, nLifeSkillType)
		else
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 99, nLifeSkillType)
		end
		AddLifeSkillExp(nLifeSkillType, nLifeSkillID, nLifeSkillExp)
		
		if (nLifeSkillType == 0) then
			Say("B�n �� h�c th�nh c�ng k� n�ng s�ng: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>. Xin ch�c m�ng!", 0)
		else
			Say("B�n �� h�c th�nh c�ng k� n�ng s�ng: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color>. Xin ch�c m�ng!", 0)
		end
	end
end;


-- �����ص��������
function clean_task_values(nLifeSkillType, nLifeSkillID)
	if (nLifeSkillType == 1) then
		-- �䷽��ǰѧ���ĵȼ� LEV_LEARNRECIPE
		SetTask(1926, 0)	
		
		-- ���¼��ܵ��Ա�ѡ�� RECIPE_SEX
		if (nLifeSkillID == 5 or nLifeSkillID == 9 or nLifeSkillID == 10) then
			SetTask(1935, 0)	
		end	
	end
end;

-- �������첹��ͼֽ
function pay_back_weaponprints()
	if (HaveLearnRecipe(955) > 0 or HaveLearnRecipe(956) > 0) then	-- ��ħ���֮ս�⵶��
		AddItem(2, 1, 1071, 1)
		Msg2Player("B�n nh�n ���c 1 Chi�n � �ao ph�!")
	end
	if (HaveLearnRecipe(957) > 0 or HaveLearnRecipe(958) > 0) then	-- ��ħ���֮ս�����
		AddItem(2, 1, 1072, 1)
		Msg2Player("B�n nh�n ���c 1 Chi�n � c�n ph�!")
	end
	if (HaveLearnRecipe(959) > 0 or HaveLearnRecipe(960) > 0) then	-- ������ʦ֮��������
		AddItem(2, 1, 1073, 1)
		Msg2Player("B�n nh�n ���c 1 Thi�n T�nh tr��ng ph�!")
	end
	if (HaveLearnRecipe(961) > 0 or HaveLearnRecipe(962) > 0) then	-- �����޺�֮��������
		AddItem(2, 1, 1074, 1)
		Msg2Player("B�n nh�n ���c 1 ��u Kh� th� ph�!")
	end
	if (HaveLearnRecipe(963) > 0 or HaveLearnRecipe(964) > 0 or
		HaveLearnRecipe(965) > 0 or HaveLearnRecipe(966) > 0) then	-- �ض��̿�֮��������
		AddItem(2, 1, 1075, 1)
		Msg2Player("B�n nh�n ���c 1 B� ��c ch�m ph�!")
	end
	
	if (HaveLearnRecipe(967) > 0 or HaveLearnRecipe(968) > 0) then	-- ����ʹ֮���ƽ���
		AddItem(2, 1, 1076, 1)
		Msg2Player("B�n nh�n ���c 1 Ph�p V�n ki�m ph�!")
	end
	if (HaveLearnRecipe(969) > 0 or HaveLearnRecipe(970) > 0) then	-- ����ʹ֮��������
		AddItem(2, 1, 1077, 1)
		Msg2Player("B�n nh�n ���c 1 Ph�p �m c�m ph�!")
	end
	if (HaveLearnRecipe(971) > 0 or HaveLearnRecipe(972) > 0 or
		HaveLearnRecipe(973) > 0 or HaveLearnRecipe(974) > 0) then	-- �ĺ���֮��������
		AddItem(2, 1, 1078, 1)
		Msg2Player("B�n nh�n ���c 1 H�o Kh� th� ph�!")
	end
	if (HaveLearnRecipe(975) > 0 or HaveLearnRecipe(976) > 0 or
		HaveLearnRecipe(977) > 0 or HaveLearnRecipe(978) > 0) then	-- �˴�����֮�������
		AddItem(2, 1, 1079, 1)
		Msg2Player("B�n nh�n ���c 1 T� Ngh�a b�ng ph�!")
	end
	
	if (HaveLearnRecipe(979) > 0 or HaveLearnRecipe(980) > 0 or
		HaveLearnRecipe(981) > 0 or HaveLearnRecipe(982) > 0) then	-- ���ҵ���֮���󷨽���
		AddItem(2, 1, 1080, 1)
		Msg2Player("B�n nh�n ���c 1 T� T��ng ph�p ki�m ph�!")
	end
	if (HaveLearnRecipe(983) > 0 or HaveLearnRecipe(984) > 0 or
		HaveLearnRecipe(985) > 0 or HaveLearnRecipe(986) > 0) then	-- ��������֮������
		AddItem(2, 1, 1081, 1)
		Msg2Player("B�n nh�n ���c 1 Linh Phong th�ch ph�!")
	end
	
	if (HaveLearnRecipe(987) > 0 or HaveLearnRecipe(988) > 0 or
		HaveLearnRecipe(989) > 0 or HaveLearnRecipe(990) > 0) then	-- ���佫��֮͸��ǹ��
		AddItem(2, 1, 1082, 1)
		Msg2Player("B�n nh�n ���c 1 Th�u Gi�p th��ng ph�!")
	end
	if (HaveLearnRecipe(991) > 0 or HaveLearnRecipe(992) > 0 or
		HaveLearnRecipe(993) > 0 or HaveLearnRecipe(994) > 0) then	-- ��������֮���׹���
		AddItem(2, 1, 1083, 1)
		Msg2Player("B�n nh�n ���c 1 Xuy�n Gi�p cung ph�!")
	end
	
	if (HaveLearnRecipe(995) > 0 or HaveLearnRecipe(996) > 0 or
		HaveLearnRecipe(997) > 0 or HaveLearnRecipe(998) > 0) then	-- ���޳�֮�Ͷ�����
		AddItem(2, 1, 1084, 1)
		Msg2Player("B�n nh�n ���c 1 M�nh ��c �ao ph�!")
	end
	if (HaveLearnRecipe(999) > 0 or HaveLearnRecipe(1000) > 0 or
		HaveLearnRecipe(1001) > 0 or HaveLearnRecipe(1002) > 0) then	-- ���޳�֮�צ��
		AddItem(2, 1, 1085, 1)
		Msg2Player("B�n nh�n ���c 1 Ng�y ��c tr�o ph�!")
	end
	
	if (HaveLearnRecipe(1019) > 0) then
		AddItem(2, 1, 3017, 1)
		Msg2Player("B�n nh�n ���c B�n nh�n ���c 1 Ng�c Tr� �� Ph�!")
	end
	if (HaveLearnRecipe(1020) > 0) then
		AddItem(2, 1, 3018, 1)
		Msg2Player("B�n nh�n ���c 1 Th�n Ch�m �� Ph�!")
	end
	if (HaveLearnRecipe(1029) > 0) then
		AddItem(2, 1, 3027, 1)
		Msg2Player("B�n nh�n ���c 1 M�c Ki�n Li�n Tr��ng �� Ph�!")
	end
	if (HaveLearnRecipe(1030) > 0) then
		AddItem(2, 1, 3028, 1)
		Msg2Player("B�n nh�n ���c 1 D��c S� Tr��ng �� Ph�!")
	end
	if (HaveLearnRecipe(1031) > 0) then
		AddItem(2, 1, 3029, 1)
		Msg2Player("B�n nh�n ���c 1 C�u Long To�n K�ch �� Ph�!")
	end
	if (HaveLearnRecipe(1032) > 0) then
		AddItem(2, 1, 3030, 1)
		Msg2Player("B�n nh�n ���c 1 Th��ng N� �� Ph�!")
	end
	
	if (HaveLearnRecipe(1015) > 0) then
		AddItem(2, 1, 3013, 1)
		Msg2Player("B�n nh�n ���c 1 Th�n Quy �� Ph�!")
	end
	if (HaveLearnRecipe(1016) > 0) then
		AddItem(2, 1, 3014, 1)
		Msg2Player("B�n nh�n ���c 1 �m D��ng �n �� Ph�!")
	end
	if (HaveLearnRecipe(1017) > 0) then
		AddItem(2, 1, 3015, 1)
		Msg2Player("B�n nh�n ���c 1 H�a �nh �� Ph�!")
	end
	if (HaveLearnRecipe(1018) > 0) then
		AddItem(2, 1, 3016, 1)
		Msg2Player("B�n nh�n ���c 1 Nha C�u �� Ph�!")
	end
	if (HaveLearnRecipe(1023) > 0) then
		AddItem(2, 1, 3021, 1)
		Msg2Player("B�n nh�n ���c 1 L�u C�nh �� Ph�!")
	end
	if (HaveLearnRecipe(1024) > 0) then
		AddItem(2, 1, 3022, 1)
		Msg2Player("B�n nh�n ���c 1 Ngh�ch L�n �� Ph�!")
	end
	if (HaveLearnRecipe(1037) > 0) then
		AddItem(2, 1, 3035, 1)
		Msg2Player("B�n nh�n ���c 1 B�ch Th�y �� Ph�!")
	end
	if (HaveLearnRecipe(1038) > 0) then
		AddItem(2, 1, 3036, 1)
		Msg2Player("B�n nh�n ���c 1 Thi�n T�n �� Ph�!")
	end
	
	if (HaveLearnRecipe(1021) > 0) then
		AddItem(2, 1, 3019, 1)
		Msg2Player("B�n nh�n ���c 1 Khoa Ph� �� Ph�!")
	end
	if (HaveLearnRecipe(1022) > 0) then
		AddItem(2, 1, 3020, 1)
		Msg2Player("B�n nh�n ���c 1 M�t V� �� Ph�!")
	end
	if (HaveLearnRecipe(1025) > 0) then
		AddItem(2, 1, 3023, 1)
		Msg2Player("B�n nh�n ���c 1 ��i Th�nh D� �m �� Ph�!")
	end
	if (HaveLearnRecipe(1026) > 0) then
		AddItem(2, 1, 3024, 1)
		Msg2Player("B�n nh�n ���c 1 Kh� M�c Long Ng�m �� Ph�!")
	end
	if (HaveLearnRecipe(1027) > 0) then
		AddItem(2, 1, 3025, 1)
		Msg2Player("B�n nh�n ���c 1 Toan D� �� Ph�!")
	end
	if (HaveLearnRecipe(1028) > 0) then
		AddItem(2, 1, 3026, 1)
		Msg2Player("B�n nh�n ���c 1 Th�i H� �� Ph�!")
	end
	if (HaveLearnRecipe(1033) > 0) then
		AddItem(2, 1, 3031, 1)
		Msg2Player("B�n nh�n ���c 1 Vi�n �� �� Ph�!")
	end
	if (HaveLearnRecipe(1034) > 0) then
		AddItem(2, 1, 3032, 1)
		Msg2Player("B�n nh�n ���c 1 B�t X� Chi X� �� Ph�!")
	end
	if (HaveLearnRecipe(1035) > 0) then
		AddItem(2, 1, 3033, 1)
		Msg2Player("B�n nh�n ���c 1 V� Ng�n �� Ph�!")
	end
	if (HaveLearnRecipe(1036) > 0) then
		AddItem(2, 1, 3034, 1)
		Msg2Player("B�n nh�n ���c 1 Thanh Long �� Ph�!")
	end
end;

-- �������첹��ͼֽ
function pay_back_blueprints()
	if (HaveLearnRecipe(809) > 0 or HaveLearnRecipe(810) > 0) then	-- ���߷�
		AddItem(2, 1, 425, 1)
		Msg2Player("B�n nh�n ���c 1 H�nh Gi� Ph�c Ph�!")
	end
	
	if (HaveLearnRecipe(811) > 0 or HaveLearnRecipe(812) > 0) then	-- ��Ԫ��
		AddItem(2, 1, 426, 1)
		Msg2Player("B�n nh�n ���c 1 H�n Nguy�n Ph�c Ph�!")
	end
	
	if (HaveLearnRecipe(813) > 0 or HaveLearnRecipe(814) > 0) then	-- ��ħ���֮ս������
		AddItem(2, 1, 427, 1)
		Msg2Player("B�n nh�n ���c 1 Chi�n � Kh�i Gi�p Ph�!")
	end
	
	if (HaveLearnRecipe(815) > 0 or HaveLearnRecipe(816) > 0) then	-- ������
		AddItem(2, 1, 428, 1)
		Msg2Player("B�n nh�n ���c 1 Kh� H�nh B�o Ph�!")
	end
	
	if (HaveLearnRecipe(817) > 0 or HaveLearnRecipe(818) > 0) then	-- ������
		AddItem(2, 1, 429, 1)
		Msg2Player("B�n nh�n ���c 1 Thi�n Tu B�o Ph�!")
	end
	
	if (HaveLearnRecipe(819) > 0 or HaveLearnRecipe(820) > 0) then	-- ������ʦ֮������ɳ�ַ���
		AddItem(2, 1, 430, 1)
		Msg2Player("B�n nh�n ���c 1 Thi�n T�nh B�o Ph�!")
	end

	if (HaveLearnRecipe(821) > 0 or HaveLearnRecipe(822) > 0) then	-- ɳ�ַ�
		AddItem(2, 1, 431, 1)
		Msg2Player("B�n nh�n ���c 1 Sa Di Ph�c Ph�!")
	end
	
	if (HaveLearnRecipe(823) > 0 or HaveLearnRecipe(824) > 0) then	-- ��ɮ��
		AddItem(2, 1, 432, 1)
		Msg2Player("B�n nh�n ���c 1 ��u T�ng Ph�c Ph�!!")
	end
	
	if (HaveLearnRecipe(825) > 0 or HaveLearnRecipe(826) > 0) then	-- �����޺�֮����ս��
		AddItem(2, 1, 433, 1)
		Msg2Player("B�n nh�n ���c 1 ��u Kh� Chi�n Y Ph�!")
	end
	
	if (HaveLearnRecipe(827) > 0 or HaveLearnRecipe(828) > 0 or
		HaveLearnRecipe(829) > 0 or HaveLearnRecipe(830) > 0) then	-- ׯ�ͷ�
		AddItem(2, 1, 434, 1)
		Msg2Player("B�n nh�n ���c 1 Trang Kh�ch Ph�c Ph�!")
	end
	
	if (HaveLearnRecipe(831) > 0 or HaveLearnRecipe(832) > 0 or
		HaveLearnRecipe(833) > 0 or HaveLearnRecipe(834) > 0) then	-- ������
		AddItem(2, 1, 435, 1)
		Msg2Player("B�n nh�n ���c 1 H� V� Ph�c Ph�!")
	end
	
	if (HaveLearnRecipe(835) > 0 or HaveLearnRecipe(836) > 0 or
		HaveLearnRecipe(837) > 0 or HaveLearnRecipe(838) > 0) then	-- �ض��̿�֮���ط�
		AddItem(2, 1, 436, 1)
		Msg2Player("B�n nh�n ���c 1 B� ��c ph�c ph�")
	end
	
	if (HaveLearnRecipe(839) > 0 or HaveLearnRecipe(840) > 0) then	-- ��������
		AddItem(2, 1, 437, 1)
		Msg2Player("B�n nh�n ���c 1 Thanh T�m T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(841) > 0 or HaveLearnRecipe(842) > 0) then	-- ��������
		AddItem(2, 1, 438, 1)
		Msg2Player("B�n nh�n ���c 1 Th�i V� T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(843) > 0 or HaveLearnRecipe(844) > 0) then	-- ����ʹ֮������
		AddItem(2, 1, 439, 1)
		Msg2Player("B�n nh�n ���c 1 Ph�p V�n Y Ph�!")
	end
	
	if (HaveLearnRecipe(845) > 0 or HaveLearnRecipe(846) > 0) then	-- ˼������
		AddItem(2, 1, 440, 1)
		Msg2Player("B�n nh�n ���c 1 T� Kh�c T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(847) > 0 or HaveLearnRecipe(848) > 0) then	-- ��������
		AddItem(2, 1, 441, 1)
		Msg2Player("B�n nh�n ���c 1 Ph�n �m T� Y Ph�!")
	end
	
	if (HaveLearnRecipe(849) > 0 or HaveLearnRecipe(850) > 0) then	-- ����ʹ֮������
		AddItem(2, 1, 442, 1)
		Msg2Player("B�n nh�n ���c 1 Ph�p �m Y Ph�!")
	end
	
	if (HaveLearnRecipe(851) > 0 or HaveLearnRecipe(852) > 0 or
		HaveLearnRecipe(853) > 0 or HaveLearnRecipe(854) > 0) then	-- ִ����
		AddItem(2, 1, 443, 1)
		Msg2Player("B�n nh�n ���c 1 Ch�p B�t Th��ng Ph�!")
	end
	
	if (HaveLearnRecipe(855) > 0 or HaveLearnRecipe(856) > 0 or
		HaveLearnRecipe(857) > 0 or HaveLearnRecipe(858) > 0) then	-- ������
		AddItem(2, 1, 444, 1)
		Msg2Player("B�n nh�n ���c 1 Tr� Gian Th��ng Ph�!")
	end
	
	if (HaveLearnRecipe(859) > 0 or HaveLearnRecipe(860) > 0 or
		HaveLearnRecipe(861) > 0 or HaveLearnRecipe(862) > 0) then	-- �ĺ���֮������
		AddItem(2, 1, 445, 1)
		Msg2Player("B�n nh�n ���c 1 H�o Kh� Ph�c Ph�!")
	end
	
	if (HaveLearnRecipe(863) > 0 or HaveLearnRecipe(864) > 0 or
		HaveLearnRecipe(865) > 0 or HaveLearnRecipe(866) > 0) then	-- �л���
		AddItem(2, 1, 446, 1)
		Msg2Player("B�n nh�n ���c 1 Khi�u Hoa Y Ph�!")
	end
	
	if (HaveLearnRecipe(867) > 0 or HaveLearnRecipe(868) > 0 or
		HaveLearnRecipe(869) > 0 or HaveLearnRecipe(870) > 0) then	-- �Ͷ���
		AddItem(2, 1, 447, 1)
		Msg2Player("B�n nh�n ���c 1 Tr�ng �c Th��ng Ph�!")
	end
	
	if (HaveLearnRecipe(871) > 0 or HaveLearnRecipe(872) > 0 or
		HaveLearnRecipe(873) > 0 or HaveLearnRecipe(874) > 0) then	-- �˴�����֮������
		AddItem(2, 1, 448, 1)
		Msg2Player("B�n nh�n ���c 1 T� Ngh�a Th��ng Ph�!")
	end

	if (HaveLearnRecipe(875) > 0 or HaveLearnRecipe(876) > 0 or
		HaveLearnRecipe(877) > 0 or HaveLearnRecipe(878) > 0) then	-- ������
		AddItem(2, 1, 449, 1)
		Msg2Player("B�n nh�n ���c 1 Thanh Tu B�o Ph�!")
	end
	
	if (HaveLearnRecipe(879) > 0 or HaveLearnRecipe(880) > 0 or
		HaveLearnRecipe(881) > 0 or HaveLearnRecipe(882) > 0) then	-- ��۷���
		AddItem(2, 1, 450, 1)
		Msg2Player("B�n nh�n ���c 1 Nh�p Quan Ph�p B�o Ph�!")
	end
	
	if (HaveLearnRecipe(883) > 0 or HaveLearnRecipe(884) > 0 or
		HaveLearnRecipe(885) > 0 or HaveLearnRecipe(886) > 0) then	-- ���ҵ���֮������
		AddItem(2, 1, 451, 1)
		Msg2Player("B�n nh�n ���c 1 T� T��ng Ph�p B�o Ph�!")
	end
	
	if (HaveLearnRecipe(887) > 0 or HaveLearnRecipe(888) > 0 or
		HaveLearnRecipe(889) > 0 or HaveLearnRecipe(890) > 0) then	-- �����
		AddItem(2, 1, 452, 1)
		Msg2Player("B�n nh�n ���c 1 Thanh Phong B�o Ph�!")
	end
	
	if (HaveLearnRecipe(891) > 0 or HaveLearnRecipe(892) > 0 or
		HaveLearnRecipe(893) > 0 or HaveLearnRecipe(894) > 0) then	-- ������
		AddItem(2, 1, 453, 1)
		Msg2Player("B�n nh�n ���c 1 Thi�u D��ng Th��ng Ph�!")
	end
	
	if (HaveLearnRecipe(895) > 0 or HaveLearnRecipe(896) > 0 or
		HaveLearnRecipe(897) > 0 or HaveLearnRecipe(898) > 0) then	-- ��������֮�����
		AddItem(2, 1, 454, 1)
		Msg2Player("B�n nh�n ���c 1 Linh Phong Th��ng Ph�!")
	end
	
	if (HaveLearnRecipe(899) > 0 or HaveLearnRecipe(900) > 0 or
		HaveLearnRecipe(901) > 0 or HaveLearnRecipe(902) > 0) then	-- �����
		AddItem(2, 1, 455, 1)
		Msg2Player("B�n nh�n ���c 1 Khinh K� Gi�p Ph�!")
	end
	
	if (HaveLearnRecipe(903) > 0 or HaveLearnRecipe(904) > 0 or
		HaveLearnRecipe(905) > 0 or HaveLearnRecipe(906) > 0) then	-- Уξ����
		AddItem(2, 1, 456, 1)
		Msg2Player("B�n nh�n ���c 1 Hi�u �y Thi�t Gi�p Ph�!")
	end
	
	if (HaveLearnRecipe(907) > 0 or HaveLearnRecipe(908) > 0 or
		HaveLearnRecipe(909) > 0 or HaveLearnRecipe(910) > 0) then	-- ���佫��֮������
		AddItem(2, 1, 457, 1)
		Msg2Player("B�n nh�n ���c 1 Ph�n V� Tinh Gi�p Kh�i Ph�!")
	end
	
	if (HaveLearnRecipe(911) > 0 or HaveLearnRecipe(912) > 0 or
		HaveLearnRecipe(913) > 0 or HaveLearnRecipe(914) > 0) then	-- ���ּ�
		AddItem(2, 1, 458, 1)
		Msg2Player("B�n nh�n ���c 1 N� Th� Gi�p Ph�!")
	end
	
	if (HaveLearnRecipe(915) > 0 or HaveLearnRecipe(916) > 0 or
		HaveLearnRecipe(917) > 0 or HaveLearnRecipe(918) > 0) then	-- ��ξ����
		AddItem(2, 1, 459, 1)
		Msg2Player("B�n nh�n ���c 1 �� �y Thi�t Gi�p Ph�!")
	end
	
	if (HaveLearnRecipe(919) > 0 or HaveLearnRecipe(920) > 0 or
		HaveLearnRecipe(921) > 0 or HaveLearnRecipe(922) > 0) then	-- ��������֮������
		AddItem(2, 1, 460, 1)
		Msg2Player("B�n nh�n ���c 1 Ph�n Uy Tinh Gi�p Kh�i Ph�!")
	end
	
	if (HaveLearnRecipe(923) > 0 or HaveLearnRecipe(924) > 0 or
		HaveLearnRecipe(925) > 0 or HaveLearnRecipe(926) > 0) then	-- ������
		AddItem(2, 1, 461, 1)
		Msg2Player("B�n nh�n ���c 1 �o�t Ph�ch Y Ph�!")
	end
	
	if (HaveLearnRecipe(927) > 0 or HaveLearnRecipe(928) > 0 or
		HaveLearnRecipe(929) > 0 or HaveLearnRecipe(930) > 0) then	-- ������
		AddItem(2, 1, 462, 1)
		Msg2Player("B�n nh�n ���c 1 Th�i M�nh Y Ph�!")
	end
	
	if (HaveLearnRecipe(931) > 0 or HaveLearnRecipe(932) > 0 or
		HaveLearnRecipe(933) > 0 or HaveLearnRecipe(934) > 0) then	-- ���޳�֮�Ͷ���
		AddItem(2, 1, 463, 1)
		Msg2Player("B�n nh�n ���c 1 M�nh ��c Y Ph�!")
	end
	
	if (HaveLearnRecipe(935) > 0 or HaveLearnRecipe(936) > 0 or
		HaveLearnRecipe(937) > 0 or HaveLearnRecipe(938) > 0) then	-- ������
		AddItem(2, 1, 464, 1)
		Msg2Player("B�n nh�n ���c 1 ��c T�m Y Ph�!")
	end
	
	if (HaveLearnRecipe(939) > 0 or HaveLearnRecipe(940) > 0 or
		HaveLearnRecipe(941) > 0 or HaveLearnRecipe(942) > 0) then	-- ʴ����
		AddItem(2, 1, 465, 1)
		Msg2Player("B�n nh�n ���c 1 Th�c T�m Y Ph�!")
	end
	
	if (HaveLearnRecipe(943) > 0 or HaveLearnRecipe(944) > 0 or
		HaveLearnRecipe(945) > 0 or HaveLearnRecipe(946) > 0) then	-- ���޳�֮���
		AddItem(2, 1, 466, 1)
		Msg2Player("B�n nh�n ���c 1 Ng�y ��c Y Ph�!")
	end
	
	if (HaveLearnRecipe(1053) > 0 or HaveLearnRecipe(1054) > 0 or
		HaveLearnRecipe(1055) > 0 or HaveLearnRecipe(1056) > 0 or
		HaveLearnRecipe(1077) > 0 or HaveLearnRecipe(1078) > 0 or
		HaveLearnRecipe(1079) > 0 or HaveLearnRecipe(1080) > 0) then	-- �˼�ͷ���䷽
		AddItem(2, 1, 3044, 1)
		Msg2Player("B�n nh�n ���c 1 m� Ph�i Ph��ng c�p 8!")
	end
	if (HaveLearnRecipe(1057) > 0 or HaveLearnRecipe(1058) > 0 or
		HaveLearnRecipe(1059) > 0 or HaveLearnRecipe(1060) > 0 or
		HaveLearnRecipe(1081) > 0 or HaveLearnRecipe(1082) > 0 or
		HaveLearnRecipe(1083) > 0 or HaveLearnRecipe(1084) > 0) then	-- �˼������䷽
		AddItem(2, 1, 3045, 1)
		Msg2Player("B�n nh�n ���c 1 th��ng y Ph�i Ph��ng c�p 8!")
	end
	if (HaveLearnRecipe(1061) > 0 or HaveLearnRecipe(1062) > 0 or
		HaveLearnRecipe(1063) > 0 or HaveLearnRecipe(1064) > 0 or
		HaveLearnRecipe(1085) > 0 or HaveLearnRecipe(1086) > 0 or
		HaveLearnRecipe(1087) > 0 or HaveLearnRecipe(1088) > 0) then	-- �˼������䷽
		AddItem(2, 1, 3046, 1)
		Msg2Player("B�n nh�n ���c 1 h� y Ph�i Ph��ng c�p 8!")
	end
	if (HaveLearnRecipe(1065) > 0 or HaveLearnRecipe(1066) > 0 or
		HaveLearnRecipe(1067) > 0 or HaveLearnRecipe(1068) > 0) then	-- �ż�ͷ���䷽
		AddItem(2, 1, 3047, 1)
		Msg2Player("B�n nh�n ���c 1 m� Ph�i Ph��ng c�p 9!")
	end
	if (HaveLearnRecipe(1069) > 0 or HaveLearnRecipe(1070) > 0 or
		HaveLearnRecipe(1071) > 0 or HaveLearnRecipe(1072) > 0) then	-- �ż������䷽
		AddItem(2, 1, 3048, 1)
		Msg2Player("B�n nh�n ���c 1 th��ng y Ph�i Ph��ng c�p 9!")
	end
	if (HaveLearnRecipe(1073) > 0 or HaveLearnRecipe(1074) > 0 or
		HaveLearnRecipe(1075) > 0 or HaveLearnRecipe(1076) > 0) then	-- �ż������䷽
		AddItem(2, 1, 3049, 1)
		Msg2Player("B�n nh�n ���c 1 h� y Ph�i Ph��ng c�p 9!")
	end
end;

