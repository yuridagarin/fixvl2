--�ű����ƣ�̫�����������������������ű�
--�ű����ܣ��������������ű������������������Ʒ����������������
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-03-02
--�����޸ļ�¼��
--========================================��������������==============================
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
taixu_jwl_taskID = 998
kill_liu_date_seq_glb = 508
--=========================================�ű����߼���===============================
function OnDeath(index)
	--ɾ��NPC
	SetNpcLifeTime(index,0)
	--���浱ǰ����
	local PlayerIndex_save = PlayerIndex
	--Ѱ������������
	local team_number = GetTeamSize()
	local get_task_index_table = {}
	local j = 1
	get_task_index_table[1] = 0			--��ʼ��Ϊ0
	SetGlbValue(kill_liu_date_seq_glb,zgc_pub_day_turn(1))
	if team_number == 0 then
		liu_qijin_add()
		return
	else
		for i = 1,team_number do
			PlayerIndex = GetTeamMember(i)									--�޸ĵ�ǰ�������
			if BigGetItemCount(2,1,562) ~= 0 then
				if Zgc_pub_goods_add_chk(1,1) == 1 then
					get_task_index_table[j] = PlayerIndex
					j = j + 1
				end
			end
		end
	end
	--����û���˷�������
	local player_seq = 0
	if get_task_index_table[1] == 0 then
		player_seq = random(1,team_number)
		PlayerIndex = GetTeamMember(player_seq)
		liu_qijin_add()
	else	--���˷������ȡһ��
		player_seq = random(1,j)
		PlayerIndex = get_task_index_table[player_seq]
		liu_qijin_add()
	end
end
function liu_qijin_add()
	local add_flag = AddItem(2,1,563,1)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n nh�n ���c K� Kim c�a th� r�n L�u!")
		Msg2SubWorld("Ch�c m�ng:"..GetName().."Nhi�m v� t�ng c�p trang s�c Th�i H�, n�u gi�t ���c th� r�n L�u s� nh�n ���c K� Kim!")
		SetTask(taixu_jwl_taskID,4)
	else
		WriteLog("Nhi�m v� trang s�c Th�i H�_Ng��i ch�i:"..GetName().."T�ng K� Kim c�a th� r�n L�u th�t b�i, v� tr� th�t b�i:"..add_flag)
	end
end
