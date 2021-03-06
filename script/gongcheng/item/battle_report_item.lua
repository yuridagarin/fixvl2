--create date:07-05-17
--author:yanjun
--describe:前线报导物品脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","Ch? ? trong khu v鵦 C玭g th祅h chi課 m韎 c? th? s? d鬾g Chi課 b竜 ti襫 tuy課");
		return 0;
	end;
	local selTab = {
				"*Xem t譶h h譶h phe ch/view_enemy_info",
				"*Xem t譶h h譶h c竎 Чi k? v? th祅h m玭/see_flag_state",
				"*Xem t譶h h譶h thng vong/view_death",
				"*Ta mu鑞 r阨 kh醝 chi課 trng/leave_battle",
				"*Tho竧/nothing",
				}
	Say("C竎 h? mu鑝 xem tin t鴆 n祇?",getn(selTab),selTab);
end;

function view_enemy_info()
	local nEnemyCamp = GCZ_GetEnemyCamp();
	local szEnemyName = GetMissionS(MS_GONG_TONG_NAME+nEnemyCamp-1);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"OnUse","Bang h閕 i phng l?: <color=yellow>"..szEnemyName.."<color><enter>Binh l鵦 c馻 i phng hi謓 t筰: <color=yellow>"..nEnemyCount.."<color>");
end;

function see_flag_state()
	local szContent = "";
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local szStr = "";
	local szColorHeader = "";
	--为了界面的美观，牺牲了代码的美观
	--==============================================================================
	for i=1,getn(tReviviFlagPos) do
		if GetMissionV(MV_REVIVI_FLAG1_OWNER+i-1) == nPlayerCamp then
			szStr = "Phe ta chi誱 l躰h ";
			szColorHeader = "<color=yellow>"
		else
			szStr = "ch chi誱";
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
	--大旗
	szContent = szContent.."\n\n";	--新的内容，换行
	for i=getn(tNormalFlagPos),1,-1 do
		if GetMissionV(MV_DESTROY_FLAG1+i-1) == 1 then
			szStr = "b? ph?";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = " ch璦 b? h駓";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tNormalFlagPos[i][3]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";	
	end;
	--==============================================================================	
	--城门
	szContent = szContent.."\n\n";
	for i=getn(tDoorName),1,-1 do
		if GetMissionV(MV_DESTROY_EAST_DOOR+i-1) == 1 then
			szStr = "  b? c玭g";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = " ch璦 b? c玭g";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tDoorName[i]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";		
	end;
	Talk(1,"OnUse","T譶h h譶h c竎 Чi k? v? th祅h m玭 hi謓 t筰: \n\n"..szContent);
end;

function view_death()
	Talk(1,"OnUse","Thng vong hai phe nh? sau: \nPhe c玭g: <color=yellow>"..GetMissionV(MV_DEATH_GONG).."<color>\nPhe th?: <color=yellow>"..GetMissionV(MV_DEATH_SHOU).."<color>");
end;

function leave_battle()
	AskClientForString("leave","Nh? nh祅g r阨 kh醝...",1,32,"Sao ph秈 r阨 kh醝?");
end;

function leave(szMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"R阨 kh醝  l筰 tin nh緉:"..szMsg);
end;
