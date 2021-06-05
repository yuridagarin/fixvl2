Include("\\script\\function\\zq_battles\\zq_head.lua")

NPC_SONG_NAME = "<color=green>T�ng th��ng binh: <color>"

function main()
	if ZQ_JugdeCamp(LIAO_ID) == 1 then
		return 0;
	end
	local tTalk = {
		"��u c�a ta �au qu�, �au qu�!!!",
		"Ai �ang ca h�t trong ��u ta, l� ai?! L� ng��i sao. ��ng h�t n�a, ta n�i ��ng h�t n�a!!!! AAAAA",
		"Ta ch�nh l� ��i t��ng qu�n, ta l� ��i t��ng quan, haha, cu�i c�ng ta �� tr� th�nh ��i t��ng qu�n.",
		"L�nh qu�, l�nh qu�, c� th� mang cho ta 1 chi�c �o �m kh�ng?",
		"Mang �ao ��n cho ta, h�y mang �ao ��n cho ta, ta s� kh�ng gi�t ng��i, ta s� kh�ng gi�t ng��i ��u, hahaha.",
	}
	Talk(1,"task_deal",NPC_SONG_NAME..tTalk[mod(GetTargetNpc() or 0, getn(tTalk)) + 1]);
end

function task_deal()
	if tGtTask:check_cur_task(124) == 1 then
		if GetItemCount(2,0,30061) < 1 then
			Talk(1,"","Kh�ng c� thu�c tr� li�u:".."Thanh T�m t�n");
			return 0;
		end
		local nCount = GetTask(ZQ_CURE_SONG);
		if nCount < ZQ_CURE_SONG_MAX_COUNT then
			if random(100) > 50 then
				SetTask(ZQ_CURE_SONG, nCount + 1);
				if ZQ_CURE_SONG_MAX_COUNT == nCount + 1 then
					Msg2Player(format("Tr� li�u th��ng binh %d/%d", nCount + 1, ZQ_CURE_SONG_MAX_COUNT).."(Ho�n th�nh)");
				else
					Msg2Player(format("Tr� li�u th��ng binh %d/%d", nCount + 1, ZQ_CURE_SONG_MAX_COUNT));
				end
				Talk(1,"",NPC_SONG_NAME.."�a t�, ta c�m th�y kh�e h�n r�i.");
			else
--				local nNpcIndex = GetTargetNpc();
--				ChangeNpcToFight(nNpcIndex, 10, 1);
--				SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
--				SetNpcRemoveScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
--				SetNpcLifeTime(nNpcIndex, 10 * 60);
				Talk(1,"fail_punish",NPC_SONG_NAME.."Ng��i kh�ng cho ta �n, �, kh�ng��");
			end
		end
	end
end

function fail_punish()
		CastState("state_fetter", 100, 18*10);
		local npcIndex = CreateNpc("ZM_mohuasongbing", "Ma H�a T�ng Binh", GetWorldPos());
		SetNpcLifeTime(npcIndex, 6 * 60);
end

--function OnDeath(NpcIdx)
--	local nMapID, nX, nY;
--	if NpcIdx then
--		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
--		local nNpcIndex = CreateNpc("ZM_songshangbing", "�ξ��˱�", ZQ_MAP_ID, nX, nY);
--		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
--	end
--	SetNpcLifeTime(NpcIdx, 0);
--end

--function OnRemove(NpcIdx)
----	local nMapID, nX, nY;
----	if NpcIdx then
----		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
----		local nNpcIndex = CreateNpc("ZM_songshangbing", "�ξ��˱�", ZQ_MAP_ID, nX, nY);
----		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
----	end
--end