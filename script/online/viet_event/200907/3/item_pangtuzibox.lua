--=======================================================
--create by baiyun 2009.6.1
--describe:Խ�ϰ�7�·ݻ֮��׷Ѱ�����ӣ������ӱ���ű�
--
-----�ۣ������Ƕ�ͯ�ڰ�����Υ�ĸо�����������������
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d%H")) < 09061900 or tonumber(date("%y%m%d%H")) >= 09072700 then
		Talk(1, "", "V�t ph�m �� qu� h�n s� d�ng");
		return
	end
	local nRandItem = 0;
	if gf_Judge_Room_Weight(1, 50, " ") == 0 then
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) == 1 then
		nRandItem = gf_GetRandItemByTable(tb_pangtuzi_aword, 1000000, 8);
		gf_SetLogCaption("Hoat dong truy tim tho map: Su dung ruong tho map");
		if tb_pangtuzi_aword[nRandItem][5] == 1 then
			local nRetCode, nItem = gf_AddItemEx(tb_pangtuzi_aword[nRandItem][3], tb_pangtuzi_aword[nRandItem][1]);
			if nRetCode == 1 then
				WriteLogEx("Hoat dong thang 6","Th� M�p",tb_pangtuzi_aword[nRandItem][3][4],tb_pangtuzi_aword[nRandItem][1]);
			end
			if nRetCode == 1 and tb_pangtuzi_aword[nRandItem][4] ~= 0 then
				SetItemExpireTime(nItem, tb_pangtuzi_aword[nRandItem][4]);
			end
		else
			Earn(tb_pangtuzi_aword[nRandItem][3] * 100 * 100);
			WriteLogEx("Hoat dong thang 6","nh�n ���c",tb_pangtuzi_aword[nRandItem][3], "v�ng");
		end
		gf_SetLogCaption("");
	end
end

function task_trigger()
	if tonumber(date("%y%m%d%H")) < 09061900 or tonumber(date("%y%m%d%H")) >= 09071924 then
		RemoveTrigger(GetRunningTrigger());
		return
	end
	gf_SetLogCaption("Hoat dong tho map");
	gf_AddItemEx({2, 1, 30095, 1}, "R��ng th� m�p");
	WriteLogEx("Hoat dong thang 6","Th� M�p",1,"R��ng Th� M�p");
	gf_SetLogCaption("");
	
end