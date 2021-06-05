--filename:armyguide_npc.lua
--create date:2006-05-31
--describe:��������ս��������򵼽ű�
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"X�ng pha tr�n m�c, t�c �� r�t quan tr�ng!");
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>H��ng ��o<color>:............");
		return 0;
	end;
	local sContent = "";
	local sName = "";
	local nCamp = BT_GetCamp();
	local nStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	if nStep >= MAX_TASK_STEP then
		local _,nPosX,nPosY = GetNpcWorldPos(GetMissionV(MV_HEADER_APPEAR));
		Talk(1,"","Th� l�nh th� d�n �� xu�t hi�n, ng��i c� th� t�m th�y h�n � <color=yellow>"..floor(nPosX/8)..","..floor(nPosY/16).."<color>.");
		return 0;
	end;
	if GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1) == "" then	--��һ�α����
		Go_To_Next_Step(nCamp);	--��ʼ��һ��
	end;
	sName = GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1);
	sContent = "Qua �i�u tra, ���c bi�t th� d�n <color=yellow>"..sName.."<color> c� th� bi�t tung t�ch c�a th� l�nh, m�i t��ng s� <color=yellow>";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color> mau ��n �� t�m B�ch S� Th�ng c� li�n quan �� t�m ra t�ng t�ch <color=yellow>"..sName.."<color>.";
	local selTab = {
					--"����"..tCampNameZ[nCamp].."����Ӫ/back_to_home",
					"K�t th�c ��i tho�i/nothing",
					}
	Say("<color=green>H��ng ��o<color>:"..sContent,0);
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;