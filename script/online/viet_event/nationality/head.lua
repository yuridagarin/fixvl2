Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\lib\\globalfunctions.lua")
THOIHANNHAPQUOCTICH = 1
TB_NATION_SERVERLIST =
{
	{1,"H�ng Long"},
	{2,"T�ng Long"},
	{3,"B�ch H�"},
	{4,"Ho�ng H�"},
	{5,"Ng�a H�"},	--	Merge v�i 68-Quang Long
	{6,"Phi H�"},
--	{7,"Thanh Long"},
	{7,"Song Long"},
	{8,"Ph�c H�"},
	{9,"M�nh H�"},
--	{10,"V��ng H�"},
	{10,"Ti�u H�"},		--20/05/2014: Merge v�i 82-Th�y Y�n M�n
	{11,"X�ch Long"},	-- 12/11/2013: Merge v�i 55-X�ch Long
	{12,"Ch�nh �ng"},
	{13,"H�c H�"},	-- 12/11/2013: Merge v�i 62-Huy �ng
	{14,"D� H�"},
	{15,"K� H�"},
	{16,"Thi�n Ph�ng"},
	{17,"Tr� Long"},
	{18,"L�i H�"},
	{19,"Th�ng Long"},	-- 12/11/2013: Merge v�i 66-Quang �ng
--	{20,"Cu�ng Long"},
	{20,"Ng�c Long"},	--03/06/2014 Merge v�i 85-C�i Bang Ph�i
	--{21,"B� Long"},		--27/05/2014 Merge v�i 88-Minh Gi�o Ph�i
	{22,"Thi�n Long"},
	{23,"��i H�"},		--27/05/2014 Merge v�i 87-Nga My Ph�i
	{24,"Ng� H�"},		--20/05/2014 Merge v�i 80-C�n L�n �i�n
	{25,"H�a Long"},		--27/05/2014 Merge v�i 77-Thi�u L�m T�
	{26,"H�a �ng"},
--	{28,"Truy Long"},
--	{29,"Thi�t H�"},		--20/05/2014 Merge v�i 86-���ng M�n Ph�i
	{30,"��a H�"},
	{31,"Ch�u Long"},
	{32,"Th�n H�"},		--27/05/2014 Merge v�i 79-Ng� ��c Gi�o
	{33,"Th�n Long"},
	{35,"Song H�"},		--22/09/2014 Merge v�i 29-Thi�t H�--20/05/2014 Merge v�i 81-Th�y Y�n L�u
--	{36,"V�n Long"},
	{37,"Phong H�"},
--	{38,"Uy Long"},
	{39,"Qu�n H�"},	--22/09/2014 Merge v�i 21-B� Long --03/06/2014 Merge v�i 84-V� �ang S�n
	{43,"Ti�n Ph�ng"},  --22/09/2014 Merge v�i 73-Kim �ng
--	{45,"B�ch Ph�ng"},
	{46,"Quy�n Long"},
	{47,"B�ch �ng"},
--	{47,"H�c �ng"},
--	{49,"Thi�n �ng"},
	{50,"��i �ng"},		--03/06/2014 Merge v�i 83-D��ng Gia T��ng
	{51,"Phi �ng"},		
--	{52,"Vi�t �ng"},
--	{53,"Ng�c Ph�ng"},
--	{54,"Phi Ph�ng"},
--	{55,"T��ng Ph�ng"},
	{55,"X�ch Long"},
	{58,"Ho�ng �ng"},
	{59,"H�ng �ng"},	-- Merve v�i 71-Ph��ng Ph�ng
	{60,"Ho�ng Ph�ng"},	-- Merge v�i 10-V��ng H�
	{61,"��o Hi�p Kh�ch"},
--	{62,"Huy �ng"},
	{62,"H�c H�"},			--03/06/2014 Merge v�i 53-Ng�c Ph�ng
	{63,"T�n Ph�ng"},	--03/06/2014 Merge v�i 52-Vi�t �ng
--	{66,"Quang �ng"},
	{66,"Th�ng Long"},
	{67,"Duy Long"},	-- Merge v�i 7-Thanh Long 
--	{68,"Quang Long"},
	{68,"Song �ng"},
	{70,"Th�nh Long"},
--	{71, "Ph��ng Ph�ng"},
	{71, "Linh Ph�ng"},
	{99,"LOCAL 1"},
	{97,"LOCAL 2"},
	{96,"LOCAL 3"},
	{95,"LOCAL 4"},
	{34,"��u tr��ng 1"},
	{98,"��u tr��ng 2"},
	{40,"��u tr��ng 3"},
	{41,"��u tr��ng 4"},
	{48,"��u tr��ng 5"},
	{72,"Minh H�"}, -- Merge v�i 20-Cu�ng Long
	--{73,"Kim �ng"},
	{74,"Th��ng �ng"},
--	{75,"Ti�u Long"},
	{76,"T�y H�"},
--	{77,"Thi�u L�m T�"},
--	{79,"Ng� ��c Gi�o"},
--	{80,"C�n L�n �i�n"},
--	{81,"Th�y Y�n L�u"},
--	{82,"Th�y Y�n M�n"},
--	{83,"D��ng Gia T��ng"},
--	{84,"V� �ang S�n"},
--	{85, "C�i Bang Ph�i"},
--	{86, "���ng M�n Ph�i"},
--	{87, "Nga My Ph�i"},
--	{88, "Minh Gi�o Ph�i"},
	{89, "Linh B�o S�n"},
	{90, "Ng�a H�"},
	{91, "Ng�a Long"},
	{92, "H�a Ph�ng"},
	{150,"Li�n ��u Local"},
	{151,"Li�n ��u 1"},
	{152,"Li�n ��u 2"},
	{153,"Li�n ��u 3"},
	{154,"Li�n ��u 4"},
	{155,"Li�n ��u 5"},
	{156,"Li�n ��u 6"},
	{157,"Li�n ��u 7"},
	{158,"Li�n ��u 8"},
}

function change_nationality()
	local nDate = tonumber(date("%Y%m%d"))
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanNhapQuocTich[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch�a ��n th�i gian ��ng k� nh�p qu�c, ng��i h�y quay l�i sau nh�.")
			return 0
		end
	end
	
	local tHead = format("%s Ng��i mu�n gia nh�p <color=yellow>%s qu�c<color> ph�i kh�ng?", g_szInfoHeader, szNation)
	local tSay =
	{
		"V�n b�i ��ng � gia nh�p b�n qu�c, xin h�y t�u v�i Ho�ng Th��ng/reg_change_nationality",
		"�� �� "..THOIHANNHAPQUOCTICH.." ng�y, xin cho v�n b�i gia nh�p b�n qu�c/confirm_change_nationality",
		"Ta mu�n suy ngh� l�i/do_nothing",
	}
	Say(tHead,getn(tSay),tSay);
end

function reg_change_nationality()
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng��i �� l� th�n d�n c�a <color=yellow>%s qu�c<color> r�i, kh�ng c�n ph�i ��ng k� n�a!",g_szInfoHeader, szServerNation))
		return
	end
	if nNewNationality == nServerNation then
		Talk(1,"",format("%s Ng��i �� ��ng k� gia nh�p <color=yellow>%s qu�c<color> r�i, kh�ng c�n ph�i ��ng k� n�a!", g_szInfoHeader, szServerNation))
		return
	end
	
	gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, nServerNation)
	SetTask(TSK_SERVER_ID_TIME, GetTime())
	Talk(1,"",format("%s Ch�c m�ng ng��i �� ��ng k� gia nh�p <color=yellow>%s qu�c<color>. Sau <color=yellow>"..THOIHANNHAPQUOCTICH.." ng�y<color> h�y ��n g�p ta �� x�c nh�n gia nh�p.", g_szInfoHeader,szServerNation))
end

function confirm_change_nationality()
	local nRegTime = GetTask(TSK_SERVER_ID_TIME)
	local nCurNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	local nNewNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW)	
	local nServerNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local szServerNation = get_nationality_name(nServerNation)
	local nDay, nHour, nMin = get_waiting_time(GetTask(TSK_SERVER_ID_TIME))
	
	if nCurNationality == nServerNation then
		Talk(1,"",format("%s Ng��i �� l� th�n d�n c�a <color=yellow>%s qu�c<color> r�i, kh�ng c�n ph�i ��ng k� n�a!", g_szInfoHeader,szServerNation))
		return
	end
	if nNewNationality ~= nServerNation then
		Talk(1,"",g_szInfoHeader.."Ng��i ch�a ��ng k� gia nh�p n�n kh�ng th� x�c nh�n!")
		return
	end
	if nDay >= 0 and nHour >= 0 and nMin > 0 then
		Talk(1,"",format("%s Th�i gian �� x�c nh�n gia nh�p c�n <color=yellow>%d ng�y %d gi� %d ph�t<color>. H�y quay tr� l�i �� x�c nh�n sau.", g_szInfoHeader, nDay, nHour, nMin))
		return
	else
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, nServerNation)
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, 0)
		SetTask(TSK_SERVER_ID_TIME, 0)
		Talk(1,"",format("%s T� gi� tr� �i ng��i l� th�n d�n c�a <color=yellow>%s qu�c<color>, xin ch�c m�ng!", g_szInfoHeader, szServerNation))
		return
	end
end

function get_nationality_name(nID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if TB_NATION_SERVERLIST[i][1] == nID then
			return TB_NATION_SERVERLIST[i][2]
		end
	end	
	return ""
end

function get_waiting_time(nRegTime)
	nCurTime = GetTime()
	nDif = THOIHANNHAPQUOCTICH*86400 - nCurTime + nRegTime
	nDay = floor(nDif/86400)
	nHour = floor(mod(nDif, 86400) / 3600)
	nMin = floor(mod(mod(nDif, 86400), 3600) / 60)

	return nDay, nHour, nMin
end

function do_nothing()

end