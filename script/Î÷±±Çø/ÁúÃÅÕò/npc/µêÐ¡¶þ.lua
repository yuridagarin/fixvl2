-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC��С��Script
-- By StarryNight
-- 2007/06/07 PM 4:00

-- �����ˣ�һ��о����ޡ���

--�峤2007-12-19�����������ؿ����߹�
-- ======================================================
-- ���þ�������ͷ�ļ�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
	Npc_name = "<color=green>Ti�u Nh�<color>: "
function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ��������02������ջ----------------------------------
	
	--���С���Ի���ȡ�Ѿ�ҩ
	if nStep_XBTask == 6 then
		task_002_02_0();
		return
	end
	
	--���С���Ի�ȡ�û�δȡ���Ѿ�ҩ
	if nStep_XBTask == 7 then
		task_002_03_0();
		return
	end
	
	--ȡ���Ѿ�ҩ��δ��������Ի�
	if nStep_XBTask == 8 then
		task_002_03_1();
		return
	end
	
	--ѯ�ʵ�С���Ѿ�ҩ��Ч֮��
	if nStep_XBTask == 9 then
		task_002_05_0();
		return
	end
	
	--��δ��ŷ�����Ի�
	if nStep_XBTask == 10 then
		task_002_05_1();
		return
	end
	
	---------------------------------- ��������03��ʮ����----------------------------------
	
	--ѯ�ʴ�ʮ����ȥ��
	if nStep_XBTask == 11 then
		task_003_02_0();
		return
	end
	
	--δȡ�öǶ�ǰ�Ի�
	if nStep_XBTask == 12 then
		task_003_02_1();
		return
	end
	
	---------------------------------- ������29����֮��------------------------------------------
	--ȡ�����������
	if nStep_XBTask_01 == 70 then
		task_29_03_0();
		return
	end
	--��δ������Ԫ��
	if nStep_XBTask_01 >= 71 and Is_stage_sign_time(Tb_stage7_map_list[1]) ~= 0 and GetTask(Tb_stage7_sign_task_info[1]) >=Tb_stage7_sign_task_info[2] then
		local tb_stage7_dia_main ={
			"Ta mu�n d� ti�c/ground_log_in",
			"�i�u ki�n d� ti�c/stage_condition",
			"Nh�c nh�/stage_clew",
			"Gi�i thi�u y�n ti�c Long M�n/stage_backgroud",
			"R�i kh�i/end_dilog",
		--	"�ؿ�����/lishi",
			}
		Say(Npc_name..Npc_name.."Ng��i mu�n t� ch�c y�n ti�c �� chi�u ��i cao th� Trung Nguy�n, g� ��n �ng m� b� ch� ta ch� ��i cu�i c�ng c�ng �� xu�t hi�n!",
		getn(tb_stage7_dia_main),
		tb_stage7_dia_main
		)
	else
		Talk(1,"",Npc_name.."Kh�ch quan mu�n t�m ch� tr�? Qu�n tr� c�a ch�ng t�i c� th� xem l� t�t nh�t � Long M�n tr�n n�y, b�i v� trong tr�m d�m quanh ��y ch� c� duy nh�t qu�n tr� c�a ch�ng t�i th�i.")
	end
end;
--**************************����Ϊ�������ؿ�����****************************
--�ؿ���Ϣ
Include("\\script\\lib\\missionfunctions.lua")
--Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")
--����ѡ��
function ground_log_in()
	--PKֵ�޶�
	if GetPKValue() > 3 then
		Talk(1,"",Npc_name.."C�c h� s�t kh� qu� n�ng, h�y gi�m <color=yellow>�i�m PK<3<color> h�y ��n d� ti�c!")
		return
	end
	--�Ѿ�����������ֱ�ӽ���
	if GetTask(Stage7_date_seq) == zgc_pub_day_turn(1)  then
		local map_saved = GetTask(Stage7_map_id)
		if Is_stage_sign_time(map_saved) ~= 0 then
			log_stage7_deal(map_saved)
		else
			Talk(1,"",Npc_name.."<color=yellow>y�n ti�c Long M�n<color> �� k�t th�c, <color=green>L� Nguy�n Kh�nh<color> ch�a bi�t ng�y n�o s� t� ch�c l�i, l�n sau h�y ��n nh�!")
		end
		return
	end
	--����Я���ж�
	if GetItemCount(2,0,1037) == 0 then
		Talk(1,"",Npc_name.."Kh�ch quan ��n d� y�n ti�c? Xin cho xem thi�p m�i, ng��i ���c <color=green>L� Nguy�n Kh�nh<color> m�i ��u c� <color=yellow>thi�p m�i Long M�n<color>! ")
		return
	end
	--��ÿ��е�ͼ
	local free_map_id  = free_map_chk()
	if free_map_id == 0 then
		Talk(1,"",Npc_name.."Ti�u �i�m ��ng l� �� chi�u ��i kh�ng chu ��o! Kh�ch d� y�n ti�c �� ��n ��, m�i kh�ch quan l�n sau h�y ��n, xin l��ng th�!")
		return
	else
		local log_in_num = mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,free_map_id)
		Say(Npc_name.."B�n ���c chuy�n ��n <color=yellow>y�n ti�c Long M�n"..(free_map_id - 1105).."<color>, s� ng��i d� ti�c hi�n l� <color=yellow>"..log_in_num.."<color>, kh�ch quan mu�n v�o kh�ng?",
		2,
		"Ta mu�n v�o/#stage7_login("..free_map_id..")",
		"�� ta suy ngh� l�i/end_dialog"
		)
	end
end
--���ؽ���
function stage7_login(map_id)
	--С�ײ��òμ�
	if GetPlayerFaction() == 0 then
		Talk(1,"",Npc_name.."Ch� c� nh�n v�t �� v�o <color=yellow>l�u ph�i<color> m�i c� th� d� ti�c, ��ng c�p c�c h� ch�a ��! (Nh�c nh�: Ch� c� nh�n v�t �� v�o l�u ph�i m�i c� th� b�o danh).")
		return
	end
	--����ǽ���ؿ���������ֱ�ӽ���
	local player_num = mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,map_id) 
	--�жϹؿ��Ƿ��Ѿ�����
	local mis_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,map_id) 
	if Is_stage_sign_time(map_id) ~= 1 then
			Talk(1,"",Npc_name.."<color=green>L� Nguy�n Kh�nh<color> ��i nh�n n�i: 'Ng��i l� m� l�i th�i kh�ng th� l� h�o ki�t', bu�i ti�c �� b�t ��u, kh�ch quan l�n sau h�y ��n!")
			return
	end
	--�����ж�
	if tonumber(date("%w")) == 5 then
		Stage7_player_num_max = 100
	else
		Stage7_player_num_max = 50
	end
	if  player_num >= Stage7_player_num_max then
		Talk(1,"main",Npc_name.."Xui qu�! L�n n�y ta h�i do d�, ng��i xem gi�p bu�i ti�c kh�c c�n ch� tr�ng n�o kh�ng!")
		return
	end
	--����Я���ж�
	if GetItemCount(2,0,1037) == 0 then
		Talk(1,"",Npc_name.."Kh�ch quan ��n d� y�n ti�c? Xin cho xem thi�p m�i, ng��i ���c <color=green>L� Nguy�n Kh�nh<color> m�i ��u c� <color=yellow>thi�p m�i Long M�n<color>! ")
		return
	end
	if DelItem(2,0,1037,1) ~= 1 then
		Talk(1,"",Npc_name.."Kh�ch quan ��n d� y�n ti�c? Xin cho xem thi�p m�i, ng��i ���c <color=green>L� Nguy�n Kh�nh<color> m�i ��u c� <color=yellow>thi�p m�i Long M�n<color>! ")
		return
	end
	mf_SetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,(player_num +1),map_id)				--���ùؿ���ʼ�Ľ�������
	SetTask(TaskID_feast_prize_step,0)
	SetTask(Stage7_date_seq,zgc_pub_day_turn(1))
	SetTask(Stage7_map_id,map_id)
	WriteLogEx("Yen tiec Long Mon", "tham gia")
	log_stage7_deal(map_id)
end
--����ؿ�
function log_stage7_deal(map_id)
	--����ؿ��Ĵ���
	CleanInteractive()
	if NewWorld(map_id,1625,3182) == 1 then
		mf_JoinMission(FEAST_MS_ID,0,map_id)
	end	
end
--��������
function stage_condition()
	Talk(1,"main",Npc_name.."<color=green>L� Nguy�n Kh�nh<color> ��i nh�n chi�u ��i cao th� thi�n h� t�i ti�u �i�m, n�u c�c h� c� hi�u l�m v�i <color=green>L� Nguy�n Kh�nh<color> h�y �em <color=green>thi�p m�i Long M�n<color> c�a <color=yellow>L� ��i nh�n<color> ph�t ��n d� ti�c! (Ch� �: <color=green>L� Nguy�n Kh�nh<color> m�i tu�n ��i ti�c � Long M�n 1 l�n, h�y mang theo <color=yellow>thi�p m�i Long M�n<color> ��n d� v�o m�i <color=yellow>16:30-16:40 m�i th� 6 v� th� 7<color>)")
end
--������ʾ
function stage_clew()
	Talk(1,"",Npc_name.."Ch� b� sung")
end
--��������
function stage_backgroud()
	Talk(1,"main",Npc_name.."<color=green>L� Nguy�n Kh�nh<color> ng��i ��n �ng b� ch� ch�ng t�i ch� ��i cu�i c�ng c�ng xu�t hi�n, m�c d� vi�c giang h� ch�ng t�i c�ng �t h�i t�i nh�ng <color=green>L� Nguy�n Kh�nh<color> l�n n�y chi�u ��i c�c cao th� Trung Nguy�n nh� mu�n h�a gi�i chuy�n Nh�t Ph�m ���ng �� g�y ra � Ph�ng T��ng, cho n�n <color=green>L� Nguy�n Kh�nh<color> �� ph�t thi�p m�i kh�p thi�n h�, ng��i nh�n ���c thi�p n�y n�n tranh th� th�i gian ��n d� ti�c!")
end
--���߹ر���ʱ���ж�
function Is_stage_sign_time(map_id)
	local ms_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,map_id)
	if ms_state == 0 or ms_state == nil then
		return 0
	else
		if mf_GetMissionV(FEAST_MS_ID,MS_TIMMER_LOOP_ID,map_id) < 3060 then
			return 2
		else
			return 1
		end
	end	
end
--���г����ж�
function free_map_chk()
	local free_map_id = 0
	for i = 1,getn(Tb_stage7_map_list) do
		local ms_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,Tb_stage7_map_list[i])
		if ms_state ~= 0 and ms_state ~= nil then
			if mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,Tb_stage7_map_list[i]) < Stage7_player_num_max then
				free_map_id = Tb_stage7_map_list[i]
				break
			end
		end
	end
	return free_map_id
end
