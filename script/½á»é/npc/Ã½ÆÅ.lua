Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");

ITEM_SATIN 			= {2, 1, 15}		-- �ж�
COUNT_SATIN 		= 10				-- �ж���Ŀ
COUNT_MEIJIN		= 100				-- ��ҽ�����

CALLBACK_FILE		= "\\script\\���\\npc\\ý��.lua"		-- �ص��ļ���
FUTURE_DAY_COUNT	= 7					-- ��Ԥ��δ�����ڵ�����

STATUS_IDLE			= 0					-- ����״̬������
STATUS_BIDUP		= 1					-- ����״̬�����ھ�Ͷ
STATUS_OVER			= 2					-- ����״̬�����
--==================�����ļ۸�==============================================================================
HIRE_CLOTH_COST = 1;	--���·��������
HIRE_CLOTH2_COST = 1;	--���������������
BUY_DOOLY_COST = 1;	--������������
BUY_RING_COST = 520;		--���ָ�������
BUY_QINGTIE_PACKET = 99	--���������������
CANCEL_MARRIAGE_COST = 500	--ȡ����Լ����Ľ���
ANNOUCE_FRIENDS_BEGIN_COST = 20	--֪ͨ��һ��콫Ҫ��ʼ����Ľ��� 
ANNOUNCE_INVITAION_COST = 20	--
ANNOUNCE_ALL_PLAYER_COST = 20
--==========================================================================================================
g_InfoHeader = "<color=green>B� mai<color>:";
--����ṹ�ľ��������ǣ�map_fields = ����{ʱ��{��������{������Ϣ}}}
map_fields = {}

-- ������Ҫ����Ʒ������
map_item_nazheng = {
	{1, 1, 12, 36},		-- ������
	{1, 1, 15, 36},		-- �ƽ��
	{2, 1, 54, 36},		-- ���
	{2, 9,  3, 36},		-- ��ɫ˿
	{2, 1, 39,  1}		-- ҹ����
}

-- �ɲɣ�Ů������
function process_nacai_girl()
	Talk(1, "",g_InfoHeader.."B�n nam t� ��i v�i b�n n� r�i ��n g�p ta.")
end

-- �ɲɣ��з���ý�����Ʒ
function process_nacai_boy_gift()
	if (GetCash() < COUNT_MEIJIN*10000 or
		GetItemCount(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3]) < COUNT_SATIN) then
		Talk(1, "",g_InfoHeader.."L� v�t c��i h�i nh�t ��nh kh�ng th� thi�u, t�t c� g�m: <color=red>100<color> ti�n v�ng v� <color=red>10<color>c�y v�i g�m, mau �i chu�n b�.")
	else
		-- �۳�ý�����Ʒ
		DelItem(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3], COUNT_SATIN)
		Pay(COUNT_MEIJIN*10000)
		-- �����������
		set_wedding_step(2)
		Talk(1, "",g_InfoHeader.."Ti�n mai m�i v� l� v�t ��u nh�n c� r�i c�n kh�ng mau t� ��i v�i � trung nh�n ��n ��y g�p ta.")
		hint_step(3)
		WriteLog("[K�t h�n]:"..GetName().."Giao ti�n mai m�i v� l� v�t")
	end
end

-- �ɲɣ��з�����
function process_nacai_boy()
	if (GetLevel() < 15) then
		Talk(1, "",g_InfoHeader.."Ng��i t� ch�t c�ng kh�ng t� th�o n�o s�m t�m ���c � trung nh�n, nh�ng h�n nh�n l� chuy�n ��i s�. Theo lu�t, ng��i ch�a ��n c�p <color=red>15<color> th� kh�ng th� k�t h�n. Ng��i c� g�ng luy�n th�m m�t th�i gian n�a r�i quay l�i nh�!")
	elseif (GetPlayerFaction() == 0) then
		Talk(1, "",g_InfoHeader.."Ng��i ph�i gia nh�p m�n ph�i xin � ki�n c�a ch��ng m�n r�i m�i ���c k�t h�n.")
	elseif (GetTask(TASK_FACTION_OUT) == 0) then
		Talk(1, "",g_InfoHeader.."Ng��i"..map_faction[GetPlayerFaction()][1].." n�n b�o cho ch��ng m�n"..map_faction[GetPlayerFaction()][2].."H�y <color=yellow>xu�t s�<color> r�i ��n g�p ta!")
	else
		set_wedding_step(1)
		hint_step(2)
		Say(g_InfoHeader.."Th� n�y �i, ng��i h�y chu�n b� (<color=red>100<color> l��ng v�ng) v� (<color=red>10<color> cu�n g�m v�c) l�m l� v�t, ta s� ��ch th�n gi�p ng��i l�m l� g�m h�i. C�c ��i trai g�i quanh ��y ��u do m�t tay ta mai m�i, ch� c�n c� th�nh �, b�o ��m ng��i s� c��i ���c v� hi�n. <color=yellow>N�u nh�t th�i t�m kh�ng ���c th� ng��i c� th� ��n Ng� c�c mua K�t h�n l� bao, nh�ng g� c�n cho l� h�i ��u c� trong K�t h�n l� bao<color>.",
			2,
			"Ta �� chu�n b� ti�n mai m�i v� l� v�t r�i/process_nacai_boy_gift",
			"Ta s� chu�n b�/cancel")
	end
end

-- �ɲ�
function process_nacai()
	if (GetSex() == 1) then
		Say(g_InfoHeader.."Xem ng��i h�o ki�t tu�n t� nh� v�y �� c� � trung nh�n ch�a? N�u c� r�i th� chuy�n h�n s� �� ta lo li�u. Nh�ng ta ch� gi�p cho nh�ng ng��i ��c th�n th�i ��y nh�!",
			2,
			"Ta �� c� � trung nh�n, ta mu�n k�t h�n./process_nacai_boy",
			"Ng��i ch�a c� � trung nh�n, quay l�i sau nh�!/cancel")
	elseif (get_lover_code(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."C� n��ng �� c� ng��i t�m ��u � h�p ch�a? C�n ta gi�p kh�ng?")
	else
		Say(g_InfoHeader.."C� n��ng y�n t�m, m�i vi�c c� �� b� mai n�y lo li�u.",
			2,
			--"�Ƿ�Ҫ���Relay���ݣ�/clear_data",
			"Ta mu�n suy ngh� l�i chuy�n h�n s�./cancel_engagement",
			"V�y ta ��i ng��i./cancel")
	end
end
-- �����Լ�Ի���Ů��
function cancel_engagement()
	local selTab = {
				"��ng �/disengage_girl",
				"�� ta suy ngh� l�i/cancel",
				}
	Say(g_InfoHeader.."Sao th�? Kh�ng mu�n k�t h�n �? N�u ng��i h�y h�n ��c ph�i n�p b�i th��ng <color=yellow>"..CANCEL_MARRIAGE_COST.." L� kim<color>, suy ngh� k� nh�!",getn(selTab),selTab)
end;

function disengage_girl()	--Ů��ȡ����Լ
	if Pay(CANCEL_MARRIAGE_COST*10000) == 1 then
		clear_task();
		Talk(1,"",g_InfoHeader.."Ta �� gi�p ng��i h�y h�n ��c. Hy v�ng l�n sau kh�ng ph�i nh� v�y n�a nh�, h�n nh�n kh�ng ph�i tr� ��a ��u.")
		Msg2Player("B�n �� h�y h�n ��c");
		WriteLog("[K�t h�n]:"..GetName().."H�n ��c �� b� h�y");
	else
		Talk(1,"",g_InfoHeader.."Ti�n v�ng mang theo kh�ng ��, kh�ng th� h�y h�n ��c.");
	end;
end;
-- �����Լ�Ի����з�
function disengage_talk()
	Say(g_InfoHeader.."Ng��i mu�n h�y h�n ��c �? Nh� v�y nh�ng n� l�c c�a ng��i xem nh� c�ng c�c, l� v�t ng��i giao c�ng kh�ng th� l�y l�i. Ng��i ngh� k� �i.",
		2,
		"��ng �/disengage_boy",
		"�� ta suy ngh� l�i/cancel")
end

-- ȡ����Լ
function disengage_boy()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	if (sub_date ~= 0 and map_fields[sub_date] ~= nil) then
		local param2 = GetTask(TASK_WEDDING_FIELD)
		local sub_year, sub_mon, sub_day = decode_date(sub_date)
		local sub_period, sub_type = decode_param2(param2)
		local field_inf = map_fields[sub_date][sub_period][sub_type]
		if (field_inf[ITEMKEY_ROLE] == GetName()) then
			local caption = format(g_InfoHeader.."B�n ��t v�o <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s<color>, v�i gi� l� <color=red>%d<color> l� kim, �ang x�p th� 1 kh�ng th� h�y b� h�n nh�n. ",
				sub_mon,
				sub_day,
				map_period[sub_period][5],
				map_fieldinfo[sub_type][1],
				GetTask(TASK_WEDDING_COST))
			Talk(1, "main", caption)
			return
		end
	end
	clear_task();
	Talk(1,"",g_InfoHeader.."Ta �� gi�p ng��i h�y h�n ��c. Hy v�ng l�n sau kh�ng ph�i nh� v�y n�a nh�, h�n nh�n kh�ng ph�i tr� ��a ��u.");
	Msg2Player("B�n �� h�y h�n ��c");
	WriteLog("[K�t h�n]:"..GetName().."H�n ��c �� b� h�y");
end

-- ����
function process_wenming()
	if GetTeamSize() < 2 then
		Talk(1, "",g_InfoHeader.."Ti�n mai m�i v� l� v�t �� nh�n, t� ��i v�i � trung nh�n ��n g�p ta.")
	elseif GetTeamSize() > 2 then
		Talk(1, "",g_InfoHeader.."H�n nh�n l� chuy�n ��i s�, kh�ng �� ng��i kh�c can thi�p v�o.")
	elseif GetSex() == 2 then
		Say(g_InfoHeader.."C� n��ng y�n t�m, m�i vi�c c� �� b� mai n�y lo li�u.",
			2,
			--"�Ƿ�Ҫ���Relay���ݣ�/clear_data",
			"Ta mu�n suy ngh� l�i chuy�n h�n s�./cancel_engagement",
			"V�y ta ��i ng��i./cancel")
	elseif GetCaptainName() ~= GetName() then
		Talk(1,"",g_InfoHeader.."V�i c��ng v� l� ��i tr��ng ��n ho�n t�t c�c b��c quan tr�ng.");
	else
		local lover = get_team_lover(PlayerIndex)
		Say(g_InfoHeader.."Ng��i n�y s� l� <color=yellow>" .. GetName(lover) .. "<color> th� t� c�a ng��i �? Th�t l� ��p ng��i ��p n�t. C�c ng��i ��ng k� k�t h�n lu�n ch�?",
			2,
			"��ng v�y, ta mu�n th�nh th�n./process_wenming_confirm",
			"�� ta suy ngh� l�i!/cancel")
	end
end

-- ���˫���Ƿ�û�л�Լ
function check_empty_contract(bridegroom, bride)
	if (get_lover_code(bridegroom) ~= 0) then
		Talk(1, "",g_InfoHeader.."Ng��i �� l� ng��i ��nh h�n, kh�ng th� ��ng k� th�m l�n n�a.")
		return 0
	elseif (get_lover_code(bride) ~= 0) then
		Talk(1, "",g_InfoHeader.."C� n��ng �� �� ��nh h�n, kh�ng th� th�nh th�n v�i ng��i.")
		return 0
	else
		return 1
	end
end

-- ���˫���Ƿ����л�Լ
function check_eachother_contract(bridegroom, bride)
	local selTab = {
			"Ta mu�n suy ngh� l�i chuy�n h�n s�./disengage_talk",
			"Bi�t r�i!/cancel",
			}
	--���ɣ�������������
	if (get_lover_code(bridegroom) == Hash(GetName(bride))) and (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		if get_lover_code(bride) == 0 then
			Say(g_InfoHeader.."C� n��ng n�y �� ��nh h�n, n�u mu�n th�nh th�n v�i ng��i c� �y ph�i h�y b� h�n ��c tr��c ��.",getn(selTab),selTab)
		else
			Say(g_InfoHeader.."C� n��ng �� �� ��nh h�n, kh�ng th� th�nh th�n v�i ng��i.",getn(selTab),selTab);
		end;
		return 0
	--���ɡ�������
	elseif (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		Say(g_InfoHeader.."Ng��i �� l� ng��i ��nh h�n, kh�ng th� ��ng k� th�m l�n n�a.",getn(selTab),selTab);
		return 0
	else
		return 1
	end
end

-- ������������������ֻ�����з�����
function check_marriage_condition(check)
	-- �����з����ӳ�
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then	
		local msg = {
			"C�ng t� ��i v�i � trung nh�n ��n g�p ta.",
			"Hai ng��i c�ng t� ��i do b�n nam l�m ��i tr��ng ��n g�p ta.",
		}
		Talk(1, "",g_InfoHeader..msg[GetSex()])	--����Ӧ��������
		return 0
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "",g_InfoHeader.."� trung nh�n c�a ng��i ��y sao? Xem 2 ng��i h�nh ph�c qu�!")
	elseif (GetLevel(lover) < 13) then
		Talk(1, "",g_InfoHeader.."C� n��ng n�y c�n qu� tr�. Theo lu�t thi�u n� ch�a ��n c�p <color=red>13<color> th� kh�ng th� k�t h�n. Ng��i c� th� ��i v� c�ng c� �y luy�n th�m nh�!")
	elseif (is_married(lover) == 1) then
		Talk(1, "",g_InfoHeader.."C� n��ng n�y �� k�t h�n v�i m�t ng��i kh�c, nh�t ��nh kh�ng th� c�ng ng��i th�nh th�n.")
	elseif (GetPlayerFaction(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."Ng��i ph�i gia nh�p m�n ph�i xin � ki�n c�a ch��ng m�n r�i m�i ���c k�t h�n.")
	elseif (GetPlayerFaction(lover) == 0) then
		Talk(1, "",g_InfoHeader.."C� n��ng n�y v�n ch�a c� ng��i ch�ng gi�m �? H�n s� nh� v�y kh�ng th� g�i l� danh ch�nh ng�n thu�n ���c. H�y gia nh�p m�n ph�i ���c s� ��ng � c�a ch��ng m�n sau �� ��n g�p ta.")
	elseif (GetTask(TASK_FACTION_OUT, PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."Ng��i"..map_faction[GetPlayerFaction()][1].." n�n b�o cho ch��ng m�n"..map_faction[GetPlayerFaction()][2].."Ng��i ph�i xu�t s� r�i m�i ���c k�t h�n.")
	elseif (GetTask(TASK_FACTION_OUT, lover) == 0) then
		Talk(1, "",g_InfoHeader.."C� n��ng ph�i xu�t s� r�i m�i ���c k�t h�n.")
	elseif (check(PlayerIndex, lover) == 1) then
		return 1
	end
	return 0
end

-- ������ȷ��Ҫ���
function process_wenming_confirm()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		local name = GetName()
		Say(g_InfoHeader.."��ng n�ng v�i, ch� c�n c� n��ng �y ��ng � ta s� cho 2 ng��i k�t h�n.",
			2,
			"Thay ta d� th�m � c�a c� �y/ask_engage",
			"�� ta suy ngh� l�i/cancel")
	end
end

function ask_engage()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			g_InfoHeader.."Ng��i ch�nh l�" .. GetName(lover) .. " c� n��ng, <color=yellow>" .. GetName() .. "<color> �� nhi�u l�n mu�n c�ng c� ��nh h�n, thi�u hi�p �� y�u th��ng c� th�t l�ng. Ta �� l�m mai cho nhi�u ng��i nh�ng ch�a th�y ai t�t nh� v�y. Thi�u hi�p �y c�n s�m c� s�nh l�, ch� c�n ch� s� ��ng � c�a c�.",
			2,
			"��ng �/agree_engage",
			"Kh�ng ��ng �/disagree_engage")
	end
end

-- Ů���ܾ�����
function disagree_engage()
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			SetPlayerScript(CALLBACK_FILE, lover)		
			Talk2SomeOne(lover,
				1,
				"",
				g_InfoHeader.."Xin l�i, c� n��ng �y ch�a hi�u g� v� ng��i n�n �� t� ch�i. Ng��i n�n t�o c� h�i �� c� �y hi�u th�m v� ng��i.")
			Msg2Player(format("B�n quy�t ��nh c�ng v�i %s k�t h�n", GetName(lover)))
		end
	end
end

-- Ů��ͬ�ⶩ��
function agree_engage()
	-- DEBUG
	gf_ShowDebugInfor("agree_engage")
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			local caption = format(g_InfoHeader.."B�n nam <color=yellow>%s<color> (��ng c�p %d) c�u h�n c�ng <color=yellow>%s<color> (��ng c�p%d). Hai b�n �� quy�t ��nh ti�n t�i h�n nh�n. Ta s� gi�p c�c ng��i trao ��i danh thi�p, 2 ng��i ch�nh th�c ��nh h�n.",
				GetName(lover),
				GetLevel(lover),
				GetName(PlayerIndex),
				GetLevel(PlayerIndex))
			SetPlayerScript(CALLBACK_FILE, lover)		
			Say2SomeOne(lover,
				caption,
				2,
				"Kh�ng c� v�n �� g�/process_wenming_confirm2",
				"Ta s� quay l�i sau!/cancel")
			Msg2Player(format("Ta ��ng � c�ng %s k�t h�n", GetName(lover)))
		end
	end
end

function process_wenming_confirm2()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		set_lover_code(lover, Hash(GetName(myself)))
		set_lover_code(myself, Hash(GetName(lover)))
		-- �����������
		set_wedding_step(3)
		Talk(1, "", g_InfoHeader.."Ta �� gi�p c�c ng��i trao ��i danh thi�p, b�y gi� b�n nam s� t�ng qu� cho b�n n�.")
		SaveNow();
		PlayerIndex = lover;
		Talk(1, "", g_InfoHeader.."Ta �� gi�p c�c ng��i trao ��i danh thi�p, b�y gi� b�n nam s� t�ng qu� cho b�n n�.")
		SaveNow();
		PlayerIndex = myself;
		WriteLog("[K�t h�n]:"..GetName(myself).."c�ng v�i "..GetName(lover).."Ki�n l�p h�n ��c");
	end
end

-- �ɼ�
function process_naji()
	hint_step(4)
	Say(g_InfoHeader.."�� t�ng qu� ch�a? Ti�p theo ng��i ph�i chu�n b� l� h�i g�m <color=red>��o Hoa H��ng 36 b�nh<color>, <color=red>B�nh B�t v�ng 36 h�p<color>, <color=red>G�m v�ng 36 x�p<color>, <color=red>T� ng� s�c 36 cu�n<color>, <color=red>D� Minh Ch�u 5 vi�n<color>. Chu�n b� �� r�i c�ng t� ��i v�i th� t� c�a ng��i ��n g�p ta.",
		3,
		"Ta �� chu�n b� xong r�i/process_naji_confirm",
		"Ta mu�n suy ngh� l�i chuy�n h�n s�./disengage_talk",
		"Ta v�n ch�a chu�n b� xong/cancel")
end

-- ���磺ȷ��
function process_naji_confirm()
	-- �����з����ӳ�
	local msg = g_InfoHeader.."B�n nam ��a � trung nh�n ��n g�p ta"
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", msg)
		return
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "", g_InfoHeader.."N�y, l�n tr��c ng��i ��a ��n m�t c� n��ng sao l�n n�y l�i l� g� n�y h�?")
		return
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."C� n��ng l�n tr��c ng��i ��a ��n kh�ng ph�i l� ng��i n�y.")
		return
	end
	
	local item_count = getn(map_item_nazheng)
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		if (GetItemCount(item[1], item[2], item[3]) < item[4]) then
			Talk(1, "", g_InfoHeader.."Chu�n b� xong l� h�i c�ng t� ��i v�i � trung nh�n ��n g�p ta. L� h�i g�m: <color=red>��o Hoa H��ng 36 b�nh<color>, <color=red>B�nh B�t v�ng 36 h�p<color>, <color=red>G�m v�ng 36 x�p<color>, <color=red>T� ng� s�c 36 cu�n<color>, <color=red>D� Minh Ch�u 1 vi�n<color>.")
			return
		end
	end
	
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		DelItem(item[1], item[2], item[3], item[4])
	end
	
	-- �����������
	set_wedding_step(4)
	process_qingqi()
	WriteLog("[K�t h�n]:"..GetName().."Giao l� v�t");
end
--�ж�Ԥ���ĳ����Ƿ����
function is_field_timeout()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if get_wedding_stat() == 1 then
		if sub_date > cur_date then	--��ǰ����С�ڳ�������
			return 0
		elseif sub_date == cur_date then	--ͬһ��
			if tonumber(date("%H")) > map_period[sub_period][3]	then--�Ƚ�Сʱ
				return 1
			else
				return 0;
			end;
		else
			return 1;
		end;
	else
		return 0;	
	end;
end;
-- ���񳡵�Ԥ��״̬������ֵ0��û��Ԥ����1��Ԥ���ɹ���2��Ԥ��ʧ�ܣ�3��Ԥ�����ȣ�4��Ԥ�����-1��Ԥ������
function get_sub_stat()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if (sub_date == 0) then
		return 0		-- û��Ԥ��
	elseif (map_fields[sub_date] == nil) then	--map_fields�����³�ʼ���ˣ����Ծ�Ϊnil��
		return -1		-- Ԥ������
	else	--���map_fieldsû����ʼ���Ϳ���������ж��Ƿ������
		local sub_time = encode_time(map_period[sub_period][3], map_period[sub_period][4], 0)
		if (cmp_datetime(sub_date, sub_time, cur_date, cur_time) <= 0) then
			return -1	-- Ԥ������
		end
	end
	
	local field = map_fields[sub_date][sub_period][sub_type]
	local name = GetName()
	local field_stat = field[ITEMKEY_STAT]
	if (field_stat == STATUS_OVER or
		cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], cur_date, cur_time) <= 0) then
		if (name == field[ITEMKEY_ROLE]) then
			return 1	-- Ԥ���ɹ�
		else
			return 2	-- Ԥ��ʧ��
		end
	else
		if (name == field[ITEMKEY_ROLE]) then
			return 3	-- Ԥ������
		else
			return 4	-- Ԥ�����
		end
	end
end

-- ����
function process_qingqi()
	-- ���񳡵�Ԥ��״̬������ֵ0��û��Ԥ����1��Ԥ���ɹ���2��Ԥ��ʧ�ܣ�3��Ԥ�����ȣ�4��Ԥ�����-1��Ԥ������
	local sub_stat = get_sub_stat()
	-- DEBUG
	gf_ShowDebugInfor(format("process_qingqi: sub_stat==%d", sub_stat))
	local talk = {
		"�� ta xem s�n kh�u h�n l� � ��u/process_qingqi_selectfield",
		"Ta mu�n xem b�n trong s�n kh�u/preview_fields",
--		"���c! Ta t� ch�c h�n l� m� kh�ng c�n s�n kh�u/process_qingqi_nofield",
		"Ta mu�n suy ngh� l�i chuy�n h�n s�./disengage_talk",
		"�� ta suy ngh� l�i/cancel"
	}
	local caption = g_InfoHeader.."L� h�i �� chu�n b� xong, b�y gi� ��n <color=yellow>Th�nh k�<color>. Ta c� v�i ch� n�y ng��i th� ��n �� xem sao."

	local sub_year, sub_mon, sub_day = decode_date(GetTask(TASK_WEDDING_DATE))
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if get_wedding_stat() == 1 and sub_stat ~= 0 then	--���Ԥ���ɹ��������ڽ׶Σ���ô����û��ȡ������
		caption = format(g_InfoHeader.."B�n ��t v�o th�nh c�ng <color=red>th�ng %d ng�y %d %s<color> - <color=red>%s<color>. ��y l� b�n ch� d�n c�ch s� d�ng s�n kh�u h�n l�,  c� g� ch�a r� ng��i c� ��n t�m ta. ",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		Say(caption, 2,
			format("Nh�n thi�p m�i v� k�t h�n l� bao/#take_invitation(%d)", map_fieldinfo[sub_type][4]),
			"�� ta ngh� l�i/cancel")		
		return 0;
	end;
	if (sub_stat == -1) then	--������
		caption = format(g_InfoHeader.."B�n ��t <color=red>th�ng %d ng�y %d %s<color> - <color=red>%s<color> �� qu� h�n,  kh�ng th� l�y l�i ti�n ��u gi�. H�y ch�n l�i khu v�c h�n l�.",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		clear_subs();
		Say(caption, getn(talk), talk)
	elseif (sub_stat == 0) then	--û��Ԥ��
		if (get_wedding_stat() == 1) then
			hint_step(5)
			Say(g_InfoHeader.."N�u kh�ng k�t h�n � s�n kh�u h�n l� c�c ng��i c� th� t� ��i v�i nhau ��n <color=red>Th�y Y�n<color> g�p <color=red>Nguy�t L�o<color>.",
				2,
				"Ta mu�n suy ngh� l�i chuy�n h�n s�./disengage_talk",
				"V�y ch�ng ta s� ��n g�p Nguy�t L�o/cancel")
		elseif (check_marriage_condition(check_eachother_contract) ~= 0 or get_sub_stat() ~= 0) then
			Say(caption, getn(talk), talk)
		end
	elseif (sub_stat == 1) then
		if (get_wedding_stat() == 0) then
			on_sub_success()
		else
			hint_step(5)
			Say(g_InfoHeader.."Ng��i �� ��t s�n kh�u �� k�t h�n, nh�t ��nh ph�i ��ng gi�. K�t h�n � ��y, th�ng qua c�c nghi th�c c�c ng��i s� tr� th�nh phu th�. N�u mu�n ��n gi�n h�n ng��i c�ng c� th� ��n Th�y Y�n g�p Nguy�t L�o.",
				1,
				"Ta bi�t r�i/main")
		end
		--set_wedding_step(5);	--�������͵���ӭ��
	elseif (sub_stat == 2) then	--Ԥ��ʧ��
		Say(g_InfoHeader.."Ng��i �� kh�ng ��t ���c s�n kh�u h�n l�.",
			getn(talk), talk)
	elseif (sub_stat == 3 or	--3��Ԥ������
			sub_stat == 4) then	--4��Ԥ�����
		Say(caption, 2,
			"�� ch�ng ta xem l�i/process_qingqi_selectfield",
			--"�������¿���һ���ҵĻ���/disengage_talk",
			"�� ta suy ngh� l�i/cancel")
	end
end

function preview_fields()
	local selTab = {
			"Y�t chi ti�u tr�c/#preview_fields_confirm(1)",
			"C� ��o/#preview_fields_confirm(2)",
			"��ng ph�ng hoa ch�c/#preview_fields_confirm(3)",
			"V�n S�n ��nh/#preview_fields_confirm(4)",
			"Kh�ng c�n ��u/cancel",
			}
	Say(g_InfoHeader.."S�n kh�u � ��y l� ��p nh�t, c� mu�n tham quan kh�ng?",getn(selTab),selTab);
end;

function preview_fields_confirm(nType)
	local nOldPlayerIndex = PlayerIndex;
	local nFellowIndex = GetInteractivePlayerIndex();
	local nMyName = GetName();
	if nFellowIndex ~= 0 then
		if GetTask(TASK_WEDDING_LOVER,nFellowIndex) ~= Hash(nMyName) then	--����Է����Լ�û��Լ
			CleanInteractive();
		end;
	end;
	local tField = {
			[1] = {855,1543, 3220},
			[2] = {856,1603, 3276},
			[3] = {857,1544, 3213},
			[4] = {858,1603, 3326},
			}
	NewWorld(tField[nType][1],tField[nType][2],tField[nType][3]);
end

-- ��Relay���󳡵�Ԥ����Ϣ
function process_qingqi_selectfield()
	set_wedding_stat(0);	--��ʾδ����ɹ�
	show_subs()
end

-- ���ĳ���Ƿ��п��г���
function check_idle_date(fields)
	for i = 1, getn(fields) do
		if (check_idle_period(fields[i]) == 0) then
			return 0
		end
	end
	return 1
end

-- ���ĳʱ���Ƿ��п��г���
function check_idle_period(fields)
	local date = curr_date()
	local time = curr_time()
	for i = 1, getn(map_fieldinfo) do
		local stat = fields[i][ITEMKEY_STAT]
		if (stat == STATUS_IDLE) then
			-- ����
			return 1
		elseif (stat == STATUS_BIDUP and
			cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], date, time) > 0) then
			-- ��Ͷ�У�δ����
			return 1						
		end
	end
	return 0
end

-- ��ʾ����Ԥ����Ϣ
function show_subs()
	local future = future_days(2, FUTURE_DAY_COUNT)
	local talk = {}
	local count = getn(future)
	
	for i = 1, count do
		local date = future[i]
		local year, mon, day = decode_date(date)
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("show_subs: init map_fields[%d]", date))
			map_fields[date] = init_date_field()
		end
		
		if (check_idle_date(map_fields[date]) == 1) then
			talk[i] = format("th�ng %d ng�y %d/#show_subs_date(%d,%d,%d)", mon, day, year, mon, day)
		else
			talk[i] = format("th�ng %d ng�y %d (T�t c� c�c s�n kh�u ��u tr�ng)/cancel", mon, day)
		end	
	end	
	
	--talk[count + 1] = "�ҵ�Ͷ�����/show_mysubs"
	--talk[count + 2] = "��Ҫȡ�ؾ�Ͷ�����/withdraw"
	talk[count + 1] = "Quay l�i ��i tho�i tr��c/main"
	talk[count + 2] = "S� quay l�i sau/cancel"
	Say(g_InfoHeader.."Xin ch�n ng�y", getn(talk), talk)
end

function withdraw()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng��i c�n s�p x�p l�i h�nh l�, kho�ng tr�ng kh�ng ��.");
		return 0;
	end;
	local task_cost = GetTask(TASK_WEDDING_COST)
	if (task_cost == 0) then
		Talk(1, "main", g_InfoHeader.."Ch�a ��t l�i")
		return
	end
	
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(task_date)
	local this_date = curr_date()
	local this_time = curr_time()
	if (task_date < curr_date()) then
		local caption = format(g_InfoHeader.."B�n ��t v�o <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s<color>, v�i gi� l� <color=red>%d<color> l� kim. �� qu� h�n,  kh�ng th� l�y l�i ti�n ��t c�c ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "main", caption)
		return
	else
		local field = map_fields[task_date][task_time][task_type]
		if (field[ITEMKEY_ROLE] == GetName()) then
			local close_date = field[ITEMKEY_CLOSEDATE]
			local close_time = field[ITEMKEY_CLOSETIME]
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER or
				cmp_datetime(close_date, close_time, this_date, this_time) <= 0) then
				caption = format(g_InfoHeader.."B�n ��t v�o <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s<color>,  gi� ti�n l�<color=red>%d<color>. B�n ��t ti�n th�nh c�ng.",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			else
				caption = format(g_InfoHeader.."B�n ��t v�o <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s<color>,  gi� ti�n l�<color=red>%d<color>. B�n �ang x�p th� 1, kh�ng th� r�t l�i ti�n �� ��t.",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			end
			Talk(1, "main", caption)
			return
		end
	end
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], task_cost)
	clear_subs()
	Msg2Player(format("Ng��i �� ��t %d L� kim.", task_cost))
	WriteLog("[K�t h�n]:"..GetName().."Do m�t s� nguy�n nh�n �� r�t l�i"..task_cost.." L� kim, t�i h�m s� withdraw")
end

function diff_time(time1, time2)
	local hour1, min1, sec1 = decode_time(time1)
	local hour2, min2, sec2 = decode_time(time2)
	local t1 = hour1 * 3600 + min1 * 60 + sec1
	local t2 = hour2 * 3600 + min2 * 60 + sec2
	if (t1 < t2) then
		t1 = t1 + 24 * 3600
	end
	return t1 - t2
end

-- Ͷ��ɹ�
function on_sub_success()
	local wedding_stat = get_wedding_stat()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (wedding_stat == 1) then
		local task_cost = GetTask(TASK_WEDDING_COST)
		local caption = format(g_InfoHeader.."B�n ��t <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s,  v�i gi� l� <color=red>%d<color> l� kim. Phi�n ��u gi� �� k�t th�c,  b�n �� ��u gi� th�nh c�ng v� nh�n ���c quy�n s� d�ng khu v�c h�n l�.",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "", caption)
	else
		local caption = format(g_InfoHeader.."B�n �� d� ��nh th�nh c�ng <color=red>th�ng %d ng�y %d %s<color> - <color=red>%s<color>. ��y l� b�n ch� d�n c�ch s� d�ng s�n kh�u h�n l�,  c� g� ch�a r� ng��i c� ��n t�m ta. ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1])
		Say(caption, 2,
			format("Nh�n thi�p m�i v� k�t h�n l� bao/#take_invitation(%d)", map_fieldinfo[task_type][4]),
			"�� ta ngh� l�i/cancel")
	end
	set_wedding_stat(1)		--��ʾ���곡�سɹ�
	WriteLog("[K�t h�n]:"..GetName().."��t ���c s�n kh�u, th�i gian:"..GetTask(TASK_WEDDING_DATE)..", th�i gian v� lo�i:"..GetTask(TASK_WEDDING_FIELD));
end

-- ��������
function take_invitation(count)
	if GetTask(TASK_GOT_INVITATION) == 1 then
		Talk(1,"",g_InfoHeader.."B�n �� nh�n thi�p m�i v� K�t h�n l� bao");
		return 0;
	end
	if gf_JudgeRoomWeight(15,50) == 0 then
		Talk(1,"",g_InfoHeader.."Kho�ng tr�ng trong h�nh trang c�a b�n kh�ng ��");
		return 0;
	end;
	SetTask(TASK_GOT_INVITATION,1)
	local wedding_stat = get_wedding_stat()
	-- ������������
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_para = GetTask(TASK_WEDDING_FIELD)
	add_invitation(count, task_date, task_para)
	local _,nFieldType = decode_param2(task_para)
	AddItem(ITEM_MARRIAGE_PACKET[nFieldType][1],ITEM_MARRIAGE_PACKET[nFieldType][2],ITEM_MARRIAGE_PACKET[nFieldType][3],1)
	Msg2Player("B�n nh�n ���c "..ITEM_MARRIAGE_PACKET[nFieldType][4]);
	set_wedding_step(5);	--�������͵���ӭ��
	WriteLog("[K�t h�n]:"..GetName().."thi�p m�i v� K�t h�n l� bao"..nFieldType);
end

-- �ҵ�Ͷ�����
function show_mysubs()
	local cost = GetTask(TASK_WEDDING_COST)
	local date = GetTask(TASK_WEDDING_DATE)
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(date)
	-- ���񳡵�Ԥ��״̬������ֵ0��û��Ԥ����1��Ԥ���ɹ���2��Ԥ��ʧ�ܣ�3��Ԥ�����ȣ�4��Ԥ�����-1��Ԥ������
	local sub_stat = get_sub_stat()
	if (sub_stat == -1) then
		local caption = format(g_InfoHeader.."B�n ��t <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s,  v�i gi� l� <color=red>%d<color> l� kim. Phi�n ��u gi� �� h�t h�n.",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost)
		Talk(1, "", caption)
	elseif (sub_stat == 0) then
		Talk(1, "main", g_InfoHeader.."Ch�a ��t l�i")
	elseif (sub_stat == 1) then
		on_sub_success()
	elseif (sub_stat == 2) then
		local field = map_fields[date][period][type]
		caption = format(g_InfoHeader.."B�n ��t <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s,  v�i gi� l� <color=red>%d<color> l� kim. Phi�n ��u gi� �� k�t th�c,  b�n ��u gi� th�t b�i,  kh�ng nh�n ���c quy�n s� d�ng khu v�c h�n l�.",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost,
			field[ITEMKEY_COST])
		Talk(1, "", caption)
	else
		local field = map_fields[date][period][type]
		local left_sec = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(left_sec / 3600)
		local left_min = floor(mod(left_sec, 3600) / 60) 
		if (sub_stat == 3) then	-- Ͷ������
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

-- ��ʾĳһ���Ԥ�����
function show_subs_date(year, mon, day)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	
	local date = encode_date(year, mon, day)
	local talk = {}
	if (map_fields[date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("show_subs_date: init map_fields[%d]", date))
		map_fields[date] = init_date_field()
	end
	
	local fields = map_fields[date]
	local count = getn(fields)
	for i = 1, count do
		if (check_idle_period(fields[i]) == 0) then
			talk[i] = format("%s (T�t c� c�c s�n kh�u ��u tr�ng)/cancel",
				map_period[i][5])
		else
			talk[i] = format("%s/#show_subs_period(%d,%d,%d,%d)",
				map_period[i][5],
				year,
				mon,
				day,
				i)
		end
	end
	--talk[count + 1] = "�ҵ�Ͷ�����/show_mysubs"
	talk[count + 1] = "Ch�n l�i ng�y kh�c/show_subs"
	talk[count + 2] = "S� quay l�i sau/cancel"
	Say(format(g_InfoHeader.."Th�i gian s�n kh�u c�n tr�ng: n�m %d th�ng %d ng�y %d. Xin ch�n ng�y: ",year, mon, day), getn(talk), talk)
end

function show_subs_period(year, mon, day, period)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	
	local date = encode_date(year, mon, day)
	local fields = map_fields[date][period]
	local count = getn(fields)
	local talk = {}
	for i = 1, count do
		local stat = fields[i][ITEMKEY_STAT]
		local cost = fields[i][ITEMKEY_COST]
		if (stat == STATUS_IDLE) then
			talk[i] = format("%s: gi� %d/#select_field(%d,%d,%d,%d,%d)",
				map_fieldinfo[i][1], map_fieldinfo[i][2], year, mon, day, period, i)
		elseif (stat == STATUS_OVER or cost >= map_fieldinfo[i][3]) then
			local role = fields[i][ITEMKEY_ROLE]
			talk[i] = format("%s: �� c� %s ��t v�i gi� l� %d L� kim/cancel",
				map_fieldinfo[i][1], role, cost)
		else
			if (cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
				talk[i] = format("%s: ��t xong, gi� %d/cancel",
					map_fieldinfo[i][1], fields[i][ITEMKEY_COST])
			else
				local close_date = fields[i][ITEMKEY_CLOSEDATE]
				local close_time = fields[i][ITEMKEY_CLOSETIME]			
				local this_date = curr_date()
				local this_time = curr_time()
			
				local diff = diff_time(close_time, this_time)
				local left_hour = floor(diff / 3600)
				local left_min = (diff - left_hour * 3600) / 60
				-- talk[i] = format("%s������Ͷ�꣬�ּ�%d�����ÿ�μӼ�%d����𣬾���Ͷ���������%dСʱ%d��/#select_field(%d,%d,%d,%d,%d)",
				talk[i] = format("%s: Gi� ti�n t�i %d L� kim, m�i l�n t�ng %d L� kim. Th�i gian ��ng k� c�n %d gi� %d ph�t/#select_field(%d,%d,%d,%d,%d)",
					map_fieldinfo[i][1],
					fields[i][ITEMKEY_COST],
					map_fieldinfo[i][6],
					left_hour,
					left_min,
					year, mon, day, period, i)
			end
		end
	end
	
	talk[count + 1] = format("Ch�n l�i th�i gian kh�c/#show_subs_date(%d,%d,%d)",year, mon, day);
	talk[count + 2] = "S� quay l�i sau/cancel"
	local caption = format(g_InfoHeader.."T�nh h�nh s�n kh�u n�m %d th�ng %d ng�y%d %s, ch�n s�n kh�u b�n c�n.",
			year,
			mon,
			day,
			map_period[period][5])
	Say(caption, getn(talk), talk)
end

-- Ͷ�꣬����
function keep_ahead(year, mon, day, period, type, left_hour, left_min)
	local nCurrLost = GetTask(TASK_WEDDING_COST);
	local nMaxPrice = map_fieldinfo[type][3];
	local caption = format(g_InfoHeader.."B�n ��t <color=red>th�ng %d ng�y %d gi� %s<color>-%s,  gi� l� <color=red>%d<color> l� kim. Hi�n c�n %d gi� %d ph�t k�t th�c ��u gi�. Gi� cu�i c�ng l� <color=yellow> "..nMaxPrice.."<color> L� kim, b�n ph�i ra gi� <color=yellow>"..(nMaxPrice-nCurrLost).."<color> m�i c� th� mua ��t s�n kh�u n�y. ��ng � kh�ng?",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		GetTask(TASK_WEDDING_COST),
		left_hour,
		left_min)
	local talk = {}
	talk[1] = format("Ta mua ��t s�n kh�u n�y!/#buy(%d,%d,%d,%d,%d)", year, mon, day, period, type)
	talk[2] = "�� ta suy ngh� l�i/cancel"
	Say(caption, getn(talk), talk)
end

-- Ͷ�꣬�����˳���
function drop_behind(field, year, mon, day, period, type, left_hour, left_min)
	-- DEBUG
	gf_ShowDebugInfor(format("\ndrop_behind(%d,%d,%d,%d,%d,%d,%d)", year, mon, day, period, type, left_hour, left_min))
	
	local last_bidup = GetTask(TASK_WEDDING_COST)
	local curr_price = field[ITEMKEY_COST]
	local base_price = map_fieldinfo[type][6]	--�Ӽ�
	local need_money = curr_price + base_price - last_bidup
	
	caption = format(g_InfoHeader.."B�n ��t <color=red>th�ng %d ng�y %d %s<color>-%s,  gi� b�n ��a ra l� <color=red>%d<color> l� kim,  �� c� ng��i kh�c ra gi� cao h�n. Gi� hi�n t�i l� <color=red>%d<color> L� kim. Th�i gian ��u gi� c�n <color=red>%d gi� %d ph�t<color>. N�u mu�n ti�p t�c ��u gi� b�n ph�i t�ng th�m <color=red>%d<color> L� kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		last_bidup,
		curr_price,
		left_hour,
		left_min,
		need_money)
	talk = {}
	talk[1] = format("Mu�n ��u v�i ta �? ���c! T�ng th�m %d L� kim, t�ng c�ng l� %d L� kim!/#bidup(%d,%d,%d,%d,%d)",
		need_money,
		need_money + last_bidup,
		year,
		mon,
		day,
		period,
		type)
	talk[2] = format("S�n kh�u n�y ��i gia ta mua ��t r�i, gi� %d L� kim!/#buy(%d,%d,%d,%d,%d)",
		map_fieldinfo[type][3], year, mon, day, period, type)
	talk[3] = "Ta mu�n thu h�i l�i s� ti�n �� b� ra � s�n kh�u n�y/rollback"
	talk[4] = format("Ch�n s�n kh�u kh�c/#show_subs_period(%d,%d,%d,%d)",
		year, mon, day, period)
	talk[5] = "S� quay l�i sau/cancel"
	Say(caption, getn(talk), talk)
end

-- Ͷ���Ƿ�ʧ��
function is_bidup_failed(field, role)
	if (field[ITEMKEY_ROLE] == role) then
		return 0
	elseif (field[ITEMKEY_STAT] == STATUS_OVER) then
		return 1
	elseif (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
		return 1
	else
		return 0
	end
end

-- ѡ��ĳ��ʱ�ε�ĳ������
function select_field(year, mon, day, period, type)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	type = tonumber(type)
	
	-- DEBUG
	gf_ShowDebugInfor(format("\nselect_field(%d, %d, %d, %d, %d)", year, mon, day, period, type))
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local myself = GetName()
	
	-- �Ѿ���Ͷ��
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		-- ����ϴξ�Ͷʧ�ܣ����������¾�Ͷ
		if (map_fields[task_date] ~= nil) then
			local field = map_fields[task_date][task_time][task_type]
			if (is_bidup_failed(field, myself) == 0) then
				local task_year, task_mon, task_day = decode_date(task_date)
				Talk(1, "", format(g_InfoHeader.."B�n �� ��t n�m <color=red>%d<color> th�ng <color=red>%d<color> ng�y <color=red>%d<color> - <color=red>%s<color>  color=red>%s<color>",
					task_year,
					task_mon,
					task_day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1]))
				return
			end
		end
	end

	local caption = ""
	local talk = {}
	local date = encode_date(year, mon, day)
	local field = map_fields[date][period][type]
	local curr_cost = field[ITEMKEY_COST]	-- ��ǰ�ľ���۸�
	
	-- ��ǰû��Ͷ������ϴ�Ͷ��ʧ��
	if (GetTask(TASK_WEDDING_COST) == 0 or
		map_fields[task_date] == nil or
		is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 1) then
		caption = format(g_InfoHeader.."B�n �� ch�n: n�m %d th�ng %d ng�y %d %s - %s,  quy�t ��nh ��t ch�?",
			year,
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1])
--		if curr_cost == 0 then	--���֮ǰû���˾���
--			talk[1] = format("��Ҫ���꣬�ҳ�%d�����/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][2], year, mon, day, period, type)
--		else
--			talk[1] = format("��Ҫ���꣬�Ҷ��%d�����һ����%d�����/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][6],curr_cost+map_fieldinfo[type][6], year, mon, day, period, type)
--		end;
			
		talk[1] = format("��ng �, gi� %d L� kim!/#buy(%d,%d,%d,%d,%d)",
			map_fieldinfo[type][2], year, mon, day, period, type)
		talk[2] = format("Hay l� ch�n s�n kh�u kh�c/#show_subs_period(%d,%d,%d,%d)",
			year, mon, day, period)
		talk[3] = "S� quay l�i sau/cancel"
		Say(caption, getn(talk), talk)
	else
		local diff = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(diff / 3600)
		local left_min = (diff - left_hour * 3600) / 60
		if (field[ITEMKEY_ROLE] == GetName()) then	-- �Ѿ�Ͷ����δ����
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else										-- �Ѿ�Ͷ���걻����
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

function callback_adddata(result)
	gf_ShowDebugInfor("callback_adddata")
	WriteLog("[K�t h�n]: File g�c thay ��i c�c th�ng s� li�n quan ��n k�t h�n th�nh c�ng");
	-- TODO: here
end

-- �޸����͹�������
function update_sharedata_int(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: �ص�����
		0,
		key,
		"d",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_int(%d, %d, %s, %d)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[K�t h�n]: File g�c thay ��i c�c th�ng s� li�n quan ��n s�n kh�u k�t h�n. Lo�i: ��ng th�ng");
end

-- �޸��ַ����͹�������
function update_sharedata_str(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: �ص�����
		0,
		key,
		"s",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_str(%d, %d, %s, %s)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[K�t h�n]: File g�c thay ��i c�c th�ng s� li�n quan ��n s�n kh�u k�t h�n. Lo�i: Chu�i k� t�");
end

-- ��Ͷ��ʾ
function bidup_hint(mon, day, period, type, cost)
	local caption = format("��u gi� th�ng %d ng�y %d_ %s %s, gi� %d L� kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
end

function global_msg(mon, day, period, type, cost)
	local sMsg = "";
	if type == 1 then
		sMsg = ""
	elseif type == 2 then
	
	elseif type == 3 then
	
	else
	
	end;
	AddGlobalNews(sMsg)
	Msg2Global(sMsg)
end;

-- �����ʾ
function buy_hint(mon, day, period, type, cost)
	local caption = format("d� ��nh th�ng %d ng�y %d_ %s %s, gi� %d L� kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
	local sMsg = "";
	local sMsg1 = "";
	local lover = get_team_lover(PlayerIndex);
	local sBoyName = GetName();
	local sGirlName = GetName(lover);
	local nHour = map_period[period][1];
	if type == 1 then
		sMsg = "Hi�p s� giang h� <color=yellow>"..sBoyName.."<color> t� <color=red>"..mon.."Nguy�t"..day.."Ng�y <color> l�c <color=red>"..nHour.."<color> t�i <color=yellow>Y�t Chi ti�u tr�c<color> c�ng v�i <color=yellow>"..sGirlName.."<color> c� n��ng k�t h�n. S� c� m�t c�a c�c v� b�ng h�u l� ni�m vinh h�nh cho t�n nh�n!";
		sMsg1 = "Hi�p s� giang h�"..sBoyName.."Vu"..mon.."Nguy�t"..day.."Ng�y"..nHour.." gi� t�i Y�n Chi ti�u tr�c c�ng v�i"..sGirlName.." k�t h�n. S� c� m�t c�a b�ng h�u l� ni�m vinh h�nh cho t�n nh�n";
	elseif type == 2 then
		sMsg = "<color=yellow>"..sBoyName.."<color> v� <color=yellow>"..sGirlName.."<color> l�c <color=red>"..mon.."Nguy�t"..day.."Ng�y <color> l�c <color=red>"..nHour.."<color> s� k�t h�n t�i C� ��o, m�i ng��i ��n �� ch�c m�ng!";
		sMsg1 = "Gia nh�n"..sBoyName.."c�ng v�i "..sGirlName.."l�c"..mon.."Nguy�t"..day.."Ng�y"..nHour.." gi� k�t h�n t�i C� ��o, m�i c�c anh h�ng k� n� ��n ch�c m�ng!";
	elseif type == 3 then
		sMsg = "Cao th� <color=yellow>"..sBoyName.."<color> k�t h�n c�ng <color=red>"..mon.."Nguy�t"..day.."Ng�y <color> l�c <color=red>"..nHour.."<color> giai nh�n <color=yellow>"..sGirlName.."<color>, c�c v� ��ng ��o V� l�m ��n ch�c m�ng";
		sMsg1 = "Cao th�"..sBoyName.."k�t h�n c�ng"..mon.."Nguy�t"..day.."Ng�y"..nHour.."Gia nh�n"..sGirlName..", c�c v� ��ng ��o ��n ch�c m�ng";
	else
		sMsg = "Nam cao th� <color=yellow>"..sBoyName.."<color> s�nh duy�n c�ng giai nh�n <color=red>"..mon.."Nguy�t"..day.."Ng�y <color> l�c <color=red>"..nHour.."<color> t�i <color=yellow>"..sGirlName.."<color>, ch�c hai ng��i b�ch ni�n giai l�o!";
		sMsg1 = "Nam cao th�"..sBoyName.."s�nh duy�n c�ng n� giai nh�n"..mon.."Nguy�t"..day.."Ng�y"..nHour.."t�i"..sGirlName..". Ch�c 2 ng��i b�ch ni�n giai l�o!";
	end;
	AddGlobalNews(sMsg);
	Msg2Global(sMsg1);
end

-- ����
function bidup(year, mon, day, period, type)
	if (check_marriage_condition(check_eachother_contract) == 0) then
		return
	end
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))	
	
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		-- ����ϴξ�Ͷʧ�ܣ����������¾�Ͷ
		if (map_fields[task_date] ~= nil and
			is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 0) then
			Talk(1, "", format(g_InfoHeader.."B�n ch�n: n�m %d th�ng %d ng�y %d_ %s %s",
				task_year,
				task_mon,
				task_day,
				map_period[task_time][5],
				map_fieldinfo[task_type][1]))
			return
		end
	end
	
	local date = encode_date(year, mon, day)
	if (map_fields[subs_date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("bidup: init map_fields[%d]", subs_date))
		map_fields[subs_date] = init_date_field()
	end
	local field = map_fields[subs_date][period][type]
	
	-- ����Ƿ��Ѿ������
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."S�n kh�u n�y �� ���c %s ��t", field[ITEMKEY_ROLE]))
		return
	end
	
	-- �����������Ƿ��㹻
	local last_price = GetTask(TASK_WEDDING_COST)								-- �ϴξ�Ͷ�ļ۸�
	local curr_money = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])	-- ���ϵ�������
	local base_price = map_fieldinfo[type][2]									-- ��������
	local curr_price = field[ITEMKEY_COST]										-- ��ǰ��Ͷ��߼�
	local add_price  = map_fieldinfo[type][6]									-- ÿ�εļӼ�ֵ
	local need_money = curr_price + add_price - last_price						-- �Ӽ۵�������
	if (curr_money < need_money) then
		Talk(1, "", g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng �� ")
		return
	end
	
	local wife = get_team_lover(PlayerIndex)
	-- ��龺Ͷ�Ƿ����
	local param2 = encode_param2(period, type)
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		local close_date = field[ITEMKEY_CLOSEDATE]
		local close_time = field[ITEMKEY_CLOSETIME]
		if (curr_price >= map_fieldinfo[type][3] or
			cmp_datetime(close_date, close_time, curr_date(), curr_time()) <= 0) then
			-- ��Ͷ����
			Talk(1, "", format(g_InfoHeader.."��u gi� k�t th�c, s�n kh�u ���c %s mua v�i gi� %d L� kim",
				field[ITEMKEY_ROLE], curr_price))
			return
		else
			-- ��Ͷ������
			if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], need_money) ~= 1 then
				Talk(1, "", g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng �� ")
				return			
			end;
			if (last_price == 0) then
				SetTask(TASK_WEDDING_DATE, subs_date)
				SetTask(TASK_WEDDING_FIELD, param2)
			end
			local pay = last_price + need_money
			SetTask(TASK_WEDDING_COST, pay)
			
			local husband_name = GetName(PlayerIndex)
			local wife_name = GetName(wife)
			
			field[ITEMKEY_WIFE] = wife_name
			field[ITEMKEY_ROLE] = husband_name
			field[ITEMKEY_COST] = pay
			
			update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
			update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
			update_sharedata_int(subs_date, param2, ITEMKEY_COST, pay)
			
			bidup_hint(mon, day, period, type, pay)
			return
		end
	end
	
	if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], base_price) ~= 1 then
		Talk(1, "", g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng �� ")
		return
	end;
	-- �趨��������Ϊ24Сʱ�Ժ�
	local close_date = next_date(curr_date())
	local close_time = curr_time()
	field[ITEMKEY_CLOSEDATE] = close_date
	field[ITEMKEY_CLOSETIME] = close_time
	update_sharedata_int(date, param2, ITEMKEY_CLOSEDATE, close_date)
	update_sharedata_int(date, param2, ITEMKEY_CLOSETIME, close_time)
	
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)
	
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = base_price
	field[ITEMKEY_STAT] = STATUS_BIDUP
	
	update_sharedata_str(date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(date, param2, ITEMKEY_COST, base_price)
	update_sharedata_int(date, param2, ITEMKEY_STAT, STATUS_BIDUP)
	
	-- ��¼��Ͷ������ʱ��ͳ���
	SetTask(TASK_WEDDING_COST, base_price)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	bidup_hint(mon, day, period, type, base_price)
	WriteLog("[K�t h�n]:"..GetName().."��u gi� s�n kh�u, t�n"..base_price.." L� kim, th�ng tin:"..subs_date..","..param2);
end

-- ȡ�ؾ�Ͷ�����
function rollback()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng��i c�n s�p x�p l�i h�nh l�, kho�ng tr�ng kh�ng ��.");
		return 0;
	end;
	local cost = GetTask(TASK_WEDDING_COST)
	if (cost == 0) then
		return
	end
	local date = GetTask(TASK_WEDDING_DATE)
	local time, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (cost > map_fieldinfo[type][3]) then
		cost = map_fieldinfo[type][3]
	end

	-- ����Ǿ�Ͷ���ȣ�����ȡ�ؾ�Ͷ�����
	local fields = map_fields[date]
	if (fields ~= nil) then
		local times = map_fields[date][time]
		if (times ~= nil) then
			local types = times[type]
			if (types ~= nil and types[ITEMKEY_ROLE] == GetName()) then
				Talk(1,"",g_InfoHeader.."��u gi� c�a b�n th�p h�n, kh�ng th� l�y l�i L� kim!");
				return
			end
		end
	end
	-- �������
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], cost)
	clear_subs()
	Msg2Player(format("Ng��i �� ��t %d L� kim.", cost));
	-- TODO: ��־
	WriteLog("[K�t h�n]:"..GetName().."�� c� ng��i b� phi�u cao h�n, nh�n"..cost.." L� kim");
end

-- ���
function buy(year, mon, day, period, type)
	-- DEBUG
	gf_ShowDebugInfor(format("buy(%d,%d,%d,%d,%d)", year, mon, day, period, type))

	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (check_marriage_condition(check_eachother_contract) == 0) then
		-- DEBUG
		gf_ShowDebugInfor("buy: check_marriage_condition fail")
		return
	end
		
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		Talk(1, "", format(g_InfoHeader.."B�n �� ��t th�ng %d ng�y %d_ %s %s",
			task_mon,
			task_day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1]))
		return
	end

	-- �����������Ƿ��㹻
	local lost_count = GetTask(TASK_WEDDING_COST)
	local curr_count = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])
	local over_count = map_fieldinfo[type][2]	-- ��ϼ۸�
	local nPrice = map_fieldinfo[type][2]	--����
	if (lost_count + curr_count < over_count) then
		Talk(1, "", g_InfoHeader.."L� kim c�a b�n kh�ng �� ")
		return
	end

	local field = map_fields[subs_date][period][type]
	-- ����Ƿ��Ѿ������
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."S�n kh�u n�y �� ���c %s ��t", field[ITEMKEY_ROLE]))
		return
	end
	
	-- ��龺Ͷ�Ƿ����
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		if (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
			-- ��Ͷ�Ѿ�����
			Talk(1, "", format(g_InfoHeader.."��u gi� k�t th�c, s�n kh�u ���c %s mua v�i gi� %d L� kim",
				field[ITEMKEY_ROLE], field[ITEMKEY_COST]))
			return
		end
	end
	
	if (lost_count < over_count) then
		if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], over_count - lost_count) ~= 1 then
			Talk(1, "", g_InfoHeader.."L� kim c�a b�n kh�ng �� ")
			return 0;
		end;
	end

	local wife = get_team_lover(PlayerIndex)
	local param2 = encode_param2(period, type)
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)

	field[ITEMKEY_STAT] = STATUS_OVER
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = over_count
	
	update_sharedata_int(subs_date, param2, ITEMKEY_STAT, STATUS_OVER)
	update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(subs_date, param2, ITEMKEY_COST, over_count)

	SetTask(TASK_WEDDING_COST, over_count)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	buy_hint(mon, day, period, type, over_count)
	set_wedding_stat(1)		--��ʾ���곡�سɹ�
	WriteLog("[K�t h�n]:"..GetName().."D�ng th�"..(over_count - lost_count).." L� kim mua ��t s�n kh�u,"..subs_date..","..encode_param2(period, type));
	SaveNow();
end

function process_qingqi_nofield()
	Say(g_InfoHeader.."Hai v� kh�ng mu�n ��t s�n kh�u n�a sao? Sau n�y kh�ng th� ��n <color=red>thu�<color> n�a.",
		2,
		"��ng v�y, kh�ng thu� n�a!/process_qingqi_nofield_confirm",
		"�� ta suy ngh� l�i/cancel")
end

function process_qingqi_nofield_confirm()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_year, sub_mon, sub_day = decode_date(sub_date)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (map_fields[sub_date] ~= nil) then	--���֮ǰû�ж������أ���ômap_fields[0]����nil
		local field = map_fields[sub_date][sub_period][sub_type]
		if (field[ITEMKEY_ROLE] == GetName()) then	--���˳��غ󻹿���ѡ���ó��ؽ���𣿿��ԣ������˾Ϳ�������ѡ����
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER) then	--��Ϻ������
				caption = format(g_InfoHeader.."B�n �� ��t <color=red>n�m %d th�ng %d ng�y %d<color>_<color=red>%s %s<color>, kh�ng th� h�y b�",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			else	--������ȡ������¹�����
				caption = format(g_InfoHeader.."B�n �� ��t <color=red>n�m %d th�ng %d ng�y %d_ %s<color> <color=red>%s<color>, kh�ng th� h�y b�",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			end
			Talk(1, "", caption)
			return
		end
	end
	
	-- ���Ԥ����Ϣ
	clear_subs()
	set_wedding_stat(1)
	Talk(1, "",g_InfoHeader.."Hai v� kh�ng k�t h�n � S�n kh�u c�ng kh�ng sao. Hai ng��i c�ng t� ��i ��n <color=red>Th�y Y�n<color> nh� <color=red>Nguy�t L�o<color> ch�ng gi�m cho 2 ng��i.")
	WriteLog("[K�t h�n]:"..GetName().."Kh�ng d�ng s�n kh�u k�t h�n.")
end

-- ��ʾ�ҵĻ��񳡵����
function show_myfield()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local this_year, this_mon, this_day = decode_date(curr_date())
	local this_hour, this_min, this_sec = decode_time(curr_time())
	local caption = format(g_InfoHeader.."B�n ��t v�o <color=red>th�ng %d ng�y %d %s<color>-<color=red>%s<color>. B�y gi� l� <color=red>th�ng %d ng�y %d %d gi� %d ph�t<color>! ",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		this_mon,
		this_day,
		this_hour,
		this_min)
	Talk(1, "", caption)
end

-- ��ӭ
function process_qinying()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_field = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local sub_hour = map_period[sub_period][1]
	local sub_min = map_period[sub_period][2]
	local sub_close_hour = map_period[sub_period][3]
	local sub_close_min	= map_period[sub_period][4]
	local sub_time = encode_time(sub_hour, sub_min, 0)	
	local sub_close_time = encode_time(sub_close_hour,sub_close_min,0);
	local nDesMapID = map_fieldpos[sub_field][1];
	if cmp_datetime(sub_date,sub_close_time,curr_date(), curr_time()) <= 0 then	--��������˻�û���
		clear_subs();			--�������Ԥ����Ϣ
		set_wedding_stat(0);	--��ʾδ����ɹ�
		set_wedding_step(4);	--�ص����ڽ׶�
		local selTab = {
				"Ta mu�n ch�n l�i s�n kh�u/process_qingqi_selectfield",
				"Ta mu�n h�y h�n ��c/disengage_talk",
				"Kh�ng c� g�/cancel",
				}
		Say(g_InfoHeader.."S�n kh�u k�t h�n �� qu� h�n",getn(selTab),selTab);
		return 0
	end;
	--���ʱ�䵽�˲��ҽ�鳡�ؿ���
	if (cmp_datetime(sub_date, sub_time, curr_date(), curr_time()) <= 0) and mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID) ~= MS_STATE_IDEL then
		Say(g_InfoHeader.."Ch�c m�ng hai v�! ��n g�p <color=yellow>Ng��i d�n ch��ng tr�nh<color> sau �� v�o s�n kh�u �� c� h�nh h�n l�. N�u c�n thu� trang ph�c hay trang s�c xin g�p <color=yellow>H� N��ng<color>",
			4,
			"Xem s�n kh�u h�n l�/show_myfield",
			"Ta mu�n mua m�t �t v�t ph�m/buy_thing",
			"Ta c�n th�ng b�o cho b�ng h�u, h�n l� b�t ��u/#global_annouce(1)",
			"Kh�ng mua/cancel")
	else
		talk = {
			"Ta mu�n mua thi�p m�i (T�n"..BUY_QINGTIE_PACKET.." ti�n v�ng)/talk_buy_invitation",
			"Ta c�n th�ng b�o cho b�ng h�u ��n nh�n thi�p/#global_annouce(2)",
			"Ta mu�n th�ng b�o cho to�n th� ng��i ch�i th�i gian k�t h�n/#global_annouce(3)",						
			"Xem s�n kh�u h�n l�/show_myfield",
			"�� ta ngh� l�i/cancel"
		}
		Say(g_InfoHeader.."S�n kh�u k�t h�n c�c ng��i �� ��t xong, m�i vi�c li�n quan ��n h�n s� n�u c�n g� c� ��n t�m ta.",
			getn(talk),
			talk)
	end
end

tAnnouce = {
	[1] = {20,"Th�ng b�o cho t�t c� th�n thu�c b�ng h�u bi�t th�i gian c� h�nh h�n l� t�n <color=yellow>"..ANNOUCE_FRIENDS_BEGIN_COST.."<color> ti�n v�ng, ng��i ��ng � ch�?","L� th�nh h�n c�a T�n lang <color=red>%s<color> v� t�n n��ng <color=red>%s<color> b�t ��u. Nh�ng ai mang theo thi�p xin m�i v�o s�n kh�u.","L� th�nh h�n c�a T�n lang %s v� T�n n��ng %s b�t ��u, nh�ng ai mang theo thi�p xin m�i v�o s�n kh�u."},
	[2] = {20,"Th�ng b�o cho b�ng h�u ��n nh�n thi�p c�n<color=yellow>"..ANNOUNCE_INVITAION_COST.."<color> ti�n v�ng, ng��i ��ng � ch�?","M�i b�ng h�u c�a T�n lang <color=red>%s<color> v� t�n n��ng <color=red>%s<color> ��n D��ng Ch�u g�p b� mai nh�n <color=yellow>thi�p m�i<color>","M�i b�ng h�u c�a T�n lang %s v� t�n n��ng %s ��n D��ng Ch�u g�p b� mai nh�n thi�p m�i "},
	[3] = {20,"Th�ng b�o cho to�n th� V� l�m bi�t r�ng b�n s�p th�nh h�n, c�n <color=yellow>"..ANNOUNCE_ALL_PLAYER_COST.."<color> ti�n v�ng, ng��i ��ng � ch�?","T�n lang <color=red>%s<color> v� t�n n��ng <color=red>%s<color> s� c� h�nh h�n l� v�o n�m <color=yellow>%d<color> th�ng <color=yellow>%d<color> ng�y <color=yellow>%d<color> <color=yellow>%d<color> gi�!","T�n lang %s v� t�n n��ng %s s� c� h�nh h�n l� v�o %d-%d-%d! l�c %d gi�."},
	}

function global_annouce(nType)
	Say(g_InfoHeader..tAnnouce[nType][2],
		2,
		format("��ng �/#global_annouce_confirm(%d)",nType),
		"H�y b�/cancel")	
end;

function global_annouce_confirm(nType)
	if Pay(tAnnouce[nType][1]*10000) == 1 then
		local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE));
		local nPeriod = decode_param2(GetTask(TASK_WEDDING_FIELD))
		local caption = format(tAnnouce[nType][3],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		local caption1 = format(tAnnouce[nType][4],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		AddGlobalNews(caption)
		Msg2Global(caption1);
	else
		Talk(1,"",g_InfoHeader.."Ng��i kh�ng �� ti�n v�ng");
	end;
end;

function buy_thing()
	local selTab = {
				"Thu� y ph�c h�n l�/buy_cloth",
				"Thu� y ph�c cho ch� h�n/buy_cloth2",
				"Thu� ki�u hoa/buy_dooly",
				"Mua nh�n c��i/buy_ring",
				"Ta mu�n mua thi�p m�i (T�n"..BUY_QINGTIE_PACKET.." ti�n v�ng)/talk_buy_invitation",
				"Kh�ng mua/process_qinying",
				};
	Say(g_InfoHeader.."V�t ph�m �� ph�c v� h�n l� ch� ta kh�ng thi�u, ng��i c�n g�?",getn(selTab),selTab);
end;

function buy_cloth()
	local selTab = {
			"Ta mu�n thu� 1 b� l� ph�c (c�n"..HIRE_CLOTH_COST.."l��ng ti�n v�ng)/buy_cloth_confirm",
			"Ta mu�n thu� 1 b� l� ph�c cho t�n n��ng ( c�n"..HIRE_CLOTH_COST.."l��ng ti�n v�ng)/buy_bride_cloth_confirm",
			"�� ta xem/buy_thing",
			"Kh�ng c�n ��u/cancel",
			}
	Say(g_InfoHeader.."Thu� l� ph�c n�i trong 24 gi� ph�i ho�n tr�. N�u c�n thu� l� ph�c cho t�n n��ng th� 2 ng��i t� ��i ��n ��y g�p ta",getn(selTab),selTab);
end;

function buy_cloth2()
	local selTab = {
			"Ta mu�n thu� 1 b� y ph�c cho ch� h�n (c�n"..HIRE_CLOTH2_COST.."l��ng ti�n v�ng)/buy_cloth2_confirm",
			"�� ta xem/buy_thing",
			"Kh�ng c�n ��u/cancel",
			}
	Say(g_InfoHeader.."Thu� y ph�c cho ch� h�n, n�i trong 24 gi� ph�i ho�n tr�.",getn(selTab),selTab);
end;
--�·���������ɵĶ�Ӧ��ϵ
tCloth_Faction = {--ͷ�Σ��·�
		{131,173},
		{143,189},
		{147,193},
		{151,197},
		{155,201},
		{159,205},
		{163,209},
		{550,550},
		{554,554},
		{558,558},
		};
function buy_bride_cloth_confirm()
	if GetTeamSize() ~= 2 then
		Talk(1,"",g_InfoHeader.."T� ��i v�i t�n n��ng c�ng ��n thu� l� ph�c nh�!");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nBrideIndex = get_team_lover(PlayerIndex);
	if get_lover_code(nBrideIndex) ~= Hash(GetName()) then
		Talk(1,"",g_InfoHeader.."Ng��i ta ch�ng c� h�n ��c g� v�i ng��i");
		return 0;
	end;
	PlayerIndex = nBrideIndex;
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		PlayerIndex = nOldPlayerIndex
		Talk(1,"",g_InfoHeader.."Kho�ng tr�ng trong h�nh trang kh�ng ��");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	PlayerIndex = nOldPlayerIndex;
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		PlayerIndex = nBrideIndex;
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"Th�nh c�ng: "..GetName().." 1 c�i n�n")
			Msg2Player(GetName(nOldPlayerIndex).."Cho ng��i thu� 1 c�i n�n");
			WriteLog("[K�t h�n]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thu� ���c 1 c�i n�n, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"Th�nh c�ng: "..GetName().."Thu� ���c 1 b� l� ph�c")
			Msg2Player(GetName(nOldPlayerIndex).."Cho ng��i th� 1 b� l� ph�c");
			WriteLog("[K�t h�n]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thu� ���c 1 c�i n�n, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng ��, c�n <color=yellow>"..HIRE_CLOTH_COST.."<color> ti�n v�ng.");
	end;
	PlayerIndex = nOldPlayerIndex;
end;
function buy_cloth_confirm()
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho�ng tr�ng trong t�i h�nh trang kh�ng ��");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2Player("B�n thu� ���c 1 c�i n�n");
			WriteLog("[K�t h�n]:"..GetName().."Thu� ���c 1 c�i n�n, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("B�n thu� ���c 1 b� l� ph�c");
			WriteLog("[K�t h�n]:"..GetName().."B�n thu� ���c 1 b� l� ph�c, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng ��, c�n <color=yellow>"..HIRE_CLOTH_COST.."<color> ti�n v�ng.");
	end;
end;

function buy_cloth2_confirm()
	local selTab = {
				"Nam ti�u chu�n/#buy_cloth2_confirm2(1)",
				"Nam kh�i ng�/#buy_cloth2_confirm2(2)",
				"N� g�i c�m/#buy_cloth2_confirm2(3)",
				"Ki�u n�/#buy_cloth2_confirm2(4)",
				"�� ta xem/buy_thing",
				}
	Say(g_InfoHeader.."Xin ch�n size:",getn(selTab),selTab);
end;

function buy_cloth2_confirm2(nBody)
	if gf_JudgeRoomWeight(2,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho�ng tr�ng trong t�i h�nh trang kh�ng ��");
		return 0;
	end;
	if Pay(HIRE_CLOTH2_COST*10000) == 1 then
		local nRetCode = AddItem(0,109,177+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("B�n thu� ���c 1 b� l� ph�c cho ch� h�n.");
			WriteLog("[K�t h�n]:"..GetName().."B�n thu� ���c 1 b� l� ph�c cho ch� h�n, size:"..nBody)
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng ��, c�n <color=yellow>"..HIRE_CLOTH2_COST.."<color> ti�n v�ng.");
	end;	
end;

function buy_dooly()
	local selTab = {
				"��ng �/buy_dooly_confirm",
				"�� ta xem/buy_thing",
				"Kh�ng c�n ��u/cancel",
				}
	Say(g_InfoHeader.."Ng��i c� mu�n thu� <color=yellow>Ki�u hoa<color> kh�ng? T�n <color=yellow>"..BUY_DOOLY_COST.."<color> ti�n v�ng",getn(selTab),selTab);
end;

function buy_dooly_confirm()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho�ng tr�ng trong t�i h�nh trang kh�ng ��");
		return 0;
	end;
	if Pay(BUY_DOOLY_COST*10000) == 1 then
		if AddItem(ITEM_DOOLY[1],ITEM_DOOLY[2],ITEM_DOOLY[3],1) ~= 0 then
			Msg2Player("B�n thu� ���c 1 ki�u hoa");
			WriteLog("[K�t h�n]:"..GetName().."B�n thu� ���c 1 ki�u hoa")
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng ��, c�n <color=yellow>"..BUY_DOOLY_COST.."<color> ti�n v�ng.");
	end;
end;

function buy_ring()
	local selTab = {
				"Ta mu�n mua nh�n nam/#buy_ring_confirm(1)",
				"Ta mu�n mua nh�n n�/#buy_ring_confirm(2)",
				"�� ta xem/buy_thing",
				"Kh�ng c�n ��u/cancel",
				}
	Say(g_InfoHeader.."Ng��i mu�n mua <color=yellow>nh�n<color> kh�ng? C�n <color=yellow>"..BUY_RING_COST.."<color> ti�n v�ng.",getn(selTab),selTab);
end;

function buy_ring_confirm(nType)
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho�ng tr�ng trong t�i h�nh trang kh�ng ��");
		return 0;
	end;
	local nBuyRingInfo = GetTask(TASK_BUY_RING);
	if nType == 1 then
		if mod(nBuyRingInfo,10) ~= 0 then
			Talk(1,"",g_InfoHeader.."Ng��i �� mua nh�n nam, kh�ng th� mua ti�p.");
			return 0;
		end;
	else
		if floor(nBuyRingInfo/10) ~= 0 then
			Talk(1,"",g_InfoHeader.."Ng��i �� mua nh�n n�, kh�ng th� mua ti�p.");
			return 0;
		end;
	end;
	if Pay(BUY_RING_COST*10000) == 1 then
		if AddItem(0,102,103+nType,1) ~= 0 then
			if nType == 1 then
				SetTask(TASK_BUY_RING,nBuyRingInfo+1);	--�Ѹ�λ���1
			else
				SetTask(TASK_BUY_RING,nBuyRingInfo+10);	--��ʮλ���1
			end;
			Msg2Player("B�n mua ���c 1 chi�c nh�n");
			WriteLog("[K�t h�n]:"..GetName().."Mua ���c 1 chi�c nh�n, lo�i:"..nType)
		end;
	else
		Talk(1,"",g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng ��, c�n <color=yellow>"..BUY_RING_COST.." <color> ti�n v�ng.");
	end;
end;

-- ���������Ի�
function talk_buy_invitation()
	local nRetCode,nItemIdx = 0,0;
	if Pay(BUY_QINGTIE_PACKET*10000) == 1 then
		add_qingtie_packet(1)
	else
		Talk(1,"",g_InfoHeader.."Ti�n v�ng c�a b�n kh�ng ��");
	end;
end

map_process = {
	[0] = process_nacai,	-- �ɲ�
	[1] = process_nacai_boy,-- �ɲ�2
	[2] = process_wenming,	-- ����
	[3] = process_naji,		-- �ɼ�
	[4] = process_qingqi,	-- ����
	[5] = process_qinying,	-- ��ӭ
}
--��ʼ������ʱ�����г��ص���Ϣ
function init_date_field()
	local fields = {}
	-- ʱ��
	for j = 1, getn(map_period) do
		fields[j] = {}
		-- ����
		for k = 1, getn(map_fieldinfo) do
			fields[j][k] = {
				[ITEMKEY_STAT] = STATUS_IDLE,
				[ITEMKEY_COST] = 0
			}
		end
	end
	return fields
end

apply_count = 0
recv_count 	= 0
inited 		= 0		-- �Ƿ��Ѿ���ʼ��

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"",g_InfoHeader.."Ch�a ��n th�i gian ��ng k� k�t h�n, ng��i h�y quay l�i sau nh�!!!");		
		do	return	end
		end
	end
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."H�n l� �� k�t th�c, xin h�i ng��i ph�c v�.");
		return 0;
	end;
	if (GetTask(TASK_WEDDING_DATE) == 0 and GetMateName() ~= "") or --ѡ���ó��ؽ���
		(is_field_timeout() == 1 and GetMateName() ~= "") or --���ع��ڽ���
		(GetSex() == 2 and GetMateName() ~= "") then	--Ů������
		local selTab= {
				"�a t�!/cancel",
				}
		Say(g_InfoHeader.."��n c�m �n ta �? Ch�c c�c ng��i h�nh ph�c!",getn(selTab),selTab);
		return 0;
	end;
	if (inited == 0) then
		init()
		return
	end
	
	local step = get_wedding_step()
	-- DEBUG
	gf_ShowDebugInfor(format("main step:%d", step))
	local process = map_process[step]
	if (process) then
		process()
	end
end


function init()
	apply_count = 0
	recv_count = 0
	local days = future_days(0, FUTURE_DAY_COUNT + 2)
	for i = 1, getn(days) do
		-- ����
		local date = days[i]
		-- �Ȱѳ���Ԥ����Ϣȫ����Ϊ����
		map_fields[date] = init_date_field()
	
		-- ��relay���󳡵�Ԥ����Ϣ
		for j = 1, getn(map_period) do
			for k = 1, getn(map_fieldinfo) do
				local param2 = encode_param2(j, k)
				ApplyRelayShareData(KEY_WEDDING, date, param2, CALLBACK_FILE, "hook_recvsubs")
				apply_count = apply_count + 1
			end
		end
	end
	WriteLog("[K�t h�n]: S�n kh�u k�t h�n");
end

-- DEBUG
-- �ص���������ȡ����Ԥ����Ϣ
function hook_clearsubs(...)
	-- Do nothig	
end

-- �ص���������ȡ����Ԥ����Ϣ
function hook_recvsubs(key, param1, param2, count)
	-- �ó��ظ�ʱ�ο���
	if (count ~= 0) then
		-- DEBUG
		gf_ShowDebugInfor(format("\nhook_recvsubs(%d,%d,%d)", param1, param2, count))
		local date = param1
		local period, type = decode_param2(param2)	
		local stat, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_STAT)
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		local cost, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_COST)
		local close_date, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSEDATE)
		local close_time, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSETIME)
		
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("\nhook_recvsubs: init map_fields[%d]", date))
			map_fields[date] = {}
		end
		if (map_fields[date][period] == nil) then
			map_fields[date][period] = {}
		end
		if (map_fields[date][period][type] == nil) then
			map_fields[date][period][type] = {}
		end
		
		local field = map_fields[date][period][type]	--field�൱��ȫ�ֱ���map_fields[date][period][type]��һ������
		field[ITEMKEY_STAT] = stat
		field[ITEMKEY_WIFE] = wife
		field[ITEMKEY_ROLE] = role
		field[ITEMKEY_COST] = cost
		if (stat ~= STATUS_OVER) then
			field[ITEMKEY_CLOSEDATE] = close_date
			field[ITEMKEY_CLOSETIME] = close_time
		end
	end
	recv_count = recv_count + 1
	if (recv_count == apply_count) then
		inited = 1
		main()
	end
	WriteLog("[K�t h�n]: S�n kh�u k�t h�n k�t th�c");
end
