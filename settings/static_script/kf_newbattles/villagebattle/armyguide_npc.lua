--filename:armyguide_npc.lua
--create date:2006-05-31
--describe:村落争夺战场中随军向导脚本
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"X玭g pha tr薾 m筩, t鑓  r蕋 quan tr鋘g!");
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>Hng o<color>:............");
		return 0;
	end;
	local sContent = "";
	local sName = "";
	local nCamp = BT_GetCamp();
	local nStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	if nStep >= MAX_TASK_STEP then
		local _,nPosX,nPosY = GetNpcWorldPos(GetMissionV(MV_HEADER_APPEAR));
		Talk(1,"","Th? l躰h th? d﹏  xu蕋 hi謓, ngi c? th? t譵 th蕐 h緉 ? <color=yellow>"..floor(nPosX/8)..","..floor(nPosY/16).."<color>.");
		return 0;
	end;
	if GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1) == "" then	--第一次被点击
		Go_To_Next_Step(nCamp);	--开始第一步
	end;
	sName = GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1);
	sContent = "Qua 甶襲 tra, 頲 bi誸 th? d﹏ <color=yellow>"..sName.."<color> c? th? bi誸 tung t輈h c馻 th? l躰h, m阨 tng s? <color=yellow>";
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
	sContent = sContent.."<color> mau n  t譵 B竎h S? Th玭g c? li猲 quan  t譵 ra t玭g t輈h <color=yellow>"..sName.."<color>.";
	local selTab = {
					--"返回"..tCampNameZ[nCamp].."方后营/back_to_home",
					"K誸 th骳 i tho筰/nothing",
					}
	Say("<color=green>Hng o<color>:"..sContent,0);
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;