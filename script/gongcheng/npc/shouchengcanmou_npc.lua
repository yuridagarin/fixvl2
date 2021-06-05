--create date:07-04-12
--author:yanjun
--describe:�سǲ�ı�ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>Th� th�nhTham m�u<color>: ";
g_NpcCamp = SHOU_ID;

function main()
	local nNpcIdx = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) >= 15 then
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	if nPlayerCamp ~= g_NpcCamp then
		Talk(1,"",g_InfoHeader.."Ng��i ��u! C� gian t�!");
		return 0;
	end;
	local selTab = {
				"*Xem t�nh h�nh phe ��ch/view_enemy_info",
				"* L�nh Th� V� l�nh/get_guard_token",
				"* Xem Th� v� th�nh m�n/view_guard_info",
				"*Xem t�nh h�nh c�c ��i k� v� th�nh m�n/see_flag_state",
				"* L�nh chi�n b�o ti�n tuy�n/get_battle_report",
				"M� r��ng	/open_box",
				"*Ta mu�n r�i kh�i chi�n tr��ng/leave_battle",
				"Ta ch� ti�n ���ng h�i ch�i!/nothing",
				}
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState >= MS_STATE_GONGCHENG then
		tremove(selTab,3);
	end;
	Say(g_InfoHeader.."Ta l� Th� th�nh Tham m�u",getn(selTab),selTab);
end;

function leave_battle()
	AskClientForString("leave","Nh� nh�ng r�i kh�i...",1,32,"Sao ph�i r�i kh�i?");
end;

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"R�i kh�i �� l�i tin nh�n:"..sLeaveMsg);
end;

function view_enemy_info()
	local nEnemyCamp = GCZ_GetEnemyCamp();
	local szEnemyName = GetMissionS(MS_GONG_TONG_NAME);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"main",g_InfoHeader.."Bang h�i ��i ph��ng l�: <color=yellow>"..szEnemyName.."<color><enter>Binh l�c c�a ��i ph��ng hi�n t�i: <color=yellow>"..nEnemyCount.."<color>");
end;

function get_guard_token()
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"main",g_InfoHeader.."B�n kh�ng th� nh�n Th� V� l�nh.");
		return 0;
	end;
	if GetMissionV(MV_GET_SHOU_TOKEN) == 1 then
		Talk(1,"main",g_InfoHeader.."Th� V� l�nh chi�n d�ch l�n n�y �� ���c ph�t h�t r�i!");
		return 0;
	end;
	if gf_JudgeRoomWeight(3,30) == 0 then
		Talk(1,"main",g_InfoHeader.."R��ng b�n kh�ng �� kho�ng tr�ng ho�c S�c l�c kh�ng ��. H�y quay l�i sau nh�!");
		return 0;
	end;
	SetMissionV(MV_GET_SHOU_TOKEN,1);
	AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],3);
	SendTongMessage("L�nh ���c Th� V� l�nh");
	Talk(1,"",g_InfoHeader.."M�i tr�n C�ng th�nh chi�n ��u c� th� l�nh <color=yellow>3<color> Th� V� l�nh, ph�t cho 3 cao th� �� h� ��m nh�n tr�ng tr�ch Th� v� th�nh m�n");
end;

function view_guard_info()
	--���������ϣ��������ſ��Բ���
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"",g_InfoHeader.."Ch� c� bang ch�, ph� bang ch� v� tr��ng l�o m�i c� th� th�c hi�n thao t�c n�y");
		return 0;
	end;
	local selTab = {
				"* Ta mu�n h�y "..tDoorName[1].."Th� v�/#fire_guard(1)",
				"* Ta mu�n h�y "..tDoorName[2].."Th� v�/#fire_guard(2)",
				"* Ta mu�n h�y "..tDoorName[3].."Th� v�/#fire_guard(3)",
				"* Kh�ng �i�u ch�nh/nothing",
				}
	local szEGuardName,szSGuardName,szWGuardName = GCZ_GetGuardName(g_NpcCamp,0);
	Say(g_InfoHeader.."Th�nh m�n th� v� b�n ta ph�n bi�t nh� sau: \n"..tDoorName[1].."Th� v�: <color=yellow>"..szEGuardName.."<color>\n"..tDoorName[2].."Th� v�: <color=yellow>"..szSGuardName.."<color>\n"..tDoorName[3].."Th� v�: <color=yellow>"..szWGuardName.."<color>",getn(selTab),selTab);
end;

function fire_guard(nDoorIdx)
	local selTab = {
				format("��ng �/#fire_guard_confirm(%d)",nDoorIdx),
				"Ta suy ngh� l�i!/nothing",
				}
	Say(g_InfoHeader.."B�n x�c ��nh ph�i h�y b� ch�c v� c�a th� v� "..tDoorName[nDoorIdx].." ch�?",getn(selTab),selTab);
end;

function fire_guard_confirm(nDoorIdx)
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"",g_InfoHeader.."Ch� c� bang ch�, ph� bang ch� v� tr��ng l�o m�i c� th� th�c hi�n thao t�c n�y");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"",g_InfoHeader.."Ch� c� th� h�y b� ch�c v� c�a th�nh m�n th� v� t�i giai �o�n chu�n b� c�ng th�nh ");
		return 0;
	end;
	local nGuardIdx = GCZ_GetGuardPlayerIndex(g_NpcCamp,nDoorIdx);
	if nGuardIdx == 0 then
		Talk(1,"view_guard_info",g_InfoHeader.."Th�nh m�n n�y v�n ch�a s�p x�p th� v� ");
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	PlayerIndex = nGuardIdx
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--�����ǰ�������ڵ�����
		Talk2SomeOne(nOldPlayerIdx,1,"view_guard_info",g_InfoHeader.."Th� v� n�y �ang khi�u chi�n ��n ��u v�i ��ch, kh�ng th� h�y b� ch�c v� n�y!");
		return 0;
	end;
	Talk2SomeOne(nOldPlayerIdx,1,"",g_InfoHeader.."B�n �� h�y b� th�nh c�ng ch�c v� c�a "..tDoorName[nDoorIdx]..".");
	Say(g_InfoHeader.."Ch�c v� th�nh m�n th� v� c�a b�n �� b� h�y b�",0);
	Msg2Player("Ch�c v� th�nh m�n th� v� c�a b�n �� b� h�y b�");
	SetTaskTemp(TEMP_GURAD_ID,0);
	SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);
	local nPlayerCamp = GCZ_GetPlayerCamp();
	GCZ_Msg2Camp(GetName(nOldPlayerIdx).."�� h�y b� ch�c v� c�a"..tDoorName[nDoorIdx].."Th� v�"..GetName()..".",nPlayerCamp);
end;

function see_flag_state()
	local szContent = "";
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local szStr = "";
	local szColorHeader = "";
	--Ϊ�˽�������ۣ������˴��������
	--==============================================================================
	for i=1,getn(tReviviFlagPos) do
		if GetMissionV(MV_REVIVI_FLAG1_OWNER+i-1) == nPlayerCamp then
			szStr = "Phe ta chi�m l�nh ";
			szColorHeader = "<color=yellow>"
		else
			szStr = "��ch chi�m";
			szColorHeader = "<color=red>"
		end;
		szContent = szContent..gf_FormatStringLength(tReviviFlagPos[i][3]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";
		if i == 1 or i == 6 then
			szContent = szContent..gf_FormatStringLength("",25); 
		end;
		if i == 2 or i == 5 then	
			szContent = szContent.."\n";
		end;
	end;
	--==============================================================================
	--����
	szContent = szContent.."\n\n";	--�µ����ݣ�����
	for i=getn(tNormalFlagPos),1,-1 do
		if GetMissionV(MV_DESTROY_FLAG1+i-1) == 1 then
			szStr = "b� ph�";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = " ch�a b� h�y";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tNormalFlagPos[i][3]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";	
	end;
	--==============================================================================	
	--����
	szContent = szContent.."\n\n";
	for i=getn(tDoorName),1,-1 do
		if GetMissionV(MV_DESTROY_EAST_DOOR+i-1) == 1 then
			szStr = " �� b� c�ng";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = " ch�a b� c�ng";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tDoorName[i]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";		
	end;
	Talk(1,"main",g_InfoHeader.."T�nh h�nh c�c ��i k� v� th�nh m�n hi�n t�i: \n\n"..szContent);
end;

function get_battle_report()
	if GetItemCount(tItemInfo[4][2],tItemInfo[4][3],tItemInfo[4][4]) ~= 0 then
		Talk(1,"",g_InfoHeader.."Ch� ph�i ng��i �� c� 1 quy�n Chi�n b�o ti�n tuy�n sao?");
		return 0;
	end;
	AddItem(tItemInfo[4][2],tItemInfo[4][3],tItemInfo[4][4],1);
	Msg2Player("B�n nh�n ���c 1 Chi�n b�o ti�n tuy�n");
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_InfoHeader.."Ng��i v�n ch�a thu�c v� r��ng c�a m�nh.");
		return 0;
	end;
	OpenBox();
end;
