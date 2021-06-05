Include("\\script\\function\\zq_battles\\zq_head.lua")

NPC_SONG_NAME = "<color=green>Li�u th��ng binh:<color>"

function main()
	if ZQ_JugdeCamp(SONG_ID) == 1 then
		return 0;
	end
	local tTalk = {
		"Ta kh�t qu�, ta mu�n u�ng n��c, ta mu�n u�ng n��c.",
		"M� �i, con l� con c�a m� m�, m� �i ��ng b� con, ��ng b� con !",
		"Ta ch�nh l� ph�t t� chuy�n th�, t�n ph�m nh�n nh� ng��i g�p ta sao kh�ng mau qu� xu�ng.",
		"Ch�t r�i, ch�t h�t r�i, ta c�ng s�p ch�t r�i, ch�t r�i.....",
		"Ta ph�i gi�t h�t c�c ng��i, h�y mau ch�t �i, gi�t, gi�t.....gi�t........",
	}
	Talk(1,"task_deal",NPC_SONG_NAME..tTalk[mod(GetTargetNpc() or 0, getn(tTalk)) + 1]);
end

function task_deal()
	if tGtTask:check_cur_task(128) == 1 then
		if GetItemCount(2,0,30062) < 1 then
			Talk(1,"","Kh�ng c� thu�c tr� li�u:".."S�t kh� ��n");
			return 0;
		end
		local nCount = GetTask(ZQ_CURE_LIAO);
		if nCount < ZQ_CURE_LIAO_MAX_COUNT then
			if random(100) > 50 then			
				SetTask(ZQ_CURE_LIAO, nCount + 1);
				if ZQ_CURE_LIAO_MAX_COUNT == nCount + 1 then
					Msg2Player(format("Tr� li�u th��ng binh %d/%d", nCount + 1, ZQ_CURE_LIAO_MAX_COUNT).."(Ho�n th�nh)");
				else
					Msg2Player(format("Tr� li�u th��ng binh %d/%d", nCount + 1, ZQ_CURE_LIAO_MAX_COUNT));
				end
				Talk(1,"",NPC_SONG_NAME.."T�t qu�, s�c m�nh c�a ta �� ���c h�i ph�c.")
			else
--				local nNpcIndex = GetTargetNpc();
--				ChangeNpcToFight(nNpcIndex, 10, 1);
--				SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
--				SetNpcRemoveScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
--				SetNpcLifeTime(nNpcIndex, 10 * 60);
				Talk(1,"fail_punish",NPC_SONG_NAME.."Wa hahaha, A hahaha, gi�t, gi�t s�ch, gi�t h�t��");
			end
		end
	end
end

function fail_punish()
		CastState("state_fetter", 100, 18*10);
		local npcIndex = CreateNpc("ZM_mohualiaobing", "Ma H�a Li�u Binh", GetWorldPos());
		SetNpcLifeTime(npcIndex, 6 * 60);
end

--function OnDeath(NpcIdx)
--	local nMapID, nX, nY;
--	if NpcIdx then
--		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
--		local nNpcIndex = CreateNpc("ZM_liaoshangbing", "�ɾ��˱�", ZQ_MAP_ID, nX, nY);
--		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
--	end
--	SetNpcLifeTime(NpcIdx, 0);
--end

--function OnRemove(NpcIdx)
----	local nMapID, nX, nY;
----	if NpcIdx then
----		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
----		local nNpcIndex = CreateNpc("ZM_liaoshangbing", "�ɾ��˱�", ZQ_MAP_ID, nX, nY);
----		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
----	end
--end