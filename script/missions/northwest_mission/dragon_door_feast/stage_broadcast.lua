--�ű����ƣ�������ʱ����ýű�
--�ű����ܣ���������Ϣ���ؿ�����
--���ܲ߻��ˣ��¹���
--���ܿ����ˣ��峤
--���ܲ����ˣ����
--���뿪��ʱ�䣺2007-12-23
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")

Tb_boss_info = 	{"L� Nguy�n Kh�nh","L� Nguy�n Kh�nh",1651,3149,"\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"}

function main()
	if Zgc_pub_week_day() ~= 6 and Zgc_pub_week_day() ~= 5 then
		return
	end
	if SubWorldID2Idx(507) == -1 then
		return
	end
	--�����ؿ���
	for i = 1,getn(Tb_stage7_map_list) do
		local mis_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,Tb_stage7_map_list[i])
		if mis_state == nil or  mis_state == 0 then
			if mf_OpenMission(FEAST_MS_ID,Tb_stage7_map_list[i])	== 1 then									--�����ؿ�
				--boss����
				local boss_index = CreateNpc(Tb_boss_info[1],Tb_boss_info[2],Tb_stage7_map_list[i],Tb_boss_info[3],Tb_boss_info[4])
				SetNpcScript(boss_index,Tb_boss_info[5])
				AddUnitStates(boss_index,7,0)
				ChangeNpcToFight(boss_index,0,6)
				--ϵͳ����
				mf_SetMissionV(FEAST_MS_ID,MS_STATE_ID,1,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_feast_boss_index,boss_index,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,0,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,Ms_feast_step,1,Tb_stage7_map_list[i])
			end
		end
	end
	AddGlobalNews("(Thi�n l� truy�n �m) L� Nguy�n Kh�nh: T�i h� c� m� m�t bu�i ti�c t�i qu�n tr� Long M�n tr�n chi�u ��i v� l�m h�o ki�t ��i T�ng, r�t mong c�c v� ��i hi�p c�m 'Thi�p Long M�n Y�n' ��n tham d�.")
end
