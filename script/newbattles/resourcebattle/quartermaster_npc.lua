--filename:quartermaster_npc.lua
--create date:2006-06-05
--describe:��������ս����˫������ٽű�
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function main()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nNpcCamp = 0;
	if nNpcName == "M� L��ng Quan-T�ng" then
		nNpcCamp = SONG_ID;
	else
		nNpcCamp = LIAO_ID;
	end;
	local nCamp = BT_GetCamp();
	if nCamp ~= nNpcCamp then	--�����ҵ���Ӫ��NPC��Ӫ��ͬ
		Talk(1,"","<color=green>"..nNpcName.."<color>: To gan! D�m ��t nh�p v�o ��y, ng��i ��u b�t l�y h�n!");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("<color=green>"..nNpcName.."<color>: L��ng th�o �� ���c chuy�n ra ti�n tuy�n, l�n sau nh� n�p s�m nh�!",0);
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local selTab = {
			"N�p to�n b� l��ng th�o/#handin(0)",
			"N�p l��ng th�o-s� c�p ("..nResourceCount1.." ph�n)/#handin(1)",
			"N�p l��ng th�o-trung c�p ("..nResourceCount2.." ph�n)/#handin(2)",
			"N�p l��ng th�o-cao c�p ("..nResourceCount3.." ph�n)/#handin(3)",
			"N�p Huy�n thi�t kho�ng th�ch ("..nStoneCount.." ph�n)/handin_stone",
			"Nh�n cu�c/get_hoe",
			"tr� l�i"..tCampNameZ[nCamp].."_h�u doanh/back_to_home",
			"�ang thu th�p/nothing"
			}
	Say("<color=green>"..nNpcName.."<color>: Th�i gian g�p b�ch, mau giao n�p l��ng th�o.",getn(selTab),selTab);
end;

function handin(nType)
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	if nType == 0 and nResourceCount1 == 0 and nResourceCount2 == 0 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng��i kh�ng mang theo l��ng th�o, mau �i t�m v� ��y!")
		return 0;
	elseif nType == 1 and nResourceCount1 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng��i kh�ng mang theo l��ng th�o-s� c�p, mau �i t�m v� ��y!")
		return 0;
	elseif nType == 2 and nResourceCount2 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng��i kh�ng mang theo l��ng th�o-trung c�p, mau �i t�m v� ��y!")
		return 0;
	elseif nType == 3 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng��i kh�ng mang theo l��ng th�o-cao c�p, mau �i t�m v� ��y!")
		return 0;
	end;
	local nBattlePoint = 0;	--��������
	local nPersonalPoint = 0;
	local str1 = "";
	local str2 = "";
	local str3 = "";
	if nType == 0 or nType == 1 then
		if nResourceCount1 > 0 then
			if DelItem(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4],nResourceCount1) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				str1 = "L��ng th�o-s� c�p"..nResourceCount1.." ph�n,";
			end;
		end;
	end;
	if nType == 0 or nType == 2 then
		if nResourceCount2 > 0 then
			if DelItem(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4],nResourceCount2) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				str2 = "L��ng th�o-trung c�p"..nResourceCount2.." ph�n,";
			end;
		end;
	end;
	if nType == 0 or nType == 3 then
		if nResourceCount3 > 0 then
			if DelItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],nResourceCount3) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				str3 = "L��ng th�o-cao c�p"..nResourceCount3.." ph�n,";
			end;
		end;
	end;
	local nProbability = 0;
	if nBattlePoint <= 19 then
		nProbability = 0;
	elseif nBattlePoint <= 79 then
		nProbability = 1;				
	else
		nProbability = 3;
	end;
	BT_EmperorAward(nProbability);
	local nCamp = BT_GetCamp();
	Add_Resource(nCamp,nBattlePoint);
	BT_SetData(PT_HANDIN_RESOURCE,BT_GetData(PT_HANDIN_RESOURCE)+nBattlePoint);
	BT_AddPersonalPoint(nPersonalPoint);
	Talk(1,"","<color=green>"..nNpcName.."<color>: Giao n�p <color=yellow>"..str1..str2..str3.."<color> gi�p phe m�nh t�ng th�m <color=yellow>"..nBattlePoint.."<color> �i�m t�ch l�y. T�ng �i�m t�ch l�y <color=yellow>"..Get_ResCount(nCamp).."<color>");
	Msg2MSGroup(MISSION_ID,GetName().." N�p"..str1..str2..str3.."�i�m t�ch l�y hi�n t�i"..Get_ResCount(nCamp),nCamp);
end;

function get_hoe()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	if BigGetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) > 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ng��i kh�ng ph�i c� c�y"..tBattleItem[4][1].."? N�u kh�ng mang theo th� mau chu�n b�, th�i gian kh�ng c�n nhi�u!");
	else
		if AddItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1) == 1 then
			BT_SetData(PTNC_USE_HOE_TIMES,0);
			Msg2Player("B�n nh�n ���c 1 "..tBattleItem[4][1]);
		end;
	end;
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;

function handin_stone()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>: H�nh nh� ng��i kh�ng mang theo Huy�n thi�t kho�ng th�ch.");
	else
		local selTab = {
					"Ta mu�n n�p/handin_stone_confirm",
					"Chuy�n s�n t�c ��u m�c/know_cateran_header",
					"Ta suy ngh� l�i!/main",
					}
		Say("<color=green>"..nNpcName.."<color>: Ng��i th�t s� mu�n n�p t�t c� Huy�n thi�t kho�ng th�ch (<color=yellow>"..nStoneCount.."<color> vi�n)? Nghe n�i s�n t�c ��u m�c r�t th�ch ch�ng.",getn(selTab),selTab);
	end;
end;

function handin_stone_confirm()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local nBattlePoint = tBPEven[BP_RESOURCE_HAND_STONE_QM]*nStoneCount;
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>: H�nh nh� ng��i kh�ng mang theo Huy�n thi�t kho�ng th�ch.");
	else
		if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],nStoneCount) == 1 then
			BT_AddPersonalPoint(nBattlePoint);	--�����ݲ�ʹ��BT_AddBattleEvenPoint
			Add_Resource(nCamp,nBattlePoint);
		end;
	end;
end;

function know_cateran_header()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	Talk(1,"main","<color=green>"..nNpcName.."<color>: S�n t�c ��u m�c c�ng �ang thu th�p Huy�n thi�t kho�ng th�ch, nghe n�i y c� nhi�u m�n b�o b�i, b�ng h�u c� th� ��n t�m h�n.");
end;