Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\online\\qianhe_tower\\mission\\6021\\mission.lua")
Include("\\script\\lib\\missionfunctions.lua")

function OnTimer()
	if qht_activity_isopen() ~= 1 then
		EndMission();
	end
	local nStep = mf_GetMissionV(QHT_MISSION_ID[1], 99, QHT_MAP_TABLE[1]);
	mf_SetMissionV(QHT_MISSION_ID[1], 99, mod(nStep + 1, QHT_NPC_REFLASH * 3), QHT_MAP_TABLE[1]);
	--һ��������һ��
	if nStep == 0 then
		local tBuff, tBox, tBoss = qht_random_flash(6021, QHT_RANDOM_POINT_6021);
		
		if not tBuff or not tBox or not tBoss then 
			return 0; 
		end
		--������ǰ��
		for i = 1, 30 do
			mf_SetMissionV(QHT_MISSION_ID[1], i, 0, QHT_MAP_TABLE[1]);
		end
		--��¼buff��
		for i = 1, getn(tBuff) do
			mf_SetMissionV(QHT_MISSION_ID[1], i, tBuff[i], QHT_MAP_TABLE[1]);
		end
		--��¼box��
		for i = 11, getn(tBox) + 10 do
			mf_SetMissionV(QHT_MISSION_ID[1], i, tBox[i - 10], QHT_MAP_TABLE[1]);
		end
		--��¼boss��
		for i = 21, getn(tBoss) + 20 do
			mf_SetMissionV(QHT_MISSION_ID[1], i, tBoss[i - 20], QHT_MAP_TABLE[1]);
		end
	end
	--��̳��
	if nStep + 1 == QHT_NPC_REFLASH then
		--ÿһ���ڿ���30min��ʼˢʱ���֮ǰ����
		for i = 31, 50 do
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[1], i, QHT_MAP_TABLE[1]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
				mf_SetMissionV(QHT_MISSION_ID[1], i, 0, QHT_MAP_TABLE[1]);
			end
		end
		--��ʼˢ����
		create_buff_npc();
	end
	--boss��
	if nStep + 1 == 2 * QHT_NPC_REFLASH then
		--��ʼˢ����
		create_buff_npc();
		create_boss_npc();
	end
	--������
	if nStep + 1 == 3 * QHT_NPC_REFLASH  then
		--��ʼˢ����
		create_buff_npc();
		create_boss_npc();
		create_box_npc();
	end
end


function create_buff_npc()
	for i = 1, 10 do 
		local nRand = mf_GetMissionV(QHT_MISSION_ID[1], i, QHT_MAP_TABLE[1]);
		--�������ֵ
		if nRand > 0 and nRand <= getn(QHT_RANDOM_POINT_6021) then
			--֮ǰ��npc����
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[1], i + 30, QHT_MAP_TABLE[1]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
			end
			--������npc
			local npcIndex = qht_create_buff(QHT_SHENTAN_TABLE_6021,{QHT_RANDOM_POINT_6021[nRand][1], QHT_RANDOM_POINT_6021[nRand][2], QHT_RANDOM_POINT_6021[nRand][3]});
			--��¼npc��ֵ
			mf_SetMissionV(QHT_MISSION_ID[1], i + 30, npcIndex, QHT_MAP_TABLE[1])
		end
	end
end

function create_box_npc()
	for i = 11, 20 do 
		local nRand = mf_GetMissionV(QHT_MISSION_ID[1], i, QHT_MAP_TABLE[1]);
		--�������ֵ
		if nRand > 0 and nRand <= getn(QHT_RANDOM_POINT_6021) then
			--֮ǰ��npc����
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[1], i + 30, QHT_MAP_TABLE[1]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
			end
			--������npc
			local npcIndex = qht_create_box(QHT_BOX_TABLE_6021,{QHT_RANDOM_POINT_6021[nRand][1], QHT_RANDOM_POINT_6021[nRand][2], QHT_RANDOM_POINT_6021[nRand][3]});
			--��¼npc��ֵ
			mf_SetMissionV(QHT_MISSION_ID[1], i + 30, npcIndex, QHT_MAP_TABLE[1])
		end
	end
end

function create_boss_npc()
	for i = 21, 30 do 
		local nRand = mf_GetMissionV(QHT_MISSION_ID[1], i, QHT_MAP_TABLE[1]);
		--�������ֵ
		if nRand > 0 and nRand <= getn(QHT_RANDOM_POINT_6021) then
			--֮ǰ��npc����
			local oldnpcIndex = mf_GetMissionV(QHT_MISSION_ID[1], i + 30, QHT_MAP_TABLE[1]);
			if oldnpcIndex > 0 and qht_npc_name_cmp(GetNpcName(oldnpcIndex)) == 1 then
				SetNpcLifeTime(oldnpcIndex, 0);
			end
			--������npc
			local npcIndex = qht_create_boss(QHT_BOSS_TABLE_6021,{QHT_RANDOM_POINT_6021[nRand][1], QHT_RANDOM_POINT_6021[nRand][2], QHT_RANDOM_POINT_6021[nRand][3]});
			--��¼npc��ֵ
			mf_SetMissionV(QHT_MISSION_ID[1], i + 30, npcIndex, QHT_MAP_TABLE[1])
		end
	end
end