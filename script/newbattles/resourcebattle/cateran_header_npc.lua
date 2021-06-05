Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("C� b�o v�t g� cho ta kh�ng?",0);
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nChangeLeft = GetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1);
	local selTab = {
			"��i s�n t�c-binh k� (T�n 1 vi�n Huy�n thi�t Kho�ng Th�ch)/get_flag",
			"��i s�n t�c-chi�n c� (T�n 2 vi�n Huy�n thi�t Kho�ng Th�ch, c�n ��i ���c"..nChangeLeft..")/get_drum",
			"Nh�n ti�n gh� qua th�i!/nothing",
			}
	Say("C� chuy�n g� n�i mau, kh�ng th� c�t kh�i ��y!",getn(selTab),selTab);
end;

function get_flag()
	local nCamp = BT_GetCamp();
	local nStoneCount = GetMissionV(MV_STONE_COUNT_SONG+nCamp-1);
	if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],1) == 1 then
		AddItem(tBattleItem[7][2],tBattleItem[7][3],tBattleItem[7][4],1);
		Msg2Player("B�n nh�n ���c 1 s�n t�c-binh k�");
		SetMissionV(MV_STONE_COUNT_SONG+nCamp-1,nStoneCount+1);
		BT_AddPersonalPoint(1*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
		Add_Resource(nCamp,1*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
	else
		Talk(1,"","To gan! D�m g�t ta, ng��i kh�ng mang vi�n <color=yellow>Huy�n thi�t Kho�ng Th�ch<color> n�o h�t.");
	end;
end;

function get_drum()
	local nCamp = BT_GetCamp();
	local nChangeLeft = GetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1);
	local nStoneCount = GetMissionV(MV_STONE_COUNT_SONG+nCamp-1);
	if nChangeLeft <= 0 then
		Talk(1,"","Th�ng c�m! �� h�t chi�n c� ��i cho ng��i r�i.");
		return 0;
	end;
	if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],2) == 1 then
		AddItem(tBattleItem[8][2],tBattleItem[8][3],tBattleItem[8][4],1);
		Msg2Player("B�n nh�n ���c 1 s�n t�c-chi�n c�");
		SetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1,nChangeLeft-1);
		SetMissionV(MV_STONE_COUNT_SONG+nCamp-1,nStoneCount+2);
		BT_AddPersonalPoint(2*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
		Add_Resource(nCamp,2*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
	else
		Talk(1,"","To gan! D�m g�t ta, ng��i kh�ng mang vi�n <color=yellow>Huy�n thi�t Kho�ng Th�ch<color> n�o h�t.");
	end;
end;