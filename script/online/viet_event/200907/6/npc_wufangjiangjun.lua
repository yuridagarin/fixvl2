--====================================================
--create by baiyun 2009.6.3
--describe:Խ�ϰ�7�·ݻ֮���Ի��������䷼�����ű�
--====================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	tSay = {
					"Ta mu�n nh�n ph�n th��ng c�p �� 73/#get_aword(73)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 74/#get_aword(74)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 75/#get_aword(75)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 76/#get_aword(76)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 77/#get_aword(77)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 78/#get_aword(78)",
					"Trang k�/nextpage",
					"T�i h� ch� gh� ngang!/dlgover",
			}
						
	if CheckStateNHTL() == 2 then
		tinsert(tSay,1,"Ta mu�n nh�n th��ng th�ng c�p 73/levelup")
	end

	if CheckStateNHTL() == 1 or  CheckStateNHTL() == 2 then
		Say("<color=green>V� Ph��ng T��ng Qu�n<color>: S� ki�n Ng�a H� T�ng Long di�n ra t� ng�y<color=red>19-06-2009 ��n 24:00 30-11-2009<color>. Trong th�i gian n�y, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), ��ng ��o c� th� ��n g�p ta �� nh�n ph�n th��ng.",	getn(tSay),tSay)
	else
		Say("C�c h� ch�a �� th�i gian �� k�ch ho�t nh�n th��ng, ( 8 ti�ng k� t� th�i �i�m ��ng nh�p ��u ti�n) xin h�y quay l�i sau!",0)
	end
end

function nextpage()
	if CheckStateNHTL() == 1 or  CheckStateNHTL() == 2 then
		Say("<color=green>V� Ph��ng T��ng Qu�n<color>: S� ki�n Ng�a H� T�ng Long di�n ra t� ng�y<color=red>19-06-2009 ��n 24:00 30-11-2009<color>. Trong th�i gian n�y, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), ��ng ��o c� th� ��n g�p ta �� nh�n ph�n th��ng.",
			8,
			"Ta mu�n nh�n ph�n th��ng c�p �� 79/#get_aword(79)",
			"Ta mu�n nh�n ph�n th��ng c�p �� 80/#get_aword(80)",
			"Ta mu�n nh�n ph�n th��ng c�p �� 81/#get_aword(81)",
			"Ta mu�n nh�n ph�n th��ng c�p �� 82/#get_aword(82)",
			"Ta mu�n nh�n ph�n th��ng c�p �� 83/#get_aword(83)",
			"Ta mu�n nh�n ph�n th��ng c�p �� 84/#get_aword(84)",
			"Trang tr��c/main",
			"T�i h� ch� gh� ngang!/dlgover");
	else
		Say("Ho�t ��ng �� k�t th�c!",0)
	end
end

function CheckStateNHTL()
	local nRet = 0
	local nExtVal = GetExtPoint(EXT_POINT)	
	if (VerifyDate(3) == 1 and GetBit(nExtVal,1) == 1)  then
		nRet = 2	
	elseif  (VerifyDate(2) == 1) then
		nRet = 1
	end			
	return nRet
end

function GetEventBit(nBit)
	return GetBit(GetExtPoint(EXT_POINT),nBit)	
end

function SetEventBit(nBit)
	local nExtVal = GetExtPoint(EXT_POINT)
	local nExtVal2 = SetBit(nExtVal,nBit,1)
	
	local nExtFinal = nExtVal2 - nExtVal

	if AddExtPoint(EXT_POINT,nExtFinal) == 1 then
		return 1
	else
		return 0
	end
end

function levelup()
	if GetLevel() >= 73 then
		Say("C�c h� �� ��t ��ng c�p 73 r�i, kh�ng th� nh�n th��ng!",0)
		return
	end
	if GetEventBit(2) == 0 then
		if SetEventBit(2) == 1 then
			SetLevel(73, 454)
			ResetProperty()
			ModifyExp(20000000)
			Say("Ch�c m�ng c�c h� �� th�ng c�p 73, vui l�ng ��ng nh�p l�i!",0)
			Msg2Player("B�n nh�n ���c 20000000 �i�m kinh nghi�m.")
			WriteLogEx("Ngoa Ho Tang Long","nh�n ph�n th��ng th�ng c�p")
		else
			WriteLogEx("Ngoa Ho Tang Long","nh�n ph�n th��ng th�ng c�p th�t b�i")
		end
	else
		Say("Ch�ng ph�i c�c h� �� nh�n th��ng r�i sao?",0)
	end
end



function dlgover()
end

function get_aword(nLevel)
--ʱ���
--1245394800,��2009-06-19 0��
--1249282800,��2009-08-02 24��
	if CheckStateNHTL() == 1 or CheckStateNHTL() == 2 then		
		if GetEventBit(1) == 0 then -- C�c t�i kho�n t� t�o c�a gamer
			if GetExtPoint(1) == 0 then -- Th�i gian t�o t�i kho�n ko ��ng quy ��nh			
				Talk(1, "", "<color=green>V� Ph��ng T��ng Qu�n<color>: T�i kho�n c�a c�c h� kh�ng ph�i t�o trong th�i gian y�u c�u.");
				return
			end
		end
		if GetPlayerRoute() == 0 then
			Talk(1, "", "<color=green>V� Ph��ng T��ng Qu�n<color>: Ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
			return
		end
		local bHaveLearnFullSkill = get_full_skill_level()
		if (bHaveLearnFullSkill == 0) then
			Talk(1, "", "<color=green>V� Ph��ng T��ng Qu�n<color>: C�c h� v�n ch�a h�c �� k� n�ng c�p 55.");
			return	
		end
		if GetLevel() < 73 then
			Talk(1, "", "<color=green>V� Ph��ng T��ng Qu�n<color>: C�p c�a ��i hi�p v�n ch�a ��, kh�ng th� nh�n th��ng.");
			return
		end
		if GetEventBit(nLevel - 70) == 1  then
			Talk(1, "", "<color=green>V� Ph��ng T��ng Qu�n<color>: ��i hi�p �� nh�n th��ng r�i, kh�ng th� ti�p t�c nh�n th��ng.");
			return
		end
		confim_get_aword(nLevel);
	end
end

function confim_get_aword(nLevel)
	local nAwordLevel = check_aword_level();
	if nAwordLevel == 0 or nAwordLevel < nLevel then
		Talk(1, "", "<color=green>V� Ph��ng T��ng Qu�n<color>: Kh�ng �� �i�u ki�n nh�n ph�n th��ng n�y");
		return
	end
	warning_get_aword(nLevel, nAwordLevel);--���������ȡ����
end

function warning_get_aword(nWantLevel, nLevel)
	Say("Nh�n ph�n th��ng l� ph�n th��ng c�p <color=red>"..nWantLevel.."<color>, ng��i c� th� nh�n ph�n th��ng cao nh�t l�  ph�n th��ng c�p <color=red>"..nLevel.."<color>. C� ch�c mu�n nh�n ph�n th��ng c�p "..nWantLevel.." kh�ng??",
		2,
		"Ta mu�n nh�n /#confirm_confirm("..nWantLevel..")",
		"�� ta suy ngh� l�i xem./nothing");
end

--���շ�����
function confirm_confirm(nLevel)
	if GetEventBit(nLevel - 70) == 1  then
		Talk(1, "", "<color=green>V� Ph��ng T��ng Qu�n<color>: ��i hi�p �� nh�n th��ng r�i, kh�ng th� ti�p t�c nh�n th��ng.");
		return
	end
	if gf_Judge_Room_Weight(5, 100, " ") == 0 then
		return
	end
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	if SetEventBit(nLevel - 70) == 1 then
		gf_SetLogCaption("Ho�t ��ng ng�a h� t�ng long");
		if nLevel == 73 or nLevel == 76 or nLevel == 77 or nLevel == 80 or nLevel == 84 then
			local nRetCode, nItem = gf_AddItemEx(tb_wohucanglong_item_aword[nLevel][2], tb_wohucanglong_item_aword[nLevel][1]);
			if nLevel == 77 or nLevel == 84 then
				if nRetCode == 1 then
					SetItemExpireTime(nItem, 30*24*60*60);				
				end
			end				
			WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",tb_wohucanglong_item_aword[nLevel][2][4],tb_wohucanglong_item_aword[nLevel][1]);
		elseif nLevel == 74 then
			gf_AddItemEx(tb_wohucanglong_item_aword_74[nBody][2], tb_wohucanglong_item_aword_74[nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",tb_wohucanglong_item_aword_74[nBody][2][4],tb_wohucanglong_item_aword_74[nBody][1]);
		elseif nLevel == 75 then
			gf_AddItemEx(tb_wohucanglong_item_aword_75[nRoute][nBody][2], tb_wohucanglong_item_aword_75[nRoute][nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1, "�o S� m�n c�p 8x");
		elseif nLevel == 78 then
			gf_AddItemEx(tb_wohucanglong_item_aword_78[nRoute][2], tb_wohucanglong_item_aword_78[nRoute][1]);
			WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1,"T�i Y�u Quy�t");
		elseif nLevel == 79 then
			local nItem = gf_GetRandItemByTable(tb_wohucanglong_item_aword_79, 100, 1);
			gf_AddItemEx(tb_wohucanglong_item_aword_79[nItem][3], tb_wohucanglong_item_aword_79[nItem][1]);
			WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1,"Trang S�c Th�i H�");
		elseif nLevel == 81 then
			gf_AddItemEx(tb_wohucanglong_item_aword_81[nBody][2], tb_wohucanglong_item_aword_81[nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1,"Qu�n T�ng Ki�m c�p 8x");
		elseif nLevel == 82 then
			local nItem = random(1, 100);
			local nBook = random(1, 14);
			if 0 < nItem and nItem <= 45 then
				gf_AddItemEx(tb_wohucanglong_item_aword_82_1[nBook][2], tb_wohucanglong_item_aword_82_1[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1,"Quy�n M�t T�ch Tr�n Ph�i");
			elseif nItem > 45 and nItem <= 90 then
				gf_AddItemEx(tb_wohucanglong_item_aword_82_2[nBook][2], tb_wohucanglong_item_aword_82_2[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1,"Quy�n M�t T�ch Tr�n Ph�i");
			else
				gf_AddItemEx(tb_wohucanglong_item_aword_82_3[nBook][2], tb_wohucanglong_item_aword_82_3[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1,"Quy�n M�t T�ch Tr�n Ph�i");
			end
		elseif nLevel == 83 then
			gf_AddItemEx(tb_wohucanglong_item_aword_83[nRoute][2], tb_wohucanglong_item_aword_83[nRoute][1]);
			WriteLogEx("Hoat dong thang 6","Ngo� H� T�ng Long",1,"V� Kh� B� Phi Y�n");
		end
		gf_SetLogCaption("");	
	end
end

--�жϿ��������ĸ�����Ľ���
function check_aword_level()
	local nAwordLevel = 0;
	local nLevel = GetLevel();
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	if nHor < 0 then
		nHor = 0 - nHor;
	end
	
	for i = 84, 73, -1 do
		if nLevel >= i and nRep >= tb_wohucanglong_aword[i][1] and nFaction >= tb_wohucanglong_aword[i][2] and nHor >= tb_wohucanglong_aword[i][3] then
			nAwordLevel = i;
			break;
		end
	end
	return nAwordLevel;
end

function get_full_skill_level()
	local nPlayerRoute = GetPlayerRoute()
	if TB_55_SKILL_INFO[nPlayerRoute] == nil then
		return 0
	end
	for i = TB_55_SKILL_INFO[nPlayerRoute][1], TB_55_SKILL_INFO[nPlayerRoute][2] do
		if GetSkillLevel(i) == 0 then
			return 0;
		end
	end
	return 1;
end;


-- ���55�������Ƿ��Ѿ�ѧ����
TB_55_SKILL_INFO = {
	[2] = {21, 31},
	[3] = {45, 56},
	[4] = {33, 43},
	[6] = {58, 73},
	[8] = {75, 88},
	[9] = {90, 101},
	[11] = {103, 112},
	[12] = {114, 123},
	[14] = {125, 145},
	[15] = {147, 158},
	[17] = {720, 731},
	[18] = {733, 744},
	[20] = {364, 377},
	[21] = {347, 363}
}

function nothing()
end