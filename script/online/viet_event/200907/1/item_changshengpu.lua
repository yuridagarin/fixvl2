--=======================================================
--create by baiyun 2009.5.30
--describe:Խ�ϰ�7�·ݻ֮һ׷Ѱ�����գ������սű�
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d%H")) < 09061900 or tonumber(date("%y%m%d%H")) >= 09072700 then
		Talk(1, "", "V�t ph�m �� qu� h�n s� d�ng");
		return
	end
	local nRandItem = 0;
	if gf_Judge_Room_Weight(4, 50, " ") == 0 then
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		if GetTask(TASK_USE_CHANGSHENGPU_EXP) < CONST_USE_CHANGSHENGPU_MAX_EXP then
			ModifyExp(CONST_USE_CHANGSHENGPU_EACH_EXP);
			SetTask(TASK_USE_CHANGSHENGPU_EXP, GetTask(TASK_USE_CHANGSHENGPU_EXP) + CONST_USE_CHANGSHENGPU_EACH_EXP);
			Msg2Player("B�n nh�n ���c "..CONST_USE_CHANGSHENGPU_EACH_EXP.." �i�m kinh nghi�m");
		end
		nRandItem = gf_GetRandItemByTable(tb_changshengpu_aword, 1000000000, 23);
		gf_SetLogCaption("Truy t�m tr��ng sinh ph�");
		local nRetCode, nItem = gf_AddItemEx(
				{tb_changshengpu_aword[nRandItem][3], tb_changshengpu_aword[nRandItem][4], tb_changshengpu_aword[nRandItem][5], tb_changshengpu_aword[nRandItem][7]}, 
				tb_changshengpu_aword[nRandItem][1]
				);
		WriteLogEx("Hoat dong thang 6","Tr��ng Sinh Ph�",tb_changshengpu_aword[nRandItem][6],tb_changshengpu_aword[nRandItem][1]);
		gf_SetLogCaption("");
		if nRetCode == 1 and tb_changshengpu_aword[nRandItem][6] ~= 0 then
			SetItemExpireTime(nItem, tb_changshengpu_aword[nRandItem][6]);
		end
	end
end