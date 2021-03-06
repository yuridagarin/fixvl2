--filename:knowmandeath.lua
--create date:2006-06-02
--describe:知情人NPC死亡脚本
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nNpcCamp,nNum = get_npc_camp(tonumber(npcIndex));
	local nPlayerCamp = BT_GetCamp();
	SetNpcDeathScript(npcIndex,"");
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetMissionV(nNum,0);
	BT_EmperorAward(1);
	BT_AddBattleEvenPoint(BP_VILLAGE_KILL_KNOWMAN);
	BT_AddBattleActivity(BA_VILL_KILL_KNOWMAN);
	if nNpcCamp == nPlayerCamp then
		SetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1,GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1)+1);	--nPlayerCamp杀死nPlayerCamp的知情人
		if nPlayerCamp == SONG_ID then
			Msg2MSGroup(MISSION_ID,"S? B竎h S? Th玭g c馻 phe T鑞g b? phe T鑞g di謙:"..GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1),nPlayerCamp);
		else
			Msg2MSGroup(MISSION_ID,"S? B竎h S? Th玭g c馻 phe Li猽 b? phe Li猽 di謙:"..GetMissionV(MV_SONG_KILL_SONG+nPlayerCamp-1),nPlayerCamp);
		end;
	else
		SetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1,GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1)+1);	--nPlayerCamp杀死nEnemyCamp的知情人
		if nPlayerCamp == SONG_ID then
			Msg2MSGroup(MISSION_ID,"S? B竎h S? Th玭g c馻 phe Li猽 b? phe T鑞g di謙:"..GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1),nPlayerCamp);
		else
			Msg2MSGroup(MISSION_ID,"S? B竎h S? Th玭g c馻 phe T鑞g b? phe Li猽 di謙:"..GetMissionV(MV_SONG_KILL_LIAO+nPlayerCamp-1),nPlayerCamp);
		end;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_SONG+nNpcCamp-1));
	if nNpcCamp == SONG_ID then
		Say("Nh﹏ v藅 phe T鑞g <color=yellow>"..GetMissionS(MSTR_SONG_TARGETNAME+nNpcCamp-1).."<color> t鋋 : <color=yellow>"..floor(MapX/8)..","..floor(MapY/16).."<color>",0);
	else
		Say("Nh﹏ v藅 phe Li猽 <color=yellow>"..GetMissionS(MSTR_SONG_TARGETNAME+nNpcCamp-1).."<color> t鋋 : <color=yellow>"..floor(MapX/8)..","..floor(MapY/16).."<color>",0);
	end;
end;
--判断NPC是哪个阵营的。在这里要说明一下，我们可以根据NPC的名字来判断它所属的阵营，
--但是这样的话，这个函数将不适用于海外版，因为海外版对字符串的处理不同于中文版。
--所以尽量不要用判断中文字符的方式来处理一些事情。
function get_npc_camp(nIndex)
	for i=MV_KNOWMAN_SONG_BEGIN,MV_KNOWMAN_SONG_END do
		if nIndex == GetMissionV(i) then
			return SONG_ID,i;
		end;
	end;
	for i=MV_KNOWMAN_LIAO_BEGIN,MV_KNOWMAN_LIAO_END do
		if nIndex == GetMissionV(i) then
			return LIAO_ID,i;
		end;
	end;
	WriteLog("[Chi課 trng b竜 l鏸]: get_npc_camp kh玭g t譵 th蕐 i phng NPC, nh藀 tham s?:"..nIndex);
end;