--create date:07-05-17
--author:yanjun
--describe:ǰ�߱�����Ʒ�ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","Ch� � trong khu v�c C�ng th�nh chi�n m�i c� th� s� d�ng Chi�n b�o ti�n tuy�n");
		return 0;
	end;
	local selTab = {
				"*Xem t�nh h�nh phe ��ch/view_enemy_info",
				"*Xem t�nh h�nh c�c ��i k� v� th�nh m�n/see_flag_state",
				"*Xem t�nh h�nh th��ng vong/view_death",
				"*Ta mu�n r�i kh�i chi�n tr��ng/leave_battle",
				"*Tho�t/nothing",
				}
	Say("C�c h� mu�m xem tin t�c n�o?",getn(selTab),selTab);
end;

function view_enemy_info()
	local nEnemyCamp = GCZ_GetEnemyCamp();
	local szEnemyName = GetMissionS(MS_GONG_TONG_NAME+nEnemyCamp-1);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"OnUse","Bang h�i ��i ph��ng l�: <color=yellow>"..szEnemyName.."<color><enter>Binh l�c c�a ��i ph��ng hi�n t�i: <color=yellow>"..nEnemyCount.."<color>");
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
	Talk(1,"OnUse","T�nh h�nh c�c ��i k� v� th�nh m�n hi�n t�i: \n\n"..szContent);
end;

function view_death()
	Talk(1,"OnUse","Th��ng vong hai phe nh� sau: \nPhe c�ng: <color=yellow>"..GetMissionV(MV_DEATH_GONG).."<color>\nPhe th�: <color=yellow>"..GetMissionV(MV_DEATH_SHOU).."<color>");
end;

function leave_battle()
	AskClientForString("leave","Nh� nh�ng r�i kh�i...",1,32,"Sao ph�i r�i kh�i?");
end;

function leave(szMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"R�i kh�i �� l�i tin nh�n:"..szMsg);
end;
