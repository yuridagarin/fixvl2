--create date:2007-07-09
--author:yanjun
--describe:���ؿ������ߣ��ؿ����������NPC������������Ⱥͽ��д��صģ�
Include("\\script\\missions\\tong_mission\\main_function.lua");
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua";
g_szInfoHeader = "<color=green>T� Quang C�c L�o Nh�n<color>: ";
function main()
	load_stage(GetMissionS(MS_TONG_NAME));
end;

function ask_reason()
	AskClientForString("leave","Nh� nh�ng r�i kh�i...",1,32,"Sao ph�i r�i kh�i?");
end;	

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,ALL_CAMP);
	Msg2MSAll(MISSION_ID,GetName().."R�i T� Quang C�c, �� l�i l�i nh�n:"..sLeaveMsg);
end;

function know_rule()
	Talk(1,"main",g_szInfoHeader.."Sinh t�n ch�nh l� quy t�c c� b�n nh�t.");
end;

function go_out_room()
	local selTab = {
				"��ng �/go_out_room_confirm",
				"H�y b�/nothing",
				}
	Say(g_szInfoHeader.."Ng��i c� ch�c mu�n ra ngo�i ���ng?",getn(selTab),selTab);
end;

function go_out_room_confirm()
	SetPos(tPos_Out_Room[1],tPos_Out_Room[2]-10);
	SetTaskTemp(TSK_TEMP_STATUS,0);
	TM_StopTimeGuage(-1);
	Msg2MSAll(MISSION_ID,GetName().." �i ra t� n�i ���ng.");
end;

function apply_enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nNormalPlayerCount = TM_GetNormalPlayerCount();
	if nNormalPlayerCount >= MAX_NORMAL_PLAYER_COUNT then
		Talk(1,"main",g_szInfoHeader.."Trong bang �� c� <color=yellow>"..MAX_NORMAL_PLAYER_COUNT.."<color> v� cao th� ti�n v�o n�i ���ng, ng��i h�y ch� m�t ch�t x�u n�a nh�.");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	if TM_CheckNormalPlayer(nRoute) == 0 then
		Talk(1,"main",g_szInfoHeader.."N�i ���ng �� c� <color=yellow>"..MAX_ROUTE_PLAYER_COUNT.."<color> v� cao th� c�ng h� ph�i ��i hi�p, ng��i h�y ��i th�m l�c n�a nh�.");
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastEnterTime = GetMissionV(MV_ENTER_TIME);
	--������ڴ��ؽ׶β��Ҿ����ϴν���ʱ������MIN_ENTER_INTERVAL
	if GetMissionV(MV_STAGE_OVER) ~= 1 and nCurTime - nLastEnterTime <= MIN_ENTER_INTERVAL then
		Talk(1,"",g_szInfoHeader.."c�n <color=yellow>"..tf_GetTimeString(MIN_ENTER_INTERVAL-nCurTime+nLastEnterTime).."<color> m�i c� th� ti�n v�o n�i ���ng.");
		return 0;
	end;
	local nCurJob = IsTongMember();
	local szTongName = GetTongName();
	if (szTongName == GetMissionS(MS_TONG_NAME) and nCurJob ~= 0 and nCurJob <= 3) or LIMIT_VERSION == 0 then
		enter_in_room();	--����쵼ֱ�ӽ��볡��
	else
		sent_apply_to_tong_header();
	end;
end;

function sent_apply_to_tong_header()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastApplyTime = GetTask(TSK_APPLY_TIME);	--��ø����ϴ�����ʱ��
	local nLastMSApplyTime = GetMissionV(MV_APPLY_TIME);	--���Mission��¼���ϴ���������ʱ��
	if nCurTime - nLastMSApplyTime <= MIN_MS_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."Hi�n t�i �� c� ng��i ch�i kh�c b�o danh v�o n�i ���ng r�i, xin m�i ��i th�m l�c n�a.");
		return 0;
	end;
	if nCurTime - nLastApplyTime <= MIN_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."c�n <color=yellow>"..tf_GetTimeString(MIN_APPLY_INTERVAL-nCurTime+nLastApplyTime).."<color> m�i c� th� �� xu�t b�o danh v�o n�i ���ng.");
		return 0;		
	end;
	local _,__,tbTongHeader = TM_GetPlayerTable();
	local nHeaderCount = getn(tbTongHeader);
	local nOldPlayerIdx = PlayerIndex;
	local nMaxJob = 99999;
	if nHeaderCount <= 0 then
		Talk(1,"",g_szInfoHeader.."Hi�n t�i n�i ���ng kh�ng c� ng��i th�ch h�p �� x� l� �� ngh� b�o danh v�o n�i ���ng n�y.");
		return 0;
	else
		SetMissionV(MV_PROPOSER,PlayerIndex);	--��¼�����ߵ�����
		SetTask(TSK_APPLY_TIME,nCurTime);
		SetMissionV(MV_APPLY_TIME,nCurTime);
		Msg2MSAll(GetName().."B�o danh v�o n�i ���ng");
		Talk(1,"","Th�ng tin b�o danh �� ���c g�i �i!");
		local nMaxJobPlayerIdx = 0;
		local nCurJob = 0;
		for i=1,nHeaderCount do
			PlayerIndex = tbTongHeader[i];
			nCurJob = IsTongMember();
			if nCurJob ~= 0 and nCurJob < nMaxJob then	
				nMaxJobPlayerIdx = PlayerIndex;
				nMaxJob = nCurJob;
			end;
		end;
		PlayerIndex = nMaxJobPlayerIdx;	--ְλ��ߵ���λ�ſ�����׼
		Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).."B�o danh v�o n�i ���ng. C�n kho�ng %d gi�y", MIN_MS_APPLY_INTERVAL, g_THIS_FILE)
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function OnAccept(nProposerIdx, nType)
	local nOldPlayerIdx = PlayerIndex;
	clear_apply_info();
	if nProposerIdx <= 0 then
		Talk(1,"","��i ph��ng �� r�i kh�i khu v�c.");
		Msg2Player("��i ph��ng �� r�i kh�i khu v�c");
		return 0;
	end;
	if nType == 0 then	--ѡ��ȡ���������ʱ
		PlayerIndex = nProposerIdx;
		Talk(1,"","B�o danh v�n ch�a ���c th�ng qua.");
		Msg2Player("B�o danh v�n ch�a ���c th�ng qua");
		PlayerIndex = nOldPlayerIdx;
		return 0;
	end;
	PlayerIndex = nProposerIdx;
	SetMissionV(MV_ENTER_TIME,GetTime());
	enter_in_room();
	PlayerIndex = nOldPlayerIdx;
	return 1;
end;

function clear_apply_info()
	SetMissionV(MV_APPLY_TIME,0);
	SetMissionV(MV_PROPOSER,0);
end;

function enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	SetPos(tPos_In_Room[1],tPos_In_Room[2]+10);
	SetTaskTemp(TSK_TEMP_STATUS,1);	
	Msg2MSAll(MISSION_ID,GetName().."�� ti�n v�o n�i ���ng");
end;

function boss_info()
	local nCurStage = GetMissionV(MV_STAGE);
	if GetMissionV(MV_STAGE_OVER) == 1 then
		nCurStage = nCurStage + 1;
	end;
	Talk(1,"main",g_szInfoHeader..TB_BOSS_INFO[nCurStage]);
end;
--������һ��
function next_stage()
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."Ngo�i tuy�n kh�ng th� kh�i ��ng quan �i.");
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--��һ��
	if nPreStage >= 4 then	--��4��֮��
		init_stage(nPreStage+1);
	else
		remove_faction1();
	end;
end;

function remove_faction1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"Thi�u L�m/#remove_faction2(1)",
				"���ng M�n/#remove_faction2(2)",
				"Nga My/#remove_faction2(3)",
				"C�i Bang/#remove_faction2(4)",
				"V� �ang/#remove_faction2(5)",
				"Trang k�/remove_faction1_1",
				"Ch�n k�t th�c/remove_faction_confirm",
				"Ta suy ngh� l�i!/nothing",
				}
	Say(g_szInfoHeader.."Xin m�i b�n ch�n b� lo�i b�ng h� v� <color=yellow>1<color>: ",getn(selTab),selTab);
end;

function remove_faction1_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"D��ng M�n/#remove_faction2(6)",
				"Ng� ��c/#remove_faction2(7)",
				"C�n L�n/#remove_faction2(8)",
				"Th�y Y�n/#remove_faction2(10)",
				"Trang tr��c/remove_faction1",
				"Ch�n k�t th�c/remove_faction_confirm",
				"Ta suy ngh� l�i!/nothing",
				}
	Say(g_szInfoHeader.."Xin m�i b�n ch�n b� lo�i b�ng h� v� <color=yellow>1<color>: ",getn(selTab),selTab);
end;

function remove_faction2(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--����ڹؿ������в����ǲ������õ�
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE9,nFaction);
	end;
	local selTab = {
				"Thi�u L�m/#remove_faction_confirm(1)",
				"���ng M�n/#remove_faction_confirm(2)",
				"Nga My/#remove_faction_confirm(3)",
				"C�i Bang/#remove_faction_confirm(4)",
				"V� �ang/#remove_faction_confirm(5)",
				"Trang k�/remove_faction2_1",
				"Ch�n k�t th�c/remove_faction_confirm",
				"Ta suy ngh� l�i!/nothing",
				}
	Say(g_szInfoHeader.."Xin m�i b�n ch�n b� lo�i b�ng h� v� <color=yellow>2<color>: ",getn(selTab),selTab);
end;

function remove_faction2_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"D��ng M�n/#remove_faction_confirm(6)",
				"Ng� ��c/#remove_faction_confirm(7)",
				"C�n L�n/#remove_faction_confirm(8)",
				"Th�y Y�n/#remove_faction_confirm(10)",
				"Trang tr��c/remove_faction2",
				"Ch�n k�t th�c/remove_faction_confirm",
				"Ta suy ngh� l�i!/nothing",
				}
	Say(g_szInfoHeader.."Xin m�i b�n ch�n b� lo�i b�ng h� v� <color=yellow>2<color>: ",getn(selTab),selTab);
end;

function remove_faction_confirm(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--����ڹؿ������в����ǲ������õ�
		return 0;
	end;
	if nFaction == GetMissionV(MV_VALUE9) then
		Talk(1,"remove_faction2",g_szInfoHeader.."Ng��i �� ch�n lo�i b�ng h� v� n�y, xin m�i ch�n 1 lo�i b�ng h� v� kh�c.");
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE10,nFaction);
	end;
	local szFactionRemove = "";
	if GetMissionV(MV_VALUE9) ~= 0 then
		szFactionRemove = szFactionRemove..tb_Npc_Info[GetMissionV(MV_VALUE9)][2]
	end;
	if GetMissionV(MV_VALUE10) ~= 0 then
		szFactionRemove = szFactionRemove.." v�"..tb_Npc_Info[GetMissionV(MV_VALUE10)][2]
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--��һ��
	if szFactionRemove ~= "" then
		Msg2MSAll(MISSION_ID,"Quan �i n�y b� nh�ng lo�i b�ng h� v� sau: "..szFactionRemove);
	end;
	init_stage(nPreStage+1);
end;
--����Ȩ�޼��
function check_right()
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local nCurJob = IsTongMember();
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."Ngo�i tuy�n kh�ng th� kh�i ��ng quan �i.");
		return 0;
	end;
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Thao t�c n�y ph�i ���c th�c hi�n b�i bang ch�, ph� bang ch� ho�c tr��ng l�o.");
		return 0;
	end;
	if GetMSPlayerCount(MISSION_ID,ALL_CAMP) < MIN_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."Hi�n t�i t�ng s� ng��i ch�i �t h�n <color=yellow>"..MIN_PLAYER_COUNT.."<color> ng��i, kh�ng th� b�t ��u v��t �i!	");
		return 0;
	end;
	if GetMissionV(MV_GET_BOX) == 1 then
		Talk(1,"",g_szInfoHeader.."Xin m�i nh�t b�o r��ng r�i m�i ti�p t�c v�o �i k� ti�p.");
		return 0;
	end;
	return 1;
end;

--����ĳһ��
function init_stage(nStage)
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--����ڹؿ������в����ǲ������õ�
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--��һ��
	Msg2MSAll(MISSION_ID,GetName().."Kh�i ��ng �i "..(nPreStage+1)..".");
	TM_InitStage(nStage);	--��ʼ����һ��
end;
--���õ�ǰ�ؿ�
function reset_stage()
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:EndStage(0);
	SetMissionV(MV_STAGE,0);
end;
--��ȡ����
function load_stage(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"load_stage_callback");
end;

function load_stage_callback(szKey, nKey1, nKey2, nCount)
	local nStage = 0;
	gf_ShowDebugInfor(nCount);
	if nCount == 0 then
		nStage = 0;
	else
		nStage = GetRelayShareDataByKey(szKey,nKey1,nKey2,KEY_STAGE);
	end;
	gf_ShowDebugInfor(nStage);
	if nStage == nil then
		nStage = 0;
	end;
	if GetMissionV(MV_STAGE) == 0 then	--��һ�ε��ʱ��֮ǰ�Ľ��ȶ�����
		SetMissionV(MV_STAGE,nStage);
	end;
	local selTab = {
				"Gi�i thi�u quy t�c/know_rule",
				}
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	local nMissionState = GetMissionV(MV_MISSION_STATE);
	if nMissionState > MS_STATE_READY then	--׼��ʱ�������
		local nCurStage = GetMissionV(MV_STAGE);
		if bStageOver == 0 then	--ֻ�����ڴ�BOSS��ʱ����д�ѡ��
			if DEBUG_VERSION == 1 then
				tinsert(selTab,"Reset �i hi�n t�i (Test)/reset_stage");
			end;
		end;
		if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
			if bStageOver == 1 and nCurStage < MAX_STAGE then
				tinsert(selTab,"B�t ��u v��t �i (�i "..(nStage+1)..")/next_stage");
				if DEBUG_VERSION == 1 then
					tinsert(selTab,"Ta mu�n v��t �i 1 (test)/#init_stage(1)");
					tinsert(selTab,"Ta mu�n v��t �i 2 (test)/#init_stage(2)");
					tinsert(selTab,"Ta mu�n v��t �i 3 (test)/#init_stage(3)");
					tinsert(selTab,"Ta mu�n v��t �i 4 (test)/#init_stage(4)");
					tinsert(selTab,"Ta mu�n v��t �i 5 (test)/#init_stage(5)");
					tinsert(selTab,"Ta mu�n v��t �i 6 (test)/#init_stage(6)");
				end;
			end;
			tinsert(selTab,"Tr� l�i ngo�i ���ng	/go_out_room");
		else
			tinsert(selTab,"B�o danh v�o n�i ���ng/apply_enter_in_room");
		end;
	else
		tinsert(selTab,"L�p t�c b�t ��u v��t �i/run_mission");
	end;
	if DEBUG_VERSION == 1 then
		tinsert(selTab,"K�t th�c �i (test)/close_mission");
	end;
	tinsert(selTab,"Gi�i thi�u �n s� T� Quang C�c/know_boss_info");
	tinsert(selTab,"M� r��ng	/open_box");
	tinsert(selTab,"Ta mu�n r�i kh�i n�i ��y/ask_reason");
	tinsert(selTab,"Kh�ng c� vi�c g�/nothing");	
	Say(g_szInfoHeader.."Nghe n�i n�i ���ng cao th� mu�n v�n, �� m� s�ng s�t tho�t kh�i ���c n�i ��y h�nh nh� kh�ng nhi�u ng��i, bang <color=yellow>"..szKey.."<color> n�n c�n th�n.",getn(selTab),selTab);
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

function run_mission()
	local selTab = {
				"��ng �/run_mission_confirm",
				"��i m�t t�	/nothing",
				}
	Say(g_szInfoHeader.."Ng��i ch�c ch�n l�p t�c kh�i ��ng �i n�y?",getn(selTab),selTab);
end;

function run_mission_confirm()
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."Thao t�c n�y ph�i ���c th�c hi�n b�i bang ch�, ph� bang ch� ho�c tr��ng l�o.");
		return 0;
	end;
	if GetMissionV(MV_STAGE_OVER) == MS_STATE_READY then
		RunMission(MISSION_ID);
		Talk(1,"",g_szInfoHeader.."B�y gi� ng��i c� th� b�t ��u v�o khu v�c �� v��t �i ���c r�i ��.");
	end;
end;

function team_enter_in_room()
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize == 0 then
		enter_in_room();
	else
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			enter_in_room();
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function close_mission()
	local selTab = {
				"��ng �/close_mission_confirm",
				"Ta b�m nh�m r�i/nothing",
				}
	Say(g_szInfoHeader.."X�c ��nh mu�n k�t th�c �i v� tho�t kh�i khu v�c n�y?",getn(selTab),selTab);
end;

function close_mission_confirm()
	CloseMission(MISSION_ID);
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInfoHeader.."Ng��i v�n ch�a thu�c v� r��ng c�a m�nh.");
		return 0;
	end;
	OpenBox();
end;