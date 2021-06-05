--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-06
	MS_boss_index = 10
	MS_bougie_index_noutheast = 11
	MS_bougie_index_southeast = 12
	MS_bougie_index_southwest = 13
	MS_bougie_index_northwest = 14
	--����λ����̨״̬��0���������� 1��Ϊ��������δ����Сboss 2��Ϊ����������Сboss���
	Ms_candler_state_noutheast = 15
	Ms_candler_state_southeast = 16
	Ms_candler_state_southwest = 17
	Ms_candler_state_northwest = 18
	--��������̨�������λ�á�
	Ms_candler_index_noutheast = 19
	Ms_candler_index_southeast = 20
	Ms_candler_index_southwest = 21
	Ms_candler_index_northwest = 22
	--ɱ���ĸ���λ��Сboss������
	Ms_Devilgen_Killed_num ={ 23,24,25,26}
	Tb_Bougie_info = {}
	Tb_Bougie_info[1038] = {"��n c�y l�n","Mang n�n v� ng�n �u�c (��i)"}		--������
	Tb_Bougie_info[1039] = {"��n c�y v�a","Mang n�n v� ng�n �u�c (trung)"}		--������
	Tb_Bougie_info[1040] = {"��n c�y nh�","Mang n�n v� ng�n �u�c (ti�u)"}		--С����
		--������Ѫ���ܣ�
	Tb_Bougie_buff = {"state_lost_life_per18_monster",200,31860,0,19801250}
		--����ȼ����ЧID
	Bougie_burning_SFX_id = 954
		--����λ�õ�����Ϩ���BOSS��Ӱ��
	Tb_Boss_buff_info_3 = {
		{--�������
			{
				{"state_p_attack_point_add",2000,31860,0,19801252},
				{"state_m_attack_point_add",2000,31860,0,19801253},
			},
			"T�ng t�n c�ng","Gi�m t�n c�ng",
		},	
		{--������Ѫ 
			{
				{"state_life_percent_per10s_anytime",2,31860,0,19801251},
			},
			"Duy tr� h�i m�u","Ng�ng h�i m�u",
		},
		{--�������	
			{	--ħ��buff�����������
				{"state_i_defence_point_add",2000,31860,0,19801254},
				{"state_o_defence_point_add",2000,31860,0,19801255},
			},
			"T�ng ph�ng th�","Gi�m ph�ng th�",
		},	
		{--�ƶ��ٶ����       
			{
				{"state_move_speed_percent_add",200,31860,0,19801256},
			},
			"T�ng di chuy�n","Gi�m di chuy�n",
		},	  
	}

	--�ؿ���ʼ֮ǰ���������˵�����
function stage_3_bougie_del()
	for i = 1038,1040 do
			Zgc_pub_mission_fun(MS_ID,"BigDelItem(2,0,"..i..",BigGetItemCount(2,0,"..i.."))")
	end
end
	--�ؿ���ʼ����
function stage3_boss_create()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[3][5][1],Tb_Monster_info[3][5][2],map_id,Tb_Monster_info[3][5][3],Tb_Monster_info[3][5][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,npc_index)
	for i = 1,4 do
		public_bougie_crt(i)
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K�t th�c v��t �i c�n\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Qu� Phong xu�t hi�n c�n\",60,0,2)")
end
--boss���缼��ʹ��
function stage3_boss_wind_skill()
	local boss_index = GetMissionV(MS_boss_index)
	local bougie_alive_num = 0
	for i = MS_bougie_index_noutheast,MS_bougie_index_northwest do
		bougie_alive_num = bougie_alive_num + GetMissionV(i)
	end
	if bougie_alive_num == 0 then		--�����������Ϩ��ֱ�Ӵ���С��
		NpcChat(boss_index,"Ch� c� b�ng t�i m�i c� th� gi�p nh� vua y�n gi�c!")
		stage3_devilkin_crt()
		return
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Qu� Phong xu�t hi�n c�n\",60,0,2)")
	NpcChat(boss_index,"Th�t to gan, d�m th�p �nh s�ng loe lo�t!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Qu� Phong bi�n m�t, b�n h��ng chuy�n ��ng, Qu� T��ng Qu�n g�i ra Qu� Phong, n�n b�ng ph�t ch�y!\")")
	for i = Ms_candler_state_noutheast,Ms_candler_state_northwest do
		if GetMissionV(i) == 0 then
			local ran_num = random(-20,-10)
			local buogie_index = GetMissionV(i-4)
			if buogie_index ~= 0 then
				if Zgc_pub_mission_boss_life_chg(buogie_index,1,ran_num) == -1 then			--���򱻷紵���ˡ�
					--��̨��ʧ
					SetNpcLifeTime(buogie_index,0)
					SetMissionV((i-4),0)
					SetMissionV(i,1)
					--˵��
				else		--û�б��紵��
					--˵��
				end
			end
		end
	end
	bougie_alive_chk()
end
--��������/+buff
function bougie_alive_chk()
	local map_id =  SubWorldIdx2ID(SubWorld)
	for i = 	Ms_candler_state_noutheast,Ms_candler_state_northwest do
		local buogie_index = GetMissionV(i-4)
		if buogie_index ~= 0 then
			local max_life_num,life_num = GetUnitCurStates(buogie_index,1)
			if life_num < 10 then
				SetNpcLifeTime(buogie_index,0)
				SetMissionV((i-4),0)
				SetMissionV(i,1)
			end
		end
		if GetMissionV(i) == 1 then
		 	--�������������̨
			local candler_index = CreateNpc(Tb_Monster_info[3][i-14][6],Tb_Monster_info[3][i-14][2],map_id,Tb_Monster_info[3][i-14][3],Tb_Monster_info[3][i-14][4])
			SetNpcScript(candler_index,Main_Npc_Script_way)
			SetMissionV((i + 4),candler_index)
			--����Сboss
			local devil_num,devil_index = CreateNpc(Tb_Monster_info[3][i-14][7],Tb_Monster_info[3][i-14][8],map_id,Tb_Monster_info[3][i-14][3],Tb_Monster_info[3][i-14][4],-1,(GetMissionV(MS_PLAYER_NUM)*2),1,50)
			for j = 0 ,getn(devil_index) do
				SetNpcScript(devil_index[j],Main_Npc_Script_way)
			end
			SetMissionV(i,2)
			--boss+buff
			local boss_index = GetMissionV(MS_boss_index)
			for j = 1,getn(Tb_Boss_buff_info_3[i-14][1]) do
				CastState2Npc(boss_index,Tb_Boss_buff_info_3[i-14][1][j][1],Tb_Boss_buff_info_3[i-14][1][j][2],Tb_Boss_buff_info_3[i-14][1][j][3],Tb_Boss_buff_info_3[i-14][1][j][4],Tb_Boss_buff_info_3[i-14][1][j][5])
			end
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..Tb_Monster_info[3] [i-14][2].."Ch�y t�n, Qu� T��ng Qu�n n�i gi�n uy l�c gia t�ng ("..Tb_Boss_buff_info_3[i-14][2].."), mau th�p �u�c l�n!! Tr�n M� T��ng Qu�n h�nh nh� c� n�n!\")")
		end
	end
	stage3_devilkin_crt()
end
--С�ִ������
function stage3_devilkin_crt()
	local crt_flag = 0
	--��ȡboss������Ϣ
	local map_id,att_x,att_y= GetNpcWorldPos(GetMissionV(MS_boss_index))
	local nMapID = SubWorldIdx2ID()
	if map_id ~= nMapID then
		return
	end
	for i = Ms_candler_state_noutheast,Ms_candler_state_northwest do
		if GetMissionV(i) ~= 0 then
			crt_flag = 1
			local devilkin_num = min(GetMissionV(MS_PLAYER_NUM) ,stage_devil_restrict())
			if devilkin_num < 2 then
				return
			end
			local suc_crt_num,devilkin_index = CreateNpc(Tb_Monster_info[3][i-14][10],Tb_Monster_info[3][i-14][11],map_id,att_x,att_y,-1,devilkin_num,1,50)
			for j = 0,getn(devilkin_index) do
				SetNpcScript(devilkin_index[j],Main_Npc_Script_way)
			end
		end
	end
	--�����С�ִ�����boss����
	if crt_flag == 1 then
		NpcChat(GetMissionV(MS_boss_index),"To gan! Ta s� tr�ng tr� th�ch ��ng nh�ng k� ngang nhi�n x�m ph�m!")
	end
end
--���������ű�
function stage3_boss_death()
	--�������ں���
	--����Ϣ
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti�u di�t 'Qu� T��ng Qu�n' th�nh c�ng, ��i ng� v��t �i th�nh c�ng!\")")

	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T�i"..GetName().."Chi�n ��u gian kh�, cu�i c�ng ��nh b�i 'Qu� T��ng Qu�n', v��t �i th�nh c�ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--�������
	stage_3_bougie_del()
	--׼���ؿ�����
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[�i T�y B�c] th�ng k� qua �i: ID �i	"..stage_seq..":"..nMapID..":"..mission_count.."	Th�i gian qua �i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(3)
end
--Сboss�����ű�
function devil_Gen_death(gen_seq)
	--������
	local killed_num = (GetMissionV(Ms_Devilgen_Killed_num[gen_seq]) + 1)
	SetMissionV(Ms_Devilgen_Killed_num[gen_seq],killed_num)
	--���ɱ���������Ա���������������������
	if mod(killed_num,(GetMissionV(MS_PLAYER_NUM)*2)) == 0 then
		local ran_num = random(1,100)
		for i = 1,getn(Tb_Monster_info[3][gen_seq][9]) do
			if ran_num <= Tb_Monster_info[3][gen_seq][9][i] then
				AddItem(2,0,(1037+i),1)
				Msg2Player("Nh�n ���c 1 "..Tb_Bougie_info[1037+i][1]..", b�n c� th� ��i tho�i v�i ng�n �u�c �� ��t n�n.")
				break
			end
		end
	end
end
--��̨�����ű�
function player_kill_candler(bougie_seq)
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().." t�n c�ng d�n ��n "..Tb_Monster_info[3][bougie_seq][2].." b� t�t n�n!\")")
	local buogie_index = GetMissionV(bougie_seq+10)
	SetNpcLifeTime(buogie_index,0)
	SetMissionV((bougie_seq+10),0)
	SetMissionV((bougie_seq+14),1)
	bougie_alive_chk()
end
--NPC�Ի��ű�
--NPC�Ի�����ͳһ����
function stage3_bougie_use(bougie_seq)
	--�Ƿ�������ļ��
	local bougie_chk_flag = 0
	for i = 1038,1040 do
		if GetItemCount(2,0,i) ~= 0 then
			bougie_chk_flag = 1
			break
		end
	end	
	if bougie_chk_flag == 0 then
		return
	end
	--�Ի�չ��
	Say("<color=green>Nh�c nh�<color> B�n mu�n d�ng n�n th�p ng�n �u�c n�y kh�ng?",
	2,
	"��ng �/#bougie_use_dtm("..bougie_seq..")",
	"Tho�t/end_dialog"
	)
end
--ȷ��ʹ������
function bougie_use_dtm(bougie_seq)
	--����ѡ��ȷ��
	local tb_dilog = {}
	for i = 1038,1040 do
		if GetItemCount(2,0,i) ~= 0 then
			tinsert(tb_dilog,"��ng �"..Tb_Bougie_info[i][1].."Th�p �u�c/#bougie_crt("..bougie_seq..","..i..")")
		end
	end
	if getn(tb_dilog) == 0 then
		Talk(1,"","<color=green>Nh�c nh�<color>: Xin x�c nh�n c� mang n�n!")
		return
	else
		tinsert(tb_dilog,"�� ta suy ngh� l�i/end_dialog")
	end
	Say("<color=green>Nh�c nh�<color>: Xin ch�n n�n mu�n d�ng!",
		getn(tb_dilog),
		tb_dilog
	)
end
--����Ĵ���
function bougie_crt(att_seq,bougie_id)
	--״̬���
	if GetMissionV(att_seq + 14) == 0 then
		Talk(1,"","<color=green>Nh�c nh�<color>: Hi�n"..Tb_Monster_info[3] [att_seq][2].." n�n �� th�p!")
		return
	end
	--��Ʒ���
	if GetItemCount(2,0,bougie_id) == 0 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_Bougie_info[bougie_id][1].."<color>!")
		return
	else
		--��Ʒɾ�����
		if DelItem(2,0,bougie_id,1) ~= 1 then
			Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_Bougie_info[bougie_id][1].."<color>!")
			return
		end
	end
	--��������̨ɾ��
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."S� d�ng "..Tb_Bougie_info[bougie_id][1].."�� th�p"..Tb_Monster_info[3] [att_seq][2].." n�n, uy l�c 'Qu� T��ng Qu�n' gi�m b�t ("..Tb_Boss_buff_info_3[att_seq][3].."����\")")
	local candler_index = GetMissionV(18+att_seq)
	SetNpcLifeTime(candler_index,0)
	SetMissionV((18+att_seq),0)
	--npc����
	public_bougie_crt(att_seq)
	--boss buffɾ��
	local boss_index = GetMissionV(MS_boss_index)
	for i = 1,getn(Tb_Boss_buff_info_3[att_seq][1]) do
		RemoveStateFromNpc(boss_index,Tb_Boss_buff_info_3[att_seq][1][i][5])
	end
end
--���򴴽�����
function public_bougie_crt(att_seq)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[3][att_seq][1],Tb_Monster_info[3][att_seq][2],map_id,Tb_Monster_info[3][att_seq][3],Tb_Monster_info[3][att_seq][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetNpcActivator(npc_index)
	SetMissionV((10+att_seq),npc_index)
	SetMissionV((14+att_seq),0)			--������̨�ĳ�ʼ״̬Ϊ0
	--�Զ���Ѫbuff���
	CastState2Npc(npc_index,Tb_Bougie_buff[1],Tb_Bougie_buff[2],Tb_Bougie_buff[3],Tb_Bougie_buff[4],Tb_Bougie_buff[5])
	--��Ч����
	SetCurrentNpcSFX(npc_index,Bougie_burning_SFX_id,2,1)
end

