--�ű����ƣ�������ͷ�ļ�
--�ű����ܣ������繫��������ϵͳ��������
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--��������ˣ����
--���뿪��ʱ�䣺2007-12-23
--�����޸ļ�¼��
--missionID����
FEAST_MS_ID = 43
--msֵ����
MS_STATE_ID = 1						--mission״̬�Ĵ洢id
MS_PLAYER_NUM = 2					--��Ž�����ҵ�����
MS_TIMMER_LOOP_ID = 3			--��ʱ�����������λ��

feast_time_loop_num = 3660		--�ؿ���ʱ�䣺һ��Сʱ��30��
feast_devil_kill_loop_num = 60
feast_prize_get_num = 30
--ʱ�����������
feast_timeguage_num = 2

MS_feast_timmer_deputy_loop_ID = 11	--��ḱ����ID
MS_feast_boss_index = 12			--boss����
--MS_feast_boss_life_num = 13	--Ѫ��
Ms_feast_step = 13						--�ؿ������
Ms_feast_deputy_step = 14			--�ؿ�С����
Ms_feast_forstep_time = 15			--ǰһ�׶ε�k npc��ʼʱ��
Ms_feast_waste_sec_num = 16 	--ǰһ�׶�K npc ���ĵ�����
Ms_feast_devil_kill_num = 17		--ɱ��С�ֵ�����

--�ؿ����ʱ����Ϣ������-����ʱ�䣨22��-22��10�֣�
Tb_stage7_sign_time = {6,79200,82860}
	--�ؿ�������Ҫ���������(taskID,ֵ)
Tb_stage7_sign_task_info = {2031,71} 
--�����������������
Stage7_player_num_max = 50
--�ؿ���ͼ�б�
Tb_stage7_map_list = {1106,1107}--,1108,1109,1110}
Stage7_date_seq = 1412
Stage7_map_id = 1413
TaskID_feast_prize_step = 1414
--ʱ�����������
Timeguge_num = 2
--��¼������ID
Login_trigger_ID = 1111
Trigger_save_ID = 905
--ͨ�ؽ���(�շѣ�1����ѣ�2)
Sever_diff = 2			--���������֣�1Ϊ�շѣ�2Ϊ���
Timmer_ID = 72												--��ʱ��ID
Frame_per_second = 18								--������ÿ��֡��=18
Timer_interval = 1 * Frame_per_second		--���õ�����
feast_time_loop_num = 3660						--�ؿ���ʱ�䣺һ��Сʱ��30��
feast_boss_life_chk_start_sec = 3060			--�ؿ�����ʱ��
feast_boss_life_chk_end_sec = 60				--�ؿ�����ʱ��
Tb_time_bar_info_main = {
	{feast_time_loop_num,feast_boss_life_chk_start_sec,"Th�i gian b�t ��u d� y�n c�n "},
	{feast_boss_life_chk_start_sec,feast_boss_life_chk_end_sec,"Th�i gian k�t th�c d� y�n c�n "},
	{feast_boss_life_chk_end_sec,"Th�i gian k�t th�c d� y�n c�n "},
}
Tb_time_bar_info_denputy = {
	{"Th�i gian ��nh b�i h� v� c�n ",feast_devil_kill_loop_num},
	{"Th�i gian ti�p t�c t� v� c�n ",feast_prize_get_num},
	{"Th�i gian nh�n th��ng c�n ",feast_prize_get_num},
}

function OnLogin()
	--״̬�ָ�
	RemoveTrigger(GetTrigger(Trigger_save_ID))
	for i =1,Timeguge_num do
		StopTimeGuage(i)
	end
	--��Ҵ���
	NewWorld(507,1654,3297)
	--״̬����
	local mission_diff = GetTask(Task_ID_stage_diff)
	LeaveTeam()
	InteractiveEnable(1)
	SetFightState(1)
	ForbidChangePK(0)		--��ֹת��PK״̬
	SetPKFlag(0,0)			--PK״̬	
	SetCreateTeam(0)
	UseScrollEnable(1)		--��ֹʹ�ûسǷ�
	ForbitTrade(0)			--��ֹ����
	StallEnable(1)				--��ֹ��̯
	SetDeathPunish(1)		--�������ͷ�
	OpenFriendliness(1)	--���Ӻøж�	
	if IsPlayerDeath() == 1 then
		RevivePlayer(0)
	end
	RestoreAll()		--ȫ���ظ�
end

