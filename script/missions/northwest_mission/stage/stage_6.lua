--�ű����ƣ������ؿ�������
--�ű����ܣ����������߼�
--���ܲ߻��ˣ��¹���
--���ܿ����ˣ��峤
--���ܲ����ˣ����
--���뿪��ʱ�䣺2007-12-13
--�����޸�ʱ�䣺
MS_boss_index = 10				--boss����
MS_stage6_boss_life = 11					--bossѪ��
Ms_stage6_step_boss = 12				--(��ĵ�ǰ״̬)
Ms_stage6_step_shandow = 13 		--(��Ӱ��״̬���:0Ϊ��ǰboss�Ѿ�����������Ϊ��������Ļ�Ӱ)
Ms_stage6_shandow_index = 14		--��������
Ms_stage6_real_box_seq = 15			--���������ż�¼ID
Ms_stage6_shandow_crt_loop = 16	--���������
Ms_stage6_box_crt_loop = 17			--��������
Tb_boss_life_fun_info = {0.9,0.7,0.5,0.3,0.1}
--�������Ϣ
Tb_shadow_info = {
	{"Th�ng l�nh t��ng binhHoanT��ng ","Th�ng l�nh t��ng binhHoanT��ng ",1614,3217},
	{"Huy�t Ma Nh�nHoan T��ng ","Huy�t Ma Nh�nHoan T��ng ",1614,3217},
	{"Tr�n m� T��ng qu�nHoan T��ng ","Tr�n m� T��ng qu�nHoan T��ng ",1614,3217},    
	{"Tr�n M� Th�Hoan T��ng ","Tr�n M� Th�Hoan T��ng ",1614,3217},
	{"Qu� T��ng ��uHoan T��ng ","Qu� T��ng ��uHoan T��ng ",1614,3217},
}
--���Ӻ�Ѱ���˵�����
 Tb_box_info = {
	{1620,3206,1629,3225},
	{1624,3245,1601,3252},
	{1581,3243,1574,3223},
	{1583,3199,1600,3194},
 }
 --��Ӱÿ10��۳���Ѫ���ٷֱ�
 shadow_reduce_life_per_10s = 0.05

 Tb_stage6_boss_info = {
		{"Sa M�c Hoan T��ng �i 1","Nguy�n h�nh �o �nh (t�nh m�ch)",1614,3217},
		{"Sa M�c Hoan T��ng �i 2","Nguy�n h�nh �o �nh (th�n)",1614,3217},
	}
  -------------------------------------------ϵͳ�߼���------------------------------------------
 --��һ�����ؿ�׼��
 function stage6_ready()
	--ɾ���ƻþ�
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"�i b�t ��u c�n\",30,0,1)")
 end
 --��һ����boss����
 function stage6_boss_crt()
	local boss_diff = 1
	local step_now = GetMissionV(Ms_stage6_step_shandow) 
	if step_now == 5 then
		boss_diff = 2
	end
	--����boss
	local map_id = SubWorldIdx2ID(SubWorld)
	local boss_index = CreateNpc(Tb_stage6_boss_info[boss_diff][1],Tb_stage6_boss_info[boss_diff][2],map_id,Tb_stage6_boss_info[boss_diff][3],Tb_stage6_boss_info[boss_diff][4])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,boss_index)
	--�ж��Ƿ��ǵ�һ��ˢ��boss��������������޸�Ѫ��
	if step_now == 0 or step_now == nil then
		--ʱ���������ʾ 
		Zgc_pub_mission_fun(MS_ID,"BigDelItem(2,0,1041,BigGetItemCount(2,0,1041))")
		Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"K�t th�c v��t �i c�n\",1830,0,1)")
		Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"�o gi�c xu�t hi�n c�n\",30,0,2)")
		local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
		--SetMissionV(Ms_stage6_box_crt_loop,0)
		--��һ�β�ˢ��������ϵͳ����ˢ��
		SetMissionV(Ms_stage6_shandow_crt_loop,-1)
	else
			local life_num = GetMissionV(MS_stage6_boss_life)
			local max_life_num = GetUnitCurStates(boss_index,1)
			local remain_life_num_max = max(life_num,floor(Tb_boss_life_fun_info[step_now]*max_life_num))
			ModifyNpcData(boss_index,0,remain_life_num_max,0)
		if step_now == 5 then
			SetMissionV(Ms_stage6_step_shandow,(step_now + 1))
			NpcChat(boss_index,"C�c ng��i th�t to gan, xem b�o c�t ��y!")
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"�o �nh sa m�c hi�n nguy�n h�nh, c�n th�n ��i ph�!\")")
		else
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"D�ng g��ng �o �nh th�nh c�ng ph� h�y �o �nh, �o �nh d��ng nh� �� hi�n nguy�n h�nh!\")")
		end
	end
 end
 --���߼���ÿ10s����һ�Σ������߼���������
 function shadow_reduce_life()
 	local step_now = GetMissionV(Ms_stage6_step_shandow) 
	if step_now > 5 then
		return
	end
	--��������
	local shandow_crt_loop_num = GetMissionV(Ms_stage6_shandow_crt_loop)
	if shandow_crt_loop_num == 0 then
		stage6_shadow_crt()
	end
	SetMissionV(Ms_stage6_shandow_crt_loop,(shandow_crt_loop_num - 1))
	--��������Ϳ�Ѫ
	local box_crt_loop_num = GetMissionV(Ms_stage6_box_crt_loop)
	local shadow_index = GetMissionV(Ms_stage6_shandow_index)
	--�Ƿ��ǻ���ʱ��
	if shadow_index == 0 and shadow_index == nil then
		return
	else
		if mod(box_crt_loop_num,3) == 0  then
			stage6_box_crt()
		end
		SetMissionV(Ms_stage6_box_crt_loop,(box_crt_loop_num - 1))
		--�����Ѫ
		local shadow_index = GetMissionV(Ms_stage6_shandow_index)
		if shadow_index == 0 then
			return
		end
		--Ѫ����ȡ�ͼ���
		local max_life_num,life_num = GetUnitCurStates(shadow_index,1)
		local need_reduce_life = floor(max_life_num * shadow_reduce_life_per_10s)
		if need_reduce_life >= life_num  then
			SetNpcLifeTime(shadow_index,0)
			shadow_recrt()
		else		--������Ѫ
			ModifyNpcData(shadow_index,0,(life_num - need_reduce_life),0)
		end
	end
 end
 --�ڶ�����������������
 function stage6_shadow_crt()
	--��Ϣ��ʾ
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"�o �nh m� ho�c, c�c ng��i c� th� ph� �nh trong t�m kh�ng? B�o c�t �ang k�o ��n!")	
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"�o �nh sa m�c bi�n h�a qua nh�ng tr�ng th�i kh�c nhau, xem ra kh�ng d� ti�u di�t.\")")
	Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"B�o r��ng xu�t hi�n c�n\",30,0,2)")
	--������
	local step_now = GetMissionV(Ms_stage6_step_shandow) + 1
	--��ȡboss��Ϣ
		--���boss�Ѿ���ɱ������Ѫ������Ϊ0
		SetNpcLifeTime(boss_index,0)
	if GetNpcName(boss_index) ~= Tb_stage6_boss_info[1][2] then
		SetMissionV(MS_stage6_boss_life,0)
	else
		--���boss��Ѫ��
		local max_life_num,life_num = GetUnitCurStates(boss_index,1)
		--�ڴ�����ʱ���ٶ�bossѪ�����д���
		SetMissionV(MS_stage6_boss_life,life_num)
	end
	--��������
	local map_id = SubWorldIdx2ID(SubWorld)
	local shadow_index = CreateNpc(Tb_shadow_info[step_now][1],Tb_shadow_info[step_now][2],map_id,Tb_shadow_info[step_now][3],Tb_shadow_info[step_now][4])
 	SetNpcScript(shadow_index,Main_Npc_Script_way)
	SetMissionV(Ms_stage6_step_shandow,step_now)
	SetMissionV(Ms_stage6_shandow_index,shadow_index)
	SetMissionV(Ms_stage6_box_crt_loop,2)
end
--����Ѱ���˺ͱ���
function stage6_box_crt()
	--����Ѱ����
	local map_id =  SubWorldIdx2ID(SubWorld)
	--��������
	if break_shadow_goods_chk() == 0  then 
		if GetMissionV(Ms_stage6_shandow_index) ~= 0 then
			--û���ƻþ�����������
			Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
			Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"B�o r��ng xu�t hi�n c�n\",30,0,2)")
			--��ʼ����
			local box_index = 0
			for i = 1,getn(Tb_box_info) do
				box_index = CreateNpc("Sa m�c b�o r��ng","Sa m�c b�o r��ng",map_id,Tb_box_info[i][1],Tb_box_info[i][2])
				SetNpcScript(box_index,Main_Npc_Script_way)
				SetNpcLifeTime(box_index,5)
			end
			--ȷ�Ͽ��ڼ������ӵ�ʱ�����ƻþ�
			SetMissionV(Ms_stage6_real_box_seq,random(1,4))
		end
	else
		local npc_index = 0
		for i = 1,getn(Tb_box_info) do
			if stage_devil_restrict() ~= 0 then
				npc_index = CreateNpc("�i T�m B�o Nh�n","T�m B�o Nh�n",map_id,(Tb_box_info[i][3]+random(-2,2)),(Tb_box_info[i][4]+random(-2,2)))
				SetNpcScript(npc_index,Main_Npc_Script_way)
			end
		end
	end
end
 --------------------------------------����������-------------------------------------
 --���󸴻�
 function shadow_recrt()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local shadow_step = GetMissionV(Ms_stage6_step_shandow)
	local shadow_index = CreateNpc(Tb_shadow_info[shadow_step][1],Tb_shadow_info[shadow_step][2],map_id,Tb_shadow_info[shadow_step][3],Tb_shadow_info[shadow_step][4])
	SetNpcScript(shadow_index,Main_Npc_Script_way)
	SetMissionV(Ms_stage6_shandow_index,shadow_index)
	NpcChat(shadow_index,"Ng��i b� m� ho�c, r�t kh� ph� gi�i t�m ma.")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"�o �nh l�i t�i sinh, ch�a ti�u di�t ho�n to�n!\")")
 end
--boss����
 function stage6_boss_chat()
	NpcChat(GetMissionV(MS_boss_index),Stage_info[6].boss_chat[random(1,getn(Stage_info[6].boss_chat))])
 end
 -------------------------------------------����������------------------------------------------
 --���ӶԻ�
 function stage6_box_dialog()
	local box_index = GetTargetNpc()
	--�Ի�����ʧ
	SetNpcLifeTime(box_index,0)
	if break_shadow_goods_chk() ~= 0 then
		return
	else
		--�Ƿ������Ӿ��ӵ�����
		local box_step = (GetMissionV(Ms_stage6_real_box_seq) - 1)
		if box_step <= 0 then
			if AddItem(2,0,1041,1) == 1 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Trong b�o r��ng nh�n ���c b�o v�t g��ng �o �nh d�ng �� ph� h�y �o �nh.\")")
				Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
				SetMissionV(Ms_stage6_real_box_seq,-1)
			end
		else
			SetMissionV(Ms_stage6_real_box_seq,box_step)
		end
	end
 end
 --��������
 function stage6_shadow_death(shadow_seq)
	if PlayerIndex ~= break_shadow_goods_chk() then
		shadow_recrt()
	else
		--������һ�׶ε�boss
		BigDelItem(2,0,1041,BigGetItemCount(2,0,1041))
		SetMissionV(Ms_stage6_shandow_index,0)
		SetMissionV(Ms_stage6_shandow_crt_loop,3)
		stage6_boss_crt()
	end
 end
 --boss�ڳ���״̬����
 function stage6_boss_slience_death()
	SetMissionV(MS_boss_index,0)
 end
 --boss����
 function stage6_boss_death()
	--�������ں���
	--����Ϣ
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ti�u di�t '�o �nh Nguy�n H�nh (th�n)', ��i ng� v��t �i th�nh c�ng!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T�i"..GetName().."Chi�n ��u gian kh�, cu�i c�ng ��nh b�i '�o �nh Nguy�n H�nh (th�n)', v��t �i th�nh c�ng"..Stage_info[stage_seq].stage_name..".")
	end

	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--׼���ؿ�����
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[�i T�y B�c] th�ng k� qua �i: ID �i	"..stage_seq..":"..nMapID..":"..mission_count.."	Th�i gian qua �i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(6) 
end
 ------------------------------------------------����������--------------------------------------
  --�Ƿ�����ҳ����ƻþ���⺯��
 function break_shadow_goods_chk()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_index_save = PlayerIndex
	for i = 1,getn(player) do
		PlayerIndex = player[i]
		if BigGetItemCount(2,0,1041) ~= 0 then
			PlayerIndex = player_index_save
			return player[i]
		end
	end
	PlayerIndex = player_index_save
	return 0
 end
