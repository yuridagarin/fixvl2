--��������npc
--by vivi
--2009-07-16

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua")
Include("\\script\\lib\\message.lua")
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online_activites\\award.lua")
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--���������Ľӿ�
Include("\\script\\online\\olympic\\oly_head.lua")
--׷����������ս
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\collect_card\\cc_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

g_szThisFile = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";
g_RealmNpcName = "<color=green>T��ng Gi�o Qu�ch Qu�n Di <color>: ";

function main()
	--==========�������������===================
	Talk(1,"",g_NpcName.."Ch�c n�ng TMT t�m ��ng");
	
	do 
		return 0
	end
	
	if GetTask(1401) == 136 then
		Talk(1,"",g_NpcName.."Nh� l�i M�c t��ng qu�n �� n�i, th�t s� ta �� l�p n�n tr�n ph�p. Thi�u hi�p c� th� tham gia th� nghi�m m�t tr�n, chi�n th�ng r�i h�y ��n t�m ta");
		SetTask(1401,137);
		GivePlayerExp(SkeyTianmenzhen,"guojunpen")
		TaskTip("Chi�n th�ng 1 l�n Thi�n M�n Tr�n.");
		return 0;
	elseif GetTask(1401) == 137 and GetTask(TASKID_TMZ_PLAY_POINT) >= OVER_GAME_POINT then
		Talk(1,"",g_NpcName.."Xem ra c�c h� �� r� c�ch b�y b� Thi�n M�n Tr�n r�i, h�y mau v� b�m b�o v�i M�c t��ng qu�n �i.");
		SetTask(1401,138);
		GivePlayerExp(SkeyTianmenzhen,"yanwushengli")
		TaskTip("V� b�m b�o v�i M�c Qu� Anh");
		return 0;
	end
	--============================================
	if GetMapTemplate(SubWorld) == 350 then		--��������NPCȡ��
		Talk(1,"",g_RealmNpcName.."Thi�n M�n Tr�n hi�n �� ���c chuy�n ��n <color=red>Th�nh �� (231/229) v� ��i L� (179/179)<color>!")
	else
		local strtab = {
			"��ng k� tham gia Thi�n M�n Tr�n c� nh�n/tmz_single_join",
			"��ng k� tham gia Thi�n M�n Tr�n t� ��i/tmz_team_join",
			"Nh�n ph�n th��ng Thi�n M�n Tr�n/tmz_get_award",
			"Xem thu�c t�nh trang b� m�i/#Sale(147,100,1)",
			"Gi�i thi�u Thi�n M�n Tr�n/tmz_about_detail",
			"Kh�ng c� g�!/gf_DoNothing"
			};
		if GLB_TMZ_BiWuCheck() == 1 then
			tinsert(strtab,4,"T� v� Thi�n M�n Tr�n bang h�i xuy�n server/tmz_about_tong");
		end
		Say(g_NpcName.."Giang s�n ��i T�ng ta �ang t�nh c�nh v�y nguy t� ngo�i t�c, nam nhi ��i tr��ng phu sao c� th� khoanh tay ��ng nh�n! Thi�u hi�p ��n t�m ta c� vi�c chi?",
			getn(strtab),
			strtab)	
	end
end

function tmz_tong_callback_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzTong = SDB(szkey,0,0,3);
	local strTongName = GetTongName();
	local nHufu =  tbTmzTong[strTongName][8] or MAX_HUFU;
	strtab = {
		"B�o danh tham gia/#tmz_tong_join(1)",
		"S� d�ng 20 Ti�u Dao Ng�c b�o danh tham gia/#tmz_tong_join(2)",
		"Gi�i thi�u ��i tr�n/tmz_tong_detail",
		"��a ta tr� v�/tmz_tong_back",
		"Kh�ng c� g�!/gf_DoNothing",	
	};
	local strMsg = "Qu� bang c�n d� Thi�n M�n H� Ph� �n l� <color=yellow>"..nHufu.."<color>, m�i l�n b�o danh c�u ti�u hao 1."
	Say(g_RealmNpcName.."C�c v� thi�u hi�p, khi �� v�o ��n ��y th� ph�i nghe l�nh ta! K� l�m tr�i l�nh, x� theo qu�n ph�p!"..strMsg,
		getn(strtab),
		strtab);	
end

function tmz_single_join()
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ph��ng �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ng�c �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
	end
	--ʱ������
	local nTime = tonumber(date("%H%M"));
	if (not ((1100 <= nTime and nTime < 1300) or (1700 <= nTime and nTime < 1900) or (2200 <= nTime and nTime <= 2359))) then
		Talk(1,"",g_NpcName.."Di�n v� ch�a m�, t� 11:00-13:00, 17:00-19:00 ho�c 22:00-23:00 h�y quay l�i b�o danh tham gia");
		return 0;
	end
	
	--����ȼ�����
	local nLv = GetLevel();
	if nLv < PLAY_NEED_LV then
		Talk(1,"",g_NpcName.."L�n di�n v� n�y kh�ng ph�i t�m th��ng, thi�u hi�p tr� ng��i non da kh� tr�nh kh�i th��ng vong. C�c h� ��t ��n c�p <color=yellow>70<color> h�y ��n tham gia.");
		return 0
	end
	--�����ɲŸ���
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C�c h� v�n ch�a gia nh�p m�n ph�i, kh�ng th� tham gia.");
		return 0;
	end
	--�����Ƿ���ȡ����һ��ս���Ľ���
	if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
		Talk(1,"",g_NpcName.."Thi�u hi�p v�n ch�a nh�n ph�n th��ng l�n tham gia tr��c, h�y nh�n th��ng tr��c �i.");
		return 0;
	end 
	if GetTeamSize() > 1 then
		Talk(1,"",g_NpcName.."H�y t�m ch� t� ��i ��n b�o danh v�i ta.");
		return 0;
	end
	
	if GetPKValue() >= 10 then
		Talk(1,"",g_NpcName.."C�c h� s�t kh� qu� n�ng (PK>10), n�u tham gia v�o Thi�n M�n Tr�n s� m�ng h�a s�t th�n, �� ngh� t�nh t�m l�i h�y ��n t�m ta b�o danh tham gia");
		return 0;
	end
	
	-- ÿ���������
	if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
		Talk(1,"",g_NpcName..format("M�i ng�y m�i ng��i ch� ���c tham gia <color=green>%d<color> tr�n Di�n V�, c�c h� h�y quay l�i v�o ng�y mai.",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	
	if GetCash() < 30000 then
		Talk(1,"","��i hi�p kh�ng c� 3 v�ng")
		return
	end
	
	local nWaiting = 0;
	if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
		nWaiting = 1; --��װ״̬
	end
	local nCurMapId = TMZ_GetSuitMap(1,nWaiting);
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId) then
			mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
		else
			mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
		end
	else --û�к��ʵģ��¿�һ��
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."T�t c� c�c b�n �� �� ��y, h�y quay l�i sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("T� l� chi�m tr�n: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			
			_stat_on_misson_open()
		end
	end
	Pay(30000)
	_stat_when_join(1)
	
	--cdkey�
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

function tmz_team_join()
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ph��ng �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H�y ��n g�p Ti�u Ng�c �� tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta ");
			return 0;	
		end
	end
	--ʱ������
	local nTime = tonumber(date("%H%M"));
	if (not ((1100 <= nTime and nTime < 1300) or (1700 <= nTime and nTime < 1900) or (2100 <= nTime and nTime < 2300))) then
		Talk(1,"",g_NpcName.."Di�n v� v�n ch�a chu�n b� xong, thi�u hi�p h�y quay l�i v�o 11: 00 ~ 13: 00 ho�c 17: 00~19: 00 ho�c 21: 00~23: 00 tham gia chi�n tr��ng.");
		return 0;
	end
	
	local nTeamNumber = GetTeamSize();
	local sCapTainName = GetCaptainName();
	if nTeamNumber < 1 or nTeamNumber > 3 then
		Talk(1,"",g_NpcName.."B�o danh Thi�n M�n Tr�n c� th� theo t� ��i 3 ng��i ho�c c� nh�n tham gia");
		return 0;
	end
	if GetName() ~= sCapTainName then
		Talk(1,"",g_NpcName.."T� ��i c�n ��i tr��ng ��n b�o danh.");
		return 0;
	end
	if tmz_AreaCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ��i ng� c� th�nh vi�n v�ng m�t ");
		return 0;
	end
	if tmz_LvCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ��i ng� c� th�nh vi�n ch�a ��t c�p 70.");
		return 0;
	end
	if tmz_AwardCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ��i ng� c� th�nh vi�n ch�a nh�n ph�n th��ng l�n tham gia tr��c");
		return 0;
	end
	if tmz_TeamRouteCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ��i ng� c� th�nh vi�n ch�a gia nh�p m�n ph�i");
		return 0;
	end
	if tmz_TeamCashCheck() == 0 then
		tmz_TeamTalk(g_NpcName)
		return 0
	end
	
	if tmz_PkValueCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ��i ng� c� th�nh vi�n s�t kh� qu� n�ng (PK>10), kh�ng th� v�o");
		return 0;		
	end
	-- ÿ���������
	if tmz_CheckJoinLimitCount() == 0 then
		Talk(1,"",g_NpcName..format("Trong ��i ng� c� ng��i �� tham gia <color=green>%d<color> tr�n di�n v� r�i.",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	local nWaiting = 0;
	if tmz_ZhengZhuangCheck() == 0 then
		nWaiting = 1;
	end
	local nCurMapId = TMZ_GetSuitMap(nTeamNumber,nWaiting);
	local nOldIndex = PlayerIndex; 
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId)then
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i); 
				mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		else
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);						
				mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		end
	else --û�к��ʵģ��¿�һ��
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."T�t c� c�c b�n �� �� ��y, h�y quay l�i sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("T� l� chi�m tr�n: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);							
				mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
			
			_stat_on_misson_open()
		end
	end	
	tmz_TeamPay()
	_stat_when_join(GetTeamSize() or 2)
	
	--cdkey�
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

-- �ڽ���ǰ�ж����ж�Ա�Ƿ���ͬһ������
function tmz_AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--���ȡһ����Ա��worldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function tmz_LvCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nLv = GetLevel();
		if nLv < PLAY_NEED_LV then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;
end

function tmz_AwardCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_ZhengZhuangCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_TeamRouteCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCheckRoute = gf_CheckPlayerRoute();
		if nCheckRoute == 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function  tmz_TeamCashCheck()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCash = GetCash()
		if nCash < 30000 then
			return 0
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

 function tmz_TeamTalk(g_NpcName)
 	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Talk(1,"",g_NpcName.."Trong ��i ng� c� th�nh vi�n ch�a c� 3 v�ng");
	end
	PlayerIndex = nOldIndex;
 end

function  tmz_TeamPay()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Pay(30000)
	end
	PlayerIndex = nOldIndex;
end


function tmz_PkValueCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nPk = GetPKValue();
		if nPk >= 10 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;			
end

function tmz_TongMemberCheck()
	local nOldIndex = PlayerIndex;
	local strTongName = "";
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if i == 1 then
			strTongName = GetTongName();
		else
			if strTongName ~= GetTongName() then
				PlayerIndex = nOldIndex;
				return 0;
			end
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	 
end

function tmz_CheckJoinLimitCount()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

--������ȫ���
function tmz_Award_Base_Exp()
	local nExp = 0;
	local nLv = GetLevel();
	local tExpType = {{75,80,85,90,100},{nLv^3/3,(100+(nLv-75)*20)*10000/3,(280+(nLv-80)*24)*10000/3,(400+(nLv-85)*28)*10000/3,5120000/3}};
	for i = 1,getn(tExpType[1]) do
		if nLv < tExpType[1][i] then
			nExp = tExpType[2][i];
			break;
		end
	end
	return nExp
end

--����˥��ϵ��1
function tmz_Award_Exp_Arg()
	local nExpArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	if nNum <= 8 then
		nExpArg = 1-(1/512)*(nNum-4)^2;
	else
		nExpArg = 0.5;
	end
	return nExpArg;
end

--����˥��ϵ��1
function tmz_Award_Mark_Arg()
	local tNumArg = {{9,8,7,6,5,4,3,2,1},{0,0.2,0.3,0.6,0.6,0.8,1,0.8,0.7}};
	local nMarkArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	for i = 1,getn(tNumArg[1]) do
		if nNum >= tNumArg[1][i] then
			nMarkArg = tNumArg[2][i];
			break;
		end
	end
	return nMarkArg;
end

function tmz_get_award()
	
	--���ж��Ƿ�μ�����һ���������ж��Ƿ�Ϊ��Ч����
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C�c h� v�n ch�a tham gia th� nghi�m Thi�n M�n Tr�n tr��c");
		return 0;
	end

	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local sTalk = format("Thi�u hi�p tr�n Di�n V� Tr��ng bi�u hi�n %s, n�n l�n di�n v� n�y ngo�i ph�n th��ng tham d� ra c�n c� th� nh�n ���c %s ph�n th��ng t�ch c�c.", tbAcvtiveDesc[nActiveLevel][2], "H� Qu�n C�ng Ch��ng", tbAcvtiveDesc[nActiveLevel][1]);
	Say(g_NpcName..sTalk,
		6,
		format("%s/#tmz_confirm_award(0)","Nh�n th��ng tr�c ti�p"),
		format("%s/#tmz_ask_award(1)",format("D�ng %s nh�n th��ng",tAwardItem[1][1])),
		format("%s/#tmz_ask_award(2)",format("D�ng %s nh�n th��ng",tAwardItem[2][1])),
		format("%s/#tmz_ask_award(3)",format("D�ng %s nh�n th��ng",tAwardItem[3][1])),
		format("%s/#tmz_ask_award(4)",format("D�ng %s nh�n th��ng",tAwardItem[4][1])),
		"T�m th�i kh�ng nh�n/gf_DoNothing")
end

function tmz_ask_award(nType)
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C�c h� v�n ch�a tham gia th� nghi�m Thi�n M�n Tr�n tr��c");
		return 0;
	end

	nType = nType or 0;
	
	local tbNormal = tbNormalAward[nType];
	local szAward = format("C�c h� x�c nh�n d�ng <color=yellow>%s<color> nh�n th��ng?", tAwardItem[nType][1] or "" );
--	szAward = szAward .. "�������";
--	
--	for i=1,getn(tbNormal.tbAward) do
--		local szUnit = "";
--		local szName = "";
--		local nCount = 0;
--		if (tbNormal.tbAward[i][1] == 1) then
--			szUnit = "��";
--			szName = tbNormal.tbAward[i][2];
--			nCount = tbNormal.tbAward[i][3][4];
--		elseif (tbNormal.tbAward[i][1] == 2) then
--			szUnit = "��";
--			szName = "����";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 3) then
--			szUnit = "";
--			szName = "��Ǯ";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 4) then
--			szUnit = "��";
--			szName = "����";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 5) then
--			szUnit = "��";
--			szName = "ʦ�Ź���";
--			nCount = tbNormal.tbAward[i][2];
--		end
--		szAward = szAward .. format("<color=green>%d<color>%s<color=yellow>%s<color>, ",nCount, szUnit, szName);
--	end
	Say(g_NpcName .. szAward,
		3,
		"\n ��ng, ta mu�n nh�n th��ng/#tmz_confirm_award("..nType..")",
		"\n ta ch�n sai r�i/tmz_get_award",
		"\n t�m th�i ch�a mu�n/gf_DoNothing");
end

function tmz_confirm_award(nType)
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C�c h� v�n ch�a tham gia th� nghi�m Thi�n M�n Tr�n tr��c");
		return 0;
	end

	nType = nType or 0;
	local tbNeedItem = tAwardItem[nType]	
--	if nType == 4 then
--		if GetItemCount(2,1,9999) < 1 or GetItemCount(2,1,9998) < 1 or GetItemCount(2,1,9977) < 1 then
--			Talk(1,"",g_NpcName.."C�c h� ch�n nh�n th��ng d�ng VIP m� kh�ng mang �� c�c lo�i qu�n c�ng");
--			return 0;
--		end
--	else
		if type(tbNeedItem[1]) == "string" then
			if GetItemCount(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4]) < tbNeedItem[5] then
				Talk(1,"",g_NpcName.."C�c h� mang kh�ng ��"..tbNeedItem[1]..".");
				return 0;
			end
		end
--	end
	local nNeedRoom = 0;
	local nNeedWeight = 0;
	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local tbActive = tbAcvtiveLossAward[nActiveLevel];
	local tbNormal = tbNormalAward[nType];
	
	local bIsWin = 0--��ʤ���
	if (GetTask(TASKID_TMZ_PLAY_RESULT) == 2) then
		tbActive = tbAcvtiveWinAward[nActiveLevel];
		bIsWin = 1--��ʤ���
	end
	
	if (tbActive == nil or tbNormal == nil) then
		return 0;
	end
	
	nNeedRoom = tbNormal.nBagLimit;
	nNeedRoom = nNeedRoom + tbActive.nBagLimit;
	nNeedWeight = tbNormal.nWeightLimit;
	nNeedWeight = nNeedWeight + tbActive.nWeightLimit;
	if gf_Judge_Room_Weight(nNeedRoom+4,nNeedWeight,g_NpcName) ~= 1 then --+4Ԥ����������Ŀռ�
		return 0;
	end
--	if nType == 4 then
--		if DelItem(2,1,9999,1) ~= 1 or DelItem(2,1,9998,1) ~= 1 or DelItem(2,1,9977,1) ~= 1 then
--			return 0
--		end
--	else
		if type(tbNeedItem[1]) == "string" then
			if DelItem(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4],tbNeedItem[5]) ~= 1 then
				return 0;
			end
		end
--	end
	
	local tAddRate = {
		nExpAddRate = (1 + TMZ_EXP_EXT_RATE)*(1 + GetVipCardParam()),
		nJunGongAddRate = (1 + TMZ_JUNGONG_EXT_RATE),
	}
	if bIsWin == 0 then--�������������ӳ�
		tAddRate.nJunGongAddRate = 1
	end
	gf_EventGiveAllAward(tbNormal.tbAward,"Thi�n M�n tr�n",format("Nh�n th��ng type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
--	if bIsWin == 0 then--������Ծ�Ⱦ��齱��/3
--		tAddRate.nExpAddRate = tAddRate.nExpAddRate/3
--	end
	gf_EventGiveAllAward(tbActive.tbAward,"Thi�n M�n tr�n",format("Nh�n th��ng type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
	if(nActiveLevel == 6) then
		Msg2Global(format("%s trong Thi�n M�n Di�n V� Tr��ng l�c �p qu�n h�ng, ch�i s�ng m�t ph��ng, qu� th�t nh�n trung h�o ki�t.",GetName()));
	end
	-- Chuy�n Sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) < 80 then
				gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) +1)
				if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) == 80 then
					TaskTip("Ho�n th�nh y�u c�u c�a B�ch Ti�n Sinh ho�n th�nh 80 l�n Thi�n m�n tr�n")
				end
	end
	-----------------------Chu�i nhi�m v� Chuy�n Sinh 6
	local nCS6_TMT =  floor(GetTask(TSK_CS6_COUNTC)/100)
	local nCS6_TMT_Num = mod(GetTask(TSK_CS6_COUNTC),100)
	if mod(nCS6_TMT,100) < 20 and GetTask(TSK_CS6_TULINH) == 3 then
		nCS6_TMT = (nCS6_TMT + 1) * 100 + nCS6_TMT_Num
		SetTask(TSK_CS6_COUNTC, nCS6_TMT)
	end
	------------------------	
	local nCheckTMT = GetTask(368)
	nType = tonumber(nType)
	WriteLogEx(THIENMON_LOG_TITLE, "��i �i�m Thi�n M�n Tr�n: "..nCheckTMT)
	
	--���ٽ�������
	--AwardZhenQi_TianMenZhen(nActiveLevel, bIsWin)--�������ʤ��������
	
	if bIsWin == 1 then
		_MissionAward_RandAward(g_tWinExtraAward, "Ph�n th��ng phe th�ng Thi�n M�n Tr�n")--ʤ��ר������
		gf_EventGiveAllAward(g_tWinExtraAward2[nType].tbAward,"Thi�n M�n tr�n",format("Nh�n %s ph�n th��ng tham gia","Phe th�ng"),tAddRate);
		--Nh�n qu�n c�ng cho server H�a Ph�ng
		-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
			-- gf_Modify("JunGong",tbQuanCong_HP[nType][1])
		-- end
	else
		gf_EventGiveAllAward(g_tLoseExtraAward2[nType].tbAward,"Thi�n M�n tr�n",format("Nh�n %s ph�n th��ng tham gia","Phe thua"),tAddRate);
		--Nh�n qu�n c�ng cho server H�a Ph�ng
		-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
			-- gf_Modify("JunGong",tbQuanCong_HP[nType][2])
		-- end
	end
--	local nQCPoint =  tbQuanCongTMT[nType+1][1]
	local nCampBase = 1
	local nExp_TMT = 5000000
	
	if nCheckTMT < 2 then
--		nQCPoint = tbQuanCongTMT[nType+1][2]
		nExp_TMT = 1900000
	end 
	ModifyExp(nExp_TMT)	
--	if  GetTask(701) < 0 then
--		nCampBase = -1
--	end
	
--	SetTask(701,GetTask(701) + nQCPoint * nCampBase)
--	Msg2Player("B�n nh�n ���c "..nQCPoint.." �i�m qu�n c�ng")
	WriteLogEx(THIENMON_LOG_TITLE, "Qu�n c�ng Thi�n M�n Tr�n")	
	
	AwardZhenQi_TianMenZhen(nActiveLevel, bIsWin)--�������ʤ��������
	CalcBattleRank()
	UpdateBattleMaxRank()
	SetTask(TASKID_TMZ_PLAY_RESULT,0);
	
	tmz_clear_task_id();
	--Observer:onEvent(OE_TMZ_Get_Award,{nWin,nType}); --��Ӯ�����������
	--==============���⽱���ӿ�award.lua==============
--	if nType ~= 4 then
		extra_tianmenzhen_award(nType)
--	end
	--�����
	if bIsWin == 1 then
		--���˻
		oly_AddShengHuo(6,1);
		--׷����������ս
		dzt_tmz_succ();
		--������Ƭ���ƻ
		cc_tmz_award_succ();
	else
		oly_AddShengHuo(2,1);
		dzt_tmz_fail();
		--������Ƭ���ƻ
		cc_tmz_award_fail();
	end
	-----------------------Chu�i nhi�m v� ��ng H�nh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 9 or DongHanh_GetMission() == 10) then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	--------------------------------
	ThienMonTran_NhanThuong(nType)
	--�������ܻ���������
	aw_tmz_award(nType);
	
	_stat_when_award(nType, nActiveLevel)
	
	--���ֹ�ѫ
	merit_TianMenZhen(bIsWin, nType);
end

function tmz_change_mark()
	local tSel = {
--		"��Ҫ�鿴�����װ/#Sale(147,100,1)",
--		"��Ҫ�û��ֶһ������ɵ�[����ϵ��]�������ɽ��ף�/tmz_change_weapon",
--		"��Ҫ�û��ֽ�[����ϵ��]װ������Ϊ[�ǿ�ϵ��]װ�������ɽ��ף�/#tmz_change_s2(1)",
--		"��Ҫ�û��ֽ�[�ǿ�ϵ��]װ������Ϊ[����ϵ��]װ�������ɽ��ף�/#tmz_change_s2(2)",
		"10 �i�m t�ch l�y ��i ���c 1 Kim Tinh/#tmz_change_stone(1)",
		"10 �i�m t�ch l�y ��i ���c 1 M�c Tinh/#tmz_change_stone(2)",
		"10 �i�m t�ch l�y ��i ���c 1 Th�y Tinh/#tmz_change_stone(3)",
		"10 �i�m t�ch l�y ��i ���c 1 H�a Tinh/#tmz_change_stone(4)",
		"10 �i�m t�ch l�y ��i ���c 1 Th� Tinh/#tmz_change_stone(5)",
		"Kh�ng c� g�!/gf_DoNothing",
	}
	Say(g_NpcName.."�i�m t�ch l�y Thi�n M�n Tr�n c�a c�c h� l�: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color>. ��i hi�p mu�n ��i tr�ng b� g�?", getn(tSel), tSel)
end

function tmz_change_stone(nType)
	if nType < 1 or nType > 5 then return end
	local nNeed = 10;
	if GetTask(TASKID_TMZ_AWARD_MARK) < nNeed then
		Talk(1,"",g_NpcName.."�i�m t�ch l�y c�a c�c h� kh�ng ��.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,g_NpcName) ~= 1 then
		return 0;
	end
	gf_ModifyTask(TASKID_TMZ_AWARD_MARK, -nNeed);
	AddItem(2,201,nType*2,1);
end

function tmz_change_weapon()
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C�c h� v�n ch�a gia nh�p m�n ph�i, kh�ng th� tham gia.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	Say(g_NpcName.."V� kh� [H� Thi�n M�n] c�n ��t <color=yellow>c�p 75<color> m�i c� th� trang b�, ��i <color=yellow>["..tAwardWeapon[nRoute][1][1].."]<color>c�n <color=yellow>"..tAwardWeapon[nRoute][1][5].."<color> �i�m t�ch l�y Thi�n M�n Tr�n, hi�n t�i c�c h� �� c�: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color> �i�m, c� mu�n ��i?",
		2,
		"\n��ng/tmz_change_weapon_confirm",
		"\nKh�ng c�n/gf_DoNothing")
end

function tmz_change_weapon_confirm()
	local nRoute = GetPlayerRoute();
	if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardWeapon[nRoute][1][5] then
		Talk(1,"",g_NpcName.."�i�m t�ch l�y c�a c�c h� kh�ng ��.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardWeapon[nRoute][1][5]);
	local nAdd_flag,nIdx = AddItem(tAwardWeapon[nRoute][1][2],tAwardWeapon[nRoute][1][3],tAwardWeapon[nRoute][1][4],1,1,-1,-1,-1,-1,-1,-1);
	if nAdd_flag == 1 then
		Msg2Player("B�n nh�n ���c ["..tAwardWeapon[nRoute][1][1].."]x1");
	end
	WriteLogEx(THIENMON_LOG_TITLE, "��i �i�m t�ch l�y s� d�ng: "..tAwardWeapon[nRoute][1][1])
	WriteLog("[��i �i�m t�ch l�y Thi�n M�n Tr�n]: t�i kho�n: "..tostring(GetAccount()).."Nh�n v�t: "..tostring(GetName()).."Th�i gian: "..tonumber(date("%Y%m%d")).."[��i 1 m�n: "..tAwardWeapon[nRoute][1][1].."]. K� hi�u: "..nAdd_flag);
end

function tmz_change_s2(nTbIDX)
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C�c h� v�n ch�a gia nh�p m�n ph�i, kh�ng th� tham gia.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local strtab = {
	format("[%s] n�ng c�p th�nh [%s] (c�n �i�m t�ch l�y Thi�n M�n Tr�n %d)/#tmz_change_s2_ask(%d,1,1)",tAwardCloth[nTbIDX][1][1][1][1],tAwardCloth[nTbIDX+1][1][1][1][1],tAwardCloth[nTbIDX+1][1][1][1][5],nTbIDX),
	format("[%s] n�ng c�p th�nh [%s] (c�n �i�m t�ch l�y Thi�n M�n Tr�n %d)/#tmz_change_s2_ask(%d,1,2)",tAwardCloth[nTbIDX][1][2][1][1],tAwardCloth[nTbIDX+1][1][2][1][1],tAwardCloth[nTbIDX+1][1][2][1][5],nTbIDX),
	format("[%s] n�ng c�p th�nh [%s] (c�n �i�m t�ch l�y Thi�n M�n Tr�n %d)/#tmz_change_s2_ask(%d,2,1)",tAwardCloth[nTbIDX][2][1][1][1],tAwardCloth[nTbIDX+1][2][1][1][1],tAwardCloth[nTbIDX+1][2][1][1][5],nTbIDX),
	format("[%s] n�ng c�p th�nh [%s] (c�n �i�m t�ch l�y Thi�n M�n Tr�n %d)/#tmz_change_s2_ask(%d,2,2)",tAwardCloth[nTbIDX][2][2][1][1],tAwardCloth[nTbIDX+1][2][2][1][1],tAwardCloth[nTbIDX+1][2][2][1][5],nTbIDX),
	format("[%s] n�ng c�p th�nh [%s] (c�n �i�m t�ch l�y Thi�n M�n Tr�n %d)/#tmz_change_s2_ask(%d,3,1)",tAwardCloth[nTbIDX][3][1][1][1],tAwardCloth[nTbIDX+1][3][1][1][1],tAwardCloth[nTbIDX+1][3][1][1][5],nTbIDX),
	format("[%s] n�ng c�p th�nh [%s] (c�n �i�m t�ch l�y Thi�n M�n Tr�n %d)/#tmz_change_s2_ask(%d,3,2)",tAwardCloth[nTbIDX][3][2][1][1],tAwardCloth[nTbIDX+1][3][2][1][1],tAwardCloth[nTbIDX+1][3][2][1][5],nTbIDX),
	format("[%s] n�ng c�p th�nh [%s] (c�n �i�m t�ch l�y Thi�n M�n Tr�n %d)/#tmz_change_s2_ask(%d,4,1)",tAwardWeapon[nRoute][nTbIDX][1],tAwardWeapon[nRoute][nTbIDX+1][1],tAwardWeapon[nRoute][nTbIDX+1][5],nTbIDX),
	"Kh�ng c� g�!/gf_DoNothing",
	};
	local sTalk = "";
	if nTbIDX == 1 then
		sTalk = "Trang b� [H� Tinh Kh�c] c�n ��t c�p <color=yellow>80<color> m�i c� th� trang b�, ";
	elseif nTbIDX == 2 then
		sTalk = "Trang b� [H� Thi�n Ngh�a] c�n ��t c�p <color=yellow>85 <color> m�i c� th� trang b�, ";
	end
	Say(g_NpcName..sTalk.."�i�m t�ch l�y Thi�n M�n Tr�n hi�n t�i c�a ��i hi�p: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color>. Khi n�ng c�p c�n m�c trang b� tr�n ng��i, ��i hi�p c�n n�ng c�p m�n trang b� n�o? <color=red>Ch� �: trang b� c�n ph�i gi�i kh�a tr��c khi n�ng c�p, sau khi n�ng c�p s� b�o l�u c�p �� c��ng h�a v� ��nh h�n v�n c� c�a trang b� <color>",
		getn(strtab),
		strtab)
end

function tmz_change_s2_ask(nTbIDX,nWz,nType)
	local nRoute = GetPlayerRoute();
	local strTalk = "";
	if nWz ~= 4 then
		strTalk = format("��i hi�p x�c ��nh mang <color=yellow>[%s]<color> n�ng c�p th�nh <color=yellow>[%s]<color>? C�n c� <color=yellow>%d<color> �i�m t�ch l�y Thi�n M�n Tr�n <color=yellow>khi n�ng c�p c�n m�c trang b� tr�n ng��i <color>",tAwardCloth[nTbIDX][nWz][nType][1][1],tAwardCloth[nTbIDX+1][nWz][nType][1][1],tAwardCloth[nTbIDX+1][nWz][nType][1][5]);
	else
		strTalk	= format("��i hi�p x�c ��nh mang <color=yellow>[%s]<color> n�ng c�p th�nh <color=yellow>[%s]<color>? C�n c� <color=yellow>%d<color> �i�m t�ch l�y Thi�n M�n Tr�n <color=yellow>khi n�ng c�p c�n m�c trang b� tr�n ng��i <color>",tAwardWeapon[nRoute][nTbIDX][1],tAwardWeapon[nRoute][nTbIDX+1][1],tAwardWeapon[nRoute][nTbIDX+1][5]);
	end
	Say(g_NpcName..strTalk,
		3,
		"\n x�c ��nh, ta mu�n n�ng c�p/#tmz_change_s2_confirm("..nTbIDX..","..nWz..","..nType..")",
		"\n kh�ng, ta ch�n sai r�i/#tmz_change_s2("..nTbIDX..")",
		"\n Tho�t /gf_DoNothing")
end

function tmz_change_s2_confirm(nTbIDX,nWz,nType)
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if nWz ~= 4 then
		if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardCloth[nTbIDX+1][nWz][nType][nBody][5] then
			Talk(1,"",g_NpcName.."�i�m t�ch l�y Thi�n M�n Tr�n c�a ��i hi�p ch�a ��, kh�ng th� n�ng c�p trang b�");
			return 0;
		end
		local tWz = {0,1,3};
		local nIdx = GetPlayerEquipIndex(tWz[nWz]); --�������ϵ�����
		if nIdx == 0 then  --û�д�����
			Talk(1,"",g_NpcName.."M�n trang b� c�c h� �ang m�c kh�ng ph�i"..tAwardCloth[nTbIDX][nWz][nType][nBody][1]..", h�y m�c ��ng trang b� tr�n ng��i!");
			return 0;
		end		
		if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --�����ж�
			Talk(1,"",g_NpcName.."Trang b� n�y �� b� kh�a, gi�i kh�a sau h�y n�ng c�p!");
			return
		end
		local nId1,nId2,nId3 = GetPlayerEquipInfo(tWz[nWz]);
		if nId1 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][2] or nId2 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][3] or nId3 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][4] then
			Talk(1,"",g_NpcName.."M�n trang b� c�c h� �ang m�c kh�ng ph�i"..tAwardCloth[nTbIDX][nWz][nType][nBody][1]..", h�y m�c ��ng trang b� tr�n ng��i!");
			return 0;
		end
		local nQianghua = GetEquipAttr(nIdx,2);--��ȡ��Ʒǿ���ȼ�
		local nDing5 = GetItemSpecialAttr(nIdx,"DING5"); --��ȡװ���Ƿ񶨻�
		local nDing10 = GetItemSpecialAttr(nIdx,"DING10"); --��ȡװ���Ƿ񶨻�
		if DelItemByIndex(nIdx,-1) == 1 then
			SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardCloth[nTbIDX+1][nWz][nType][nBody][5]);
			local nAdd_flag,nNewIdx = AddItem(tAwardCloth[nTbIDX+1][nWz][nType][nBody][2],tAwardCloth[nTbIDX+1][nWz][nType][nBody][3],tAwardCloth[nTbIDX+1][nWz][nType][nBody][4],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
			if nAdd_flag == 1 then
				if nDing5 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING5",1); --����
				end
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING10",1); --����
				end
				Msg2Player("C�c h� nh�n ���c ["..tAwardCloth[nTbIDX+1][nWz][nType][nBody][1].."]x1");
			end
			WriteLogEx(THIENMON_LOG_TITLE, "��i trang b� "..". ID tr��c khi n�ng c�p: "..nId1..nId2..nId3.."ID sau khi n�ng c�p: "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][2]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][3]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][4])
			WriteLog("[n�ng c�p trang b� Thi�n M�n Tr�n]: T�i kho�n: "..tostring(GetAccount()).."Nh�n v�t: "..tostring(GetName()).."Th�i gian: "..tonumber(date("%Y%m%d")).."[d�ng"..tAwardCloth[nTbIDX][nWz][nType][nBody][1].."T�ng c�p th�nh "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][1]..". ID tr��c khi n�ng c�p: "..nId1..nId2..nId3.."ID sau khi n�ng c�p: "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][2]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][3]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][4].."]. K� hi�u: "..nAdd_flag);
		end
	else
		if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardWeapon[nRoute][nTbIDX+1][5] then
			Talk(1,"",g_NpcName.."�i�m t�ch l�y Thi�n M�n Tr�n c�a ��i hi�p ch�a ��, kh�ng th� n�ng c�p trang b�");
			return 0;
		end
		local nIdx = GetPlayerEquipIndex(2); --�������ϵ�����
		if nIdx == 0 then  --û�д�����
			Talk(1,"",g_NpcName.."M�n trang b� c�c h� �ang m�c kh�ng ph�i"..tAwardWeapon[nRoute][nTbIDX][1]..", h�y m�c ��ng trang b� tr�n ng��i!");
			return 0;
		end
		if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --�����ж�
			Talk(1,"",g_NpcName.."Trang b� n�y �� b� kh�a, gi�i kh�a sau h�y n�ng c�p!");
			return
		end
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 ~= tAwardWeapon[nRoute][nTbIDX][2] or nId2 ~= tAwardWeapon[nRoute][nTbIDX][3] or nId3 ~= tAwardWeapon[nRoute][nTbIDX][4] then
			Talk(1,"",g_NpcName.."M�n trang b� c�c h� �ang m�c kh�ng ph�i"..tAwardWeapon[nRoute][nTbIDX][1]..", h�y m�c ��ng trang b� tr�n ng��i!");
			return 0;
		end
		local nQianghua = GetEquipAttr(nIdx,2);--��ȡ��Ʒǿ���ȼ�
		local nDing5 = GetItemSpecialAttr(nIdx,"DING5"); --��ȡװ���Ƿ񶨻�
		local nDing10 = GetItemSpecialAttr(nIdx,"DING10"); --��ȡװ���Ƿ񶨻�
		if DelItemByIndex(nIdx,-1) == 1 then
			SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardWeapon[nRoute][nTbIDX+1][5]);
			local nAdd_flag,nNewIdx = AddItem(tAwardWeapon[nRoute][nTbIDX+1][2],tAwardWeapon[nRoute][nTbIDX+1][3],tAwardWeapon[nRoute][nTbIDX+1][4],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
			if nAdd_flag == 1 then
				if nDing5 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING5",1); --����
				end
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING10",1); --����
				end
				Msg2Player("C�c h� nh�n ���c ["..tAwardWeapon[nRoute][nTbIDX+1][1].."]x1");
			end
			WriteLogEx(THIENMON_LOG_TITLE, "��i trang b� "..". ID tr��c khi n�ng c�p: "..nId1..nId2..nId3.."ID sau khi n�ng c�p: "..tAwardWeapon[nRoute][nTbIDX+1][2]..tAwardWeapon[nRoute][nTbIDX+1][3]..tAwardWeapon[nRoute][nTbIDX+1][4])
			WriteLog("[n�ng c�p trang b� Thi�n M�n Tr�n]: T�i kho�n: "..tostring(GetAccount()).."Nh�n v�t: "..tostring(GetName()).."Th�i gian: "..tonumber(date("%Y%m%d")).."[d�ng"..tAwardWeapon[nRoute][nTbIDX][1].."T�ng c�p th�nh "..tAwardWeapon[nRoute][nTbIDX+1][1]..". ID tr��c khi n�ng c�p: "..nId1..nId2..nId3.."ID sau khi n�ng c�p: "..tAwardWeapon[nRoute][nTbIDX+1][2]..tAwardWeapon[nRoute][nTbIDX+1][3]..tAwardWeapon[nRoute][nTbIDX+1][4].."]. K� hi�u: "..nAdd_flag);
		end
	end
end

function tmz_about_detail()
	local strtab = {
		". Tham gia di�n v�/tmz_about_detail_1",
		". Quy t�c di�n v�/tmz_about_detail_2",
		". Ph�n th��ng di�n v�/tmz_about_detail_3",
		--"�����⽱��/tmz_about_detail_4",
		". Tr� l�i/main"
	};
	Say(g_NpcName.."Di�n v� tr��ng n�y ch�nh l� m�t b�n sao c�a Thi�n M�n Tr�n m� Li�u qu�n �� b� tr�, ta �� l�nh cho t��ng s� trong qu�n luy�n t�p ng�y ��m, nay cu�i c�ng �� t�m ra huy�n c� trong ��.",
		getn(strtab),
		strtab);
end

function tmz_about_detail_1()
	Talk(1,"tmz_about_detail",g_NpcName.."Thi�u hi�p c� th� t� ��i d��i 3 ng��i ho�c c� nh�n b�o danh tham gia. N�n nh� th�nh vi�n trong ��i nh�t ��nh ph�i nh�n th��ng �t nh�t 1 l�n tr��c khi tham gia tr�n ti�p theo");
end

function tmz_about_detail_2()
	Talk(1,"tmz_about_detail",g_NpcName.."1, thi�u hi�p ho�c th�nh vi�n trong ��i s� ���c <color=yellow>chuy�n ng�u nhi�n<color> ��n 1 n�i trong di�n v� tr��ng. Khi s� ng��i tham gian 2 b�n l�n h�n ho�c b�ng<color=yellow>"..PLAYER_NEED_NUM.."<color>ng��i th� chi�n tr�n s� b�t ��u. \n  2, Khi chi�m ���c Tr�n Nh�n, m�i c�ch 15 gi�y t�ng 1 l�n th�i gian chi�m tr�n cho phe m�nh. Th�i gian chi�m tr�n ��t ��n"..APPEAR_FLAG_POINT.."ph�t <color>, l�p t�c c� th� t�n c�ng <color=yellow>Tr�n K�<color> (phe doanh ch�), ti�u di�t tr�n k� c� th� tr�c ti�p nh�n ���c l��ng l�n th�i gian chi�m tr�n. \n  3, Th�i gian chi�m tr�n c�a b�t k� phe n�o ��t ��n <color=yellow>"..OVER_GAME_POINT.."<color>ph�t l�p t�c k�t th�c tr�n chi�n. Thi�u hi�p s� nh�n ���c ph�n th��ng d�a tr�n bi�u hi�n c�a b�n th�n.\n  4, Ng��i ch�i c� bi�u hi�n ti�u c�c trong ��i tr�n s� b� m�i kh�i di�n v� tr��ng.");
end

function tmz_about_detail_3()
	Talk(1,"tmz_about_detail_3_2",g_NpcName..format("\n    1.	C�u th�nh ph�n th��ng di�n v� \n    Ph�n th��ng di�n v� l� ph�n th��ng t�ng h�p khi tham gia v� �� t�ch c�c c�ng l�i, khi nh�n th��ng s� nh�n ���c c� 2. M�i ng�y m�i ng��i ch�i ch� c� th� tham gia <color=green>%d<color> l�n Di�n V�.",TMZ_DAILY_AWARD_LIMIT))
end

function tmz_about_detail_3_2()
	Talk(1,"tmz_about_detail_3_3",g_NpcName..format("\n    2.	Ph�n th��ng khi tham gia \n    Ch� c�n tham gia v� ��nh ��n h�t tr�n l� c� th� nh�n th��ng, ph�n th��ng n�y c� th� d�ng nh�ng ��o c� <color=yellow>%s<color> �� nh�n ��i nhi�u l�n, v� c�ng h�p d�n.","Qu�n C�ng Ch��ng"));
end

function tmz_about_detail_3_3()
	Talk(1,"tmz_about_detail",g_NpcName..format("\n    3.	 Ph�n th��ng t�ch c�c���� t�ch c�c\n    �� t�ch c�c l� c�n c�d�ng �� �o l��ng ng��i ch�i c� th� nh�n ���c ph�m ch�t v�t ph�m th��ng, �� t�ch c�c d�a tr�n <color=yellow>s� ng��i ��nh b�i ���c<color>, <color=yellow>t�ng s�t th��ng xu�t chi�u<color>, <color=yellow>s� l�n chi�m l�nh tr�n nh�n<color>, <color=yellow>s� l��ng qu�i ti�u di�t ���c<color>, <color=yellow>chi�m l�nh tr�n k�<color>� c�a c�c h� bi�u hi�n tr�n di�n v� tr��ng, �� t�ch c�c c�ng cao, ph�n th��ng c�ng h�p d�n, ��ng th�i kh�ng th� d�ng <color=yellow>%s<color> �� nh�n ��i ph�n th��ng.","Qu�n C�ng Ch��ng"))
end

function tmz_about_detail_4()
	Talk(1,"tmz_about_detail",g_NpcName.."V�o 12: 00 -14: 00 v� 18: 00 - 20: 00 m�i ng�y, ng��i ch�i ��ng k� tham gia ��u tr�n v� nh�n ���c ph�n th��ng �i�m kinh nghi�m s� ���c nh�n ��i. Hi�u qu� n�y kh�ng t�c d�ng v�i"..tAwardItem[1][1].." v�"..tAwardItem[2][1].."C�ng d�n.")
end

function tmz_about_tong()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --û���
		Talk(1,"",g_NpcName.."Y�u c�u gia nh�p bang h�i m�i c� th� tham gia bang h�i Thi�n M�n Tr�n.");
		return 0;
	end		
	local strtab = {
		"��i Xu Ti�u Dao/tmz_Change_Xoyo_Gold",
		"��i Ng�c Ti�u Dao (1 H�a Th� B�ch ��i ���c 100 Ng�c Ti�u Dao)/tmz_Change_Xoyo_Yu",
		"Tham gia bang h�i Thi�n M�n Tr�n xuy�n server (c�n 200 Xu Ti�u Dao)/tmz_goto_realm",
		"Nh�n th��ng Thi�n M�n Tr�n xuy�n server/tmz_tong_award",
		"Server ��i tr�n/tmz_Special_Service",
		"Gi�i thi�u ��i tr�n/tmz_tong_detail",
		"K�t th�c ��i tho�i/gf_DoNothing",
	};
	Say(g_NpcName.."T�m ta c� vi�c g� kh�ng?",
		getn(strtab),
		strtab)
end

function tmz_Change_Xoyo_Gold()
	local strtab = {
		"D�ng v�ng ��i Xu Ti�u Dao (1 v�ng ��i 100 Xu Ti�u Dao)/tmz_Use_JXB",
		"tr� l�i/tmz_about_tong",
		"K�t th�c ��i tho�i/gf_DoNothing",
	};
	Say(g_NpcName.."Sau khi v��t server ngo�i <color=yellow>Xu Ti�u Dao<color> ra nh�ng ti�n t� kh�c ��u kh�ng th� s� d�ng, ta c� th� gi�p chuy�n <color=yellow>v�ng<color> th�nh Xu Ti�u Dao. Thi�u hi�p hi�n �ang s� h�u "..GetXYB().." Xu Ti�u Dao, v� sau c� th� ki�m trang th�ng qua giao di�n F2 (c� th� l� s� �m)",
		getn(strtab),
		strtab)
end

function tmz_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("tmz_Use_JXB_Confirm",1,nJxb*100,"��i bao nhi�u Xu Ti�u Dao?");
end

function tmz_Use_JXB_Confirm(nCount)
	local nJxb = floor(GetCash()/10000);
	if nJxb < nCount/100 then
		Talk(1,"",g_NpcName.."Ti�n v�ng c�c h� mang theo kh�ng ��"..nCount.."Xu Ti�u Dao.");
		return 0;
	end
	if Pay(nCount/100*10000) == 1 then
		EarnXYB(nCount);
--		Msg2Player("����"..nCount.."��ң�ҡ�");
	end
end

function tmz_Change_Xoyo_Yu()
	Say(g_NpcName.."X�c ��nh d�ng 1 [H�a Th� B�ch] ��i 100 Ng�c Ti�u Dao?",
		2,
		"\nX�c nh�n/tmz_Change_Yu_Confirm",
		"\n Ph�n h�i/tmz_about_tong")
end

function tmz_Change_Yu_Confirm()
	if GetItemCount(2,1,1001) < 1 then
		Talk(1,"",g_NpcName.."C�c h� kh�ng mang theo H�a Th� B�ch.");
		return 0;
	end
	if DelItem(2,1,1001,1) == 1 then
		EarnXYY(100);
	end
end

function tmz_goto_realm()
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if ( nDay ~= 6 and nDay ~= 0 ) or ( nHour >= 18 or nHour < 14 ) then
		Talk(1,"","Thi�n M�n Tr�n bang h�i s� di�n ra v�o 2h ~ 6h th� 7 v� ch� nh�t h�ng tu�n.");
		return 0;
	end
	if GetLevel() < 80 then
		Talk(1,"",g_NpcName.."Tham gia Thi�n M�n Tr�n bang h�i y�u c�u ph�i ��t c�p �� tr�n 80, quay v� luy�n th�m �i.");
		return 0;
	end
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --û���
		Talk(1,"",g_NpcName.."C�c h� c�n gia nh�p bang h�i m�i c� th� tham gia Bang H�i Thi�n M�n Tr�n.");
		return 0;
	end	
	--������������ܿ��
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 172800 then
		Say(g_NpcName.."C�c h� gia nh�p bang ph�i ch�a �� 2 ng�y, kh�ng th� tham gia Bang H�i Thi�n M�n Tr�n.", 0)
		return 0;
	end
	if GetXYB() < 200 then
		Talk(1,"",g_NpcName.."Tham gia Bang H�i Thi�n M�n Tr�n c�n <color=yellow>200 Xu Ti�u Dao<color>, c�c h� mang theo kh�ng ��.");
		return 0;
	end
	local nWeek = tf_GetWeekSequence(1,0); --��һ�賿
	if GetTask(TASK_TMZ_TONG_AWARD_WEEK) ~= 0 and GetTask(TASK_TMZ_TONG_AWARD_WEEK) < nWeek then
		if GetTask(TASk_TMZ_TONG_TOTAL_NUM) ~= 0 then
			Talk(1,"",g_NpcName.."C�c h� v�n ch�a nh�n ph�n th��ng tu�n tr��c, h�y nh�n r�i tham gia ti�p th�i.");
			return 0;
		end	
	end	
	if gf_JudgeRoomWeight(15,100,g_NpcName) == 0 then
		return 0;
	end;		
	if PayXYB(200) == 1 then
		SetTask(TASKID_TMZ_TONG_IS_REALM,1);
		ChangeGroupWorld(5064,1621,3181,1);
	end
end


--=================================
function tmz_tong_AddCamp(nCurMapId,nCamp)
	local nOldIndex = PlayerIndex;
	local nTeamNumber = GetTeamSize();
	local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
	if nTeamNumber > 1 then
		for i=1, nTeamNumber do
			PlayerIndex = GetTeamMember(i); 
			mf_JoinMission(MISSION_ID,nCamp,nCurMapId);
			if GetName() == GetCaptainName() then
				WriteLogEx(THIENMON_LOG_TITLE, "t� ��i tham gia L��ng S�n B�c")
			end
			WriteLogEx(THIENMON_LOG_TITLE, "tham gia")
			TMZ_Write_TableData(nCurN,nCamp,0,0,0);
		end
		PlayerIndex = nOldIndex;
	else
		mf_JoinMission(MISSION_ID,nCamp,nCurMapId);
		TMZ_Write_TableData(nCurN,nCamp,0,0,0);
	end	
end

function tmz_tong_join(nType)
	local nTeamNumber = GetTeamSize();
	local sCapTainName = GetCaptainName();
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if ( nDay ~= 6 and nDay ~= 0 ) or ( nHour >= 18 or nHour < 14 ) then
		Talk(1,"",g_RealmNpcName.."Thi�n M�n Tr�n bang h�i s� di�n ra v�o 2h ~ 6h th� 7 v� ch� nh�t h�ng tu�n.");
		return 0;
	end
	if nTeamNumber > 1 and GetName() ~= sCapTainName then
		Talk(1,"",g_RealmNpcName.."T� ��i c�n ��i tr��ng ��n b�o danh.");
		return 0;
	end
	if tmz_AreaCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong ��i ng� c� th�nh vi�n v�ng m�t ");
		return 0;
	end
	if tmz_PkValueCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong ��i ng� c� th�nh vi�n s�t kh� qu� n�ng (PK>10), kh�ng th� v�o");
		return 0;		
	end
	if tmz_TongMemberCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong t� ��i c� ng��i kh�ng thu�c c�ng m�t bang h�i, kh�ng th� v�o Thi�n M�n Tr�n.");
		return 0;		
	end
	if nTeamNumber == 0 then --û�����
		nTeamNumber = 1;
	end
	local nCurMapId,nCamp = GLB_TMZ_GetSuitMap(nTeamNumber);
	local nOldIndex = PlayerIndex; 
	if nCurMapId == nil then --����ѿ���������������
		return 0;
	end
	if nCurMapId ~= 0 then --����ѿ�������������
		tmz_tong_AddCamp(nCurMapId,nCamp);
	else --��ỹû����
		if tmz_tong_Check(nType) == 0 then
			local tMsg = {"Thi�n M�n H� Ph� �n �t nh�t l� 1 c�i","Ng�c Ti�u Dao �t nh�t 20 c�i"};
			Talk(1,"",g_RealmNpcName.."Tham gia Thi�n M�n Tr�n y�u c�u c�n <color=yellow>bang ch�, ph� bang ch�, ho�c tr��ng l�o<color> d�n ��i <color=yellow>8 th�nh vi�n<color> bang h�i, ��ng th�i"..tMsg[nType]..".")
			return 0;
		end
		SetTaskTemp(211,nType);
		GLB_TMZ_GetOtherMap();
	end		
end

--����Ƿ���Ͽ�������
function tmz_tong_Check(nType)
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		return 0;
	end
	if GetTeamSize() < 8 then
		return 0;
	end
	if nType == 2 and GetXYY() < 20 then
		return 0;
	end
	local strTongName = GetTongName()
	local nOldIndex = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetTongName() ~= strTongName then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end 
	PlayerIndex = nOldIndex;
	return 1;
end

function tmz_tong_detail()
	local strtab = {
		"Quy tr�nh ��i tr�n/#tmz_tong_detail_1(1)",
		"�i�m bang h�i ��i tr�n/#tmz_tong_detail_1(2)",
		"C�p �� bang h�i ��i tr�n/#tmz_tong_detail_1(3)",
		"�� t�ch c�c bang h�i/#tmz_tong_detail_1(4)",
		"Ph�n th��ng /#tmz_tong_detail_1(5)",
		"tr� l�i/main",
	}
	Say("C�c h� mu�n t�m hi�u v� ph��ng di�n n�o?",
		getn(strtab),
		strtab)
end

function tmz_tong_detail_1(nType)
	local strMsg = {
		[[    ������ҵȼ���ﵽ<color=yellow>80��<color>�����Ѽ������2�졣
    ��ҿ�����ÿ<color=yellow>�������յ�14��-18��<color>��ͨ�����ｫ�����������͵��������ء���ͨ����У�����������μӿ�����������䡣����ʱ����Ҫ�ɰ��İ��������������߳�����Ϊ�ӳ�������8�˶��飬������һ�����Ż���ӡ���������������޼�����ȼ�˵����
    �ٴν���ð����ѿ����ĳ��������������Ż���ӡ��ÿ�����ͬһʱ����࿪��һ�����Ŷ���
    <color=yellow>ÿ�����ÿ�ܿɻ��8�����Ż���ӡ<color>�����ܲ������ϡ��������δ������������������Ż���ӡ��]],
		[[   ����������ǰ��μӿ����������������ֵ������ÿ������ʤ�������仯����������ֿ��ڰ������ѯ��
    ���������ǰ��ʮ����������PVP����������ѯ(ÿ�����賿ˢ�£�����300���������ֶ԰�˥������]],
		[[    ������ȼ���������������ڿ���������е�ʵ�������ɰ�������־��������У�<color=yellow>2����Ҫ150�֣�3����Ҫ190��<color>��
    ��ͬ�İ�����ȼ��������������������ͬ������һ����Ӧ8�ˣ�������Ӧ12�ˣ�������Ӧ16�ˡ�ֻ����ͬ����ȼ��İ�ᣬ�ű�������һ�����䡣]],
		[[    ����ڲμ�ÿ�������������ʱ�򣬾����а���Ծ�ȵ��ж�������Ծ������˻�Ծ����ء�
    ��һ�ζ����У��г���׼�����������İ�����ɸ��˻�Ծ���ж�����˴ζ��󷽱��϶�Ϊ��Ч���Σ�<color=yellow>�ҲμӸó�����ĸð�����Ҷ��϶�Ϊ���˻�Ծ����Ч<color>��ÿ���������������3����Ч���Σ��ſ������ܿ��Ű�ά����]],
		[[    ÿ�������������Ҹ���ʤ����������ڹ���������ȡ��Ӧ�����ľ���������о��������4���ȼ�����ͬ�ȼ��ľ�����ɻ�ò�ͬ��Ʒ�Ľ�����ÿ�ܽ��������ܲμ�����3����Ч���������ң������ܲſ���ȡ��Ӧ����ȼ��İ�ά������ȡ���ݰ��ձ���24���ֹʱ������������������������顢��������ֺ���ң�ҵȡ�
\p    ������ִﵽ400�ְ��İ��ڣ���μӹ�����3����Ч���󣩣�������ȡ����ʱ�ɶ�����<color=yellow>��Ч�ƺš�����Ⱥ�ۡ�<color>�������ɻ��<color=yellow>��Ч�ƺš�����Ӣ�ܡ�<color>��
    ������ִﵽ300�һ�����߰��İ��ڣ���μӹ�����3����Ч���󣩣�������ȡ����ʱ�ɶ�����<color=yellow>��Ч�ƺš�����ȺӢ��<color>�������ɻ��<color=yellow>��Ч�ƺš�����Ӣ����<color>]],
	};
	suTalk("tmz_tong_detail",strMsg[nType]);
end

function tmz_tong_back()
	Say(g_RealmNpcName.."C�c h� x�c ��nh mu�n tr� v�?",
		2,
		"\nX�c nh�n/tmz_tong_confirm_back",
		"\nK�t th�c ��i tho�i/gf_DoNothing")
end

function tmz_tong_confirm_back()
	ChangeGroupWorld(350,1428,2818,0);
end

tUpLvXoYoYu = {200,600};

function tmz_Special_Service()
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		Talk(1,"",g_NpcName.."Server ��i tr�n c� th� n�ng cao c�p �� ��i tr�n c�a bang h�i, y�u c�u bang ch�, ph� bang ch� ho�c tr��ng l�o ti�n h�nh thao t�c n�y.");
		return 0;
	end
	DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_3,0,0);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_sv_1");
end

function tmz_tong_callback_sv_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0);
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nBattleLv = tbTongData[2] or 1;
	local strtab = {
		"S� d�ng "..tUpLvXoYoYu[1].." Ng�c ti�u dao gi�p c�p �� bang h�i n�ng th�nh c�p 2/#tmz_Special_Service_1(1,"..nBattleLv..","..nTongScore..")",
		"S� d�ng "..tUpLvXoYoYu[2].." Ng�c ti�u dao gi�p c�p �� bang h�i n�ng th�nh c�p 3/#tmz_Special_Service_1(2,"..nBattleLv..","..nTongScore..")",
		"tr� l�i/tmz_about_tong",
		"K�t th�c ��i tho�i/gf_DoNothing"
	};
	Say(g_NpcName.."C�p �� chi�n ��u c�a qu� bang ph�i l�: <color=yellow>"..nBattleLv.."<color>",
		getn(strtab),
		strtab)	
end

function tmz_Special_Service_1(nType,nBattleLv,nTongScore)
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		Talk(1,"",g_NpcName.."Bang ch� bang h�i, ph� bang ch� ho�c tr��ng l�o c� th� ti�n h�nh thao t�c n�y.");
		return 0;
	end
	if nBattleLv > nType then
		Talk(1,"",g_NpcName.."C�p �� c�a qu� bang ph�i �� ��t ��n <color=yellow>"..nBattleLv.."<color>");
		return 0;
	end
	local nTongType = 0;
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nTongType = i;
			break;
		end
	end
	if nTongType > nType then
		Talk(1,"",g_NpcName.."�i�m t�ch l�y qu� bang ph�i �� ��t ��n <color=yellow>"..nTongScore.."<color>,  c�p �� �� ��t ��n <color=yellow>"..nTongType.."<color>");
		return 0;		
	end
	local nXoYoYu = GetXYY();
	if nXoYoYu < tUpLvXoYoYu[nType] then
		Talk(1,"",g_NpcName.."N�ng c�p c�n"..tUpLvXoYoYu[nType].."Ng�c Ti�u Dao, c�c h� mang theo kh�ng ��.");
		return 0;
	end
	Say(g_NpcName.."X�c ��nh d�ng<color>"..tUpLvXoYoYu[nType].."Ng�c Ti�u Dao gi�p bang h�i n�ng c�p th�nh "..(nType+1).."Kh�ng?",
		2,
		"\nX�c nh�n/#tmz_Special_Service_2("..nType..")",
		"\n Ph�n h�i/tmz_Special_Service")
end

function tmz_Special_Service_2(nType)
	SetTaskTemp(212,nType);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_sv_2");	
end

function tmz_tong_callback_sv_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0);
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nOldScore = nTongScore;
	local nBattleLv = tbTongData[2] or 1;
	local nWeekWin = tbTongData[3] or 0;
	local nWeekLose = tbTongData[4] or 0;
	local nTotalWin = tbTongData[5] or 0;
	local nTotalLose = tbTongData[6] or 0;
	local nLastWin = tbTongData[7] or 0;
	local nHufu = tbTongData[8] or MAX_HUFU;	
	local nType = GetTaskTemp(212);
	if nType == 0 then
		return 0;
	end
	nTongScore = tTongScoreLv[nType][1];
	nBattleLv = tTongScoreLv[nType][2]+1;
	if PayXYY(tUpLvXoYoYu[nType]) == 1 then		
		tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
		Talk(1,"","C�p �� bang h�i Thi�n M�n Tr�n c�a c�c h� l�"..nBattleLv.."C�p!")
		WriteLogEx(THIENMON_LOG_TITLE, format("[N�ng c�p bang h�i Thi�n M�n Tr�n][Bang h�i: %s n�ng c�p th�nh %d. �i�m t�ch l�y tr��c khi n�ng c�p: %d, �i�m t�ch l�y sau khi n�ng c�p: %d.]",strTongName,nBattleLv,nOldScore,nTongScore))
		WriteLog(format("[N�ng c�p bang h�i Thi�n M�n Tr�n][Bang h�i: %s n�ng c�p th�nh %d. �i�m t�ch l�y tr��c khi n�ng c�p: %d, �i�m t�ch l�y sau khi n�ng c�p: %d.]",strTongName,nBattleLv,nOldScore,nTongScore));
	end
end

function tmz_tong_award()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --û���
		Talk(1,"",g_NpcName.."C�c h� c�n gia nh�p bang h�i m�i c� th� nh�n th��ng.");
		return 0;
	end	
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);	
	local strtab = {
		"Nh�n ph�n th��ng tr�n tham gia tu�n tr��c/tmz_tong_award_1",
		"Nh�n ph�n th��ng bang h�i tham gian tu�n tr��c/tmz_tong_award_2",
		"K�t th�c ��i tho�i/gf_DoNothing",
	};
	Say(g_NpcName.."D�a tr�n bi�u hi�n tu�n tr��c c�a c�c h�, c� th� nh�n ���c <color=yellow>"..nWeekWin.."<color>tr�n th�ng tr�n h�a <color=yellow>"..nWeekLose.."<color>ph�n th��ng tr�n thua.",
		getn(strtab),
		strtab)
end

function tmz_tong_award_1()
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nWeekWin+nWeekLose <= 0 then
		Talk(1,"",g_NpcName.."C�c h� kh�ng tham gia Bang H�i Thi�n M�n Tr�n tu�n tr��c ho�c �� nh�n ph�n th��ng.");
		return 0
	end	
	local nLv = GetLevel();
	local nExp1 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3*1.35),floor((400+(nLv-85)*28)*10000/3*1.35),floor(5120000/3*1.35));
	local nExp2 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3),floor((400+(nLv-85)*28)*10000/3),floor(5120000/3));
	Say(g_NpcName.."D�a tr�n k�t qu� bi�u hi�n trong tr�n Thi�n M�n Tr�n tu�n tr��c, c�c h� c� th� nh�n ���c <color=yellow>"..floor(nExp1*nWeekWin+nExp2*nWeekLose).."<color> �i�m kinh nghi�m v� <color=yellow>"..(nWeekWin*3+nWeekLose*1).."<color> Di�n V� Bao, c� nh�n ngay kh�ng?",
		4,
		"Ta mu�n nh�n (g�p 2 l�n kinh nghi�m s�n c�)/#tmz_tong_award_1_1(0)",
		"��ng �"..(nWeekWin+nWeekLose).."C�i ["..tAwardItem[1][1].."] nh�n (kinh nghi�m b�ng "..tAwardItem[1][5].."L�n)/#tmz_tong_award_1_1(1)",
		"��ng �"..(nWeekWin+nWeekLose).."C�i ["..tAwardItem[2][1].."] nh�n (kinh nghi�m b�ng "..tAwardItem[2][5].."L�n)/#tmz_tong_award_1_1(2)",
		"T�m th�i kh�ng nh�n/gf_DoNothing")	
end

function tmz_tong_award_1_1(nType)
	local strMsg = "Kh�ng s� d�ng b�t c� h� ph�";
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nType ~= 0 then
		strMsg = "s� d�ng <color=yellow>"..(nWeekWin+nWeekLose).."c�i"..tAwardItem[nType][1].."<color>";
	end
	Say(g_NpcName.."X�c ��nh"..strMsg.."Nh�n th��ng kh�ng?",
		3,
		"\n ��ng, ta mu�n nh�n th��ng/#tmz_tong_award_1_2("..nType..")",
		"\n ta ch�n sai r�i/tmz_tong_award_1",
		"\n t�m th�i ch�a mu�n/gf_DoNothing");
end

function tmz_tong_award_1_2(nType)
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nWeekWin+nWeekLose <= 0 then
		Talk(1,"",g_NpcName.."C�c h� kh�ng tham gia Bang H�i Thi�n M�n Tr�n tu�n tr��c ho�c �� nh�n ph�n th��ng.");
		return 0
	end	
	local nLv = GetLevel();
	local nExp1 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3*1.35),floor((400+(nLv-85)*28)*10000/3*1.35),floor(5120000/3*1.35));
	local nExp2 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3),floor((400+(nLv-85)*28)*10000/3),floor(5120000/3));
	local nTotalExp = floor(nExp1*nWeekWin+nExp2*nWeekLose);
	local nBagCount = (nWeekWin*3+nWeekLose*1);
	local nBagCount2 = nWeekWin+nWeekLose;
	local nItemArg = 2;
	if nType ~= 0 then
		nItemArg = tAwardItem[nType][5];
		if GetItemCount(tAwardItem[nType][2],tAwardItem[nType][3],tAwardItem[nType][4]) < nBagCount2 then
			Talk(1,"",g_NpcName.."Mang theo tr�n ng��i"..tAwardItem[nType][1].."Kh�ng ��"..nBagCount2..".");
			return 0;
		end
	end
	if gf_Judge_Room_Weight(5,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nLastExp = nTotalExp*nItemArg;
	if nType ~= 0 then
		if DelItem(tAwardItem[nType][2],tAwardItem[nType][3],tAwardItem[nType][4],nBagCount2) ~= 1 then
			return 0;
		end
	end
	SetTask(TASk_TMZ_TONG_WEEK_WIN,0);
	SetTask(TASk_TMZ_TONG_WEEK_LOSE,0);
	ModifyExp(nLastExp);
	Msg2Player("B�n nh�n ���c "..nLastExp.." �i�m kinh nghi�m");
	gf_SetLogCaption("Bang h�i Thi�n M�n Tr�n");
	for i=1,nBagCount do
		local nRand = random(1,100);
		if nRand <= 2 then
			gf_AddItemEx({2,95,692,1},"Di�n V� Nguy�n So�i Bao");
		elseif nRand <= 4 then
			gf_AddItemEx({2,95,693,1},"Di�n V� T��ng Qu�n Bao");
		elseif nRand <= 14 then
			gf_AddItemEx({2,95,694,1},"Di�n V� Ti�n Phong Bao");
		else
			gf_AddItemEx({2,95,695,1},"Di�n V� S� Binh Bao");
		end
	end
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20100722 and nDate <= 20100815 then
		gf_AddItemEx({2,95,697,nBagCount2},"Thi�n M�n L�c Bao")
	end
	gf_SetLogCaption("");
end

tTongAward = {
	{400,12,30,3000},
	{300,12,30,3000},
	{260,12,30,3000},
	{220,12,30,3000},
	{200,11,30,2000},
	{180,10,30,2000},
	{160,9,30,2000},
	{140,8,30,1500},
	{120,7,30,1500},
	{100,6,30,1500},
};

function tmz_tong_award_2()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --û���
		Talk(1,"",g_NpcName.."C�c h� c�n gia nh�p bang h�i m�i c� th� nh�n th��ng.");
		return 0;
	end	
	local nWeek = tf_GetWeekSequence(1,0); --��һ�賿
	if GetTask(TASK_TMZ_TONG_AWARD_WEEK) == 0 or GetTask(TASK_TMZ_TONG_AWARD_WEEK) >= nWeek then
		Talk(1,"",g_NpcName.."H�y quay l�i nh�n th��ng v�o tu�n sau.");
		return 0;
	end	
	local nWeekTotal = GetTask(TASk_TMZ_TONG_TOTAL_NUM);
	if nWeekTotal <= 0 then
		Talk(1,"",g_NpcName.."C�c h� kh�ng tham gia Bang H�i Thi�n M�n Tr�n tu�n tr��c ho�c �� nh�n ph�n th��ng.");
		return 0
	end	
	if nWeekTotal < 3 then
		SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
		Talk(1,"",g_NpcName.."D�a tr�n bi�u hi�n c�a tu�n tr��c, kh�ng th� nh�n ph�n th��ng c�a bang h�i (tham gia �t nh�t 3 tr�n ��i chi�n).");
		return 0;
	end
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_award_callback_1");		
end

function tmz_tong_award_callback_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzTong = SDB(szkey,0,0);	
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 0;
	local nTongType = 0; 
	for i = 1,getn(tTongAward) do
		if nTongScore >= tTongAward[i][1] then
			nTongType = i;
			break;
		end
	end
	if nTongType == 0 then
		SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
		Talk(1,"",g_NpcName.."�i�m t�ch l�y c�a qu� bang h�i ch�a ��t y�u c�u (100 �i�m)");
		return 0;
	end
	if gf_Judge_Room_Weight(2,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nExp = floor(tTongAward[nTongType][2]*GetLevel()*GetLevel()*240);
	SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
	gf_Modify("Exp",nExp);
	local nTmzMark = tTongAward[nTongType][3];
	SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)+nTmzMark);
	Msg2Player("B�n nh�n ���c "..nTmzMark.."�i�m t�ch l�y Thi�n M�n Tr�n");
	WriteLogEx(THIENMON_LOG_TITLE, "nh�n "..nTmzMark.." �i�m t�ch l�y Thi�n M�n Tr�n")
	WriteLog("[Chi�n tr��ng Thi�n M�n Tr�n]: t�i kho�n: "..tostring(GetAccount())..", t�n: "..tostring(GetName())..", th�i gian: "..tonumber(date("%Y%m%d"))..", [�� nh�n "..nTmzMark.."�i�m t�ch l�y Thi�n M�n Tr�n]");
	if GetTask(TASKID_TMZ_AWARD_MARK) > MAX_MARK then
		SetTask(TASKID_TMZ_AWARD_MARK,MAX_MARK);
		Msg2Player("Gi�i h�n �i�m t�ch l�y Thi�n M�n Tr�n l�: "..MAX_MARK..", �i�m t�ch l�y c�a c�c h� �� ��t gi�i h�n.");
	end	
	local nXoyoB = tTongAward[nTongType][4];
	if nXoyoB ~= 0 then
		EarnXYB(nXoyoB);
	end
	local tStone = {
		{
			{"Kim Tinh",2,201,2},
			{"M�c Tinh",2,201,4},
			{"Th�y Tinh",2,201,6},
			{"H�a Tinh",2,201,8},
			{"Th� Tinh",2,201,10}
		},
		{
			{"Huy�n Th�ch Kim Tinh",2,201,3,170,0},
			{"Ph� Th�y M�c Tinh",2,201,5,170,0},
			{"Nguy�t Hoa Th�y Tinh",2,201,7,170,0},
			{"C�u Huy�n H�a Tinh",2,201,9,170,0},
			{"Ng�ng Ng�c Th� Tinh",2,201,11,170,0},
		}};
--	if nTongType == 3 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[1][nRand][2],tStone[1][nRand][3],tStone[1][nRand][4],1},tStone[1][nRand][1]);
--	elseif nTongType == 4 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[1][nRand][2],tStone[1][nRand][3],tStone[1][nRand][4],1},tStone[1][nRand][1]);	
--		gf_AddItemEx({2,201,12,2,4},"�ֽ�");
--	elseif nTongType == 5 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[2][nRand][2],tStone[2][nRand][3],tStone[2][nRand][4],1},tStone[2][nRand][1]);		
--	end
	--���ƺ�
	if nTongScore >= 400 then
		if IsTongMember() == 1 then
			RemoveTitle(2,12);
			RemoveTitle(2,13);
			AddTitle(2,13);
			SetTitleTime(2, 13, GetTime() + 7*24*3600);
			SetCurTitle(2, 13);
			Msg2Player("Nh�n ���c danh hi�u [Thi�n M�n Anh Ki�t]!");
		else
			RemoveTitle(2,12);
			RemoveTitle(2,13);
			AddTitle(2,12);
			SetTitleTime(2, 12, GetTime() + 7*24*3600);
			SetCurTitle(2, 12);	
			Msg2Player("Nh�n ���c danh hi�u [Thi�n M�n Qu�n H�ng]!");		
		end
	end
	if nTongScore >= 300 then
		DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_2,0,0);
		local tbTmzRank = SDB(TMZ_TONG_RELAY_KEY_2,0,0,2);
		tbTmzRank:apply(g_szThisFile,"tmz_tong_award_callback_2");	
	end
end

function tmz_tong_award_callback_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzRank = SDB(TMZ_TONG_RELAY_KEY_2,0,0,2);
	local strTongName,nTongScore = tbTmzRank[0][1],tbTmzRank[0][2];
	local strGruop = "";
	strGruop,strTongName = GLB_TMZ_GetRealmName(strTongName);
	local nCurTongName = GetTongName();
	if nCurTongName == strTongName then
		if IsTongMember() == 1 then
			RemoveTitle(2,14);
			RemoveTitle(2,15);
			AddTitle(2,15);
			SetTitleTime(2, 15, GetTime() + 7*24*3600);
			SetCurTitle(2, 15);
			Msg2Player("Nh�n ���c danh hi�u [Thi�n M�n H�o Ki�t]");
		else
			RemoveTitle(2,14);
			RemoveTitle(2,15);
			AddTitle(2,14);
			SetTitleTime(2, 14, GetTime() + 7*24*3600);
			SetCurTitle(2, 14);	
			Msg2Player("Nh�n ���c danh hi�u [Thi�n M�n Qu�n Anh]!");		
		end		
	end
end

--���Ƿ��ж��ֿ�λ
function GLB_TMZ_GetOtherMap()
	DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_3,0,0);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0,3);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_1");
end

function tmz_tong_callback_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0,3);
	local nType = GetTaskTemp(211);
	local strTongName = GetTongName();
	local strCurName = GLB_TMZ_GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nBattleLv = tbTongData[2] or 0;
	local nWeekWin = tbTongData[3] or 0;
	local nWeekLose = tbTongData[4] or 0;
	local nTotalWin = tbTongData[5] or 0;
	local nTotalLose = tbTongData[6] or 0;
	local nLastWin = tbTongData[7] or 0;
	local nHufu = tbTongData[8] or MAX_HUFU;	
	local nMaxNum = 0;
	local nSuitMapId = 0;
	if nType == 1 and nHufu < 1 then
		Talk(1,"",g_RealmNpcName.."Qu� bang h�i kh�ng c�n [Thi�n M�n H� Ph� �n] n�a, h�y s� d�ng [Ng�c Ti�u Dao] b�o danh.");
		return 0;
	elseif nType == 2 and GetXYY() < 20 then
		Talk(1,"",g_RealmNpcName.."��i hi�p ch�a c� 20 [Ng�c Ti�u Dao].");
		return 0;
	end
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nBattleLv = tTongScoreLv[i][2];
			nMaxNum = tTongScoreLv[i][3];
			break;
		end
	end
	local tbMapID = gf_GetDataTable(GetSameMaps(MAP_ID));
	if getn(tbMapID) > 1 then	
		for i=1,getn(tbMapID) do
			if mf_GetPlayerCount(MISSION_ID,CampTwo_ID,tbMapID[i]) == 0 and mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_PEACE then
				if mf_GetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_MAX,tbMapID[i]) == nMaxNum then
					nSuitMapId = tbMapID[i];
					break;
				end
			end
		end	
	end
	if nSuitMapId == 0 then --û���¿�һ��
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_RealmNpcName.."T�t c� b�n �� ��u �� ��y, h�y quay l�i sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("T� l� chi�m tr�n: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			if nType == 1 and nHufu >= 1 then
				nHufu = nHufu-1;
				tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
			elseif nType == 2 and GetXYY() >= 20 then
				PayXYY(20);
				GLB_TMZ_SetTask(0,3);--ͬ����ң��
			else
				return 0;
			end
			tmz_tong_AddCamp(nRoomID,CampOne_ID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_SCORE,nTongScore,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_MAX,nMaxNum,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_LV,nBattleLv,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_WEEK_WIN,nWeekWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_WEEK_LOSE,nWeekLose,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_TOTAL_WIN,nTotalWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_TOTAL_LOSE,nTotalLose,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_LAST_WIN,nLastWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_HUFU,nHufu,nRoomID);
			mf_SetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPONE_NAME,strCurName,nRoomID);								
		end			
	else --������Ӫ2
		if nType == 1 and nHufu >= 1 then
			nHufu = nHufu-1;
			tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
		elseif nType == 2 and GetXYY() >= 20 then
			PayXYY(20);
			GLB_TMZ_SetTask(0,3);--ͬ����ң��
		else
			return 0;
		end	
		tmz_tong_AddCamp(nSuitMapId,CampTwo_ID);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_SCORE,nTongScore,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_MAX,nMaxNum,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_LV,nBattleLv,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_WEEK_WIN,nWeekWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_WEEK_LOSE,nWeekLose,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_TOTAL_WIN,nTotalWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE,nTotalLose,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_LAST_WIN,nLastWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_HUFU,nHufu,nSuitMapId);		
		mf_SetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPTWO_NAME,strCurName,nSuitMapId);
	end	
end


function tmz_get_GlbExp(...)
	if arg.n ~= 5 then
		return 0;
	end
	local nExp = 0;
	local nLv = GetLevel();
	local tExpType = {{75,80,85,90,100},{arg[1],arg[2],arg[3],arg[4],arg[5]}};
	for i = 1,getn(tExpType[1]) do
		if nLv < tExpType[1][i] then
			nExp = tExpType[2][i];
			break;
		end
	end
	return nExp;	
end
