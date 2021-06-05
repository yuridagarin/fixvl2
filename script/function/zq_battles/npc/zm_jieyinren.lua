--��ħ������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

ZMJYR_NpcName = "<color=green>Ch�n Ma ti�p d�n s�: <color>";

function main()
	local tSay = {
		format("\nTi�n v�o Ma H�a Thi�n M�n Tr�n (ti�u hao: %d v�ng)/join_zm_battle", ZQ_TICKET_CAST / 10000),
		"\nT�m hi�u Ch�n Ma Thi�n M�n Tr�n/know_battle_situation",
		"\nC�a h�ng ��i ma tinh/mojing_exchange_shop",
		"\n r�t lui/nothing",
	};
	Say(ZMJYR_NpcName..format("Thi�n M�n Tr�n �� b� ma h�a, ��i quan T�ng Li�u ��u b� v�y b�n trong, c�n s� t��ng tr� c�a %s. Ng��i t��ng tr� s� c�n c� v�o tr�n doanh m� ���c chuy�n ��n doanh T�ng ho�c Li�u (tr�n doanh khi tham gia chi�n tr��ng) trong Ma H�a Thi�n M�n Tr�n, n�u ch�a c� tr�n doanh c�n ch�n tr�n doanh tr��c khi v�o.", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function join_zm_battle()
	local tSay = {};
	local nValue = ZQ_GetCamp();
	if nValue == ALL_ID then
		tinsert(tSay, "T��ng tr� phe Li�u/join_liao_zm_battle");
		tinsert(tSay, "T��ng tr� phe T�ng/join_song_zm_battle");
	elseif nValue == SONG_ID then
		tinsert(tSay, "T��ng tr� phe T�ng/join_song_zm_battle");
	elseif nValue == LIAO_ID then
		tinsert(tSay, "T��ng tr� phe Li�u/join_liao_zm_battle");
	end
	tinsert(tSay, "\n Ph�n h�i/main")
	tinsert(tSay, "Ra khi/nothing");
	Say(ZMJYR_NpcName.."C�c h� mu�n t��ng tr� phe n�o, ch�n phe t�i ��y c�ng s� quy�t ��nh phe tr�n doanh sau n�y c�a c�c h�. C�c h� c�ng c� th� ��n quan b�o danh chi�n tr��ng �� t�m hi�u th�m v� quy�t ��nh ch�n tr�n doanh n�o.", getn(tSay), tSay);
end

function know_battle_situation()
	local tSay = {}
	tinsert(tSay, "\n Ph�n h�i/main")
	tinsert(tSay, "Ra khi/nothing");
	Say(ZMJYR_NpcName.."K� t� khi Nh�m Ng� H�nh ��t nh�p v�o Th��ng C� Thi�n M�n Tr�n, s� xu�t t� n�a l� b� Th�ng Linh L�o T� ph� ma nh�p th�n, k� t� �� Thi�n M�n Tr�n tr� n�n ma kh� ng�p tr�i, v� s� binh s� b� ma h�a, ��ch ta kh�ng ph�n, gi�t ng��i �i�n d�i. Qu�n ��i T�ng Li�u 2 b�n ��u b� v�y kh�n b�n trong.", getn(tSay), tSay);
end

function join_song_zm_battle()
	local tJoinPos = {
		{1582, 3792},
	};
	join_zm_battle_deal(SONG_ID ,tJoinPos);
end

function join_liao_zm_battle()
	local tJoinPos = {
		{1905, 3288},
	};
	join_zm_battle_deal(LIAO_ID ,tJoinPos);
end

function join_zm_battle_deal(nCamp, tJoinPos)
	if nCamp ~= 1 and nCamp ~= 2 then
		return 0;
	end
	if not tJoinPos then
		return 0;
	end
	if GetCash() < ZQ_TICKET_CAST then
		Talk(1,"",format("H�nh trang kh�ng �� %d v�ng, kh�ng th� v�o.", ZQ_TICKET_CAST/10000));
		return 0;
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"","�� k�ch ho�t kinh m�ch, ��t c�nh gi�i tr�n V� Gi� m�i c� th� v�o.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	--���ǣ��״̬
	CleanInteractive();
	local nRandIndex = random(getn(tJoinPos));
	if 1 == NewWorld(ZQ_MAP_ID, tJoinPos[nRandIndex][1], tJoinPos[nRandIndex][2]) then
		--��Ǯ
		if Pay(ZQ_TICKET_CAST) ~= 1 then
			return 0;
		end
		if GetItemCount(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3]) < 1 then
			AddItem(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3], 1);
		end
		ZQ_SetCamp(nCamp);
		ZQ_SetPlayerState();
		Msg2Player("C�c h� �� v�o Ch�n Ma Thi�n M�n Tr�n");
	end	
end

function mojing_exchange_shop()
	local tSay = {
		"C�a h�ng Ma Tinh Gi�i Ch� c�p 3/#show_equip_shop(3027)",
		"C�a h�ng Ma Tinh Trang B� S� M�n/mojing_shimen_shop",
		"C�a h�ng Ma Tinh T�p H�a/#show_equip_shop(3026)",
		"\n Ph�n h�i/main",
		"Ra khi/nothing",
	}
	Say(ZMJYR_NpcName.."Tham gia chi�n tr��ng ch�n kh�, khi�u chi�n c�a �i nh� c� t� l� nh�t ��nh nh�n ���c Ma Tinh, t�ch l�y l��ng ma tinh c� th� ��i ���c ��o c� t��ng �ng.",getn(tSay), tSay);
end


function mojing_shimen_shop()
	local tSay = {
		"Ma Tinh ��i s� m�n b� 4/#show_equip_shop(3)",
		"Ma Tinh ��i s� m�n b� 5/#show_equip_shop(6)",
		"\n Ph�n h�i/mojing_exchange_shop",
		"Ra khi/nothing",
	}
	Say(ZMJYR_NpcName.."Tham gia chi�n tr��ng ch�n kh�, khi�u chi�n c�a �i nh� c� t� l� nh�t ��nh nh�n ���c Ma Tinh, t�ch l�y l��ng ma tinh c� th� ��i ���c ��o c� t��ng �ng.",getn(tSay), tSay);
end