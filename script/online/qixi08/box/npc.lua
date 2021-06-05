Include("\\script\\online\\qixi08\\box\\head.lua")
Include("\\script\\online\\qixi08\\function.lua")
IB_VERSION = 1
function aoyun_box_main()
	local szGameName,nGameID = QX08_GetTodayGame();
	if nGameID ~= GAME_ID_BOX then
		Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: H�m nay <color=yellow>"..szGameName.."<color>ho�t ��ng b�t ��u, th�t th� v�.");
		return
	end
	Say(Npc_name.."�� t�m �o�t B�o K� Binh <color=yellow>th�t<color>, ch�ng ta ��t nhi�u <color=yellow>b�o r��ng<color> v� <color>c� quan<color> � danh lam th�ng c�nh, ch� th�i gian!",
		5,
		"\nTa mu�n tham gia ho�t ��ng '�o�t B�o K� Binh'/box_log_in",
		"\nTa mu�n t�m hi�u ho�t ��ng '�o�t B�o K� Binh'/box_info",
		"\nTa mu�n bi�t ph�n th��ng ho�t ��ng '�o�t B�o K� Binh'/prize_list",
		"\nTa ��n nh�n ph�n th��ng '�o�t B�o K� Binh'/box_prize",
		"\nCh� ��n xem/end_dialog"
	)
end
--�μӻ
function box_log_in()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: Th�i gian ho�t ��ng l� <color=yellow>9h s�ng-11h t�i<color>, v� thi�u hi�p n�y mu�n xem gi� ch�nh x�c �.");
		return 0;
	end;
	--�ж�������������
--	if GetItemCount(2,0,1069) < 1 then 
--		Talk(1,"",Npc_name.."��ȷ����Я����<color=red>���µ�һ�������뺯<color>��")
--		return
--	end
	--�жϳ����Ƿ���
		--�ѿ������Ƿ��п�λ
	local map_loaded = gf_GetDataTable(GetSameMaps(Box_map_id))
	for i = 2,getn(map_loaded) do
		local last_map_start_sec_num = mf_GetMissionV(MS_ID,MS_LOOP_NUM,map_loaded[i])
		local player_num = getn(mf_GetMSPlayerIndex(MS_ID,0,map_loaded[i]))
		if last_map_start_sec_num < 60 and player_num < Box_player_max and player_num > 0  then
			player_log_in(map_loaded[i])
			return
		elseif player_num == 0 then
			FreeDynamicMap(map_loaded[i],SubWorldID2Idx(map_loaded[i]))
		end
	end
		--���û�г����������ޣ������ӳ���
	if getn(map_loaded) < Map_num_max then
		local map_id,map_index = DynamicLoadMap(Box_map_id)
		if mf_OpenMission(MS_ID,map_id) == 1 then
			player_log_in(map_id)
		else
			return
		end
	else
		Talk(1,"",Npc_name.."Khu thi ��u �� ��y, ��i ch�t!")
		return
	end
end
--��ҽ���
function player_log_in(map_id)
	local last_map_start_sec_num = mf_GetMissionV(MS_ID,MS_LOOP_NUM,map_id)
	local player_num = getn(mf_GetMSPlayerIndex(MS_ID,0,map_id))
	--����޷������򷵻�
	if player_num >= Box_player_max or last_map_start_sec_num > 60 then
		return
	else
		local nMapID = GetWorldPos()
		SetTask(Log_in_mapID,nMapID)
		mf_JoinMission(MS_ID,0,map_id)
	end
end
--�˽�
function box_info()
	Talk(4,"main",
		Npc_name.."S� ng��i v�o s�n ph�i <color=yellow>4 ng��i tr� l�n<color> m�i b�t ��u, m�i s�n nhi�u nh�t l� <color=yellow>10<color> ng��i, tr��c khi khai tr�n c� <color=yellow>1 ph�t<color> chu�n b�, n�u s� ng��i kh�ng ��, h�y thi ��u.",
		Npc_name.."B�o r��ng ch�ng ta ��t trong danh lam th�ng c�nh m�i <color=yellow>30 gi�y<color> s� xu�t hi�n 1 l�n, ch� c� ng��i t�m ���c <color=yellow>b�o r��ng<color>, m�i c� t� c�ch ti�p t�c � l�i trong danh lam th�ng c�nh n�y, ng��c l�i r�i kh�i cu�c ch�i.. Cu�i c�ng c�n l�i m�t ng��i, tr�n ��u k�t th�c.",
		Npc_name.."C� quan ch�ng ta ��t trong danh lam th�ng c�nh kh�ng ph�i �� ch�i, n�u ng��i ch�n c� quan th�nh c�ng, s� t�ng c� h�i s�ng s�t, qu�y ph� th� tr�n c�a ng��i kh�c!",
		Npc_name.."N�u trong 1 ng�y <color=yellow>10 l�n t�m ���c 7 b�o r��ng tr� l�n<color> bao g�m 7 c�i, th� ��n nh�n ph�n th��ng, nh�n danh hi�u ��c bi�t, '<color=yellow>�o�t B�o K� Binh<color>'!"
	)
end
--��������
function prize_list()
	if IB_VERSION == 0 then
		Talk(3,"main",
			Npc_name.."\nT�m ���c <color=yellow>9<color> b�o r��ng nh�n ���c 5 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*200w kinh nghi�m, c�n c� th� chuy�n (��ng c�p/80) b�nh ph��ng*400w �i�m s�c kh�e. C�p 99 t�ng 6 T�i b�o th�ch. \nT�m ���c <color=yellow>8<color> b�o r��ng nh�n ���c 4 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*100w kinh nghi�m, c�n c� th� chuy�n (��ng c�p/80) b�nh ph��ng*400w �i�m s�c kh�e. C�p 99 t�ng 5 T�i b�o th�ch.",
			Npc_name.."\nT�m ���c <color=yellow>7<color> b�o r��ng nh�n ���c 3 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*100w kinh nghi�m, c�n c� th� chuy�n (��ng c�p/80) b�nh ph��ng*350w �i�m s�c kh�e. C�p 99 t�ng 4 T�i b�o th�ch.\nT�m ���c <color=yellow>4-6<color> b�o r��ng nh�n ���c 2 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*100w kinh nghi�m, c�n c� th� chuy�n (��ng c�p/80) b�nh ph��ng*300w �i�m s�c kh�e. C�p 99 t�ng 3 T�i b�o th�ch.",
			Npc_name.."\nT�m ���c <color=yellow>1-3<color> b�o r��ng nh�n ���c 1 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*100w kinh nghi�m, c�n c� th� chuy�n (��ng c�p/80) b�nh ph��ng*250w �i�m s�c kh�e. C�p 99 t�ng 3 T�i b�o th�ch.\nN�u trong 10 l�n t�m ���c 7 ho�c nhi�u b�o r��ng, th� ��n nh�n ph�n th��ng, nh�n ���c danh hi�u ��c bi�t, '�o�t B�o K� Binh'!"
		)
	else
		Talk(3,"main",
			Npc_name.."	T�m ���c <color=yellow>9<color> b�o r��ng nh�n ���c 5 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*500w kinh nghi�m. C�p 99 t�ng 6 goi B�o th�ch.\nT�m ���c <color=yellow>8<color> b�o r��ng nh�n ���c 4 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*420w kinh nghi�m. C�p 99 t�ng 5 T�i b�o th�ch.",
			Npc_name.."T�m <color=yellow>7<color> b�o r��ng nh�n ���c 3 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*380w kinh nghi�m. C�p 99 t�ng 4 T�i b�o th�ch.\nT�m ���c <color=yellow>4-6<color> b�o r��ng nh�n ���c 2 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*350w kinh nghi�m. C�p 99 t�ng 3 T�i b�o th�ch.",
			Npc_name.."T�m ���c <color=yellow>1-3<color> b�o r��ng nh�n ���c 1 �i�m t�ch l�y. Ngo�i ra c�p 99 tr� xu�ng t�ng (��ng c�p/80) b�nh ph��ng*300w kinh nghi�m. C�p 99 t�ng 2 T�i b�o th�ch.\nN�u trong 10 l�n t�m ���c ���c 7 b�o r��ng tr� l�n (bao g�m 7 c�i), s� nh�n ���c danh hi�u ��c bi�t, '�o�t B�o K� Binh'!"
		)
	end
end
		
--�����
function box_prize()
	if GetTask(Box_prize_get_flag) == 1 then
		Talk(1,"",Npc_name.."H�m nay ng��i �� nh�n ph�n th��ng r�i, khi kh�c h�y quay l�i!")
		return
	end
	if GetTask(Box_prize_date_seq) ~=zgc_pub_day_turn(1) then
		Talk(1,"",Npc_name.."H�m nay ng��i ch�a tham gia ho�t ��ng �o�t b�o, ph�n th��ng ��u m� nh�n!")
		return
	elseif GetTask(Box_best_prize) <= 0 then
		Talk(1,"",Npc_name.."��y l��, �t nh�t c�ng c� ���c 1 r��ng, m�i c� th��ng.")
		return
	else
		QX08_GetAward(2,Tb_box_num_prize[min(GetTask(Box_best_prize),9)],Box_prize_get_flag)
	end
end
