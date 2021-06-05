Include("\\script\\���\\marriage_head.lua");
CALLBACK_FILE		= "\\script\\���\\npc\\���촫����.lua"		-- �ص��ļ���

g_date 		= 0		-- ����
g_period 	= 0		-- ʱ��
g_couples 	= {}	-- ��ͬ���ͳ��ص���������
g_recvcount = 0		-- �յ��Ĺ������ݿ��¼��Ŀ

g_InfoHeader = "<color=green>Ng��i d�n ch��ng tr�nh<color>:";

-- �Ƿ��ڻ��񳡵�
function in_wedding_field()
	local mapid, x, y = GetWorldPos()
	for i = 1, getn(map_fieldpos) do
		if (map_fieldpos[i][1] == mapid) then
			return 1
		end
	end
	return 0
end

function main()
	if GetGlbValue(GLB_CLOSE_FIELD) == 1 then
		Talk(1,"",g_InfoHeader.."Xin l�i, s�n kh�u h�n l� t�m th�i ��ng c�a. C� th� th� n�o xin h�i ng��i ph�c v�.");
		return 0;
	end;
	if (in_wedding_field() == 1) then
		Say(g_InfoHeader.."Ch�c m�ng. C� mu�n r�i kh�i s�n kh�u h�n l� kh�ng?", 2,
			"��ng �/ask_reason",
			"H�y b�/cancel")
		return
	end
	
	local this_date = curr_date()
	local this_period = curr_period()
	if (g_date ~= this_date or g_period ~= this_period) then
		init(this_date, this_period)
	else
		Say(g_InfoHeader.."C� ph�i c�c h� mu�n ��n s�n kh�u h�n l�?",
			3,
			"Ta c�n ��n s�n kh�u h�n l�/enter",
			"Xem t�n lang, t�n n��ng l� ai?/show",
			"�� ta suy ngh� l�i/cancel")
	end
end

function show()
	local sInfor = "";
	for type = 1, getn(map_fieldinfo) do
		if (g_couples[type][1] ~= "") then
			sInfor = sInfor..format("%s: T�n lang <color=yellow>%s<color> v� t�n n��ng <color=yellow>%s<color>", map_fieldinfo[type][1], g_couples[type][1], g_couples[type][2]).."<enter>";
		else
			sInfor = sInfor..format("%s: tr�ng", map_fieldinfo[type][1]).."<enter>";
		end
	end
	Talk(1,"main",g_InfoHeader.."T�nh h�nh hi�n t�i � c�c s�n kh�u h�n l�: <enter>"..sInfor)
end

function show_more_info()
	--��Ҫ��ʱ����������ݰ�
end;

function ask_reason()
	AskClientForString("leave","�i tr��c ��y!......",1,32,"Sao ph�i r�i kh�i?");
end;	
-- �뿪���񳡵�
function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"R�i kh�i �� l�i tin nh�n:"..sLeaveMsg);
end
--��ʼ��������Ϣ����Ҫ�ǳ�ʼ��g_couples������飬����ʱ�γ�������Ӧ�������������ȥ
function init(date, period)
	-- DEBUG
	gf_ShowDebugInfor(format("init(%d,%d)", date, period))
	for i = 1, getn(map_fieldpos) do
		g_couples[i] = {"", ""}
	end
	
	g_recvcount = 0
	for i = 1, getn(map_fieldpos) do
		local param2 = encode_param2(period, i)
		ApplyRelayShareData(KEY_WEDDING, date, param2, CALLBACK_FILE, "hook_recvsubs")
	end
end

-- �ص���������ȡ����Ԥ����Ϣ
function hook_recvsubs(key, param1, param2, count)
	-- DEBUG
	gf_ShowDebugInfor(format("hook_recvsubs(%s,%d,%d,%d)", key, param1, param2, count))
	
	if (count ~= 0) then
		local period, type = decode_param2(param2)	
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		
		g_couples[type] = {role,wife}
	end
	
	g_recvcount = g_recvcount + 1
	if (g_recvcount == getn(map_fieldpos)) then
		g_date = curr_date()
		g_period = curr_period()
		main()
	end
end

-- ������񳡵ضԻ�
function enter()
	-- DEBUG
	gf_ShowDebugInfor("enter()")
	local name = GetName()
	local sex = GetSex()
	for i = 1, getn(g_couples) do
		if (g_couples[i][sex] == name) then
			-- DEBUG
			gf_ShowDebugInfor("C� ng��i m�i v�o")
			local nDesMapID = map_fieldpos[i][1];
			local nFieldState = mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID);
			if nFieldState == MS_STATE_IDEL then	--Ŀ�곡�ؿ���
				Talk(1,"main",g_InfoHeader.."Hi�n t�i c�c s�n kh�u h�n l� ��u ch�a m�, xin ��i m�t ch�t!");
			else	--������ʱ�����Խ���
				mf_JoinMission(MISSION_ID,CAMP_COUPLE,nDesMapID);
				WriteLog("[K�t h�n]: Ng��i th�n"..GetName().."v�o s�n kh�u k�t h�n, lo�i s�n kh�u:"..i);
			end;
			return
		end
	end
	
	local this_date = curr_date()
	local this_period = curr_period()
	local types = get_invitaion(this_date, this_period)
	if (getn(types) == 0) then	--����ʱ���п���Ϊ��
		Talk(1, "enter",g_InfoHeader.."C� thi�p m�i m�i ���c v�o s�n kh�u k�t h�n")
	else
		local talk = {}
		local nSelCount = 0;
		for i = 1, getn(types) do
			nSelCount = nSelCount + 1;
			talk[nSelCount] = format("%s/#enter_field(%d,%d,%d)",
				map_fieldinfo[i][1],
				this_date,
				this_period,
				i)
		end
		talk[nSelCount+1] = "Ta ch�a t�ng ��n/cancel"
		Say(g_InfoHeader.."Xin ch�n s�n kh�u c�n ��n", getn(talk), talk)
	end
end

-- ������񳡵�
function enter_field(date, period, type)
	local nDesMapID = map_fieldpos[type][1];
	local nDesWeddingID = mf_GetMissionV(MISSION_ID,MV_WEDDING_ID,nDesMapID);
	local nPlayerWeddingID = GetTask(TASK_WEDDING1_ID+type-1);
	local nFieldState = mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID);
	if nFieldState == MS_STATE_IDEL then
		Talk(1,"main",g_InfoHeader.."Hi�n s�n kh�u h�n l� v�n ch�a m� c�a, xin ��i m�t ch�t!");
	elseif mf_GetPlayerCount(MISSION_ID,CAMP_FRIEND,nDesMapID) >= map_fieldinfo[type][5] then
		Talk(1,"main",g_InfoHeader.."Trong s�n kh�u h�n l� kh�ng kh� r�t n�o nhi�t. T�n lang v� t�n n��ng v�n ch�a ��n, ng��i ��i � ��y t� t� v�o nh�!");
	elseif nFieldState == MS_STATE_READY then	--�����׼���׶�
		if is_compere() == 1 then	--�����������
			if nPlayerWeddingID == nDesWeddingID then	--���֮ǰ��ȥ��
				mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--���Խ���
				return
			end;
			if del_invitaion(date, period, type) == 1 then
				mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--���Խ���
			else
				Talk(1,"enter",g_InfoHeader.."C� thi�p m�i m�i ���c v�o s�n kh�u k�t h�n");
			end;
			return
		end;
		Talk(1,"main",g_InfoHeader.."T�n nh�n �ang chu�n b� h�n l�, xin ��i m�t l�t h�y v�o.");
		return
	else	--����ʱ���Ҷ����Խ���
		if nPlayerWeddingID == nDesWeddingID then	--���֮ǰ��ȥ��
			mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);	--���Խ���
			return
		end;
		if del_invitaion(date, period, type) == 1 then
			mf_JoinMission(MISSION_ID,CAMP_FRIEND,nDesMapID);
		else
			Talk(1,"enter",g_InfoHeader.."C� thi�p m�i m�i ���c v�o s�n kh�u k�t h�n");
		end;
	end;
end
--����һ��table��ֻ���ĸ�Ԫ�أ���Ӧ�Ƿ�����Ӧ���ͳ��ص�������0��ʾû�У�1��ʾ��
function get_invitaion(date, period)
	local types = {};
	for i=1,getn(map_fieldinfo) do
		types[i] = 0;	--���ݳ���������ʼ��types����
	end;
	local obj_index, item_index = GetFirstItem()
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		if (genre == ITEM_INVITATION[1] and detail == ITEM_INVITATION[2] and particular == ITEM_INVITATION[3]) then
			local item_date = GetItemParam(item_index, 0)
			local item_period, type = decode_param2(GetItemParam(item_index, 1))
			if (date == item_date and period == item_period) then
				types[type] = 1;
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
		-- DEBUG
		gf_ShowDebugInfor(format("GetNextItem(%d,%d)", obj_index, item_index))
	end
	-- DEBUG
	gf_ShowDebugInfor("get_invitaion return")
	return types
end

function del_invitaion(date,period,type)
	local obj_index, item_index = GetFirstItem()
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		if (genre == ITEM_INVITATION[1] and detail == ITEM_INVITATION[2] and particular == ITEM_INVITATION[3]) then
			local item_date = GetItemParam(item_index, 0)
			local item_period, item_type = decode_param2(GetItemParam(item_index, 1))
			if (date == item_date and period == item_period and type == item_type) then
				if DelItemByIndex(item_index,1) == 1 then
					return 1;
				end;
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
	end
	return 0;
end;
