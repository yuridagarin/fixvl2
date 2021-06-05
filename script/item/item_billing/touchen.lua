Include("\\script\\newbattles\\functions.lua");
Include("\\script\\vng\\config\\newserver.lua");

TSK_EXCHANGE_JUNGONG_TIME = 2154

tbTOUCHEN = 
{
	[1] = {"��u th�nh t�n",2,1,9980,15000},
	[2] = {"��u th�nh th�",2,1,9979,50000},
	[3] = {"��u th�nh bi�u",2,1,9978,120000},
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch�a ��n th�i gian cho ph�p, v�t ph�m n�y kh�ng th� s� d�ng.")
			return
		end
	end
	if nDate < 20131005 then
		Talk(1,"","Ch�a ��n th�i gian cho ph�p, v�t ph�m n�y kh�ng th� s� d�ng.")
		return
	end
	
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","B�n d�ng sai d�ng c�");
		return 0;
	end;
	local selTab = {
				"K�ch ho�t s� d�ng v�t ph�m/kick_off",
				"H�y b� k�ch ho�t s� d�ng v�t ph�m/turn_off",
				format("��ng �/#use(%d,%d)",nItemIdx,nType),
				"H�y b�/nothing",
				}
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local nMaxTranslateJG = tbTOUCHEN[nType][5];
	local szItemName = tbTOUCHEN[nType][1];
	local nCamp = 0;
	if nCurJunGong > 0 then
		nCamp = 1;
	elseif nCurJunGong < 0 then
		nCamp = 2;
	end;
	if nCamp == 0 then
		Talk(1,"","�i�m chi�n c�ng hi�n t�i c�a b�n l� <color=yellow>0<color>. Kh�ng th� s� d�ng "..szItemName..".");
		return 0;
	end;
	Say("s� d�ng <color=yellow>"..szItemName.."<color>C� th� d�ng �i�m c�ng tr�ng hi�n c� ��i t��ng ���ng v�i �i�m chi�n c�ng tr�n doanh ��i ph��ng, nhi�u nh�t c� th� ��i <color=yellow>"..nMaxTranslateJG.."<color> �i�m c�ng tr�ng tr�n doanh ��i ph��ng. Hi�n t�i ng��i c� <color=yellow>"..tCampNameZ[nCamp].."_c�ng tr�ng"..abs(nCurJunGong).." �i�m<color>, ng��i ��ng � d�ng"..szItemName.."?",getn(selTab),selTab);
end;

function kick_off()
	local nCurTime = GetTime()
	if GetTask(TSK_EXCHANGE_JUNGONG_TIME) > 0 then
		Say("B�n �� k�ch ho�t s� d�ng v�t ph�m n�y r�i!",0)
		return
	end
	SetTask(TSK_EXCHANGE_JUNGONG_TIME,nCurTime)
	Say("K�ch ho�t s� d�ng v�t ph�m th�nh c�ng. Sau 72 gi� b�n c� th� s� d�ng v�t ph�m n�y.",0)
	WriteLogEx("Chuyen doi cong trang","k�ch ho�t s� d�ng",tonumber(date("%Y%m%d%H%M")))
end

function turn_off()
	SetTask(TSK_EXCHANGE_JUNGONG_TIME,0)
	Say("H�y b� k�ch ho�t s� d�ng v�t ph�m th�nh c�ng.",0)
	WriteLogEx("Chuyen doi cong trang","h�y b� k�ch ho�t",tonumber(date("%Y%m%d%H%M")))
end

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbTOUCHEN) do
		if genre == tbTOUCHEN[i][2] and detail == tbTOUCHEN[i][3] and particular == tbTOUCHEN[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nType)
	if GetTask(TSK_EXCHANGE_JUNGONG_TIME) == 0 then
		Say("B�n ch�a k�ch ho�t s� d�ng v�t ph�m n�y!",0)
		return
	end	
	if GetTime() - GetTask(TSK_EXCHANGE_JUNGONG_TIME) < 72*60*60 then
		Say("Th�i gian k�ch ho�t v�t ph�m ch�a �� 72 gi�!",0)
		return
	end
	if GetTime() - GetTask(TSK_EXCHANGE_JUNGONG_TIME) > 96*60*60 then
		Say("Th�i gian k�ch ho�t v�t ph�m �� qua 96 gi�, b�n ph�i k�ch ho�t l�i m�i c� th� s� d�ng v�t ph�m!",0)
		SetTask(TSK_EXCHANGE_JUNGONG_TIME,0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nCurJunGong = BT_GetData(PT_RANKPOINT);
		local nMaxTranslateJG = tbTOUCHEN[nType][5];
		local szItemName = tbTOUCHEN[nType][1];	
		local nCamp = 0;
		if nCurJunGong > 0 then
			nCamp = 1;
		elseif nCurJunGong < 0 then
			nCamp = 2;
		end;
		local nTranslateJG = 0;
		if nCurJunGong >= nMaxTranslateJG then
			nTranslateJG = nMaxTranslateJG;
		elseif nCurJunGong <= -nMaxTranslateJG then
			nTranslateJG = -nMaxTranslateJG;
		else
			nTranslateJG = nCurJunGong;
		end;
		BT_SetData(PT_RANKPOINT,-nTranslateJG);
		SetRankPoint(5,701,1);	--����������а�
		SetTask(TSK_EXCHANGE_JUNGONG_TIME,0)
		Msg2Player("B�n ��t th�nh c�ng "..tCampNameZ[nCamp].."Ph��ng "..abs(nCurJunGong).." �i�m c�ng tr�ng ��i th�nh"..tCampNameZ[3-nCamp].."Ph��ng "..abs(nTranslateJG).." �i�m c�ng tr�ng");
		WriteLog("[Chi�n tr��ng Nh�n M�n Quan]:"..GetName().."S� d�ng 1	"..szItemName.."Chuy�n ��i "..abs(nCurJunGong).." �i�m"..tCampNameZ[nCamp].."_c�ng tr�ng");
	end;
end;
