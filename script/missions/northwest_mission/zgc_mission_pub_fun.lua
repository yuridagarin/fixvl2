--�ű����ƣ�mission������������
--�ű����ܣ���mission���õĺ�������Ϊ��������������ʹ��
--�߻��ˣ��峤
--���뿪���ˣ��峤
--���뿪����¼��2008-08-06
--�����޸ļ�¼��
--��ע���Ҵ��ڣ�����˧��
--�������ƣ��ؿ������⺯��
--�������ܣ�ͨ����������������ؿ��ı��������Ƿ��������
function Zgc_pub_mission_team_chk(captain_flag,member_min,memeber_max,npc_name)
	--�����Ա�������
	local team_member = GetTeamSize()
	if team_member < member_min or team_member > memeber_max then
		Talk(1,"",npc_name.."S� l��ng ng��i ch�i quy ��nh: <color=yellow>"..member_min.."<color> ��n <color=yellow>"..memeber_max.."<color> ng��i!")
		return 0
	end
	--�ӳ����
	if captain_flag == 1 and GetTeamMember(0) ~= PlayerIndex then
		Talk(1,"",npc_name.."�i n�y ph�i do <color=yellow>��i tr��ng<color> ho�n th�nh!")
		return 0
	end
	return 1
end

--�������ƣ������Աְҵ���
--�������ܣ��жϸö������Ƿ����ظ���ְҵ
function Zgc_pub_mission_route_chk(npc_name)
	local tb_player_route = {}
	local player_route = 0
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route = GetPlayerRoute()
		if getn(tb_player_route) ~= 0 then
			for i = 1,getn(tb_player_route) do
				if player_route == tb_player_route[i] then
					PlayerIndex = player_index_save
					Talk(1,"",npc_name.."�i n�y <color=yellow>kh�ng cho ph�p<color> ng��i trong t� ��i th�c hi�n l�i!")
					return 0
				end
			end
		end
		tinsert(tb_player_route,player_route)
	end
	PlayerIndex = player_index_save
	return 1
end

--�������ƣ�������Ϣ
--�������ܣ���һ����������г�Ա������Ϣ
function Zgc_pub_mission_team_msg(msg_content)
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Msg2Player(msg_content)
	end
	PlayerIndex = player_index_save
	return
end

--�������ƣ��޸�npcѪ��
--�������ܣ����ٷֱȻ���ֵ�޸�bossѪ��
function Zgc_pub_mission_boss_life_chg(boss_index,chg_flag,chg_num)
	--chg_flagΪ0��ʾ����ֵ��chg_flagΪ1��ʾ���ٷֱ�
	--�������ֵΪ1��ʾ����ִ�У��������ֵΪ-1���ʾboss��Ѫ����
	--���boss��Ѫ��
	local max_life_num,life_num = GetUnitCurStates(boss_index,1)
	if chg_flag == 0 then
		life_num = (life_num + chg_num)
	else
		life_num = floor(life_num + (max_life_num * (chg_num/100)))
	end
	--��������������ֵ������Ϊ�������ֵ
	if life_num > max_life_num then
		life_num = max_life_num
	end
	if life_num <= 0 then
		--SetNpcLifeTime(boss_index,0)
		return -1
	else
		ModifyNpcData(boss_index,0,life_num,0)
		return 1
	end
end

--�������ƣ�mission��Ϣ
--�������ܣ�������mission����ҷ���Ϣ
function Zgc_pub_mission_message(MS_ID,msg_content)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		Msg2Player(msg_content)
	end
end
--�������ƣ�missionͳһִ�к���
--�������ܣ�����mission���������ִ�д���ĺ���
function Zgc_pub_mission_fun(MS_ID,deal_order)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	local player_index_save = PlayerIndex
		for i = 1, getn(player) do
		PlayerIndex = player[i]
		dostring(deal_order)
	end
	PlayerIndex = player_index_save
end
--�������ƣ��������г�Ա�Ƿ���ͳһ��ͼ�ж�
--�������ܣ��жϸĶ�������г�Ա�Ƿ���ͬһ��ͼ������Ƿ���1���򷵻�0
function Zgc_pub_missio_same_map_chk()
	local map_ID = GetWorldPos()
	local player_index_save = PlayerIndex
	local chk_flag = 1
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local map_ID_temp = GetWorldPos()
		if map_ID ~= map_ID_temp then
			chk_flag = 0
			break
		end
	end
	PlayerIndex = player_index_save
	return chk_flag
end
--�������ƣ�mission���г�Ա����ʱ�������
--�������ܣ�����ʱ���������Ҫ����Ϣ����󽫸�misssion���г�Ա������ʱ�������
function Zgc_pub_mission_starttimeguage(MS_ID,timeguage_content,second_num,repeat_flag,timeguage_id)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		StopTimeGuage(timeguage_id)
		StartTimeGuage(timeguage_content,second_num,repeat_flag,timeguage_id)
	end
end
--�������ƣ�mission���г�Ա�ر�ʱ�������
--�������ܣ��رն�ӦID��ʱ�������������ر�ID
function Zgc_pub_mission_stoptimeguage(timeguage_id)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		StopTimeGuage(timeguage_id)		
	end
end
