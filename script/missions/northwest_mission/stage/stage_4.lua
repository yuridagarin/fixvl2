--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-06
	MS_boss_index = 10
	grass_index_TasktempID = 188		--��Ųݵ�����
	grass_id_state = 0					--��Ÿò�Ŀǰ��״̬��0Ϊ��ʼ״̬��1Ϊʹ�ðγ�״̬
	grass_id_sys_time = 1			--��Ÿò��ϴβ�����ʱ�䣬����һ��������ռ�л���
	grass_kill_num = 1424			--�γ��˶���ҩ�˲�
	Tb_grass_crt_info = {
		{1584,3170,80},
		{1610,3157,80},
		{1588,3233,80},
		{1623,3229,80},
		{1599,3199,80},
	}
function stage4_boss_create()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[4][1][1],Tb_Monster_info[4][1][2],map_id,Tb_Monster_info[4][1][3],Tb_Monster_info[4][1][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,npc_index)
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K�t th�c v��t �i c�n\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian D��c Nh�n Th�o xu�t hi�n\",30,0,2)")
end
--ҩ�˲ݴ���
function stage4_grass_crt()
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"C�c ng��i mu�n di�t D��c Nh�n Th�o c�a ta, ��ng l� m� gi�a ban ng�y!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"D��c Nh�n Th�o �ang t�ng tr��ng m�nh, D��c V��ng h�nh nh� �� h�nh ��ng, c�n nhanh ch�ng ti�u h�y. D��c Nh�n Th�o c�c ��c, n�u b� d�nh v�o th� ph�i c�n th�n.\")")
	local map_id =  SubWorldIdx2ID(SubWorld)
	local palyer_num = GetMissionV(MS_PLAYER_NUM)
	--���������������
	local main_crt_coordinate_seq = random(1,getn(Tb_grass_crt_info))
	for i = 1,getn(Tb_grass_crt_info) do
		local grass_num,grass_index = 0,{}
		if i == main_crt_coordinate_seq then
			grass_num,grass_index = CreateNpc(Tb_Monster_info[4][2][1],Tb_Monster_info[4][2][2],map_id,Tb_grass_crt_info[i][1],Tb_grass_crt_info[i][2],-1,(palyer_num*6),1,Tb_grass_crt_info[i][3])
		else
			grass_num,grass_index = CreateNpc(Tb_Monster_info[4][2][1],Tb_Monster_info[4][2][2],map_id,Tb_grass_crt_info[i][1],Tb_grass_crt_info[i][2],-1,floor(palyer_num*6/4),1,Tb_grass_crt_info[i][3])
		end
		for i = 0,getn(grass_index) do
			SetNpcScript(grass_index[i],Main_Npc_Script_way)
		end
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian ch� t�o D��c Nh�n V��ng\",120,0,2)")
end
--ҩ�˲�ת��ҩ��
function stage4_grass_chg()
	--�Ƿ���Ҫ����ҩ���ж�
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local grass_num = 0
	--ͳ��ҩ������
	for i = 1,getn(npc_total_index) do
		if GetNpcName(npc_total_index[i]) == "D��c Nh�n Th�o"  then
			grass_num = grass_num + 1
			SetNpcLifeTime(npc_total_index[i],0)
		end
	end
	--ˢҩ����
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian tr�ng sinh D��c Nh�n Th�o\",180,0,2)")
	if grass_num > 0 then
		local player_index_total = mf_GetMSPlayerIndex(MS_ID,0,map_id)
		local devil_gress_num = min(stage_devil_restrict(),floor(grass_num * 1.5))
		for i = 1, devil_gress_num do
			PlayerIndex = player_index_total[mod(i,getn(player_index_total))+1]
			local mapID,att_x,att_y = GetWorldPos()
			if map_id == mapID then
				local npc_inex = CreateNpc(Tb_Monster_info[4][3][1],Tb_Monster_info[4][3][2],mapID,att_x,att_y,-1,1,1,30)
				SetNpcScript(npc_inex,Main_Npc_Script_way)
			end
		end
		local boss_index = GetMissionV(MS_boss_index)
		NpcChat(boss_index,"Ch� c� D��c Nh�n m�i c� m�nh ��ng da s�t!")
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"D��c V��ng ch� D��c Nh�n Th�o th�nh D��c Nh�n V��ng, uy l�c kh�ng y�u! Nhanh ti�u di�t �i!\")")
	end
end
--boss�������ú���������
function stage4_boss_death()
	--�������ں���
	--����Ϣ
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti�u di�t 'D��c V��ng', ��i ng� v��t �i th�nh c�ng!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T�i"..GetName().."Chi�n ��u gian kh�, cu�i c�ng ��nh b�i 'D��c V��ng', v��t �i th�nh c�ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	--��ҩ��������0
	Zgc_pub_mission_fun(MS_ID,"SetTask("..grass_kill_num..",0)")
	--ɾ��buff
	Zgc_pub_mission_fun(MS_ID,"RemoveState(19801223)")
	--ɾ���ƺ�
	for i = 21,25 do
		Zgc_pub_mission_fun(MS_ID,"RemoveTitle(60,"..i..")")
	end
	--׼���ؿ�����
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[�i T�y B�c] th�ng k� qua �i: ID �i	"..stage_seq..":"..nMapID..":"..mission_count.."	Th�i gian qua �i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(4)
end
	--ҩ�������ű�
function stage4_devil_death()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local devil_num = 0 
	for i = 1,getn(npc_total_index) do
		if GetNpcName(npc_total_index[i]) == "D��c Nh�n" and IsNpcDeath(npc_total_index[i]) ~= 1  then
			devil_num = devil_num + 1
		end
	end 
	if devil_num > 1 then
		return
	end
	--ɾ��buff
	Zgc_pub_mission_fun(MS_ID,"RemoveState(19801223)")
	--��ҩ��������0
	Zgc_pub_mission_fun(MS_ID,"SetTask("..grass_kill_num..",0)")
	--ɾ���ƺ�
	for i = 21,25 do
		Zgc_pub_mission_fun(MS_ID,"RemoveTitle(60,"..i..")")
	end
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"�� h�y to�n b� 'D��c Nh�n V��ng' do D��c V��ng t�o ra, ��c c�a D��c Nh�n Th�o �� gi�i!\")")
end
	--ҩ�˲ݶԻ�����
function stage4_grass_dia()
	--�������Ļ�ȡ�ͼ��
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	if GetNpcName(npc_index) ~= "D��c Nh�n Th�o" then
		return
	end
	--ռ���жϺ�����
	if GetUnitCurStates(npc_index,grass_id_state) == 1 and (GetTime() - GetUnitCurStates(npc_index,grass_id_sys_time)) <= 10 then
		Talk(1,"","<color=green>Nh�c nh�<color>: ��ng ��i �� d�n <color=yellow>D��c Nh�n Th�o<color> n�y, "..Zgc_pub_sex_name().."Sao kh�ng ��i c�y kh�c!")
		return
	end
	SetTaskTemp(grass_index_TasktempID,npc_index)
	SetUnitCurStates(npc_index,grass_id_state,1)
	SetUnitCurStates(npc_index,grass_id_sys_time,GetTime())
	DoWait(11,12,10)
end
