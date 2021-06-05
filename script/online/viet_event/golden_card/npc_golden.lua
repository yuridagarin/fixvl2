Include("\\script\\online\\viet_event\\golden_card\\golden_head.lua");
Include("\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua");
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua");
Include("\\script\\weapon_upgrade\\upgrade_npc.lua");


function golden_award()
	local tSay = {
		"Ta mu�n mua m� Ho�ng Kim L�nh B�i/get_golden_card",
		"Ta mu�n k�ch ho�t nh�n th��ng Thi�u Ni�n Anh H�ng (nh�n th��ng theo ��ng c�p)/#activate_account(1)",
		"Ta mu�n k�ch ho�t nh�n th��ng V� L�m Ti�n B�i/#activate_account(2)",
		"Ta mu�n nh�n th��ng V� L�m Chi�n H�u/get_friendly_award",
		"Ta mu�n nh�n ph�n th��ng m�i ng�y/get_golden_day",
		"Ta mu�n nh�n th��ng ng�y v�ng/get_golden_weekday",
		"Ta mu�n nh�n th��ng theo ��ng c�p (�� k�ch ho�t th�nh c�ng)/award_level",
		--"Ta mu�n ��i T� Linh B�i/award_golden_jewel",
		"T�i h� ch� gh� ngang!/dlgover",
	}	
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>Ho�ng Kim L�nh B�i<color>, c�c h� c� th� ��n g�p ta �� nh�n c�c ph�n th��ng sau:", getn(tSay),tSay)
end

function get_golden_day()
	local tSay = {
		"Ta mu�n nh�n v�t ph�m thu th�p + H�t gi�ng/#confirm_get_golden_day(1)",
		"Ta mu�n nh�n v�t ph�m thu th�p + V�ng/#confirm_get_golden_day(2)",
		"Ta mu�n nh�n v�t ph�m thu th�p + Tu Ch�n Y�u Quy�t/#confirm_get_golden_day(3)",
		"Ta mu�n nh�n v�t ph�m thu th�p + Tr�i C�y/#confirm_get_golden_day(4)",
		"T�i h� ch� gh� ngang!/dlgover",
	}	
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>Ho�ng Kim L�nh B�i<color>, m�i ng�y c�c h� c� th� ��n g�p ta �� nh�n c�c ph�n th��ng sau:", getn(tSay),tSay)	
end

function confirm_get_golden_day(nIndex)
	local nType = CheckActivated()
	if nType == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� Ho�ng Kim L�nh B�i ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_HKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_HKLB_DAILYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_HKLB_DAILYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n th��ng h�m nay r�i. Mai quay l�i nh�.")
		return
	end
	
	if gf_Judge_Room_Weight(6, 300, "Ch� Ph�ng M�y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	
	SetTask(TSK_HKLB_DAILYAWARD, GetTask(TSK_HKLB_DAILYAWARD) + 1)
	
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end
	
	gf_AddItemEx2(tb_everyday_award[nType][nLevel][2],tb_everyday_award[nType][nLevel][1], szHKLBLogHeader, szHKLBLogAction)
	if nIndex == 1 then
			gf_AddItemEx2({2,1,30086,tb_everyday_award[nType][nLevel][3],4},"H�t Gi�ng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	elseif nIndex == 2 then
		Earn(tb_everyday_award[nType][nLevel][4] * 10000)
		Msg2Player("B�n nh�n ���c "..tb_everyday_award[nType][nLevel][4].." v�ng.")
	elseif nIndex == 3 then
		gf_AddItemEx2(tb_everyday_award_TCYQ[nType][nLevel],"Tu Ch�n Y�u Quy�t", szHKLBLogHeader, szHKLBLogAction,7*24*60*60)
	elseif nIndex == 4 then
		gf_AddItemEx2(tb_everyday_award[nType][nLevel][7], tb_everyday_award[nType][nLevel][6], szHKLBLogHeader, szHKLBLogAction)
	end
end

function get_golden_weekday()
	local tSay = {}
	tinsert(tSay, "Ta mu�n nh�n G� Qu�n D�ng + Qu�n C�ng Ch��ng + B�t Nh� Nh�/#confirm_get_golden_weekday(1)")
	if GetLevel() >= 80 then
		tinsert(tSay, "Ta mu�n nh�n Kho�ng Th�ch Qu�n D�ng + Qu�n C�ng Ch��ng + B�t Nh� Nh�/#confirm_get_golden_weekday(2)")
		tinsert(tSay, "Ta mu�n nh�n L�a M�ch Qu�n D�ng + Qu�n C�ng Ch��ng + B�t Nh� Nh�/#confirm_get_golden_weekday(3)")
		tinsert(tSay, "Ta mu�n nh�n Thu�c Da Qu�n D�ng + Qu�n C�ng Ch��ng + B�t Nh� Nh�/#confirm_get_golden_weekday(4)")
		tinsert(tSay, "Ta mu�n nh�n T� T�m Qu�n D�ng + Qu�n C�ng Ch��ng + B�t Nh� Nh�/#confirm_get_golden_weekday(5)")
		tinsert(tSay, "Ta mu�n nh�n D��c Th�o Qu�n D�ng + Qu�n C�ng Ch��ng + B�t Nh� Nh�/#confirm_get_golden_weekday(6)")
		tinsert(tSay, "Ta mu�n nh�n Linh Huy�t Qu�n D�ng + Qu�n C�ng Ch��ng + B�t Nh� Nh�/#confirm_get_golden_weekday(7)")
	end
	tinsert(tSay, "T�i h� ch� gh� ngang!/dlgover")
	
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>Ho�ng Kim L�nh B�i<color>, v�o c�c ng�y th� 6, 7, Ch� Nh�t h�ng tu�n c�c h� c� th� ��n g�p ta �� nh�n c�c ph�n th��ng sau:", getn(tSay),tSay)		
end

function confirm_get_golden_weekday(nIndex)
	local nType = CheckActivated()
	if nType == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� Ho�ng Kim L�nh B�i ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� nh�n ph�n th��ng n�y v�o th� s�u, th� b�y v� ch� nh�t.");
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_HKLB_GOLDENDAYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_HKLB_GOLDENDAYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_HKLB_GOLDENDAYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n th��ng h�m nay r�i. Mai quay l�i nh�.")
		return
	end
	
	if gf_Judge_Room_Weight(10, 800, "Ch� Ph�ng M�y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	
	SetTask(TSK_HKLB_GOLDENDAYAWARD, GetTask(TSK_HKLB_GOLDENDAYAWARD) + 1)
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end
	
	if nLevel == 7 then
		gf_AddItemEx2(tb_golden_material_goldenday[1][2], tb_golden_material_goldenday[1][1], szHKLBLogHeader, szHKLBLogAction)
		gf_AddItemEx2({2,1,9999,1,4}, "Qu�n C�ng Ch��ng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday[1][4],4}, "B�t Nh� nh�", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	elseif nLevel == 8 then
		gf_AddItemEx2(tb_golden_material_goldenday[nIndex + 1][2], tb_golden_material_goldenday[nIndex + 1][1], szHKLBLogHeader, szHKLBLogAction)
		gf_AddItemEx2({2,1,9999,1,4}, "Qu�n C�ng Ch��ng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday[nIndex + 1][4],4}, "B�t Nh� nh�", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	elseif nLevel == 9 then
		gf_AddItemEx2(tb_golden_material_goldenday[nIndex + 8][2], tb_golden_material_goldenday[nIndex + 8][1], szHKLBLogHeader, szHKLBLogAction)
		gf_AddItemEx2({2,1,9999,1,4}, "Qu�n C�ng Ch��ng", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday[nIndex + 8][4],4}, "B�t Nh� nh�", szHKLBLogHeader, szHKLBLogAction, 24*60*60)
	end
end

function activate_account(nType)
	local nLevel = GetLevel()
	local nExp = GetExp()
	if CheckAccount() <= 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� Ho�ng Kim L�nh B�i.")
		return
	end
	
	if CheckActivated() ~= 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� �� ���c k�ch ho�t r�i, kh�ng c�n k�ch ho�t n�a!");
		return
	end
	
	if nType == 1 then
		if CheckAccount() ~= 1 then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Kh�ng ph�i Thi�u Ni�n Anh H�ng, kh�ng th� k�ch ho�t.");
			return
		end
		
		if CheckCharged() > 1 then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ho�t ��ng ch� �p d�ng ��i v�i t�i kho�n n�p Ho�ng Kim L�nh B�i l�n ��u.");
			return
		end
		
		if ((nLevel > NEEDED_LEVEL) or (nExp > NEEDED_EXP)) then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� nh�ng nh�n v�t ��ng c�p t� 73 tr� xu�ng, �i�m kinh nghi�m t�ch l�y kh�ng qu� 200 tri�u m�i c� th� k�ch ho�t nh�n th��ng!");
			return
		end
		
		if gf_SetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE, 3) == 1 then
			gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_LEVELAWARD, 1)
			gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS, 3)
			if nLevel < 73 then
				SetLevel(73,0)
				ModifyExp(20000000)			
			end
			ModifyReputation(3000, 0)
			Earn(999999)
			gf_WriteLogEx(szHKLBLogHeader, "K�ch ho�t th�nh c�ng Thi�u Ni�n Anh H�ng")
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� �� ���c k�ch ho�t Thi�u Ni�n Anh H�ng! Vui l�ng ��ng nh�p l�i!");	
		end
	elseif nType == 2 then
		if CheckAccount() ~= 2 then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Kh�ng ph�i V� L�m Ti�n B�i, kh�ng th� k�ch ho�t.");
			return
		end
		
		if gf_SetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE, 4) == 1 then
			gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS, 4)
			SetTask(TSK_HKLB_REWARD, 0)
			SetTask(TSK_HKLB_EXCHANGE,0)
			gf_WriteLogEx(szHKLBLogHeader, "K�ch ho�t th�nh c�ng V� L�m Ti�n B�i")
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� �� ���c k�ch ho�t V� L�m Ti�n B�i! Vui l�ng ��ng nh�p l�i!");	
		end
	end
end

function award_level()
	local tSay = {
					"Ta mu�n nh�n ph�n th��ng c�p �� 74/#get_golden_award(74)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 75/#get_golden_award(75)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 76/#get_golden_award(76)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 77/#get_golden_award(77)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 78/#get_golden_award(78)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 79/#get_golden_award(79)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 80/#get_golden_award(80)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 81/#get_golden_award(81)",			
					"Ta mu�n nh�n ph�n th��ng c�p �� 82/#get_golden_award(82)",	
					"Trang k�/award_level_2",
					"T�i h� ch� gh� ngang!/dlgover",
			}
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>Ho�ng Kim L�nh B�i<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), c�c h� c� th� ��n g�p ta �� nh�n ph�n th��ng.",	getn(tSay),tSay)	
end

function award_level_2()
	local tSay = {							
					"Ta mu�n nh�n ph�n th��ng c�p �� 83/#get_golden_award(83)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 84/#get_golden_award(84)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 85/#get_golden_award(85)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 86/#get_golden_award(86)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 87/#get_golden_award(87)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 88/#get_golden_award(88)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 89/#get_golden_award(89)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 90/#get_golden_award(90)",
					"Trang k�/award_level_3",	
					"Trang tr��c/award_level",
					"T�i h� ch� gh� ngang!/dlgover",
			}
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>Ho�ng Kim L�nh B�i<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), c�c h� c� th� ��n g�p ta �� nh�n ph�n th��ng.",	getn(tSay),tSay)		
end

function award_level_3()
	local tSay = {							
					"Ta mu�n nh�n ph�n th��ng c�p �� 91/#get_golden_award(91)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 92/#get_golden_award(92)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 93/#get_golden_award(93)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 94/#get_golden_award(94)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 95/#get_golden_award(95)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 96/#get_golden_award(96)",
					"Trang tr��c/award_level_2",
					"T�i h� ch� gh� ngang!/dlgover",
			}
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>Ho�ng Kim L�nh B�i<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), c�c h� c� th� ��n g�p ta �� nh�n ph�n th��ng.",	getn(tSay),tSay)		
end

function get_golden_award(nLevel)
	if CheckActivated() ~= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� ch�a k�ch ho�t nh�n th��ng ho�c kh�ng ph�i Thi�u Ni�n Anh H�ng!");
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if tRouteSkillInfo[nRoute]== 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if GetLevel() < 74 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a c�c h� ch�a �� 74, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	
	confim_get_golden_award(nLevel)
end

function confim_get_golden_award(nLevel)
	local nAwardLevel = CheckLevel();
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Kh�ng �� �i�u ki�n �i�m qu�n c�ng, danh v�ng v� �i�m s� m�n �� nh�n ph�n th��ng n�y");
		return
	end
	if nLevel >= 89 then
		if GetExp() < tb_golden_award[nLevel][5] then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ph�i c� �� ".. tb_golden_award[nLevel][5].." �i�m kinh nghi�m m�i c� th� nh�n ph�n th��ng c�p "..nLevel.."!")
			return
		end
	end
	warning_get_golden_award(nLevel, nAwardLevel);
end

function warning_get_golden_award(nWantLevel, nLevel)
	Say("<color=green>Ch� Ph�ng M�y<color>: Nh�n ph�n th��ng c�p <color=red>"..nWantLevel.."<color>, c�c h� c� th� nh�n ph�n th��ng cao nh�t l�  ph�n th��ng c�p <color=red>"..nLevel.."<color>. C� ch�c mu�n nh�n ph�n th��ng c�p "..nWantLevel.." kh�ng?",
		2,
		"Ta mu�n nh�n /#confirm_confirm("..nWantLevel..")",
		"�� ta suy ngh� l�i xem./dlgover");
end

function confirm_confirm(nLevel)
	if CheckActivated() ~= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� ch�a k�ch ho�t nh�n th��ng ho�c kh�ng ph�i Thi�u Ni�n Anh H�ng!");
		return
	end
	
	local nGet = CheckAwardLevel()
	if nGet > tb_golden_award[nLevel][4] then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n ti�p n�a!");
		return
	end
	
	if gf_Judge_Room_Weight(9, 500, "Ch� Ph�ng M�y") == 0 then
		return
	end
	
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	local nGuanGong = GetTask(701)
	local szLogTitle = szHKLBLogHeader
	local szLogAction = "nh�n th��ng theo c�p"
	local nRet, nItemIdx = 0,0;
	
	if tRouteSkillInfo[nRoute] == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end	
	
	gf_SetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_LEVELAWARD, nGet + 1)
	if nLevel == 74 then										
		gf_AddItemEx2({2, 0, 553,2,4},"��i Nh�n S�m", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx({0, 107, 64,1,1},"Thi�n H� M�t t�ch")
		gf_AddItemEx({0, 107, 65,1,1},"T� H� M�t t�ch")
		gf_AddItemEx({0, 107, 66,1,1},"Chi�m Y Ph�")
		gf_AddItemEx({0, 107, 60,1,1},"Tu La M�t t�ch")
		gf_AddItemEx({0, 107, 63,1,1},"Ng� Qu� M�t t�ch")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);			
	elseif nLevel == 75 then
		 gf_AddItemEx2({2, 1, 9977,1,1},"Huy hi�u chi�n c�ng (Huy Ho�ng)", szLogTitle, szLogAction, 7*24*60*60)
		 if nGuanGong >= 0 then
		 	gf_AddItemEx2({0, 109, 992 + nBody -1,1,1},"T�ng Qu�n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 else
		 	gf_AddItemEx2({0, 109, 996 + nBody -1,1,1},"Li�u Qu�n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 end	
		 Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 76 then
		local nRand = random(1, 100)
		if nRand <= 20 then
			gf_AddItemEx2({2,1,30172,100}, "Xo�i", szLogTitle, szLogAction)
		elseif nRand <= 40 then
			gf_AddItemEx2({2,1,30173,100}, "��o", szLogTitle, szLogAction)
		elseif nRand <= 60 then
			gf_AddItemEx2({2,1,30174,100}, "M�n", szLogTitle, szLogAction)
		elseif nRand <= 80 then
			gf_AddItemEx2({2,1,30177,100}, "B�", szLogTitle, szLogAction)
		else
			gf_AddItemEx2({2,1,30175,100}, "V�i", szLogTitle, szLogAction)
		end
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 77 then
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 100, 2231 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"T�ng �� Th�ng chi�n")
			gf_AddItemEx({0, 101, 2231 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"T�ng �� Th�ng chi�n")
			gf_AddItemEx({0, 103, 2231 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"T�ng �� Th�ng chi�n")
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9988,1,1},"Phong th��ng l�nh_T�ng (�� Th�ng)")
		else
			gf_AddItemEx({0, 100, 2235 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Li�u �� Th�ng chi�n")
			gf_AddItemEx({0, 101, 2235 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Li�u �� Th�ng chi�n")
			gf_AddItemEx({0, 103, 2235 + nBody - 1, 1,1,-1,-1,-1,-1,-1,-1,0,6},"Li�u �� Th�ng chi�n")	
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9987,1,1},"Phong th��ng l�nh_Li�u (�� Th�ng)")
		end
		if nRet == 1 then
		 	SetItemExpireTime(nItemIdx,30*24*60*60)
		end
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 78 then
		gf_AddItemEx2(tb_golden_skillbag[nRoute][2], tb_golden_skillbag[nRoute][1], szLogTitle, "nh�n ���c")
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][7], tb_golden_faction_tree[nRoute][6], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 79 then
		local nBody = GetBody()
		local tWeapons = {0, 3, 8, 0, 0, 1,  0, 2, 10, 0, 0, 5, 0, 2, 9, 0, 6, 4, 0, 7, 11}
		if nRoute ==8 or nRoute == 9 then
			nBody = nBody - 2		
		end
		AddItem(0, tWeapons[nRoute], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0 , 6);	
		if nRoute == 2 then
			AddItem(0, tWeapons[12], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0, 6);	
		end
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][9], tb_golden_faction_tree[nRoute][8], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 80 then
		GivePet1Award()
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 81 then
		gf_AddItemEx2({2, 1, 1068, 1, 4},"Thi�n Th�ch Linh Th�ch", szLogTitle, "nh�n ���c", 7*24*60*60)
		gf_AddItemEx2({0, 107, 160, 1}, "T� Linh Thi�n � Ph�", szLogTitle, "nh�n ���c")
		gf_AddItemEx2({0, 107, 161, 1}, "T� Linh T� � Ph�", szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
			AddGlobalNews("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 Thi�n Th�ch Linh Th�ch, ph�n th��ng c�p 81 Ho�ng Kim L�nh B�i")
  			Msg2SubWorld("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 Thi�n Th�ch Linh Th�ch, ph�n th��ng c�p 81 Ho�ng Kim L�nh B�i")
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 82 then
		GoldenGiveJewel()
		gf_AddItemEx2({0, 107, 159, 1}, "T� Linh Chi�n � Ph�", szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)	
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 83 then
		GoldenGiveJewel()
		gf_AddItemEx2(tb_golden_book_high[nRoute][2], tb_golden_book_high[nRoute][1], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)	
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 84 then
		gf_AddItemEx2({2, 1, 1068, 1, 1},"Thi�n Th�ch Linh Th�ch", szLogTitle, "nh�n ���c", 7*24*60*60)
		gf_AddItemEx2(tb_golden_book_med[nRoute][2], tb_golden_book_med[nRoute][1], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 85 then
		gf_AddItemEx2({2,1,30130,3}, "Phi Y�n Th�ch", szLogTitle, "nh�n ���c")
		gf_AddItemEx2({2,1,30131,1}, "T� Quang Th�n Th�ch", szLogTitle, "nh�n ���c")
		gf_AddItemEx2(tb_golden_book_low[nRoute][2], tb_golden_book_low[nRoute][1], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 86 then
		GetTQVD()
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11] , tb_golden_faction_tree[nRoute][10], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 87 then
		GetTQVD()
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11] , tb_golden_faction_tree[nRoute][10], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 88 then
		GetTQVD()
		gf_AddItemEx2({0, 107, 156, 1}, "B�ch Th�o m�t t�ch", szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 89 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 25.000.000 �i�m kinh nghi�m.")
		gf_AddItemEx2({2, 1, 504, 8, 4},"N� Oa Tinh Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 90 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 25.000.000 �i�m kinh nghi�m.")
		--gf_AddItemEx2({2,1,1067,1,4}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		AddTrangBiSuMon4()
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
			AddGlobalNews("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 trang bi s� m�n b� 4 ng�u nhi�n, ph�n th��ng c�p 90 Ho�ng Kim L�nh B�i")
  			Msg2SubWorld("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 trang bi s� m�n b� 4 ng�u nhi�n, ph�n th��ng c�p 90 Ho�ng Kim L�nh B�i")
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 91 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 25.000.000 �i�m kinh nghi�m.")
		--gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		gf_AddItemEx2({2,0,1084,3,1}, "Thi�n Qu�i Th�ch", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 92 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 50.000.000 �i�m kinh nghi�m.")
		--gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({0,112,78,1,4}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 93 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 50.000.000 �i�m kinh nghi�m.")
		--gf_AddItemEx2({0,112,78,1,4}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		gf_AddItemEx2({2,1,1067,1,4}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
		AddGlobalNews("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 ��nh h�n thi�n th�ch, ph�n th��ng c�p 93 Ho�ng Kim L�nh B�i")
  		Msg2SubWorld("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 ��nh h�n thi�n th�ch, ph�n th��ng c�p 93 Ho�ng Kim L�nh B�i")		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 94 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 50.000.000 �i�m kinh nghi�m.")
		--gf_AddItemEx2({2,1,1067,1,4}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		AddweaponFYVYDV94()
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
		AddGlobalNews("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 V� kh� (BFY,Vi�t Y�n, ��i Vi�t Y�n) ng�u nhi�n, ph�n th��ng c�p 94 Ho�ng Kim L�nh B�i")
  		Msg2SubWorld("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 V� kh� (BFY,Vi�t Y�n, ��i Vi�t Y�n) ng�u nhi�n, ph�n th��ng c�p 94 Ho�ng Kim L�nh B�i")		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 95 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 50.000.000 �i�m kinh nghi�m.")
		gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 96 then
		ModifyExp(0 - tb_golden_award[nLevel][5])
		Msg2Player("B�n �� b� tr� 50.000.000 �i�m kinh nghi�m.")
		--gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)	
		AddGlobalNews("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 ��nh h�n thi�n th�ch, ph�n th��ng c�p 96 Ho�ng Kim L�nh B�i")
  		Msg2SubWorld("Qu� l� Thi�u Ni�n Anh H�ng, "..GetName().." �� nh�n th�nh c�ng 1 ��nh h�n thi�n th�ch, ph�n th��ng c�p 96 Ho�ng Kim L�nh B�i")	
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	else
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p kh�ng ��ng!");
		WriteLogEx(szLogTitle,"��ng c�p kh�ng ��ng???");
		return
	end
end

function dlgover()
end	
