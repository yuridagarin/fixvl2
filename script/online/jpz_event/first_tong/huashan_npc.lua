Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

g_InfoHeader = "<color=green>V� L�m ��c S�<color>: "

function main()
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID) == 2 then
		Say(g_InfoHeader.."Ho�t ��ng bang h�i tinh anh �ang ti�n h�nh, c�c h� kh�ng th� r�i kh�i b�n �� Hoa S�n.",0);
		return
	end

	Say(g_InfoHeader.."Hoa S�n c�nh ��p tuy�t m�, ng��i mu�n r�i kh�i ch�ng?",
	2,
	"��ng! Ta mu�n r�i kh�i/LeaveMap",
	"K�t th�c ��i tho�i/end_dialog"
	)
end

--���Ҫ���뿪��������
function LeaveMap()
	--��ǰ�����˲��Ƕӳ�
	if PlayerIndex ~= GetTeamMember(0) then
		LeaveTeam();
	end

	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID) == 0 then
		MS_SetPlayerState(3);
		NewWorld(100,1420,2989);
		return
	end

	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID);
	if SubWorld >= 0 then
		DelMSPlayer(MISSION_ID,0);
	end;
	SubWorld = nOldSubWorld;
end

function end_dialog()
end
