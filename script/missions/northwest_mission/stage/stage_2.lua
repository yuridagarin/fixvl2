--�ű����ƣ��������ؿ��ڶ���
--�ű����ܣ��ؿ�����Ҫ�߼�
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-06
	--msID����
	MS_boss_index = 10				--boss�������ID
	MS_pillar_index_east = 11		--����boss����
	MS_pillar_index_south = 12		--�Ͻ�boss����
	MS_pillar_index_west = 13		--����boss����
	MS_pillar_index_north = 14		--����boss����
	MS_boss_buff_state = 15			--��ǰboss����ħ��״̬���
	MS_player_buff_state = 16		--��ǰ��Ҹ���ħ��״̬���
	--��������
	Devil_num_per_palyer = 1			--ÿ����Ҷ�Ӧ��ˢ��С�ֵ�����
	Tb_pillar_buff_info = {				--buff���
	---------------------------------------------����boss������--------------------------------------------
	--����buff�����Զ����-��Ӧ��������-
		{--�������	
			{	--ħ��buff�����������
				{"state_i_defence_point_add",6000,5400,0,19801228},
				{"state_o_defence_point_add",6000,5400,0,19801229},
				{"state_receive_half_damage",100,5400,0,19801250},
			},
			"Ph� ph�ng Tr�n m� tr�","T�ng ph�ng th�",
		},	
		{--�������
			{
				{"state_p_attack_point_add",6000,5400,0,19801230},
				{"state_m_attack_point_add",6000,5400,0,19801231},
			},
			"Gi�ng c�ng Tr�n m� tr�","T�ng t�n c�ng",
		},	
		{--�������      
			{
				{"state_i_defence_point_add",4200,5400,0,19801232},
				{"state_o_defence_point_add",4200,5400,0,19801233},
				{"state_p_attack_point_add",4200,5400,0,19801234},
				{"state_m_attack_point_add",4200,5400,0,19801235},
			},
			"H� nh��c Tr�n m� tr�","T�ng c�ng th�",
		},	       
		{--�ƶ��ٶ����       
			{
				{"state_move_speed_percent_add",250,5400,0,19801236},
			},
			"Gi�m t�c Tr�n m� tr�","T�ng di chuy�n",
		},	  
		{--�������   
			{
				{"state_perfect_dodge_rate",10000,5400,0,19801237},
			},
			"��n th�n Tr�n m� tr�","T�ng n� tr�nh",
		},	          
		{--������Ѫ 
			{
				{"state_life_percent_per10s_anytime",2,5400,0,19801238},
			},
			"�o�n huy�t Tr�n m� tr�","Duy tr� h�i m�u",
		},
	--------------------------------------------------��Ϊ����к���-------------------------------------------
		{--������Ѫ
			{
				{"state_lost_p_life_per18",2,5400,0,19801239},
			},
			"H�i m�nh Tr�n m� tr�",
			"Duy tr� m�t m�u",
			{60,11},
		},		
		{--��������
			{
				{"state_lost_p_mana_per18",2,5400,0,19801240},
			},
			"H�i n�i Tr�n m� tr�","Duy tr� m�t n�i l�c",
			{60,12},
		},
		{--�����½�
			{
				{"state_p_attack_percent_dec",70,5400,0,19801241},
				{"state_m_attack_percent_dec",70,5400,0,19801242},
			},
			"C��ng c�ng Tr�n m� tr�","Gi�m t�n c�ng",
			{60,13},
		},
		{--�����½�
			{
				{"state_neili_defence_point_dec",400,5400,0,19801243},
				{"state_physical_def_point_dec",400,5400,0,19801244},
				{"state_physical_parmor_per_dec",40,5400,0,19801243},
				{"state_magic_parmor_per_dec",40,5400,0,19801244},
			},
			"Ng� th� Tr�n m� tr�","Gi�m ph�ng th�",
			{60,14},
		},
		{--�����½�
			{
				{"state_p_attack_percent_dec",56,5400,0,19801245},
				{"state_m_attack_percent_dec",56,5400,0,19801246},
				{"state_neili_defence_point_dec",320,5400,0,19801247},
				{"state_physical_def_point_dec",320,5400,0,19801248},
				{"state_physical_parmor_per_dec",32,5400,0,19801251},
				{"state_magic_parmor_per_dec",32,5400,0,19801252},
			},
			"C��ng l�c Tr�n m� tr�","Gi�m c�ng th�",
			{60,15},
		},
		{--�ƶ��ٶ��½�
			{
				{"state_slow",70,5400,0,19801249},
			},
			"�� t�c Tr�n m� tr�","Gi�m t�c",
			{60,16},
		}	
	}
	--buffѡȡ���� boss/player
	Tb_buff_sel_odds = {{25,50,70,75,80,100},{10,20,45,70,95,100}}
	--С�ִ�����������
	monster_crt_ran_att_num = 50
--boss��������
function stage2_boss_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local boss_index = CreateNpc(Tb_Monster_info[2][5][1],Tb_Monster_info[2][5][2],nMapID,Tb_Monster_info[2][5][3],Tb_Monster_info[2][5][4])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,boss_index)
	--ʱ�����������
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K�t th�c v��t �i c�n\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian kh�i ��ng c� quan\",30,0,2)")
	--Zgc_pub_mission_starttimeguage(MS_ID,"���ؽ���ʣ��ʱ��",1830,0,1)
	--Zgc_pub_mission_starttimeguage(MS_ID,"��Ĺ������ʱ��",180,30,2)
end
--��Ĺ����������
function pillar_create()
	--����С�ּ���ѽ
	pillar_life_chk()
	--���ԭ������
	for i = MS_pillar_index_east,MS_pillar_index_north do
		local npc_index = GetMissionV(i)
		if npc_index ~= 0 then
			SetNpcLifeTime(npc_index,0)
		end
	end
	--�����һ�ֵ�����
	local buff_sel = stage2_buff_ran_sel()
	SetMissionV(MS_boss_buff_state,buff_sel[1])		--boss����buff
	SetMissionV(MS_player_buff_state,buff_sel[3])		--���buff
	local pillar_crt_seq = {}		--���Ӵ���˳��
	--boss buff����
	local boss_index = GetMissionV(MS_boss_index)
	for i = 1,getn(Tb_pillar_buff_info[buff_sel[1]][1]) do
		CastState2Npc(boss_index,Tb_pillar_buff_info[buff_sel[1]][1][i][1],Tb_pillar_buff_info[buff_sel[1]][1][i][2],Tb_pillar_buff_info[buff_sel[1]][1][i][3],Tb_pillar_buff_info[buff_sel[1]][1][i][4],Tb_pillar_buff_info[buff_sel[1]][1][i][5])
	end
	--���buff����
	local player = mf_GetMSPlayerIndex(MS_ID,0)
	local player_num = getn(player)
	if player_num <= 0 then
		return
	end
	for i = 1, player_num do
		PlayerIndex = player[i]
		for j = 1,getn(Tb_pillar_buff_info[buff_sel[3]][1]) do
			CastState(Tb_pillar_buff_info[buff_sel[3]][1][j][1],Tb_pillar_buff_info[buff_sel[3]][1][j][2],Tb_pillar_buff_info[buff_sel[3]][1][j][3],Tb_pillar_buff_info[buff_sel[3]][1][j][4],Tb_pillar_buff_info[buff_sel[3]][1][j][5])
		end
		for i = 11,16 do
			RemoveTitle(60,i)
		end
		AddTitle(Tb_pillar_buff_info[buff_sel[3]][4][1],Tb_pillar_buff_info[buff_sel[3]][4][2])
		SetCurTitle(Tb_pillar_buff_info[buff_sel[3]][4][1],Tb_pillar_buff_info[buff_sel[3]][4][2])
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr�n M� Th�"..Tb_pillar_buff_info[buff_sel[1]][3].."\",300,0,2)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"T�"..Tb_pillar_buff_info[buff_sel[3]][3].."\",300,0,3)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Th�i gian kh�i ��ng l�i c� quan\",300,0,4)")
	--Zgc_pub_mission_starttimeguage(MS_ID,"��Ĺ��"..Tb_pillar_buff_info[buff_sel[1]][3],300,0,2)
	--Zgc_pub_mission_starttimeguage(MS_ID,"����"..Tb_pillar_buff_info[buff_sel[3]][3],300,0,3)
	--Zgc_pub_mission_starttimeguage(MS_ID,"���´���ʣ��ʱ��",300,0,4)
	--��ҳƺŴ���
	--����λ�����
	local chg_seq_tem = 0
	for i = 4,1,-1 do
		chg_seq_tem = random(1,i)
		pillar_crt_seq[i] = buff_sel[chg_seq_tem]
		buff_sel[chg_seq_tem] =  buff_sel[i]
	end
	--���Ӵ���
	local pillar_index = 0
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = 1,4 do
		pillar_index = CreateNpc(Tb_Monster_info[2][i][1],Tb_pillar_buff_info[pillar_crt_seq[i]][2],nMapID,Tb_Monster_info[2][i][3],Tb_Monster_info[2][i][4])
		SetNpcScript(pillar_index,Main_Npc_Script_way)
		SetMissionV((MS_pillar_index_east-1+i),pillar_index)
	end
end
--С�ִ�������
function pillar_life_chk()
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = MS_pillar_index_east,MS_pillar_index_north do
		local pillar_index = GetMissionV(i)
		if pillar_index ~= 0 then
			local pillar_life_max,pillar_life_now = GetUnitCurStates(pillar_index,1)
			local pillar_life_cent = (pillar_life_now/pillar_life_max)
			if pillar_life_cent > 0 and pillar_life_cent < 0.8 then
				local devil_crt_num = min((GetMissionV(MS_PLAYER_NUM)*Devil_num_per_palyer),stage_devil_restrict())
				if devil_crt_num > 1 then
					local devil_num,devil_index = CreateNpc("Th�ng l�nh Th� Tr�","Th�ng l�nh Th� Tr�",nMapID,(Tb_Monster_info[2][i-10][3]+random(-2,2)),(Tb_Monster_info[2][i-10][4]+random(-2,2)),-1,devil_crt_num,1,monster_crt_ran_att_num)
					for i = 0 ,getn(devil_index) do
						SetNpcScript(devil_index[i],Main_Npc_Script_way)
					end
				end
			end
		end
	end
end
--buffѡ����㺯��
function stage2_buff_ran_sel()
	local table_rtn = {}
	--ѡȡ����
	for i = 0,1 do
		local table_temp = {(1+(6*i)),(2+(6*i)),(3+(6*i)),(4+(6*i)),(5+(6*i)),(6+(6*i))}
		--ѡȡ����
		local buff_sel_ran_num = random(1,100)			--ȡ�����
		local num_sel = 0		--�����
		for j = 1,getn(Tb_buff_sel_odds[i+1]) do
			if buff_sel_ran_num <= Tb_buff_sel_odds[i+1][j] then
				num_sel = j
				break
			end
		end
			--��һ��д��
		tinsert(table_rtn,table_temp[num_sel])
			--������д��ڶ���
		table_temp[num_sel] = table_temp[6] 
		num_sel = random(1,5)
		tinsert(table_rtn,table_temp[num_sel])
	end
	return table_rtn
end
-------------------------------------NPC��������-------------------------------
--bossɱ����׼���˳�
function stage2_boss_death()
	--�������ں���
	--����Ϣ
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti�u di�t 'Tr�n M� Th�' th�nh c�ng, ��i ng� v��t �i th�nh c�ng!\")")
	--Zgc_pub_mission_team_msg("����Ĺ�ޡ����ɹ���ɱ�����ؿ�ͨ�أ�")
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T�i"..GetName().."Chi�n ��u gian kh�, cu�i c�ng ��nh b�i 'Tr�n M� Th�', v��t �i th�nh c�ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	--���buff���
	local player_buff_seq = GetMissionV(MS_player_buff_state)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = 1,getn(player) do
		PlayerIndex = player[i]
			--���buff����
			for j = 19801239,19801252 do
				RemoveState(j)
			end
			--��ҳƺŴ���
			for i = 11,16 do
				RemoveTitle(60,i)
			end
	end
	--׼���ؿ�����
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[�i T�y B�c] th�ng k� qua �i: ID �i	"..stage_seq..":"..nMapID..":"..mission_count.."	Th�i gian qua �i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)	
	--stage_mission_fail(2)
end
--���ӱ�ɱ��
function stage2_pillar_death(pillar_seq,pillar_index)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = MS_pillar_index_east,MS_pillar_index_north do
		if GetMissionV(i) == pillar_index then
			SetMissionV(i,0)
			break
		end
	end
	if GetMissionV(MS_boss_buff_state) == pillar_seq then
		local boss_index = GetMissionV(MS_boss_index)
		for i = 1,getn(Tb_pillar_buff_info[pillar_seq][1]) do
			RemoveStateFromNpc(boss_index,Tb_pillar_buff_info[pillar_seq][1][i][5])
		end
		for i = 1,getn(player) do
			PlayerIndex = player[i]
			StopTimeGuage(2)
			Msg2Player(Tb_pillar_buff_info[pillar_seq][2].."B� ph�, s�c m�nh "..Tb_pillar_buff_info[pillar_seq][3].." c�a Tr�n M� Th� �� b� h�a gi�i!")
		end
	elseif GetMissionV(MS_player_buff_state) == pillar_seq then
		for i = 1,getn(player) do
			PlayerIndex = player[i]
			for j = 1,getn(Tb_pillar_buff_info[pillar_seq][1]) do
				RemoveState(Tb_pillar_buff_info[pillar_seq][1][j][5])
			end
			Msg2Player(Tb_pillar_buff_info[pillar_seq][2].."B� ph�, b�n �� h�a gi�i "..Tb_pillar_buff_info[pillar_seq][3].." s�c m�nh!")
			RemoveTitle(Tb_pillar_buff_info[pillar_seq][4][1],Tb_pillar_buff_info[pillar_seq][4][2])
			StopTimeGuage(3)
		end
	end
	SetNpcLifeTime(pillar_index,0)
end
