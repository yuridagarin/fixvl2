--�ű����ƣ��������ؿ�����NPC�Ի�
--�ű����ܣ�����NPC�����Ͻű���������صĶԻ��Լ��ؿ��Ŀ�������ع���
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2002-08-30
--�����޸ļ�¼��
--2008-06-12�����ӳ��д���NPC����޸ģ�
--�ؿ���Ϣ
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
--���Ի�
function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 2 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 3);
		Say("B�o ki�m l�u l�m kh�ng s� d�ng, h�y gi�p ta m�i ki�m, cho ��n khi n�o V�ng trong Ki�m t�a �nh h�o quang ng�.\n<color=gold> ti�u di�t 333 Sa M�c H�nh Nh�n \n ti�u di�t 555 T�m B�o Nh�n <color>", 0);
		TaskTip("Ti�u di�t 333 Sa M�c H�nh Nh�n ");
		TaskTip("Ti�u di�t 555 T�m B�o Nh�n");
		return 
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 4 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 5);
		Say("B�n ng��i c�y l�m ta ng�a m�t, h�y ti�u di�t ch�ng, ta c�m th�y vui ta s� truy�n b� thu�t. \n<color=gold>ti�u di�t 99 ng��i c�y<color>", 0);
		TaskTip("Ti�u di�t 99 ng��i c�y");
		return 
	end
	local npc_name = GetTargetNpcName()
	local stage_seq = 0
	for i = 1,Stage_count do
		if npc_name == Tb_stage_npc_name[i] then
			stage_seq = i
			break
		end
	end
	if stage_seq == 0 then
		local tb_dialog_city_main = {
			"Ta mu�n ��n T�y V�c th�n b�/stge_main_city",
			"Mua v�t ph�m th�n b�/#Sale(99)",
			"Li�n quan T�y V�c th�n b�/about_mis",
			"R�i kh�i/end_dialog",
		}
		Say(Npc_name_city.."Theo �i�u tra c�a nhi�u hi�p s�, ph�t hi�n T�y V�c c� nhi�u ��ng ch�a nhi�u Kim th�ch c� th� th�m <color=yellow>Linh t�nh<color> cho binh kh�. Tri�u ��nh c�ng �ang b�t ��u coi tr�ng s�ch l��c l�y v� c�u qu�c n�n ph�i ch�ng t�i ��n �� h� tr� c�c hi�p s�. Ngo�i ra tr�n tay ta �� thu th�p ��y �� v�t ph�m �� c�c v� hi�p s� s� d�ng tr�n ���ng kh�m ph� T�y V�c.",
			getn(tb_dialog_city_main),tb_dialog_city_main
		)
	else
		local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
		--�������͸������
		if nStep_XBTask_01 == 65 and npc_name == "B�ch Thi�n Th�nh" then
			task_023_03_0()
			return
		end
		--��ҹؿ�����
		local stage_diff = stage_diff_chk(stage_seq)
		SetTask(Task_ID_stage_diff,stage_diff)
		if stage_diff == 0 then
			Talk(1,"",Stage_info[stage_seq].no_task_dialog)
			return
		end
		SetTask(TaskID_miss_login_diff,1)
		SetTask(Task_ID_stage_seq,stage_seq)		--����Ӧ�Ĺؿ���Ϣ���棬�ڴ�NPC��������
			--�Ի�
		Say(Stage_info[stage_seq].main_dialog[stage_diff],
			4,
			Stage_info[stage_seq].log_in_dialog[stage_diff].."/search_ground",
			"�i�u ki�n v��t �i/stage_condition",
			Stage_info[stage_seq].stage_name.."B�i c�nh/stage_backgroud",
			"R�i kh�i/end_dialog"
		)
	end
end
--���йؿ�ѡ�����Ի�
function stge_main_city()
	local stage_name = {}
	for i = 1, Stage_count do
		tinsert(stage_name,Stage_info[i].stage_name.."/#city_stage_sel("..i..")")
	end
	tinsert(stage_name,"tr� l�i/main")
	tinsert(stage_name,"R�i kh�i/end_dialog")
	Say(Npc_name_city.."V�i n�i � T�y V�c �� ph�t hi�n <color=yellow>Kim th�ch<color>, b�n mu�n ��n ��u �� t�m hi�u?",
		getn(stage_name),stage_name
	)
end
--���йؿ�ѡ��
function city_stage_sel(stage_seq)
	SetTask(TaskID_miss_login_diff,2)
	SetTask(Task_ID_stage_diff,2)
	SetTask(Task_ID_stage_seq,stage_seq)
	search_ground()
end
--���йؿ���Ϣ
function about_mis()
	Say(Npc_name_city.."Nhi�u hi�p s� ��i T�ng ph�t hi�n <color=yellow>Kim th�ch<color> � v�ng ��t th�n b� T�y V�c, ���c bi�t <color=green>Long Quang Ch�n Nh�n<color> c� th� s� d�ng Kim th�ch �� l�m to�t l�n <color=yellow>H�o quang<color> c�a binh kh�, th�m ch� c� g�i ra <color=yellow>Linh t�nh<color> c�a binh kh�. V� l�m nh�n s� �n �n k�o ��n T�y V�c �� kh�m ph� l�i th�m vi�c T�y H� kh�ng ch�u ngh� h�a bao phen x�m ph�m bi�n gi�i n��c ta, tri�u ��nh ph�i ta mang tin t�c ��n gi�p �� c�c v� hi�p s�.",
		2,
		"tr� l�i/main",
		"R�i kh�i/end_dialog"
	)
end
--���ó��ضԻ�
function search_ground()
	--�Ի�����
	local stage_diff = GetTask(Task_ID_stage_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local login_diff = GetTask(TaskID_miss_login_diff)
	local tb_dialog = {}
	local team_total = 0
	local map_total = getn(Stage_info[stage_seq].map[login_diff])
	for i = 1, map_total do
		if mf_GetMissionV(MS_ID,MS_STATE_ID,Stage_info[stage_seq].map[login_diff][i]) == 0 then
			tinsert(tb_dialog,Stage_info[stage_seq].stage_name.."["..i.."(Tr�ng th�i: Tr�ng)/#log_stageg("..Stage_info[stage_seq].map[login_diff][i]..")")
		else
			tinsert(tb_dialog,Stage_info[stage_seq].stage_name.."["..i.."(Tr�ng th�i: Chi�m d�ng)/cannot_log")
			team_total = team_total + 1
		end
	end
	if team_total < map_total then
		local dialog_main = Stage_info[stage_seq].ground_sel_dialog[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info.city_mis_dia_main[stage_seq]
			tinsert(tb_dialog,"Kh�m ph�"..Stage_info[stage_seq].stage_name.."�i�u ki�n/stage_condition")
			tinsert(tb_dialog,"Kh�m ph�"..Stage_info[stage_seq].stage_name.."nh�c nh�/stage_login_clew")
		end	
		tinsert(tb_dialog,"tr� l�i/main")
		tinsert(tb_dialog,"R�i kh�i/end_dialog")
		Say(dialog_main.."(<color=yellow>Nh�c nh�: khi v�o tr�n s� v�t b� th� c�ng tr�n ng��i c�a nh�n v�t<color>)",
			getn(tb_dialog),
			tb_dialog
			)
	else
		local dialog_main = Stage_info[stage_seq].ground_sel_dialog[stage_diff][2]
		if login_diff == 2 then
			dialog_main = Npc_name_city.."�� c� h�o ki�t kh�c �ang v��t �i, h�y quay l�i sau!"
		end	
		Talk(1,"",Stage_info[stage_seq].ground_sel_dialog[stage_diff][2])
	end
end
--��¼�ؿ��Ĳ���
function log_stageg(map_id)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	local login_diff = GetTask(TaskID_miss_login_diff)
	
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	--��¼�������
	--��Ӽ��
	if Mission_team_chk(1,3,5) ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info[stage_seq].cannot_log_reason[3][1]
		end		
		Talk(1,"",dialog_main)
		return
	end
	--�����Ա��������
	if stage_diff ~= 2 then
		local unlogin_player = team_mission_step_chk() 
		if unlogin_player ~= "none" then
			local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][3]
			if login_diff == 2 then
				dialog_main = Stage_info[stage_seq].cannot_log_reason[3][3]
			end	
			Talk(1,"",dialog_main.."\n    T� ��i kh�ng ph� h�p �i�u ki�n nhi�m v�: <color=yellow>"..unlogin_player.."<color>")
			Zgc_pub_mission_team_msg(unlogin_player.."Ch�a ��n b��c nhi�m v� k� ti�p, kh�ng th� v�o �i!")
			return
		end
	end
	--ְҵ�ظ����
	if mission_route_chk() ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][4]
		if login_diff == 2 then
			dialog_main =Stage_info[stage_seq].cannot_log_reason[3][4]
		end	
		Talk(1,"",dialog_main)
		return
	end
	--PKֵ�ļ��
	local pk_chk_player = mission_pk_chk()
	if pk_chk_player ~= "none" then
		Talk(1,"",npc_name.."Trong ��i c� th�nh vi�n c� tr� PK l�n h�n <color=yellow>"..Mission_PK_max.."<color>, h�y x�a tr� PK r�i quay l�i v��t �i.\n    T� ��i kh�ng �� �i�u ki�n: <color=yellow>"..pk_chk_player.."<color>")
		Zgc_pub_mission_team_msg(pk_chk_player.."PK v��t qu� "..Mission_PK_max..", kh�ng th� v��t �i!")
		return
	end
	--��ɴ������
	local week_login_chk = misssion_week_times_chk()
	if week_login_chk ~= "none" then
		Talk(1,"",npc_name.."Trong ��i c� th�nh vi�n v��t qu� gi�i h�n <color=yellow>"..Mission_login_times_per_week.."<color> l�n v��t �i c�a tu�n.\n    T� ��i kh�ng �� �i�u ki�n: <color=yellow>"..week_login_chk.."<color>")
		Zgc_pub_mission_team_msg(week_login_chk.."S� l�n v��t �i tu�n n�y v��t qu�"..Mission_login_times_per_week..", kh�ng th� v��t �i!")
		return
	end
	--�Ƿ���ͬһ��ͼ���
	if Zgc_pub_missio_same_map_chk() ~= 1 then
		Talk(1,"",npc_name.."Mu�n ��a ��i v� m�nh c�ng v�o ph�i ��a ��i c�a ng��i ��n ch� ta!")
		return
	end
	--��ҵȼ����
	local level_chk_player = player_level_chk()
	if  level_chk_player ~= "none" then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info[stage_seq].cannot_log_reason[3][1]
		end		
		Talk(1,"",dialog_main.."\n    T� ��i kh�ng ph� h�p �i�u ki�n: <color=yellow>"..level_chk_player.."<color>")
		Zgc_pub_mission_team_msg(level_chk_player.."Ch�a ��t c�p "..Stage_player_level_min..", kh�ng th� v�o �i!")
		return
	end
	--�ؿ��Ƿ�ռ�ü��
	if mf_GetMissionV(MS_ID,MS_STATE_ID,map_id) == 1 then
		cannot_log()
		return
	end
	--��������ɹؿ�����ҽ�����Ʊ���
	if mission_goods_chk() ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][2]
		if login_diff == 2 then
			dialog_main =Stage_info[stage_seq].cannot_log_reason[3][2]
		end	
		Talk(1,"",dialog_main)
		return
	end
	--stage�ؿ�
	if mf_OpenMission(MS_ID,map_id) ~= 1 then
		cannot_log()
		return
	end
	--mission��ز���
	mf_SetMissionV(MS_ID,MS_PLAYER_NUM,GetTeamSize(),map_id)				--���ùؿ���ʼ�Ľ�������
	mf_SetMissionV(MS_ID,MS_STATE_DIFF_ID,stage_seq,map_id)					--��ǰ�ؿ��ǵڼ���
	if stage_seq == 5 then
		mf_SetMissionV(MS_ID,MS_BOSS_KILL_NUM,0,map_id)
	end
	mf_SetMissionV(MS_ID,MS_STATE_ID,MS_state_wait_start,map_id)			--�ؿ�״̬����Ϊ�ȴ���ʼ
	mf_SetMissionV(MS_ID,MS_DIFF,stage_diff,map_id)										--�ؿ����ͣ�1Ϊ�򵥣�2Ϊ����
	--���õ�¼�ص�
	local player_route_str = ""
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route_str = player_route_str..GetPlayerRoute().."	"
	end
	SetMapTaskTemp(map_id,1,(GetMapTaskTemp(map_id,1) +1))
	local mission_count = GetMapTaskTemp(map_id,1)
	WriteLog("[�i T�y B�c]Th�ng k� ��ng nh�p: ID �i	"..stage_seq..":"..map_id..":"..mission_count.."	S� ng��i ch�i	"..GetTeamSize().."	T�n ��i tr��ng: 	"..GetName().."	M� h� ph�i ng��i ch�i	"..player_route_str.."")
	--�ؿ���ʼ����
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetFightState(1)
		SetTask(Task_ID_stage_diff,stage_diff)
		SetTask(Task_ID_stage_seq,stage_seq)
		SetTask(TaskID_miss_login_diff,login_diff)
		mf_JoinMission(MS_ID,0,map_id)
		NewWorld(map_id,Stage_info[stage_seq].in_coordinate[1],Stage_info[stage_seq].in_coordinate[2])
		WriteLogEx("Vuot ai Tay Vuc", "tham gia")
	end
	PlayerIndex = player_index_save
end
--�ؿ���æ״̬�ĶԻ�
function cannot_log()
	local stage_seq = GetTask(Task_ID_stage_seq)
	
	local login_diff = GetTask(TaskID_miss_login_diff)
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	Talk(1,"search_ground",npc_name.."���ng n�y �� c� h�o ki�t �i, sao kh�ng ch�n con ���ng kh�c?")
end
--��������
function stage_condition()
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	
	local login_diff = GetTask(TaskID_miss_login_diff)
	local dialog_main = Stage_info[stage_seq].stage_condition[stage_diff]

	--������������
	if stage_diff ~= 1 then
		dialog_main = "\n    . Do <color=yellow> ��i tr��ng d�n ��u t� ��i 3-5 ng��i<color> ��n, t�t c� th�nh vi�n ph�i ��t ��n c�p <color=yellow>"..Stage_player_level_min.."<color> c�p."
		local npc_name = Stage_info[stage_seq].npc_name
		if login_diff == 2 then
			npc_name = Npc_name_city
		end
		dialog_main = npc_name..Stage_info.stage_condition_main_dialog[stage_seq]..dialog_main
		if getn(Stage_info[stage_seq].task_goods[2] ) ~= 0 then
			local task_goods_need = "\n    . ��i tr��ng ph�i mang theo <color=yellow>"
			for i = 1,getn(Stage_info[stage_seq].task_goods[2]) do
				if i > 1 then
					task_goods_need = task_goods_need..","
				end
				task_goods_need = task_goods_need..Stage_info[stage_seq].task_goods[2][i][5]
			end
			dialog_main = dialog_main..task_goods_need.."<color>"
		end
		dialog_main = dialog_main.."\n    . Trong ��i <color=yellow>kh�ng ���c c� ng��i v� c�ng l�u ph�i gi�ng nhau<color>."
		dialog_main = dialog_main.."\n    . Trong t� ��i m�i tu�n m�i ng��i v��t �i kh�ng th� v��t qu� <color=yellow>"..Mission_login_times_per_week.."<color> l�n."
		dialog_main = dialog_main.."\n    . Th�nh vi�n trong ��i <color=yellow>tr� PK<color> kh�ng th� v��t qu� <color=yellow>"..Mission_PK_max.."<color>."
	end
	Talk(1,"search_ground",dialog_main)
end
--�ؿ���������
function stage_backgroud()
	local stage_diff = GetTask(Task_ID_stage_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	Say(Stage_info[stage_seq].stage_background[stage_diff],
	2,
	"tr� l�i/main",
	"R�i kh�i/end_dialog"
	)	
end
--������ʾ
function stage_login_clew()
	local login_diff = GetTask(TaskID_miss_login_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	Talk(1,"search_ground",npc_name..Stage_info.stage_login_clew[stage_seq])
end
--=============��������������
--�����������
function stage_diff_chk(stage_seq)
	if GetTask(Stage_info[stage_seq].task_ID[1]) == Stage_info[stage_seq].task_ID[2] then
		return 1
	else
		return 2
	end
end
--����Ƿ�����ͨ�ؿ����Ǹ��ӹؿ�
function team_mission_step_chk()			--��ʱ��Ϊֻ��ʼ��ͨ�ؿ�
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff  = GetTask(Task_ID_stage_diff)
	local player_index_save = PlayerIndex
	local chk_flag = 2
	local player_stage_diff = 0
	local player_unlogin_name = ""
	--���ڳ�Ա�ж�
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if stage_diff == 1 and GetTask(Stage_info[stage_seq].task_ID[1]) <  Stage_info[stage_seq].task_ID[2] then
			player_unlogin_name = player_unlogin_name.." "..GetName()
			Talk(1,"","<color=green>Nh�c nh�<color>: B�n ch�a ho�n th�nh nhi�m v� tr��c, kh�ng th� v�o �i!")
		end
	end
	PlayerIndex = player_index_save
	if player_unlogin_name == "" then
		return "none"
	else
		return player_unlogin_name
	end
end
--���ؿ�����Ҫ��������Ʒ
function mission_goods_chk()
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	local task_goods_num = getn(Stage_info[stage_seq].task_goods[stage_diff])
	if task_goods_num == 0 then
		return 1
	else
		for i = 1,task_goods_num do
			if GetItemCount(Stage_info[stage_seq].task_goods[stage_diff][i][1],Stage_info[stage_seq].task_goods[stage_diff][i][2],Stage_info[stage_seq].task_goods[stage_diff][i][3]) < Stage_info[stage_seq].task_goods[stage_diff][i][4] then
				return 0
			end
		end
		if stage_diff == 2 then
			local del_flag = 1
			for i = 1,task_goods_num do
				del_flag = del_flag * DelItem(Stage_info[stage_seq].task_goods[stage_diff][i][1],Stage_info[stage_seq].task_goods[stage_diff][i][2],Stage_info[stage_seq].task_goods[stage_diff][i][3],Stage_info[stage_seq].task_goods[stage_diff][i][4])
			end
			return del_flag
		else
			return 1
		end
	end
end
--����������
function Mission_team_chk(captain_flag,member_min,memeber_max)
	--�����Ա�������
	local team_member = GetTeamSize()
	if team_member < member_min or team_member > memeber_max then
		return 0
	end
	--�ӳ����
	if captain_flag == 1 and GetTeamMember(0) ~= PlayerIndex then
		return 0
	end
	return 1
end
--ְҵ�ظ����
function mission_route_chk()
	local tb_palyer_route = {}
	local player_route = 0
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route = GetPlayerRoute()
		if getn(tb_palyer_route) ~= 0 then
			for i = 1,getn(tb_palyer_route) do
				if player_route == tb_palyer_route[i] then
					PlayerIndex = player_index_save
					return 0
				end
			end
		end
		tinsert(tb_palyer_route,player_route)
	end
	PlayerIndex = player_index_save
	return 1
end
--PKֵ���
function mission_pk_chk()
	local player_index_save = PlayerIndex
	local pk_chk_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetPKValue() > Mission_PK_max then
			pk_chk_name = pk_chk_name.." "..GetName()
			Talk(1,"","<color=green>Nh�c nh�<color>: Tr� PK c�a b�n v��t qu� <color=yellow>"..Mission_PK_max.."<color>, kh�ng th� v�o �i!")
		end
	end
	PlayerIndex = player_index_save
	if pk_chk_name == "" then
		return "none"
	else
		return pk_chk_name
	end
end
--ÿ�ܽ���ؿ��Ĵ�������
function misssion_week_times_chk()
	local player_index_save = PlayerIndex
	local mis_times_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq()  and GetTask(Mission_login_times_TaskID) >= Mission_login_times_per_week then
			mis_times_name = mis_times_name.." "..GetName()
			Talk(1,"","<color=green>Nh�c nh�<color>: B�n �� v��t �i <color=yellow>"..Mission_login_times_per_week.."<color> l�n, v��t qu� s� l�n t�i �a!")
		end
	end
	PlayerIndex = player_index_save
	if mis_times_name == "" then
		return "none"
	else
		return mis_times_name
	end
end
--��ҵȼ�����
function player_level_chk()
	local player_index_save = PlayerIndex
	local mis_level_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < Stage_player_level_min  then
			mis_level_name = mis_level_name.." "..GetName()
			Talk(1,"","<color=green>Nh�c nh�<color>: ��ng c�p nh� h�n <color=yellow>"..Stage_player_level_min.."<color>, kh�ng th� v�o �i!")
		end
	end
	PlayerIndex = player_index_save
	if mis_level_name == "" then
		return "none"
	else
		return mis_level_name
	end	
end
--���н���ؿ�ʱ�������ʾ�޸�
function dialog_main_sub(sub_str,stage_seq)
	return Npc_name_city..(strsub(sub_str,(strlen(Stage_info[stage_seq].npc_name)+1),strlen(sub_str)))
end
