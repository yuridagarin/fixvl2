--�ű����ƣ��������ؿ���һ��
--�ű����ܣ��ؿ�����Ҫ�߼�
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-06
--==��������������
	MS_boss_index = 10
	MS_blood_monster_num = 11
	MS_dragon_fox_num = 12
	Monter_num = {5,3}
	Camp_player = "nw_player"			--�����Ӫ���ַ���
	Camp_monster = "nw_monster"		--������Ӫ���ַ���
	Tb_camp_player_attr_add = {		--�����Ӫ��Ҫ���ӵ�ħ������
		--ħ�������ַ���-����ֵ-ʱ�䣨֡��-�Ƿ��滻-����ID
		{"state_move_speed_percent_add",250,2160,0,19801224},
		{"state_dispear", 1, 2160, 0,19801225},
		--{"state_shadow_run", 2565, 2160,0,19801226},
	}
	Tb_camp_monster_attr_add = {	--������Ӫ��Ҫ���ӵ�ħ������
		--ħ�������ַ���-����ֵ-ʱ�䣨֡��-�Ƿ��滻-����ID
		--{"state_shadow_run", 2565, 2160,0,19801227},
	}
	Npc_del_name = {"�m Nh�t S� ","Minh Nh�t S�","Li�t Nhan Li Long","X�ch Luy�n H�a H�"}
--��һ����boss����
function stage1_boss_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--�ؿ�״̬����Ϊ��ʼ״̬
	SetMissionV(MS_STATE_ID,MS_state_running)
	--������Ҽ���"player"��Ӫ
	Zgc_pub_mission_fun(MS_ID,"SetCampToPlayer(\"nw_player\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K�t th�c v��t �i c�n\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr�ng th�i h�a luy�n c�n\",30,0,2)")
	--boss���������������Ӫ
	local boss_index = CreateNpc(Tb_Monster_info[1][1][1],Tb_Monster_info[1][1][2],nMapID,Tb_Monster_info[1][1][3],Tb_Monster_info[1][1][4],-1,1,1,Tb_Monster_info[1][1][5])
	SetMissionV(MS_boss_index,boss_index)
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetCampToNpc(boss_index,Camp_monster)
end
function stage1_boss_add_shadow_buff()
	local boss_index = GetMissionV(MS_boss_index)
	CastState2Npc(boss_index,"state_shadow_run", 2565, 2160,0,19801226)
end
--�ڶ������޸�boss��Ӫ������С��
function sun_moon_monster_create()
	--�޸�bossΪNPC��Ӫ
	boss_camp_chg(Camp_player)
	--���ﴴ��������monster��Ӫ
	local monster_num = ((GetMissionV(MS_PLAYER_NUM)) * 5)
	--��ʼ��д����һ�׶δ���Ѫħ�˵�����
	SetMissionV(MS_blood_monster_num,monster_num)
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = 1, monster_num do
		local ran_num = random(3,4)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"T�t c� sinh linh trong C� D��ng ��ng, d�ng m�u c�c ng��i �� r�a t�i �c c�a ta!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"� ch� C� D��ng Th� y�u d�n, tr� n�n �i�n cu�ng, r�i v�o tr�ng th�i kh�ng ch�!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr�ng th�i nh�p c�n\",120,0,2)")
end
--����������С�֣�����Ѫħ��
function blood_monster_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--bossת��
	boss_camp_chg(Camp_monster)
	--С�����
	map_npc_clear()
	--Ѫħ�˵Ĵ���
	local blood_monster_num = GetMissionV(MS_blood_monster_num)
	if blood_monster_num > 1 then
		local monster_num,monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_monster_num,1,Tb_Monster_info[1][5][5])
		for i = 0,getn(monster_index) do
			SetNpcScript(monster_index[i],Main_Npc_Script_way)
			--SetCampToNpc(monster_index[i],Camp_monster)
		end
	elseif blood_monster_num == 1 then
		local monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_monster_num,1,Tb_Monster_info[1][5][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
	end
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"Sinh Linh! M�u c�a c�c ng��i �� h�a quy�n v�i m�u ta, mau �i �i!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"C� D��ng Th� nh�p v�o ng��i, bi�n th�nh Huy�t Ma Nh�n, ph�i mau ti�u di�t!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr�ng th�i h�a luy�n c�n\",180,0,2)")
end
--���Ĳ�����������С��
function all_monster_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--boss��Ӫת��
	boss_camp_chg(Camp_player)
	--��ʼ��������
	local player_num = GetMissionV(MS_PLAYER_NUM)
	local monster_num = (player_num * 5)
	local dragon_fox_num = (player_num * 3)
	for i = 1, monster_num do
		local ran_num = random(3,4)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
		--���������������������ű��������
		SetMissionV(MS_blood_monster_num,monster_num)
	for i = 1,dragon_fox_num do
		local ran_num = random(6,7)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
	--�������ͺ�����������������ű��������
	SetMissionV(MS_dragon_fox_num,dragon_fox_num)
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"T�t c� sinh linh trong C� D��ng ��ng, d�ng m�u c�c ng��i �� r�a t�i �c c�a ta!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"� ch� C� D��ng Th� y�u d�n, tr� n�n �i�n cu�ng, r�i v�o tr�ng th�i kh�ng ch�!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr�ng th�i nh�p c�n\",120,0,2)")
end
--���岽������Ѫħ�ˣ�boss��Ѫ���Ժ�һֱ�ظ����Ĳ��͵��岽��ֱ���ؿ�������
function blood_monster_recreate()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--boss��Ӫת��
	boss_camp_chg(Camp_monster)
	--����Ѫħ��
	local blood_num = GetMissionV(MS_blood_monster_num)
	if blood_num > 1 then
		local monster_num,monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_num,1,Tb_Monster_info[1][5][5])
		for i = 0,getn(monster_index) do
			SetNpcScript(monster_index[i],Main_Npc_Script_way)
		end
	elseif blood_num == 1 then
		local devil_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_num,1,Tb_Monster_info[1][5][5])
		SetNpcScript(devil_index,Main_Npc_Script_way)
	end
	--ɾ�������ͺ����
	map_npc_clear()
	--����û�б����ɱ�������ͺ��꣬��boss+Ѫ
	local df_num_remain = GetMissionV(MS_dragon_fox_num)
	if df_num_remain ~= 0 then
		Zgc_pub_mission_boss_life_chg(GetMissionV(MS_boss_index),1,df_num_remain)
	end
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"M�u c�a sinh v�t trong C� D��ng ��ng gi�p C� D��ng Th� h�i ph�c!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr�ng th�i h�a luy�n c�n\",180,0,2)")
end
--���߲����⿨ʱ������������������
function stage1_mission_end()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = 1,getn(player) do
		Ms_log_out_set_state()
		NewWorld(Stage_info[1].log_out_coordinate[1],Stage_info[1].log_out_coordinate[2],Stage_info[1].log_out_coordinate[3])
	end
end
--boss��Ӫת������
function boss_camp_chg(boss_camp)
	--boss���´���
	local boss_index = GetMissionV(MS_boss_index)
	--���boss��Ѫ��
	local max_life_num,life_num = GetUnitCurStates(boss_index,1)
	--��ͼnpc���
	local nMapID = SubWorldIdx2ID(SubWorld)
	--ClearMapNpc(nMapID)
	--�޸�bossѪ��
	--ȷ��boss����
	local boss_diff = 2
	if boss_camp == "nw_monster" then
		boss_diff = 1
	end
	local new_boss_index = CreateNpc(Tb_Monster_info[1][boss_diff][1],Tb_Monster_info[1][boss_diff][2],nMapID,Tb_Monster_info[1][boss_diff][3],Tb_Monster_info[1][boss_diff][4],-1,1,1,Tb_Monster_info[1][boss_diff][5])
	ModifyNpcData(new_boss_index,0,life_num,0)
	SetNpcScript(new_boss_index,Main_Npc_Script_way)
	--�޸�boss��Ӫ
	SetCampToNpc(new_boss_index,boss_camp)
	--����boss buff
	if boss_camp == "nw_player" then
		for i = 1,getn(Tb_camp_player_attr_add) do
			CastState2Npc(new_boss_index,Tb_camp_player_attr_add[i][1],Tb_camp_player_attr_add[i][2],Tb_camp_player_attr_add[i][3],Tb_camp_player_attr_add[i][4],Tb_camp_player_attr_add[i][5])
		end
	elseif boss_camp == "nw_monster" then
		for i = 1,getn(Tb_camp_monster_attr_add) do
			CastState2Npc(new_boss_index,Tb_camp_monster_attr_add[i][1],Tb_camp_monster_attr_add[i][2],Tb_camp_monster_attr_add[i][3],Tb_camp_monster_attr_add[i][4],Tb_camp_monster_attr_add[i][5])
		end
	end
	SetMissionV(MS_boss_index,new_boss_index)
	SetNpcLifeTime(boss_index,0)
	return
end
--map:npc����
function map_npc_clear()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(nMapID)
	local npc_num = getn(npc_total_index)
	if npc_num < 1 then
		return
	else
		for i = 1,npc_num do
			for j = 1,getn(Npc_del_name) do
				if GetNpcName(npc_total_index[i]) == Npc_del_name[j] then
					SetNpcLifeTime(npc_total_index[i],0)
				end
			end
		end
	end
end
--BOSS�����ű�
function stage1_boss_death()
	--�������ں���
	--����Ϣ
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti�u di�t th�nh c�ng 'C� D��ng Th�', ��i ng� v��t �i th�nh c�ng!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T�i"..GetName().."Chi�n ��u gian kh�, cu�i c�ng ��nh b�i 'C� D��ng Th�', v��t �i th�nh c�ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--׼���ؿ�����
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[�i T�y B�c] th�ng k� qua �i: ID �i	"..stage_seq..":"..nMapID..":"..mission_count.."	Th�i gian qua �i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
end
--����ʹ������ʹ�����ű�
function stage1_sun_moon_death()
	--��������ɱ�����������-1
	if PlayerIndex > 0 then
		SetMissionV(MS_blood_monster_num,(GetMissionV(MS_blood_monster_num)-1))
	end
	PlayerIndex = 0
end
--������������ű�
function stage1_dragon_fox_death(index)
	--��������ɱ�����������-1
	if PlayerIndex > 0 then
		SetMissionV(MS_dragon_fox_num,(GetMissionV(MS_dragon_fox_num)-1))
	end
	PlayerIndex = 0
end
