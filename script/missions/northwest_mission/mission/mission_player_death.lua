--�ű����ƣ��������ؿ���������ű�
--�ű����ܣ��������������Ƿ����е���Ҷ�������������򴳹�ʧ��
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-11-09
--�����޸ļ�¼��
Include("\\script\\missions\\northwest_mission\\stage\\stage_time.lua")
function OnDeath()
	--����������ɾ��
		local minor_num = BigGetItemCount(2,0,1041)
		if minor_num  ~=0 then
			BigDelItem(2,0,1041,minor_num)
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().." t� vong, 'Ph� �o �nh' do kh�ng c� linh kh� n�n t� bi�n m�t!\")")
		end
	--����
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	local death_chk_flag = 1
	local player_index_save = PlayerIndex
	for i = 1, getn(player) do
		if player[i] ~= player_index_save then
			PlayerIndex = player[i]
			death_chk_flag = (death_chk_flag * IsPlayerDeath())
		end
	end
	--���ȫ������
	if death_chk_flag == 1 then
		local mission_count = GetMapTaskTemp(nMapID,1)
		WriteLog("[�i T�y B�c]th�ng k� th�t b�i: ID �i	"..GetMissionV(MS_STATE_DIFF_ID)..":"..nMapID..":"..mission_count.."	S� ng��i ch�i	"..GetTeamSize().."	th�i gian tr�i qua	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
		SetMissionV(MS_TIMMER_LOOP_ID,6)
		stage_mission_fail(GetMissionV(MS_STATE_DIFF_ID))
		ClearMapNpc(nMapID)
		--׼���ؿ�����
	end
	PlayerIndex = player_index_save
end

