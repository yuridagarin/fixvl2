--=============================================
--create by baiyun 2009.10.14
--describe:Խ�ϰ�11�·ݻ �ջ���ű��ļ�
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20091213 then
		Talk(1, "", "V�t ph�m �� h�t h�n s� d�ng.");
		return 0;
	end

	if GetTask(VIET_0911_TASK_JUHUACHA_COUNT) >= VIET_0911_JUHUACHA_MAX_COUNT then
		Talk(1, "", "��i hi�p �� s� d�ng tr� hoa c�c ��t ��n kinh nghi�m cao nh�t, kh�ng th� ti�p t�c s� d�ng tr� hoa c�c n�a.");
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		ModifyExp(125000);
		WriteLogEx(VIET_0911_LOG_TITLE,"Tr� Hoa C�c",125000,"�i�m kinh nghi�m")
		SetTask(VIET_0911_TASK_JUHUACHA_COUNT, GetTask(VIET_0911_TASK_JUHUACHA_COUNT) + 1);
		--����Ʒ����		
		if mod(GetTask(VIET_0911_TASK_JUHUACHA_COUNT),50) == 0 then
			local nRand = gf_GetRandItemByTable(tbVIET_0911_JUHUACHA_AWARD_2, 1000000, 1);
			local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_JUHUACHA_AWARD_2[nRand][3], tbVIET_0911_JUHUACHA_AWARD_2[nRand][1]);
			WriteLogEx(VIET_0911_LOG_TITLE,"Tr� Hoa C�c",1,tbVIET_0911_JUHUACHA_AWARD_2[nRand][1])
			if nRetCode == 1 and tbVIET_0911_JUHUACHA_AWARD_2[nRand][4] ~= 0 then
				SetItemExpireTime(nIndex, tbVIET_0911_JUHUACHA_AWARD_2[nRand][4]);
			end
		else			
			local nRand = gf_GetRandItemByTable(tbVIET_0911_JUHUACHA_AWARD, 1000000, 19);
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			if nRand == 18 then
				ModifyReputation(2, 0);
				Msg2Player("B�n nh�n ���c 2 �i�m Danh v�ng.")
				WriteLogEx(VIET_0911_LOG_TITLE,"Tr� Hoa C�c",2,"�i�m danh v�ng")
			elseif nRand == 19 then
				SetTask(336, GetTask(336) + 2);
				Msg2Player("B�n nh�n ���c 2 �i�m S� m�n.")
				WriteLogEx(VIET_0911_LOG_TITLE,"Tr� Hoa C�c",2,"�i�m s� m�n")
			else
				local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_JUHUACHA_AWARD[nRand][3], tbVIET_0911_JUHUACHA_AWARD[nRand][1]);
				WriteLogEx(VIET_0911_LOG_TITLE,"Tr� Hoa C�c",1,tbVIET_0911_JUHUACHA_AWARD[nRand][1])
				if nRetCode == 1 and tbVIET_0911_JUHUACHA_AWARD[nRand][4] ~= 0 then
					SetItemExpireTime(nIndex, tbVIET_0911_JUHUACHA_AWARD[nRand][4]);
				end
				gf_SetLogCaption("");
			end
		end
	end
end