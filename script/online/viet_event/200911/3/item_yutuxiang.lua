--=============================================
--create by baiyun 2009.8.27
--describe:Խ�ϰ�9�·�����������ű�
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
--	if nDate > 091213 then
--		Talk(1, "", "V�t ph�m �� qu� h�n s� d�ng, kh�ng th� m�");
--		return 0;
--	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		gf_SetLogCaption(VIET_0909_LOG_TITLE);
		local nRand = gf_GetRandItemByTable(tb_VIET_0909_YUTUXIANG, 100000, 1);
		local nRetCode, nIndex = gf_AddItemEx(tb_VIET_0909_YUTUXIANG[nRand][3], tb_VIET_0909_YUTUXIANG[nRand][1]);
		WriteLogEx("Hoat dong trung thu","R��ng Th� Ng�c",1,tb_VIET_0909_YUTUXIANG[nRand][1])
		if nRetCode == 1 and tb_VIET_0909_YUTUXIANG[nRand][4] > 0 then
			SetItemExpireTime(nIndex, tb_VIET_0909_YUTUXIANG[nRand][4]);
		end
		gf_SetLogCaption("");
	end
end