--create date:07-04-12
--author:yanjun
--describe:���ǲ�ı�ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>C�ng th�nh Tham M�u<color>: ";
g_NpcCamp = GONG_ID;

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
		"* L�nh C�ng th�nh Ti�n phong l�nh/get_attack_token",
		"*Xem t�nh h�nh c�c ��i k� v� th�nh m�n/see_flag_state",
		"* L�nh chi�n b�o ti�n tuy�n/get_battle_report",
		"M� r��ng	/open_box",
		"*Ta mu�n r�i kh�i chi�n tr��ng/leave_battle",
		"Ta ch� ti�n ���ng h�i ch�i!/nothing",
		};
	Say(g_InfoHeader.."Ta l� C�ng th�nh Tham M�u",getn(selTab),selTab);
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
	local szEnemyName = GetMissionS(MS_SHOU_TONG_NAME);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"main",g_InfoHeader.."Bang h�i ��i ph��ng l�: <color=yellow>"..szEnemyName.."<color><enter>Binh l�c c�a ��i ph��ng hi�n t�i: <color=yellow>"..nEnemyCount.."<color>");
end;

function get_attack_token()
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_GONG_TONG_NAME) then
		Talk(1,"main",g_InfoHeader.."B�n kh�ng th� nh�n C�ng th�nh Ti�n phong l�nh.");
		return 0;
	end;
	if GetMissionV(MV_GET_GONG_TOKEN) == 1 then
		Talk(1,"main",g_InfoHeader.."C�ng th�nh Ti�n phong l�nh c�a chi�n d�ch l�n n�y �� ���c l�nh");
		return 0;
	end;
	if gf_JudgeRoomWeight(3,30) == 0 then
		Talk(1,"main",g_InfoHeader.."R��ng b�n kh�ng �� kho�ng tr�ng ho�c S�c l�c kh�ng ��. H�y quay l�i sau nh�!");
		return 0;
	end;
	SetMissionV(MV_GET_GONG_TOKEN,1);
	AddItem(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4],3);
	SendTongMessage("L�nh C�ng th�nh Ti�n phong l�nh");
	Talk(1,"",g_InfoHeader.."M�i tr�n chi�n ��u ch�ng ta ��u ph�t �i <color=yellow>3<color>C�ng th�nh Ti�n phong l�nh. S� d�ng l�nh n�y c� th� ph�t khi�u chi�n ��n ��u ��n c�c Th� v� th�nh m�n. Chi�n th�ng tr�n khi�u chi�n ��n ��u s� tr�c ti�p m� ���c th�nh m�n t��ng �ng c�a ��ch. Ti�n phong l�nh c� b�n trong Ng� C�c");
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
