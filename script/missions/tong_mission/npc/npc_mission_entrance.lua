--create date:2007-07-06
--author:yanjun
--describe:���ؿ����NPC��ÿ�����и���Ӧһ����������һ���ģ�ֻ�ǽ���ĳ��ز�һ��
Include("\\script\\missions\\tong_mission\\main_function.lua");
Include("\\script\\missions\\tong_mission\\award.lua");
Include("\\script\\lib\\writelog.lua");
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_mission_entrance.lua";
g_szInfoHeader = "<color=green>T� Quang C�c L�o Nh�n<color>: ";
g_nSvrPlayerCount = 0;	--�������������
g_nLastCheckTime = 0;	--�����ϴμ�������������ʱ���
g_CHECKINTERVAL = 10*60;	--����������������С���
MAX_SEL_PER_PAGE = 4;
function main()
	if GetGlbValue(GLB_CLEAR_FIELD) == 0 then
		CloseMissionEx(TONG_MISSIONEX);	--�ȹ�
		OpenMissionEx(TONG_MISSIONEX,1);	--�ٿ�
		TM_ClearAllFieldState();	--�����
		SetGlbValue(GLB_CLEAR_FIELD,1);
	end;
	local selTab = {
			"Ch�n chi�n tr��ng T� Quang C�c/select_area",
			"Ta mu�n ��i �i�m t�ch l�y l�y �i�m kinh nghi�m/get_exchange_exp",
			"��i ph�n th��ng T� Quang C�c/get_award",
			"B�i c�nh/know_background",
			"Gi�i thi�u quy t�c T� Quang C�c/know_stage_reflash",
			"H�n ch� c�a T� Quang C�c/know_stage_restriction",
			"Gi�i thi�u �n s� T� Quang C�c/know_boss_info",
			"Nh�ng �i�u ch�nh c�a T� Quang C�c/know_new_rule",
			"Ta ch� ti�n th� gh� ngang qua th�i./nothing"
			}
	if DEBUG_VERSION == 1 then
		tinsert(selTab,5,"X�a d� li�u Relay c�a b�n bang (Test)/clear_relay_data");
		tinsert(selTab,5,"��n th�nh kh�c xem th� (Test)/go_to_another_city");
	end;
	Say(g_szInfoHeader.."T� Quang C�c l� c� ��a th�n b�, theo truy�n thuy�t l� n�i �n n�u c�a K� L�n.",getn(selTab),selTab);
end;

function know_new_rule()
	Talk(1,"main",g_szInfoHeader.."Nh�ng ng��i ngo�i bang c� th� gia nh�p v�i t� c�ch ti�p vi�n �� gi�p �� b�n bang v��t �i, ch� c�n ���c s� ��ng � c�a ���ng ch� tr� l�n l� c� th� v��t �i \n    Trong m�t tu�n ng��i ch�i v��t �i l�n ��u ti�n s� ���c to�n b� �i�m t�ch l�y, l�n th� hai s� gi�m 2/5, l�n th� 3 gi�m c�n 1/5, l�n th� 4 s� gi�m c�n 1/10, sau l�n th� 5 tr� �i s� c�n 1/10.\n    Khi th�c l�c bang h�i kh�ng �� c� th� ch�n th� c�ng b� �i 2 b�ng h� v� m�n ph�i. Ch�c n�ng n�y ch� hi�u l�c � �i 1 ��n 4.");
end;

function know_background()
	Talk(1,"know_background2",g_szInfoHeader.."L�c tr�i ��t m�i s� khai, t�t c� m�i tinh hoa c�a �m d��ng t�ch t� th�nh th�n th� Nguy�t K� L�n tr�n gi� Th�i H�. \nCho ��n l�c b�n �� s�n h� x� t�c hi�n th�n ti�t l� thi�n c�, th�n minh n�i gi�n x� n�t b�n ��, v� vua T�ng cao t� b�o b�nh m� ch�t. Nh�n d�p T� �n T� Quang �i ngang n�n nhi�u l�n ��i T�ng c�u vi�n m� kh�ng th�nh.");
end;
function know_background2()
	Talk(1,"know_background3",g_szInfoHeader.."M�t l�n n�a T� �n l�i thay ��i quy�t ��nh v� g�n l�i b�n �� s�n h� x� t�c, kh�ng ng� r�ng vi�c n�y gi�p �� cho K� L�n � Th�i H� h�i sinh. T� �n th�y kh�ng n� gi�t �i th�n th� n�n �� �em K� L�n v� T� Quang C�c c�u ch�a, nh�ng vi�c c�u ch�a l�i gi�p cho th� t�nh c�a K� L�n n�i l�n. Bi�t m�nh kh�ng ch�ng �� n�i ma thu�t c�a K� L�n. Ch� c�n m�t c�ch l� nh� s� gi�p �� c�a v� l�m tr�n thi�n h� kh�c ch� K� L�n v� ��a n� v� Th�i H�");
end;
function know_background3()
	Talk(1,"main",g_szInfoHeader.."K� L�n thu�c linh th� c�a tr�i ��t, s�c m�nh v� song. �� t�m ra ���c v� v� s� ch�n ch�nh, T� Quang T� �n �� ��t c�c �i th� th�ch ��ng th�i tuy�n b� v�i c�c v� v� l�m r�ng s� c� ph�n th��ng ��p t� � m�i c�a �i.");
end;

function know_stage_reflash()
	Talk(1,"main",g_szInfoHeader.."M�i bang h�i c� th� nhi�u l�n chi�n ��u v�i c�a �i ��, nh�ng ch� c� 1 c� h�i v��t �i duy nh�t. V� d�: Sau khi th�nh c�ng v��t �i xong, l�n sau ti�p t�c v��t �i s� b�t ��u � �i th� 3 cho ��n l�c c�a �i thay l��t. \nC�a �i s� thay l��t v�o l�c 12 gi� ng�y ch� nh�t, m�i tu�n v�o 11:55 ch� nh�t t�t c� ng��i ch�i trong �i s� b� c��ng ch� ��y ra ngo�i. Th�i gian ��i l��t s� l� 10 ph�t, sau khi ��i l��t xong ng��i ch�i ti�n v�o s� b�t ��u t� �i th� 1.");
end;

function know_stage_restriction()
	Talk(1,"know_stage_restriction2",g_szInfoHeader.."	K�ch ho�t khu v�c �i: M�t bang h�i ch� c� th� k�ch ho�t ���c 1 khu v�c �i, k�ch ho�t ph�i do bang ch� ph� bang ch� ho�c tr��ng l�o t� ��i �� 8 ng��i c�p 75, sau �� nh�ng ng��i trong bang c� c�p 75 tr� l�n s� v�o theo sau. \n H�n ch�: N�i ���ng v� ngo�i ���ng c�a �i t�i �a 60 ng��i. N�i ���ng (khu v�c BOSS) t�i �a ch� ���c 16 ng��i, h� ph�i kh�ng ���c qu� 3 ng��i. Th�i gian chu�n b� xong n�u trong �i c� �t h�n 8 ng��i th� �i s� t� ��ng ��ng c�a.");
end;
function know_stage_restriction2()
	Talk(1,"main",g_szInfoHeader.."H�n ch� ��i ng��i: Khi th�i gian BOSS ch�a ���c k�ch ho�t th� ng��i ch�i � n�i ���ng c� th� ��i t�y th�ch, nh�ng c�n ph�i ph� h�p �i�u ki�n s� ng��i v� h� ph�i. Sau khi BOSS ���c k�ch ho�t th� m�i 2 ph�t m�i c� th� ��i ���c ng��i t� ngo�i ���ng v�o n�i ���ng (ph�i ph� h�p �i�u ki�n s� ng��i v� h� ph�i), v� v�y xin h�y c�n tr�ng ��i ng��i.");
end;

function know_boss_info()
	local selTab = {
				"B�ng h� v�/#know_boss_detail_info(0)",
				"�i 1: Li Y�n/#know_boss_detail_info(1)",
				"�i 2: B� Ki�u/#know_boss_detail_info(2)",
				"�i 3: Phong D��ng, V�n Th�y/#know_boss_detail_info(3)",
				"�i 4: ��a Huy�n/#know_boss_detail_info(4)",
				"�i 5: Ti�t Ho�nh Th�/#know_boss_detail_info(5)",
				"�i 6: Th��ng C� H�a K� L�n H�a V�, Th��ng C� H�a K� L�n L�u Quang/#know_boss_detail_info(6)",
				"Ta ch� ti�n ���ng h�i ch�i!/nothing",
				}
	Say(g_szInfoHeader.."",getn(selTab),selTab);
end;

function know_boss_detail_info(nType)
	Talk(1,"know_boss_info",g_szInfoHeader..TB_BOSS_INFO[nType]);
end;

function select_area()
	local selTab = {};
	for i=1,MAX_AREA do
		tinsert(selTab,format("Khu v�c %d/#select_field(%d)",i,i));
	end;
	tinsert(selTab,"Tr� l�i/main");
	local nSvrPlayerCount = 0;
	if GetTime() - g_nLastCheckTime > g_CHECKINTERVAL then
		nSvrPlayerCount = gf_GetServerPlayerCount();
	end;
	local szSvrState = "";
	if nSvrPlayerCount <= 300 then
		szSvrState = " <color=green>nh�<color>";
	elseif nSvrPlayerCount <= 800 then
		szSvrState = " <color=yellow>v�a<color>";
	else
		szSvrState = " <color=red>l�n<color>";
	end;
	Say(g_szInfoHeader.."Hi�n t�i nh�n kh�u th�nh th� n�y c� �p l�c:"..szSvrState..", �� cho qu� ��i hi�p ti�n h�nh v��t �i � tr�ng th�i t�t nh�t, ki�n ngh� n�n ch�n nh�ng th�nh ph� c� l��ng ng��i �t. Xin m�i ch�n khu v�c mu�n ti�n v�o: ",getn(selTab),selTab);
end;

function select_field(nAreaIdx)
	local selTab = {};
	local szFieldState = "";
	local nCurStage = 0;
	for i=1,MAX_FIELD do
		nMisstionState,nCurStage,szFieldState = TM_GetFieldInfo(nAreaIdx,i);
		szFieldState = sf_Replace(szFieldState,"/","-");
		szFieldState = sf_Replace(szFieldState,"|","-");
		szFieldState = sf_Replace(szFieldState,":","-");
		nCurStage = max(nCurStage,1);
		if nMisstionState == MS_STATE_IDEL then
			tinsert(selTab,format("Khu v�c %d: �ang tr�ng/#enter_field(%d,%d)",i,nAreaIdx,i));
		else
			tinsert(selTab,format("Khu v�c %d: %s(�i %d)/#enter_field(%d,%d)",i,szFieldState,nCurStage,nAreaIdx,i));
		end;
	end;
	tinsert(selTab,"Xin m�i ch�n khu v�c kh�c/select_area");
	Say(g_szInfoHeader.."Xin m�i ch�n khu v�c m� ��i hi�p mu�n v�o:",getn(selTab),selTab);
end;
--���������Ѿ��ĵ����߰����ˣ�������
function enter_field(nAreaIdx,nFieldIdx)
	if GetLevel() < MIN_LEVEL then
		Talk(1,"",g_szInfoHeader.."��i hi�p ph�i ��t ��n c�p <color=yellow>"..MIN_LEVEL.."<color> tr� l�n m�i c� th� v��t �i.");
		return 0;
	end;
	if GetTime() - GetJoinTongTime() <= MIN_JOIN_TONG_DAY*24*3600 then
		Talk(1,"",g_szInfoHeader.."Th�i gian ��i hi�p nh�p bang �t h�n <color=yellow>"..MIN_JOIN_TONG_DAY.."<color> ng�y, v� v�y kh�ng th� v��t �i ���c.");
		return 0;
	end;
	local nTeamSize = GetTeamSize();
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nPlayerCount = mf_GetPlayerCount(MISSION_ID,ALL_CAMP,nFieldMapID);
	if nPlayerCount >= MAX_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."Hi�n t�i s� ng��i � khu v�c n�y �� v��t qu� s� l��ng t�i �a l� <color=yellow>"..MAX_PLAYER_COUNT.."<color> ng��i, xin m�i ��i m�t l�t r�i h�y v�o!");
		return 0;
	end;
	if nCurFieldState == MS_STATE_IDEL then	--�������δ������
		open_mission_enter(nAreaIdx,nFieldIdx);
	else
		member_enter(nAreaIdx,nFieldIdx);
	end;	
end;
--��Ա����ؿ�
function member_enter(nAreaIdx,nFieldIdx)
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName then
		Talk(1,"",g_szInfoHeader.."��i hi�p kh�ng ph�i l� th�nh vi�n c�a <color=yellow>"..szTongName.."<color>, v� v�y kh�ng th� t�y � v�o khu v�c n�y ���c. Ng��i c� th� t�m ���ng ch� ho�c ���ng ch� tr� l�n c�a bang n�y �� t� ��i r�i ti�n v�o.");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 0 then	--����Ԯ����
		if GetName() ~= GetCaptainName() then
			Talk(1,"",g_szInfoHeader.."B�t bu�c ph�i ��i tr��ng ch�n khu v�c ti�n v�o.");
			return 0;
		end;
		local nCurJob = IsTongMember();
		if nCurJob == 0 or nCurJob > 4 then
			Talk(1,"",g_szInfoHeader.."Ch� c� ���ng ch� ho�c ch�c v� tr� l�n m�i c� th� d�n t� ��i ti�n v�o �i.");
			return 0;
		end;
		local bCheckSuccess = 1;
		for i=1,nTeamSize do	--���ȼ�
			PlayerIndex = GetTeamMember(i);
			if GetLevel() < MIN_LEVEL then
				gf_Msg2Team(GetName().."��ng c�p kh�ng ��");
				bCheckSuccess = 0;
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
		if bCheckSuccess == 0 then
			Talk(1,"",g_szInfoHeader.."T�t c� ng��i ch�i trong t� ��i ��u ph�i c� ��ng c�p y�u c�u <color=yellow>"..MIN_LEVEL.." tr� l�n<color>.");
			return 0;
		end;
		transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
	else
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
end;
--�����ؿ�
function open_mission_enter(nAreaIdx,nFieldIdx)
	if check_tong(nAreaIdx,nFieldIdx) ~= 1 then
		return 0;
	end;
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	if nCurFieldState == MS_STATE_IDEL then
		if check_player_right() ~= 1 then
			return 0;
		end;
		if check_team() ~= 1 then
			Talk(1,"",g_szInfoHeader.."Trong t� ��i ph�i c� ��ng c�p �t nh�t <color=yellow>"..MIN_TEAM_MEMBER.."c�i"..MIN_LEVEL.." m�i c� th� ti�n h�nh v��t �i.");
			return 0;
		end;
	end;
	SetTaskTemp(TSK_TEMP_AREA_IDX,nAreaIdx);
	SetTaskTemp(TSK_TEMP_FIELD_IDX,nFieldIdx);
	check_week(GetTongName());
end;

--������Ȩ��:�Ƿ�Ϊ�ӳ��������Ƿ��У��ˣ�����ְλ�Ƿ�Ϊ��������
function check_player_right()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	if GetTeamSize() < MIN_TEAM_MEMBER then	--����Ա����
		Talk(1,"",g_szInfoHeader.."C�n ph�i c� <color=yellow>"..MIN_TEAM_MEMBER.."<color> ng��i t� ��i v�i nhau ti�n h�nh k�ch ho�t khu v�c.");
		return 0;
	end;
	if GetName() ~= GetCaptainName() then	--�ж��Ƿ��Ƕӳ�
		Talk(1,"",g_szInfoHeader.."Y�u c�u c�n ph�i <color=yellow>��i tr��ng<color> ch�n k�ch ho�t khu v�c n�o.");
		return 0;
	end;
	local nCurJob = IsTongMember();	--�ж��Ƿ��ǰ�����������������
	--nTongJob:0��δ��� 1������ 2�������� 3������ 4������ 5������ 6����ͨ��Ա
	if nCurJob == 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Y�u c�u c�n ph�i <color=yellow>bang ch� ho�c ph� bang ch� ho�c tr��ng l�o<color> d�n t� ��i m�i c� th� k�ch ho�t khu v�c v��t �i.");
		return 0;
	end;
	return 1;
end;
--���������������ҵ������һ��һ���ؼ��
--�ȼ������������ټ����ҵȼ����ټ����ҵİ�������ټ�����ʱ��
--Midyfy:�޸�Ϊֻ��������������ҵȼ�  by yanjun 07��10��21��
function check_team()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nTeamSize = GetTeamSize();
	if nTeamSize < MIN_TEAM_MEMBER then	--����Ա����
		gf_Msg2Team("T� ��i c� s� ng��i kh�ng ��.");
		return 0;
	end;
	local szTongName = GetTongName();	--��ȡ�ӳ��İ����
	local nOldPlayerIdx = PlayerIndex;
	local bCheckSuccess = 1;
	for i=1,nTeamSize do	--���ȼ�
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < MIN_LEVEL then
			gf_Msg2Team(GetName().."��ng c�p kh�ng ��");
			bCheckSuccess = 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if bCheckSuccess == 0 then
		return 0;
	end;
	return 1;
end;
--����ᵱǰ�ɲ����Լ����
function check_tong(nAreaIdx,nFieldIdx)
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local tbCity = 
	{
		[100] = "Tuy�n Ch�u",
		[150] = "D��ng Ch�u",
		[200] = "Bi�n Kinh",
		[300] = "Th�nh ��",
		[350] = "T��ng D��ng",
	}
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName and szTongName ~= "" then	--���Ŀ�곡�ذ���Ƿ�Ϊ�Լ��İ��
		Talk(1,"",g_szInfoHeader.."Hi�n t�i khu v�c n�y �� ���c bang "..szTongName.." k�ch ho�t, xin m�i h�y ch�n khu v�c kh�c.");
		return 0;
	end;
	local nMapID,nTongAreaIdx,nTongFieldIdx = TM_GetTongFieldState(GetTongName());
	if nMapID == nCurMapID and nTongAreaIdx == nAreaIdx and nTongFieldIdx == nFieldIdx then
		return 1;	--���ѡ����Ǳ����ĳ���
	end;
	if nMapID ~= 0 then	--����ᵱǰ�Ƿ��Ѽ���ؿ�
		if nCurMapID == nMapID then
			Talk(1,"",g_szInfoHeader.."Qu� bang �ang � t�i <color=yellow>"..tbCity[nMapID].."c�a th�nh c� s� hi�u "..nTongAreaIdx.."c�a khu v�c c� s� hi�u "..nTongFieldIdx.."<color> �� ���c k�ch ho�t, xin m�i t�m khu v�c kh�c �� v��t �i.");
			return 0;
		end;
		local selTab = {
					"L�m phi�n ng��i qu�./#go_to_the_city("..nMapID..")",
					"C�m �n, �� ta t� l�m./nothing",
					}
		Say(g_szInfoHeader.."Qu� bang �ang � t�i <color=yellow>"..tbCity[nMapID].."c�a th�nh c� s� hi�u "..nTongAreaIdx.."c�a khu v�c c� s� hi�u "..nTongFieldIdx.."s� hi�u khu v�c<color> k�ch ho�t v��t �i, c� c�n ta d�n ���ng kh�ng? Ta ch� thu ph� <color=yellow>5<color> l��ng b�c th�i.",getn(selTab),selTab);
		return 0;
	end;
	return 1;
end;

function go_to_the_city(nMapID)
	if GetCash() < 500 then
		Talk(1,"",g_szInfoHeader.."��i hi�p kh�ng �� s� ng�n l��ng c�n thi�t!");
	else
		PrePay(500);
		NewWorld(nMapID,tPos_Entrance[nMapID][1],tPos_Entrance[nMapID][2]-10);
	end;
end;
--����һ�����
function transmit_single(nCurMapID,nAreaIdx,nFieldIdx)
	SetTaskTemp(TSK_TEMP_MAP_ID,nCurMapID);
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	WriteLogEx("Tu Quang Cac","tham gia");
	mf_JoinMission(MISSION_ID,ALL_CAMP,nFieldMapID);
end;
--����һ������
function transmit_team(nCurMapID,nAreaIdx,nFieldIdx)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex
	local tbTeamMember = {};
	for i=1,nTeamSize do
		tbTeamMember[i] = GetTeamMember(i);
	end;
	for i=1,getn(tbTeamMember) do
		PlayerIndex = tbTeamMember[i];
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
	PlayerIndex = nOldPlayerIndex
end;

function check_week(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"check_week_callback");
end;

function check_week_callback(szKey, nKey1, nKey2, nCount)
	local nCurWeek = tonumber(date("%y%W"));
	local szTongName = GetTongName();
	local nMapID = TM_GetTongFieldState(szTongName);
	--if nMapID ~= 0 then	--�ص���ʱ���ټ��һ�Σ�������ʾ��
		--return 0;
	--end;
	local nAreaIdx,nFieldIdx = GetTaskTemp(TSK_TEMP_AREA_IDX),GetTaskTemp(TSK_TEMP_FIELD_IDX);
	local nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_WEEK);
	local nAttendWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_ATTEND);
	if nWeek == nil then
		nWeek = 0;
	end;
	if nAttendWeek == nil then
		nAttendWeek = 0;
	end;
	gf_ShowDebugInfor("nAttendWeek:"..nAttendWeek);
	if nCurWeek > nAttendWeek then	--�µ�һ�ܣ��������
		TM_SetRelayTongData(szTongName,KEY_STAGE,"d",0);
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nWeekTime = tonumber(date("%w"));
	local nTime = tonumber(date("%H%M"));
	gf_ShowDebugInfor("nFieldMapID:"..nFieldMapID);
	if nCount == 0 or nCurWeek > nWeek then
		if nCurFieldState == MS_STATE_IDEL then
			--����������11��5������һ�賿0��05��
			if (nWeekTime == 0 and nTime > 2355) or (nWeekTime == 1 and nTime < 0001) then
				Talk(1,"",g_szInfoHeader.."�i �ang � qu� tr�nh ��i l��t, t�m th�i kh�ng th� ti�n h�nh v��t �i, xin m�i sau <color=yellow> 0 gi� 01 ph�t<color> ti�n h�nh v��t �i.");
				return 0;
			end; 
			mf_SetMissionS(MISSION_ID,MS_TONG_NAME,szTongName,nFieldMapID);
			if mf_OpenMission(MISSION_ID,nFieldMapID) == 1 then
				mf_SetMissionV(MISSION_ID,MV_CITY_MAP_ID,nCurMapID,nFieldMapID);
				TM_SetRelayTongData(szTongName,KEY_ATTEND,"d",nCurWeek);
				TM_SetTongFieldState(nFieldMapID,szTongName);
				transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
			end;
		else
			transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
		end;	
	else
		Talk(1,"",g_szInfoHeader.."Tu�n n�y qu� bang �� v��t �i r�i, xin h�y ��i tu�n k� ti�p!");
	end;
end;

function clear_relay_data()
	local selTab = {
				"th�t/clear_relay_data_confirm",
				"Gi�/nothing",
				}
	Say(g_szInfoHeader.."Th�t? ",getn(selTab),selTab);
end;

function clear_relay_data_confirm()
	local szTongName = GetTongName();
	if szTongName == "" then
		Talk(1,"",g_szInfoHeader.."Ng��i v�n ch�a gia nh�p bang h�i!");
		return 0;
	end;
	ClearRelayShareData(szTongName,0,0,"","");
	DelRelayShareDataCopy(szTongName,0,0);
	Talk(1,"",g_szInfoHeader.."D� li�u �� d�n s�ch!	");
end;

function get_award()
	local selTab = {
				"��i �i�m/get_award_use_point",
				"��i v�t ph�m ��c th�/get_award_use_item",
				"Ta ch� ti�n ���ng h�i ch�i!/nothing",
				}
	Say(g_szInfoHeader.."T� Quang C�c c� m�t l��ng l�n ch� t�c c�c trang ph�c, v� kh�; ch� c�n �� �i�m y�u c�u c� th� thu ���c c�c trang b� (�� c ��ng h�a ��n 6, kh�ng k� trang s�c), n�u nh� c� gi� m�t s� v�t ph�m ��c th� c�a T� Quang T� �n, �ng ta c�n c� th� c��ng h�a cho c�c trang b� v� v� kh� m�nh h�n.",getn(selTab),selTab);
end;

function get_award_use_point()
	local selTab = {
				"T� Quang H� Gi�p/get_equip_award",
				"T� Quang Ng�c/get_jewelry_award",
				"Ta ch� ��n xem/nothing",
				}
	Say(g_szInfoHeader.."Ng��i �ang c� <color=yellow>"..GetTask(TSK_POINT).."<color> �i�m, ��i hi�p mu�n lo�i trang b� n�o d��i ��y?",getn(selTab),selTab);
end;

function get_equip_award()
	local selTab = {
				"T� Quang M�o/#get_equip(1)",
				"T� Quang H� Gi�p/#get_equip(2)",
				"T� Quang H� Trang/#get_equip(3)",
				"T� Quang Th�ch/#get_equip(4)",
				"Xem trang b� kh�c/get_award_use_point",
				"Ta ch� ��n xem/nothing",
				}
	Say(g_szInfoHeader.."Ph� th�ng h� gi�p T� Quang C�c �� c��ng h�a ��n 6. M�i m�n c�n <color=yellow>500<color> �i�m. Ng��i hi�n t�i c� <color=yellow>"..GetTask(TSK_POINT).."<color> �i�m, ng��i mu�n lo�i trang b� n�o d��i ��y?",getn(selTab),selTab);
end;

function get_equip(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 500 then
		Talk(1,"",g_szInfoHeader.."�i�m T� Quang C�c c�a c�c h� kh�ng ��, ph�i �� <color=yellow>500<color> �i�m T� Quang C�c m�i c� th� ��i lo�i  trang b� n�y.");
		return 0;
	end;
	local tbEquipName = {"T� Quang M�o","T� Quang H� Gi�p","T� Quang H� Trang","T� Quang Th�ch"};
	local selTab = {
				"��ng �/#get_equip_confirm("..nType..")",
				"Xem trang b� kh�c/get_equip_award",
				"Ta suy ngh� l�i!/nothing",
				}
	Say(g_szInfoHeader.."��i hi�p c� ch�c d�ng <color=yellow>500<color> �i�m ��i l�y <color=yellow>"..tbEquipName[nType].."<color> ch�?",getn(selTab),selTab);
end;

function get_equip_confirm(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 500 then
		Talk(1,"",g_szInfoHeader.."�i�m T� Quang C�c c�a c�c h� kh�ng ��, ph�i �� <color=yellow>500<color> �i�m T� Quang C�c m�i c� th� ��i lo�i  trang b� n�y.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"",g_szInfoHeader.."H�nh trang ho�c s�c l�c kh�ng ��, xin m�i h�y s�p x�p l�i h�nh trang r�i ti�p t�c ��i ph�n th��ng.");
		return 0;
	end;
	local tbEquipName = {"T� Quang M�o","T� Quang H� Gi�p","T� Quang H� Trang","T� Quang Th�ch"};
	local nBody = GetBody(); 
	local nRetCode = 0;
	SetTask(TSK_POINT,nPoint-500);
	if nType == 1 then
		nRetCode = AddItem(0,103,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	elseif nType == 2 then
		nRetCode = AddItem(0,100,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	elseif nType == 3 then
		nRetCode = AddItem(0,101,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	else
		nRetCode = AddItem(0,102,2351+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	end;
	if nRetCode == 1 then
		Msg2Player("B�n �� nh�n ���c 1 "..tbEquipName[nType]);
		WriteLogEx("Tu Quang Cac","��i","1",tbEquipName[nType]);
	else
		WriteLog("[Bang h�i �i l�i]"..GetName().."��i ���c 1 "..tbEquipName[nType].."AddItem g�p l�i, nRetCode:"..nRetCode);
	end;
end;
function get_jewelry_award()
	local selTab = {
				"S�c m�nh t�ng 18, g�n c�t t�ng 18, th�n ph�p t�ng 18/#get_jewelry(1)",
				"Linh ho�t t�ng 18, g�n c�t t�ng 18, th�n ph�p t�ng 18/#get_jewelry(2)",
				"N�i c�ng t�ng 18, g�n c�t t�ng 18, linh ho�t t�ng 18/#get_jewelry(3)",
				"N�i c�ng t�ng 18, g�n c�t t�ng 18, th�n ph�p t�ng 18/#get_jewelry(4)",
				"S�c m�nh t�ng 18, g�n c�t t�ng 18, linh ho�t t�ng 18/#get_jewelry(5)",
				"Xem trang b� kh�c/get_award_use_point",
				"Ta ch� ��n xem/nothing",
				}
	Say(g_szInfoHeader.."Ng�c ph� th�ng ���c ��t tr�n 10 n�m � s�o huy�t T� Quang C�c th�n th�, h�t �� c�c khi �m d��ng. M�i m�n c�n <color=yellow>3500<color> �i�m. Xin m�i ch�n thu�c t�nh cho trang b�:",getn(selTab),selTab);
end;

function get_jewelry(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 3500 then
		Talk(1,"",g_szInfoHeader.."�i�m T� Quang C�c kh�ng ��, ��i hi�p c�n <color=yellow>3500<color> �i�m m�i c� th� ��i ���c lo�i trang b� n�y.");
		return 0;
	end;
	local tbJewelryName = {
					"S�c m�nh t�ng 18, g�n c�t t�ng 18, th�n ph�p t�ng 18",
					"Linh ho�t t�ng 18, g�n c�t t�ng 18, th�n ph�p t�ng 18",
					"N�i c�ng t�ng 18, g�n c�t t�ng 18, linh ho�t t�ng 18",
					"N�i c�ng t�ng 18, g�n c�t t�ng 18, th�n ph�p t�ng 18",
					"S�c m�nh t�ng 18, g�n c�t t�ng 18, linh ho�t t�ng 18",
					};
	local selTab = {
				"��ng �/#get_jewelry_confirm("..nType..")",
				"Xem trang b� kh�c/get_jewelry_award",
				"Ta suy ngh� l�i!/nothing",
				}
	Say(g_szInfoHeader.."��i hi�p c� ch�c ch�n d�ng <color=yellow>3500<color> �i�m ��i <color=yellow>T� Quang Ng�c<color>? Thu�c t�nh: <color=yellow> "..tbJewelryName[nType].."<color>",getn(selTab),selTab);

end;

function get_jewelry_confirm(nType)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 3500 then
		Talk(1,"",g_szInfoHeader.."�i�m T� Quang C�c kh�ng ��, ��i hi�p c�n <color=yellow>3500<color> �i�m m�i c� th� ��i ���c lo�i trang b� n�y.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,50) == 0 then
		Talk(1,"",g_szInfoHeader.."H�nh trang ho�c s�c l�c kh�ng ��, xin m�i h�y s�p x�p l�i h�nh trang r�i ti�p t�c ��i ph�n th��ng.");
		return 0;
	end;
	SetTask(TSK_POINT,nPoint-3500);
	nRetCode = AddItem(0,102,2355+nType-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("��i hi�p �� thu ���c 1 T� Quang Ng�c");
		WriteLogEx("Tu Quang Cac","��i","1","T� Quang Th�ch");
	else
		WriteLog("[Bang h�i �i l�i]"..GetName().."L�c ��i 1 T� Quang Ng�c xu�t hi�n l�i, lo�i h�nh: "..nType..",nRetCode:"..nRetCode);
	end;
end;
--==================================================================================
function get_award_use_item()
	local selTab = {
		"T� Quang Chi�n Kh�i/#list_special_equip(1,1)",
		"T� Quang Chi�n B�o/#list_special_equip(2,1)",
		"T� Quang Chi�n Trang/#list_special_equip(3,1)",
		"T� Quang Ti�n Ng�c/#list_special_equip(4,1)",
		"T� Quang Th�n Binh/#list_special_equip(5,1)",
		"Ta ch� ti�n ���ng h�i ch�i!/nothing",
		}
	Say(g_szInfoHeader.."��i hi�p mu�n ��i trang b� n�o d��i ��y? Ch� �: <color=yellow>Nh�ng trang b� d��i ��y ��u l� trang b� kh�a, kh�ng th� d�ng �� giao d�ch v�i ng��i ch�i kh�c<color>.",getn(selTab),selTab);
end;

function list_special_equip(nEquipType,nPageNum)
	local tbItemTab = get_special_equip_list(nEquipType);
	local nRecordCount = getn(tbItemTab);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbItemTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,1,format("Trang tr��c/#list_special_equip(%d,%d)",nEquipType,nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("Trang k�/#list_special_equip(%d,%d)",nEquipType,nPageNum+1));	
	end;
	tinsert(selTab,"\nXem trang b� kh�c./get_award_use_item");
	tinsert(selTab,"Ta ch� gh� ch�i/nothing");
	local nPoint = GetTask(TSK_POINT);
	Say(g_szInfoHeader.."Ng��i mu�n ��i <color=yellow>"..TB_AWARD[nEquipType][2].."<color>? C�n ph�i c� <color=yellow>"..TB_AWARD[nEquipType][1][1][2][4].."c�i"..TB_AWARD[nEquipType][1][1][2][5].." v�"..TB_AWARD[nEquipType][1][1][3].." �i�m T� Quang C�c.<color>. Hi�n t�i ng��i c� <color=yellow>"..nPoint.."<color> �i�m T� Quang C�c. Xin m�i c�n c� v�o t�nh tr�ng hi�n t�i c�a ��i hi�p �� ch�n thu�c t�nh trang b� c�n thi�t:",getn(selTab),selTab);
end;

function get_special_equip_list(nEquipType)
	local tSelTab = {};
	for i=1,getn(TB_AWARD[nEquipType][1]) do
		tinsert(tSelTab, "@ "..TB_AWARD[nEquipType][1][i][4].." /#get_special_equip_affirm("..nEquipType..","..i..")");
	end;
	return tSelTab;
end;

function get_special_equip_affirm(nEquipType,nEquipIdx)
	local selTab = {
				format("��ng �/#get_special_equip_confirm(%d,%d)",nEquipType,nEquipIdx),
				"Ta mu�n xem trang b� kh�c/get_award_use_item",
				"T�m th�i kh�ng ���c ��i/nothing",
				}
	local szInfor = TB_AWARD[nEquipType][1][nEquipIdx][4];
	Say(g_szInfoHeader.."��i hi�p ch�n <color=yellow>"..TB_AWARD[nEquipType][2].."<color> c� thu�c t�nh l�: <color=yellow>"..szInfor.."<color>. Ng��i c� ch�c ch�n ��i m�n trang b� n�y kh�ng?",getn(selTab),selTab);
end;

function get_special_equip_confirm(nEquipType,nEquipIdx)
	local nPoint = GetTask(TSK_POINT);
	local nBody = GetBody();
	local tbItemInfo = TB_AWARD[nEquipType][1][nEquipIdx];
	local nNeedPoint = tbItemInfo[3];
	local nNeedItemID1,nNeedItemID2,nNeedItemID3,nNeedItemCount,szNeedItemName = tbItemInfo[2][1],tbItemInfo[2][2],tbItemInfo[2][3],tbItemInfo[2][4],tbItemInfo[2][5];
	local nEquipID1,nEquipID2,nEquipID3,szEquipName = tbItemInfo[1][1],tbItemInfo[1][2],tbItemInfo[1][3],TB_AWARD[nEquipType][2];
	if nPoint < nNeedPoint then
		Talk(1,"",g_szInfoHeader.."�i�m T� Quang C�c c�a ��i hi�p kh�ng ��, ph�i c�n c� <color=yellow>"..nNeedPoint.."<color> �i�m T� Quang C�c m�i c� th� ��i m�n trang b� n�y.");
		return 0;
	end;
	if GetItemCount(nNeedItemID1,nNeedItemID2,nNeedItemID3) < nNeedItemCount then
		Talk(1,"",g_szInfoHeader.."��i hi�p c�n c� "..nNeedItemCount.."c�i"..szNeedItemName.." m�i c� th� ��i m�n trang b� n�y ���c.")
		return 0;
	end;
	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"",g_szInfoHeader.."H�nh trang ho�c s�c l�c kh�ng ��, xin m�i h�y s�p x�p l�i h�nh trang r�i ti�p t�c ��i ph�n th��ng.");
		return 0;
	end;
	if DelItem(nNeedItemID1,nNeedItemID2,nNeedItemID3,nNeedItemCount) == 1 then
		SetTask(TSK_POINT,nPoint-nNeedPoint);
		if nEquipType == 4 or nEquipType == 5 then	--��������λ�����
			nRetCode = AddItem(nEquipID1,nEquipID2,nEquipID3,1,1,-1,-1,-1,-1,-1,-1);
		else
			nRetCode = AddItem(nEquipID1,nEquipID2,nEquipID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
		end;
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..szEquipName);
			if nEquipType == 5 then
				local szWeaponName = tbItemInfo[5] or  ""
				WriteLogEx("Tu Quang Cac","��i","1",szWeaponName);
			else
				WriteLogEx("Tu Quang Cac","��i","1",szEquipName);
			end			
		else
			WriteLog("[Bang h�i �i l�i]"..GetName().."��i "..szEquipName.."(nEquipIdx:"..nEquipIdx..") AddItem g�p l�i, nRetCode:"..nRetCode);
		end;
	end;
end;

function go_to_another_city()
	local selTab = {
				[1] = "Tuy�n Ch�u/#go_to_the_city_test(1)",
				[2] = "D��ng Ch�u/#go_to_the_city_test(2)",
				[3] = "Bi�n Kinh/#go_to_the_city_test(3)",
				[4] = "Th�nh ��/#go_to_the_city_test(4)",
				[5] = "T��ng D��ng/#go_to_the_city_test(5)",
				[6] = "Kh�ng c�n �i n�a/nothing",
				}
	Say(g_szInfoHeader.."Mu�n ��n th�nh th� n�o?",getn(selTab),selTab);
end;

function go_to_the_city_test(nCityIdx)
	local tCityPos = 
	{
		[1] = {100,1426,3014},
		[2] = {150,1651,3174},
		[3] = {200,1381,2917},
		[4] = {300,1764,3594},
		[5] = {350,1449,3013},
	}
	NewWorld(tCityPos[nCityIdx][1],tCityPos[nCityIdx][2],tCityPos[nCityIdx][3]);
end;

function get_award_use_xiakehuizhang()
	local selTab = {
				"��i b� T� Vi�m/get_yandi_suit",
				"��i b� T� Vi�n/get_huangdi_suit",
				"Xem ph�n th��ng kh�c/get_award",
				"Ta ch� gh� ch�i/nothing",
				}
	Say(g_szInfoHeader.."Trong T� Quang C�c kh�ng nh�ng nh�n ���c �i�m t�ch l�y, m� c�n nh�n ���c Hi�p kh�ch ch��ng d�ng �� trao ��i trang b� cao c�p h�n, hi�n Hi�p kh�ch ch��ng t�i �a l� <color=yellow>"..MAX_XIEKEHUIZHANG.."<color>.",getn(selTab),selTab);
end;

g_tbYanDiSuitAward = 
{
	[1] = {"T� Quang Vi�m �� Kh�i",180,6750,{0,103,8051}},
	[2] = {"T� Quang Vi�m �� Trang",180,6750,{0,101,8051}},
	[3] = {"T� Quang Vi�m �� Gi�p",252,9450,{0,100,8051}},
}

g_tbHuangDiSuitAward = 
{
	[1] = {"T� Vi�n Chi�n",252,9450},
	[2] = {"T� Vi�n ��u",252,9450},
	[3] = {"T� Vi�n V� Kh�",324,12150},
}

function get_yandi_suit()
	local nItemName = "";
	local nNum = 0;
	local nPoint = 0;
	local selTab = {};
	local nCurPoint = GetTask(TSK_POINT);
	local nCurNum = GetItemCount(2,0,1091);
	for i=1,getn(g_tbYanDiSuitAward) do
		nItemName = g_tbYanDiSuitAward[i][1];
		nNum = g_tbYanDiSuitAward[i][2];
		nPoint = g_tbYanDiSuitAward[i][3];
		tinsert(selTab,nItemName.." (C�n "..nNum.." Hi�p kh�ch ch��ng, �i�m t�ch l�y T� Quang "..nPoint..")/#get_yandi_suit_1("..i..")");
	end;
	tinsert(selTab,"Ta xem trang b� kh�c/get_award_use_xiakehuizhang");
	tinsert(selTab,"Ta ch� gh� ch�i/nothing");
	Say(g_szInfoHeader.."Ng��i mu�n ��i trang b� g�? Hi�n ng��i c� <color=yellow>"..nCurNum.."<color> Hi�p kh�ch ch��ng v� <color=yellow>"..nCurPoint.."<color> �i�m t�ch l�y T� Quang.",getn(selTab),selTab);
end;

function get_yandi_suit_1(nIdx)
	local selTab = {
				"��ng �/#get_yandi_suit_2("..nIdx..")",
				"H�y b�/nothing",
				}
	local nItemName = g_tbYanDiSuitAward[nIdx][1];
	local nNum = g_tbYanDiSuitAward[nIdx][2];
	local nPoint = g_tbYanDiSuitAward[nIdx][3];
	Say(g_szInfoHeader.."Ng��i mu�n d�ng <color=yellow>"..nNum.."<color> Hi�p kh�ch ch��ng v� <color=yellow>"..nPoint.."<color> �i�m t�ch l�y T� Quang ��i <color=yellow>"..nItemName.."<color> ch�?",getn(selTab),selTab);
end;

function get_yandi_suit_2(nIdx)
	if gf_JudgeRoomWeight(1,100,g_szInfoHeader) == 0 then
		return 0;
	end;
	local nBody = GetBody();
	local nID1,nID2,nID3 = 0,0,0;
	nID1 = g_tbYanDiSuitAward[nIdx][4][1];
	nID2 = g_tbYanDiSuitAward[nIdx][4][2];
	nID3 = g_tbYanDiSuitAward[nIdx][4][3];
	local nItemName = g_tbYanDiSuitAward[nIdx][1];
	local nNum = g_tbYanDiSuitAward[nIdx][2];
	local nPoint = g_tbYanDiSuitAward[nIdx][3];
	if GetItemCount(2,0,1091) < nNum then
		Talk(1,"",g_szInfoHeader.."Hi�p kh�ch ch��ng kh�ng �� <color=yellow>"..nNum.."<color> c�i, c� ph�i �� trong R��ng ch�a �� kh�ng?");
		return 0;
	end;
	local nCurPoint = GetTask(TSK_POINT);
	if nCurPoint < nPoint then
		Talk(1,"",g_szInfoHeader.."�i�m t�ch l�y T� Quang kh�ng �� <color=yellow>"..nPoint.."<color>, kh�ng th� ��i trang b� n�y.");
		return 0;	
	end;
	if DelItem(2,0,1091,nNum) == 1 then
		SetTask(TSK_POINT,nCurPoint-nPoint);
		AddItem(nID1,nID2,nID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("B�n ��i "..nNum.." Hi�p kh�ch ch��ng v� "..nPoint.." �i�m t�ch l�y T� Quang ��i 1  "..nItemName);
		gf_WriteLog("T� Quang C�c","D�ng th�"..nNum.." Hi�p kh�ch ch��ng v� "..nPoint.." �i�m t�ch l�y ��i 1  "..nItemName);
	else
		gf_WriteLog("T� Quang C�c b� l�i","H�y b�"..nNum.." Hi�p kh�ch ch��ng DelItem b� l�i ");
	end;
end;
--=======================================================================================
function get_huangdi_suit()
	local nItemName = "";
	local nNum = 0;
	local nPoint = 0;
	local selTab = {};
	local nCurPoint = GetTask(TSK_POINT);
	local nCurNum = GetItemCount(2,0,1091);
	for i=1,getn(g_tbHuangDiSuitAward) do
		nItemName = g_tbHuangDiSuitAward[i][1];
		nNum = g_tbHuangDiSuitAward[i][2];
		nPoint = g_tbHuangDiSuitAward[i][3];
		tinsert(selTab,nItemName.." (C�n "..nNum.." Hi�p kh�ch ch��ng, �i�m t�ch l�y T� Quang "..nPoint..")/#get_huangdi_suit_1("..i..")");
	end;
	tinsert(selTab,"Ta xem trang b� kh�c/get_award_use_xiakehuizhang");
	tinsert(selTab,"Ta ch� gh� ch�i/nothing");
	Say(g_szInfoHeader.."Ng��i mu�n ��i trang b� g�? Hi�n ng��i c� <color=yellow>"..nCurNum.."<color> Hi�p kh�ch ch��ng v� <color=yellow>"..nCurPoint.."<color> �i�m t�ch l�y T� Quang.",getn(selTab),selTab);		
end;

function get_huangdi_suit_1(nIdx)
	local selTab = {
				"��ng �/#get_huangdi_suit_2("..nIdx..")",
				"H�y b�/nothing",
				}
	local nItemName = g_tbHuangDiSuitAward[nIdx][1];
	local nNum = g_tbHuangDiSuitAward[nIdx][2];
	local nPoint = g_tbHuangDiSuitAward[nIdx][3];
	Say(g_szInfoHeader.."Ng��i mu�n d�ng <color=yellow>"..nNum.."<color> Hi�p kh�ch ch��ng v� <color=yellow>"..nPoint.."<color> �i�m t�ch l�y T� Quang ��i <color=yellow>"..nItemName.."<color> ch�?",getn(selTab),selTab);
end;

function get_huangdi_suit_2(nIdx)
	if gf_JudgeRoomWeight(2,150,g_szInfoHeader) == 0 then
		return 0;
	end;
	local nRetCode,nRouteIdx = gf_CheckPlayerRoute();
	if nRetCode == 0 then
		Talk(1,"",g_szInfoHeader.."B�n ph�i v�o l�u ph�i m�i c� th� ��i ph�n th��ng n�y.");
		return 0;
	end;
	local nItemName = g_tbHuangDiSuitAward[nIdx][1];
	local nNum = g_tbHuangDiSuitAward[nIdx][2];
	local nPoint = g_tbHuangDiSuitAward[nIdx][3];
	if GetItemCount(2,0,1091) < nNum then
		Talk(1,"",g_szInfoHeader.."Hi�p kh�ch ch��ng kh�ng �� <color=yellow>"..nNum.."<color> c�i, c� ph�i �� trong R��ng ch�a �� kh�ng?");
		return 0;
	end;
	local nCurPoint = GetTask(TSK_POINT);
	if nCurPoint < nPoint then
		Talk(1,"",g_szInfoHeader.."�i�m t�ch l�y T� Quang kh�ng �� <color=yellow>"..nPoint.."<color>, kh�ng th� ��i trang b� n�y.");
		return 0;	
	end;
	if DelItem(2,0,1091,nNum) == 1 then
		SetTask(TSK_POINT,nCurPoint-nPoint);
		give_huangdi_suit(nIdx,nRouteIdx);
		Msg2Player("B�n ��i "..nNum.." Hi�p kh�ch ch��ng v� "..nPoint.." �i�m t�ch l�y T� Quang ��i 1  "..nItemName);
		gf_WriteLog("T� Quang C�c","D�ng th�"..nNum.." Hi�p kh�ch ch��ng v� "..nPoint.." �i�m t�ch l�y ��i 1  "..nItemName);
	else
		gf_WriteLog("T� Quang C�c b� l�i","H�y b�"..nNum.." Hi�p kh�ch ch��ng DelItem b� l�i ");
	end;
end;

g_tbHuangDiWeapon = 
{
	{{0,3,8851},{0,5,8852}},	--�����׼�
	{{0,8,8853}},	
	{{0,0,8854}},	
	{{0,1,8855}},	
	{{0,2,8856}},	
	{{0,10,8857}},
	{{0,0,8858}},	
	{{0,5,8859}},	
	{{0,2,8860}},	
	{{0,9,8861}},	
	{{0,6,8862}},	
	{{0,4,8863}},	
	{{0,7,8864}},	
	{{0,11,8865}},
}

function give_huangdi_suit(nIdx,nRouteIdx)
	local szItemName = "";
	if nIdx == 1 then
		AddItem(0,102,8851+2*(nRouteIdx-1),1,1,-1,-1,-1,-1,-1,-1);
		szItemName = GetItemName(0,102,8851+2*(nRouteIdx-1));
	elseif nIdx == 2 then
		AddItem(0,102,8852+2*(nRouteIdx-1),1,1,-1,-1,-1,-1,-1,-1);
		szItemName = GetItemName(0,102,8852+2*(nRouteIdx-1));
	elseif nIdx == 3 then
		local nID1,nID2,nID3 = 0,0,0;
		for i=1,getn(g_tbHuangDiWeapon[nRouteIdx]) do
			nID1 = g_tbHuangDiWeapon[nRouteIdx][i][1];
			nID2 = g_tbHuangDiWeapon[nRouteIdx][i][2];
			nID3 = g_tbHuangDiWeapon[nRouteIdx][i][3];
			AddItem(nID1,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
			szItemName = GetItemName(nID1,nID2,nID3);
		end;
	end;
	Msg2Player("B�n nh�n ���c "..szItemName);
end;

function get_exchange_exp()
	local tbSayDialog = {};
	local szSayHead = "��i hi�p �ang c� <color=yellow>"..GetTask(TSK_POINT).."<color> �i�m, ��i hi�p mu�n ��i bao nhi�u �i�m kinh nghi�m ?"
		
	tinsert(tbSayDialog, "��i 1000 �i�m T� Quang C�c l�y 10.000 �i�m kinh nghi�m/#confirm_get_exchange_exp(1)")
	tinsert(tbSayDialog, "��i 10.000 �i�m T� Quang C�c l�y 100.000 �i�m kinh nghi�m/#confirm_get_exchange_exp(2)")
	tinsert(tbSayDialog, "��i 100.000 �i�m T� Quang C�c l�y 1.000.000 �i�m kinh nghi�m/#confirm_get_exchange_exp(3)")	
	tinsert(tbSayDialog, 	"Ta ch� ti�n th� gh� ngang qua th�i./nothing")

	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function confirm_get_exchange_exp(nType)
	local tPoint_exchange = {
		[1] = {1000, 1 },
		[2] = {10000, 10},
		[3] = {100000, 100},	
	}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� ��i �i�m kinh nghi�m !!!")
		return
	end
	local nExp = tPoint_exchange[nType][1] * 10
	local nPointTQC = GetTask(TSK_POINT)
	if nPointTQC < tPoint_exchange[nType][1] then 
		Talk(1, "", "��i hi�p kh�ng c� nhi�u �i�m T� Quang C�c �� ��i !!!")
		return 0;
	end;
	if nExp > 2000000000 - GetExp() then
		Talk(1, "", "��i hi�p c� qu� nhi�u �i�m kinh nghi�m r�i !!!")
		return 0;
	end

	SetTask(TSK_POINT,nPointTQC - tPoint_exchange[nType][1]);
	ModifyExp(nExp) 
	Msg2Player("Ch�c m�ng ��i hi�p �� ��i ���c "..nExp.." �i�m kinh nghi�m")	
	gf_WriteLogEx("DOI DIEM KINH NGHIEM", "�i�m exp by TQC", tPoint_exchange[nType][2], "�i�m exp by TQC")		
end