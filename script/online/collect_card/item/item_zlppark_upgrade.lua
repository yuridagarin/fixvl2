Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	nItem = tonumber(nItem);
	local nTime = tonumber(date("%Y%m%d"));
	
	if nTime < CC_UPGRADE_DATE then
		Talk(1, "", "��i hi�p t�m th�i ng��i kh�ng th� m� l� bao n�y, l� bao n�ng c�p n�y ch� c� th� m� sau khi <color=red> m�n ph�i m�i �� s�ng l�p <color> m�i ���c.");
		return 0;
	end
	
	if 1 ~= gf_CheckPlayerRoute() then
		Talk(1, "", "Ch� c� nh�ng ng��i ch�i gia nh�p l�u ph�i m�i c� th� m�!");
		return 0;
	end
	
	if GetLevel() < CC_LEVEL_LIMIT then
		Talk(1,"",format("Ch� c� nh�ng ng��i ch�i c� ��ng c�p ��t ��n %d m�i m� ���c", CC_LEVEL_LIMIT));
		return 0;
	end
	
	local strTab = {
		format("Ta mu�n m� l� bao n�ng c�p/#OnUse_1(%d)", nItem),
		"�� ta suy ngh�/nothing",
	};
	Say("<color=green> L� Bao N�ng C�p: <color> x�c nh�n m� L� Bao N�ng C�p n�y kh�ng?", getn(strTab), strTab);
end

function OnUse_1(nItem)
	local tSay = {
		"Ta mu�n ��i trang b� m�i ( ti�u hao 2 L� Bao N�ng C�p)/exchange_new_equip",
	}
	local  nRoute = GetPlayerRoute();
	if nRoute == 23 or nRoute == 29 or nRoute == 30 then
		tinsert(tSay, getn(tSay), format("Ta mu�n ��i v� kh� b� s� m�n th� 4 ( ti�u hao %d L� Bao N�ng C�p)/#exchange_shimen_equip(%d,%d)",2,1,2));
		tinsert(tSay, getn(tSay), format("Ta mu�n ��i ��u kh�i b� s� m�n th� 4 ( ti�u hao %d L� Bao N�ng C�p)/#exchange_shimen_equip(%d,%d)",1,2,1));
		tinsert(tSay, getn(tSay), format("Ta mu�n ��i y ph�c b� s� m�n th� 4 ( ti�u hao %d L� Bao N�ng C�p)/#exchange_shimen_equip(%d,%d)",1,3,1));
		tinsert(tSay, getn(tSay), format("Ta mu�n ��i qu�n b� s� m�n th� 4 ( ti�u hao %d L� Bao N�ng C�p)/#exchange_shimen_equip(%d,%d)",1,4,1));
		tinsert(tSay, getn(tSay), format("Ta mu�n ��i ng�c b�i b� s� m�n th� 4 ( ti�u hao %d L� Bao N�ng C�p)/#exchange_shimen_equip(%d,%d)",1,5,1));
		tinsert(tSay, getn(tSay), format("Ta mu�n ��i nh�n b� s� m�n th� 4 ( ti�u hao %d L� Bao N�ng C�p)/#exchange_shimen_equip(%d,%d)",1,6,1));
	end
	Say("��i hi�p ng��i mu�n ��i trang b� nh� th� n�o? <color=red> ( ��i trang b� s� m�n h� th�ng t� ��ng t�ng �i�m danh v�ng l�n ��n 12000 �i�m) <color>",getn(tSay), tSay);
end

function exchange_new_equip()
	local tAward = {
		{1, 60, "Gi�y V�i Th�", {0, 154, 1, 1}, 0},
		{1, 30, "Tinh Tr� B� H�i", {0, 154, 2, 1}, 0},
		{1, 10, "B� Ch� Cao ��ng Ngoa", {0, 154, 3, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if GetItemCount(2, 1, 30541) < 2 then
		Talk(1,"",format("C�n c� %d L� Bao N�ng C�p Phi�n B�n M�i m�i c� th� ��i trang b� n�y", 2));
		return 0;
	end
	if DelItem(2, 1, 30541, 2) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, CC_LOG_TITLE, "L� Bao N�ng C�p Phi�n B�n M�i ��i trang b� m�i");
	end
end

function exchange_shimen_equip(nKind, nCost)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if nRoute ~= 23 and nRoute ~= 29 and nRoute ~= 30 then
		return 0;
	end
	local tAwardTable = CC_SHIMEN_EQUIP[nRoute];
	if not tAwardTable then return 0; end
	local nBody = GetBody();
	local tAwardTableSub = tAwardTable[nBody];
	if not tAwardTableSub then return 0; end
	local tAwardList = tAwardTableSub[nKind];
	if not tAwardList then return 0; end
	if GetItemCount(2, 1, 30541) < tonumber(nCost) then
		Talk(1,"",format("C�n c� %d L� Bao N�ng C�p Phi�n B�n M�i m�i c� th� ��i trang b� n�y", tonumber(nCost)));
		return 0;
	end
	if DelItem(2, 1, 30541, tonumber(nCost)) == 1 then
		--��ʦ��װ��
		gf_AddItemEx2({tAwardList[2][1], tAwardList[2][2], tAwardList[2][3], 1, 1, -1, -1, -1, -1, -1, -1, 0}, tAwardList[1], CC_LOG_TITLE, "L� Bao N�ng C�p Phi�n B�n M�i ��i trang b� s� m�n", 0, 1);
		--Msg2Player(format("����ʦ��4��װ��[%s]", tAwardList[1]));
		--��ʦ�Ź��׶�
		local nCurrentRepu = GetTask(336);
		if nCurrentRepu < CC_TMGL_UPGRADE_POP then
			SetTask(336, CC_TMGL_UPGRADE_POP);
			Msg2Player(format("Ng��i nh�n ���c %d �i�m danh v�ng, �i�m danh v�ng hi�n t�i l� %d.", CC_TMGL_UPGRADE_POP - nCurrentRepu, CC_TMGL_UPGRADE_POP));
		end
	end
end


