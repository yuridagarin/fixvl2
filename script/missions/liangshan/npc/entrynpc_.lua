Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\liangshan\\head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")
Include("\\script\\class\\clause3.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\missions\\liangshan\\daily_tasks.lua")
Include("\\script\\missions\\liangshan\\head.lua")
FILE_NAME = "\\script\\missions\\liangshan\\npc\\entrynpc_.lua";		
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
function giveItem(self)
	ItemCreate:create(self[1])
end
--�����һ�����
function exchange()
--	local szTitle = format("H�y l�a ch�n ph��ng th�c ��i")
--	local strtab = {
--			"\n ��i t�p v�t L��ng S�n C�u Ch�u Hi�n Vi�n/#show_equip_shop(19)",
--			--"\n Ti�m Chi�n Cu�ng/_Open_ZhanKuang_Shop",
--			--"\n N�ng c�p ��n ti�m Di�u D��ng/#show_equip_shop(3035)",
--			"\n Ph�n h�i/main",
--			"\n r�t lui/nothing",
--	};
--	Say(szTitle, getn(strtab), strtab)
	local tDiaSel = {}
--	tinsert(tDiaSel,". Ta c�n ��i trang b� H�o Nguy�t/haonguyet_chg")
--	tinsert(tDiaSel,format(NpcSayInfo[14][10][2],NpcSayInfo[14][10][3][1]).."/jiuzhou_chg")
--	tinsert(tDiaSel,format(NpcSayInfo[14][10][2],NpcSayInfo[14][10][3][2]).."/xuanyuan_chg")
--	for i = 1,getn(TOthersChgInfo) - 2 do
--		tinsert(tDiaSel,(format(NpcSayInfo[14][10][2],TOthersChgInfo[i][1][1])..format(NpcSayInfo[14][10][4],TOthersChgInfo[i][2][1],TOthersChgInfo[i][2][2]).."/#other_chg("..i..")"))
--	end
--	tinsert(tDiaSel,". Ta c�n ��i Th�i D�ch H�n Nguy�n C�ng Ph� (c�n 1 Thi�n Cang l�nh + 2 H�a Th� B�ch + 99 v�ng)/honnguyen_chg")
--	tinsert(tDiaSel,". Ta mu�n ��i 1 Thi�n Th�ch Linh Th�ch (ti�u hao 1 Thi�n Cang L�nh)/#exchang_Item(1)")
--	tinsert(tDiaSel,". Ta mu�n ��i 1 ��nh H�n Thi�n Th�ch Th�n Th�ch (ti�u hao 4 Thi�n Cang L�nh)/#exchang_Item(2)")
--	tinsert(tDiaSel,". Ta mu�n ��i 1 ��i ��nh H�n (ti�u hao 8 Thi�n Cang L�nh)/#exchang_Item(3)")
--	tinsert(tDiaSel,". Ta mu�n ��i 1 Bao Thi�n Th�ch Tinh Th�ch (ti�u hao 6 Thi�n Cang L�nh)/#exchang_Item(4)")
	--tinsert(tDiaSel,". Ta c�n ��i Bao Thi�n Th�ch Tinh Th�ch (c�n 5 Thi�n Cang l�nh v� 150 v�ng)/tinhthach_chg") ---
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/main")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..NpcSayInfo[14][10][1],getn(tDiaSel),tDiaSel)
end

function _Open_ZhanKuang_Shop()
	local szTitle = format("N�u ch�n s� d�ng trang b� Di�u D��ng n�ng c�p ��n trang b� Chi�n Cu�ng, xin ch� � s� <color=yellow> gi�m �� c��ng h�a <color>:\n")
	szTitle = format("%s 1. ch� c� trang b� Di�u D��ng +13,+14,+15 m�i ���c n�ng c�p\n", szTitle)
	szTitle = format("%s 2. n�ng c�p xong �� c��ng h�a s� b� gi�m: <color=yellow>+13 bi�n th�nh +0; +14,+15 bi�n th�nh +7<color>\n", szTitle)
	szTitle = format("%s 3. t�t c� <color=yellow> hi�u qu� ��nh h�n kh�ng ���c gi�<color>\n", szTitle)

	local strtab = {
			"\n mu�n m�/#show_equip_shop(3034)",
			"\n Ph�n h�i/exchange",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end
--�����׵Ķһ�
--function jiuzhou_chg()
--	local tDiaSel = {}
--	tinsert(tDiaSel,NpcSayInfo[14][10][7].."/#Sale(49,100,1)")
--	for i = 1,getn(TJiuzhouChgInfo) do
--		tinsert(tDiaSel,format(format(NpcSayInfo[14][10][2],TJiuzhouChgInfo[i][1])..format(NpcSayInfo[14][10][4],TJiuzhouChgInfo[i][2],TJiuzhouChgInfo[i][3]).."/#jiuzhou_sel("..i..")"))
--	end
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/exchange")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..NpcSayInfo[14][10][1],getn(tDiaSel),tDiaSel)
--end
--function jiuzhou_sel(nEquipDiff)
--	local tDiaSel = {}
--	--�����ɼ��
--	if (nEquipDiff == 4 or nEquipDiff == 5) then
--		local nPlayerRoute = GetPlayerRoute()
--		if gf_CheckPlayerRoute() ~= 1 then
--			Talk(1,"",format(LSSysTalk[15][4],TJiuzhouChgInfo[nEquipDiff][1]))
--			return
--		else
--			if nEquipDiff == 4 then
--				TGL_chg({TJiuzhouEquip[nEquipDiff][1][nPlayerRoute],TJiuzhouEquip[nEquipDiff][2][nPlayerRoute]},{TJiuzhouChgInfo[nEquipDiff][2],TJiuzhouChgInfo[nEquipDiff][3]})
--			else
--				TGL_chg(TJiuzhouEquip[nEquipDiff][nPlayerRoute],{TJiuzhouChgInfo[nEquipDiff][2],TJiuzhouChgInfo[nEquipDiff][3]})
--			end
--		end
--	else
--		local nPlayerBody = GetBody()
--		TGL_chg({TJiuzhouEquip[nEquipDiff][1][nPlayerBody],TJiuzhouEquip[nEquipDiff][2][nPlayerBody]},{TJiuzhouChgInfo[nEquipDiff][2],TJiuzhouChgInfo[nEquipDiff][3]})
--	end
--end
----��ԯװ���һ�
--function xuanyuan_chg()
--	local tDiaSel = {}
--	for i = 1,getn(TXuanyuanChgInfo) do
--		tinsert(tDiaSel,format(format(NpcSayInfo[14][10][2],TXuanyuanChgInfo[i][1])..format(NpcSayInfo[14][10][4],TXuanyuanChgInfo[i][2],TXuanyuanChgInfo[i][3]).."/#xuanyuan_sel("..i..")"))
--	end
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/exchange")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..NpcSayInfo[14][10][1],getn(tDiaSel),tDiaSel)
--end
--function xuanyuan_sel(nEquipDiff)
--	local nPlayerRoute = GetPlayerRoute()
--	if gf_CheckPlayerRoute() ~= 1 then
--		Talk(1,"",_name()..LSSysTalk[15][4])
--		return
--	else
--		TGL_chg(TXuanyuanEquip[nEquipDiff][nPlayerRoute],{TXuanyuanChgInfo[nEquipDiff][2],TXuanyuanChgInfo[nEquipDiff][3]})
--	end
--end
----����
--function other_chg(nOtherSeq)
--	TGL_chg(TOthersChgInfo[nOtherSeq][1],TOthersChgInfo[nOtherSeq][2])
--end
----�һ�ͳһ����
--function TGL_chg(tEquipInfo,tConsumInfo)
--	local tDiaSel = {}
--	if getn(tEquipInfo) == 2 then
--		tinsert(tDiaSel,format(NpcSayInfo[14][10][6],tEquipInfo[1][1]).."/#TGL_chg_dtm("..tEquipInfo[1][2]..","..tEquipInfo[1][3]..","..tEquipInfo[1][4]..","..tConsumInfo[1]..","..tConsumInfo[2]..")")
--		tinsert(tDiaSel,format(NpcSayInfo[14][10][6],tEquipInfo[2][1]).."/#TGL_chg_dtm("..tEquipInfo[2][2]..","..tEquipInfo[2][3]..","..tEquipInfo[2][4]..","..tConsumInfo[1]..","..tConsumInfo[2]..")")
--	else
--		tinsert(tDiaSel,format(NpcSayInfo[14][10][6],tEquipInfo[1]).."/#TGL_chg_dtm("..tEquipInfo[2]..","..tEquipInfo[3]..","..tEquipInfo[4]..","..tConsumInfo[1]..","..tConsumInfo[2]..")")
--	end 
--	tinsert(tDiaSel,NpcSayInfo[14][2].."/exchange")
--	tinsert(tDiaSel,NpcSayInfo[14][3].."/nothing")
--	Say(_name()..format(NpcSayInfo[14][10][5],tConsumInfo[1],tConsumInfo[2]),
--		getn(tDiaSel),tDiaSel
--	)
--end
--function TGL_chg_dtm(nEquipid_1,nEquipid_2,nEquipid_3,nConsumInfo_1,nConsumInfo_2)
--	local tEquipInfo = {nEquipid_1,nEquipid_2,nEquipid_3}
--	local tConsumInfo = {nConsumInfo_1,nConsumInfo_2}
--	if TGL_money_check(tConsumInfo[1],tConsumInfo[2]) ~= 1 then
--		return
--	end
--	if TGL_money_del(tConsumInfo[1],tConsumInfo[2]) ~= 1 then
--		return
--	end
--	--���Ӵ���
--	local bAddFlag,nItemIndex  = 0,0
--	if tEquipInfo[1] == 0 then
--		bAddFlag,nItemIndex = AddItem(tEquipInfo[1],tEquipInfo[2],tEquipInfo[3],1,1,-1,-1,-1,-1,-1,-1)
--	else
--		bAddFlag,nItemIndex = AddItem(tEquipInfo[1],tEquipInfo[2],tEquipInfo[3],1)
--		--������Ʒ����ʱ��
--		if tEquipInfo[3] == 1067 then
--			SetItemExpireTime(nItemIndex,30*DAY_SECOND_NUM)
--		elseif tEquipInfo[3] == 1051 then
--			SetItemExpireTime(nItemIndex,7*DAY_SECOND_NUM)
--		end
--	end
--	if bAddFlag == 1 then
--		Msg2Player(format(LSMsgToPlayer[17],GetItemName(nItemIndex)))
--	else
--		WriteLog(format(SysLogInfo[1],GetName(),bAddFlag,tEquipInfo[1]))
--	end	
--end
----��Ʒ�ͽ�ǮЯ�����
--function TGL_money_check(nTGL,nMoney)
--	if GetItemCount(TTGLInfo[1],TTGLInfo[2],TTGLInfo[3]) < nTGL then
--		Talk(1,"",_name()..format(LSSysTalk[15][1],TTGLInfo[4],nTGL))
--		return 0
--	elseif GetCash() < (nMoney * 100 *100) then
--		Talk(1,"",_name()..format(LSSysTalk[15][2],nMoney))
--		return 0
--	elseif GetFreeItemRoom() < 1 then
--		Talk(1,"",_name()..LSSysTalk[15][3])
--		return 0
--	else
--		return 1
--	end
--end
----��Ʒɾ��
--function TGL_money_del(nTGL,nMoney)
--	if Pay(nMoney * 100 *100) ~= 1 then
--		Talk(1,"",_name()..format(LSSysTalk[15][2],nMoney))
--		return 0
--	elseif DelItem(TTGLInfo[1],TTGLInfo[2],TTGLInfo[3],nTGL) ~= 1 then
--		Talk(1,"",_name()..format(LSSysTalk[15][1],TTGLInfo[4],nTGL))
--		return 0
--	else 
--		return 1
--	end
--end
function main()
	--������ɽ�ؿ�ָ���������ȡ������
	if GetTask(2857) == 1 then
		SetTask(2857,0)
	end
	temp_Talk(T);
end

function _name()
	g_NpcName = g_NpcName or "<color=green>"..(GetNpcName(GetTargetNpc()) or "").."<color>:";
	return g_NpcName;
end

function join_consume(bTianJiaolingMode, bDelete)
--	if 1 == bDelete then
--		AddRuntimeStat(3,1,bTianJiaolingMode,1)
--	end
	if 1 == bTianJiaolingMode then
		if GetTeamMember(0) == PlayerIndex then
    		if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
    			Msg2Player(format(LSMsgToPlayer[13],T_TIANJIAOLING[4]))
    			return 0
    		end
    		if bDelete and bDelete == 1 then
        		--ɾ����Ʒ
        		if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
        			return 0
        		end
        		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
        		--AddRuntimeStat(3,10,0,N_JOIN_TIANJIAOLING_NEED)
    		end
    	else
    		return 0
		end
	else
		local OldPlayerIndex = PlayerIndex;
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
    			local nCur,_ = ModifyEnergy(0, 1)
    			if nCur < N_JOIN_ENERGY_NEED then
    				MU_Msg2Team(format("[%s] tinh l�c kh�ng �� [%d] �i�m", GetName(), N_JOIN_ENERGY_NEED))
    				return 0
    			end
			end
		end
		if bDelete and bDelete == 1 then
    		for i = 1, GetTeamSize() do
    			PlayerIndex = GetTeamMember(i);
    			if PlayerIndex > 0 then
    				ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
    			end
    		end
		end
		PlayerIndex = OldPlayerIndex
	end
	return 1
end

function checkAll(bTianJiaolingMode)
--	do return 1,1,1 end
	
	local tLiupai = {};
	local bLiupai = 1;
	local bLevel = 1;
	local bEx = 1;
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0)
	local nTown = GetWorldPos();
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < NPlayerLevelMin then
			bLevel = 0;
		end
		if IsSleeping() == 1 then
			MU_Msg2Team(format(LSMsgToTeam[3],GetName()));
			bEx = 0;
		end
		if GetWorldPos() ~= nTown then
			MU_Msg2Team(format(LSMsgToTeam[4],GetName()))
			bEx = 0;
		end
		local nRoute = GetPlayerRoute()
		if gf_CheckPlayerRoute() ~= 1 then
			--print(LSMsgToTeam[5],GetName())
			MU_Msg2Team(format(LSMsgToTeam[5],GetName()))
			bEx = 0;
		end
		tLiupai[nRoute] = 1;
	end
	PlayerIndex = OldPlayerIndex;
	return bLiupai, bLevel, bEx;
end
function check(bTianJiaolingMode)
	local msg = LSLoginQuanli[1]
	local color = "";
	local ret = 1;
	if GetTeamSize() < NTeamMemberMin then
		color = "<color=red>";
		ret = 0;
	else
		color = "<color=green>"
	end
	msg = msg..color..format(LSLoginQuanli[2],NTeamMemberMin).."<color>"
	local _, bLevel, bEx = checkAll(bTianJiaolingMode);
	if bLevel ~= 1 then
		color = "<color=red>";
		ret = 0;
	else
		color = "<color=green>"
	end
	msg = msg..color..format(LSLoginQuanli[3],NPlayerLevelMin).."<color>"..LSLoginQuanli[4]
	if GetTeamMember(0) ~= PlayerIndex then
		color = "<color=red>";
		ret = 0;
	else--�ӳ����
		color = "<color=green>"
	end
	msg = msg..color..LSLoginQuanli[5]
	if bEx ~= 1 then
		ret = 0;
	end
	if 1 == ret then
		ret = join_consume(bTianJiaolingMode, 0)
	end
	return ret, msg;
end

function entry_jingli()
	entry(0, 0)
end
function entry_tianjiaoling()
	entry(1, 0)
end

function entry(bTianJiaolingMode, bSure)
	local tMaps = gf_GetDataTable(GetSameMaps(g_RealMapId));
	local nCount = getn(tMaps);
	if nCount >= 40 then
		Talk(1, "", _name()..LSSysTalk[2]);
		return
	end
	if 1 == bTianJiaolingMode then
		if not bSure or bSure ~= 1 then
			local tSay = {
				"��ng �/#entry(1,1)",
				"Ta ch� gh� qua th�i/nothing",
				}
			Say(format(NpcSayInfo[6][4][1],N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
			return
		end
	end
	local bRet, msg = check(bTianJiaolingMode);
	if bRet ~= 1 then
		Talk(1, "", _name()..msg);
		return
	end
	
	if join_consume(bTianJiaolingMode,1) ~= 1 then
		return
	end

	createMission(g_RealMapId,bTianJiaolingMode)
end

function createMission(nOrgMapId,bTianJiaolingMode)
	local nOldIndex = PlayerIndex;
	local nMapID,nMapIdx = DynamicLoadMap(nOrgMapId);
	if mf_OpenMission(MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(MISSION_ID,MV_MAP_INDEX,nMapIdx,nMapID);
		mf_SetMissionV(MISSION_ID,MV_RETURN_MAP_ID, GetWorldPos(),nMapID);
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			mf_JoinMission(MISSION_ID,1,nMapID);
			if GetName() == GetCaptainName() then
				WriteLogEx(LUONGSON_LOG_TITLE, "t� ��i tham gia L��ng S�n B�c")
			end
			WriteLogEx(LUONGSON_LOG_TITLE, "tham gia")
			
			_stat_on_player_when_open_misson()--��������ʱ���������ͳ��
			--cdkey�
			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(2)");	
		end
		PlayerIndex = nOldIndex;		
		if 1 == bTianJiaolingMode then
			SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("tStage_1:skip(1,%d)", nMapIdx))
		end
		
		_stat_when_open_mission(bTianJiaolingMode)--��������ʱ������ͳ��
	else
		FreeDynamicMap(nMapID, nMapIdx);
	end
end

function haonguyet_chg()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n ��i."
	
	tinsert(tbSayDialog, "- Ta c�n ��i N�n H�o Nguy�t (N�n Tinh Kh�c + N�n Thi�n Ngh�a + 500 H�o Nguy�t Huy�n Kim + 250 Ng� H�nh Huy�n Kim + 3000 Kim)/#get_haonguyet(1,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i �o H�o Nguy�t (�o Tinh Kh�c + �o Thi�n Ngh�a + 500 H�o Nguy�t Huy�n Kim + 250 Ng� H�nh Huy�n Kim + 3000 Kim)/#get_haonguyet(2,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i Qu�n H�o Nguy�t (Qu�n Tinh Kh�c + Qu�n Thi�n Ngh�a + 500 H�o Nguy�t Huy�n Kim + 250 Ng� H�nh Huy�n Kim + 3000 Kim)/#get_haonguyet(3,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i Trang S�c H�o Nguy�t (Trang S�c Tinh Kh�c + Trang S�c Thi�n Ngh�a + 700 H�o Nguy�t Huy�n Kim + 350 Ng� H�nh Huy�n Kim + 5000 Kim)/get_haonguyet_trangsuc")
	tinsert(tbSayDialog, "- Ta c�n ��i V� Kh� H�o Nguy�t (V� Kh� Tinh Kh�c + V� Kh� Thi�n Ngh�a + 600 H�o Nguy�t Huy�n Kim + 300 Ng� H�nh Huy�n Kim + 4000 Kim)/#get_haonguyet(5,0)")
	tinsert(tbSayDialog, "Tr� l�i/exchange")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_haonguyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n ��i."
	
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-X�ch T��c Ho�n (Trang S�c Tinh Kh�c + Trang S�c Thi�n Ngh�a + 700 H�o Nguy�t Huy�n Kim + 350 Ng� H�nh Huy�n Kim + 5000 Kim)/#get_haonguyet(4,1)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-T� Giao Ng�c B�i (Trang S�c Tinh Kh�c + Trang S�c Thi�n Ngh�a + 700 H�o Nguy�t Huy�n Kim + 350 Ng� H�nh Huy�n Kim + 5000 Kim)/#get_haonguyet(4,2)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-V�n H� L�nh (Trang S�c Tinh Kh�c + Trang S�c Thi�n Ngh�a + 700 H�o Nguy�t Huy�n Kim + 350 Ng� H�nh Huy�n Kim + 5000 Kim)/#get_haonguyet(4,3)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-� L�n B�o Gi�i (Trang S�c Tinh Kh�c + Trang S�c Thi�n Ngh�a + 700 H�o Nguy�t Huy�n Kim + 350 Ng� H�nh Huy�n Kim + 5000 Kim)/#get_haonguyet(4,4)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-B�ch Quy Li�n (Trang S�c Tinh Kh�c + Trang S�c Thi�n Ngh�a + 700 H�o Nguy�t Huy�n Kim + 350 Ng� H�nh Huy�n Kim + 5000 Kim)/#get_haonguyet(4,5)")
	tinsert(tbSayDialog, "Tr� l�i/haonguyet_chg")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_haonguyet(nGetType, nSelected)
	if nGetType == 0 then
		return 0;
	end
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph�i gia nh�p h� ph�i m�i ��i trang b� ���c!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
    end
    	local nCash = tItem_need[nGetType][1]
	if GetCash() < nCash then
		Talk(1, "", "B�n kh�ng �� Kim �� ��i trang b� H�o Nguy�t")
		return 0
	end
	local nNHHK = tItem_need[nGetType][3]
	if GetItemCount(2,1,30304) < nNHHK then
  		Talk(1, "", "B�n kh�ng �� Ng� H�nh Huy�n Kim �� ��i trang b� H�o Nguy�t")
        	return 0;
	end
	local nHNHK = tItem_need[nGetType][2]	
	if GetItemCount(2,1,30301) < nHNHK then
  		Talk(1, "", "B�n kh�ng �� H�o Nguy�t Huy�n Kim �� ��i trang b� H�o Nguy�t")
        	return 0;
	end
	
	SetTaskTemp(TSK_TMP_CHANGE_SELECT,nSelected)	
	SetTaskTemp(TSK_TMP_CHANGE,nGetType)
	local nSlot = THaoNguyet_need[nGetType][1]		
	PutinItemBox("��i trang b�" ,nSlot , "X�c nh�n mu�n th�c hi�n ��i trang b�?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE)
	if nGetType == 0 then
		return 0;
	end
	
	local tb_item = THaoNguyet_need[nGetType][3]
	local tb_item1 = THaoNguyet_need[nGetType][4]
	local tItem = {}
	local tItem1 = {}
	local check1 = 0
	local check2 = 0
	for i = 1, getn(tb_item) do
		tinsert(tItem,tb_item[i])
	end
	for i=1,getn(tItem) do
		local nG, nD, nP = gf_UnPack(tb_item[i])
		if (genre == nG and detail == nD and particular == nP) then	
			check1 = 1	
		end
	end

	for i = 1, getn(tb_item1) do
		tinsert(tItem1,tb_item1[i])
	end
	for i=1,getn(tItem1) do
		local nG1, nD1, nP1 = gf_UnPack(tb_item1[i])
		if (genre == nG1 and detail == nD1 and particular == nP1) then	
			check2 = 1	
		end
	end
	if check1 == 1 or  check2 == 1 then
		return 1
	end
	Talk(1, "", "Ch� c� th� b� v�o "..THaoNguyet_need[nGetType][2]);
	return 0;
end

function OnPutinComplete(param)

	local nSelected = GetTaskTemp(TSK_TMP_CHANGE_SELECT)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE)
	if nGetType == 0 then
		Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= THaoNguyet_need[nGetType][1] then
		Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	local tb_item = THaoNguyet_need[nGetType][3]
	local tb_item1 = THaoNguyet_need[nGetType][4]
	local nCheck = 1
	local nCheck1 = 1
	local nFlag = 0
	local nFlag1 = 0
	local tItem = {}
	local tItem1 = {}
	-- Ph�n bi�t item ti�u hao v� trang b� b� v�o
	for i = 1, getn(tb_item) do
		local nG, nD, nP, nCount = gf_UnPack(tb_item[i])
		if nG == 0 then			
			if get_item_count(t, nG, nD, nP) == nCount then
				nFlag = nFlag + 1
				tinsert(tItem,tb_item[i])
			end		
		else		
			if get_item_count(t, nG, nD, nP) ~= nCount then
				nCheck = 0;
				break;
			end			
		end
	end
	if nGetType == 1 or nGetType == 2 or nGetType == 3 then
		for i = 1, getn(tb_item1) do
			local nG1, nD1, nP1, nCount1 = gf_UnPack(tb_item1[i])
			if nG == 0 then			 
				if get_item_count(t, nG1, nD1, nP1) == nCount1 then
					nFlag1 = nFlag1 + 1
					tinsert(tItem1,tb_item1[i])
				end		
			else		
				if get_item_count(t, nG1, nD1, nP1) ~= nCount1 then
					nCheck1 = 0;
					break;
				end			
			end
		end
		
		if nFlag > 1 or nFlag1 > 1 then
			Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
			return 0;
		end
		if (nCheck == 0 or nFlag < 1) and (nCheck == 0 or nFlag < 1) then 
			Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
			return 0;
		end
	end
	if nGetType == 4 or nGetType == 5 then
		if nCheck == 0 or nFlag < 1 then 
			Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
			return 0;
		end
	end
    	local nCash = tItem_need[nGetType][1]
	if GetCash() < nCash then
		Talk(1, "", "B�n kh�ng �� Kim �� ��i trang b� H�o Nguy�t")
		return 0
	end
	local nNHHK = tItem_need[nGetType][3]
	if GetItemCount(2,1,30304) < nNHHK then
  		Talk(1, "", "B�n kh�ng �� Ng� H�nh Huy�n Kim �� ��i trang b� H�o Nguy�t")
        	return 0;
	end
	local nHNHK = tItem_need[nGetType][2]	
	if GetItemCount(2,1,30301) < nHNHK then
  		Talk(1, "", "B�n kh�ng �� H�o Nguy�t Huy�n Kim �� ��i trang b� H�o Nguy�t")
        	return 0;
	end

	local nbody = GetBody()
	local nfaction = GetPlayerRoute()

	local nResult = 1
	for i = 1, getn(t) do		
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
			break;
		end
	end
	if nResult ==1 then
		if Pay(nCash) == 1 and DelItem(2, 1, 30301, nHNHK) == 1 and DelItem(2, 1, 30304, nNHHK) == 1 then
			SetTaskTemp(TSK_TMP_CHANGE,0)
			SetTaskTemp(TSK_TMP_CHANGE_SELECT,0)
			if nGetType == 1 or nGetType == 2 or nGetType == 3 then
				local nClo = THaoNguyet_suc[nGetType][nfaction][2][nbody]
				gf_AddItemEx2(nClo, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
				Talk(1,"","��i trang b� th�nh c�ng!")
			end
			if nGetType == 5 then
				local nVukhi = THaoNguyet_suc[nGetType][nfaction][2]
				gf_AddItemEx2(nVukhi, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng ")
				Talk(1,"","��i trang b� th�nh c�ng!")
			end
			if nGetType == 4 then
				local nTrangsuc = THaoNguyet_suc[nGetType][nSelected][2]
				gf_AddItemEx2(nTrangsuc, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
				Talk(1,"","��i trang b� th�nh c�ng!")
			end
			
		end
	end
	
end
function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then  
			nCount = nCount + 1;
		end
	end
	return nCount
end

function honnguyen_chg()
	if GetCash() < 990000 then
		Talk(1,"","B�n kh�ng mang �� v�ng �� ��i!!!")
		return 0
	end
	if GetItemCount(2,95,204) < 1 or GetItemCount(2,1,1001) < 2 then
		Talk(1,"","B�n kh�ng mang theo �� 1 Thi�n Cang L�nh v� 2 H�a Th� B�ch!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","H�nh trang c�a b�n kh�ng �� ch� tr�ng!!!")
        	return 0
	end
	if DelItem(2,95,204,1) == 1 and DelItem(2,1,1001,2) == 1 and Pay(990000) == 1 then
		gf_AddItemEx2({2, 0, 1083, 1}, "Th�i D�ch H�n Nguy�n C�ng Ph�", "DOI TRANG BI", "��i th�nh c�ng Th�i D�ch H�n Nguy�n C�ng Ph�")
		Msg2Player("B�n nh�n ���c 1 Th�i D�ch H�n Nguy�n C�ng Ph�")
	end
end

function tinhthach_chg()
	if GetCash() < 1500000 then
		Talk(1,"","B�n kh�ng mang �� v�ng �� ��i!!!")
		return 0
	end
	if GetItemCount(2,95,204) < 5 then
		Talk(1,"","B�n kh�ng mang theo �� 5 Thi�n Cang L�nh!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","H�nh trang c�a b�n kh�ng �� ch� tr�ng!!!")
        	return 0
	end
	if DelItem(2,95,204,5) == 1 and Pay(1500000) == 1 then
		gf_AddItemEx2({2, 1, 1051, 1}, "Bao Thi�n Th�ch Tinh Th�ch", "DOI TRANG BI", "��i th�nh c�ng Bao  thi�n th�ch Tinh th�ch")
		Msg2Player("B�n nh�n ���c 1 Bao Thi�n Th�ch Tinh Th�ch")
	end
end

function exchang_Item(nType)
	local tbItem = {
				[1] = {1, {2, 1, 1068, 1}, "Thi�n Th�ch Linh Th�ch"},
				[2] = {4, {2, 1, 1067, 1}, "��nh H�n Thi�n Th�ch Th�n Th�ch"},
				[3] = {8, {2, 1, 1113, 1}, "��i ��nh H�n"},
				[4] = {6, {2, 1, 1051, 1}, "Bao Thi�n Th�ch Tinh Th�ch"},
			}
	if GetItemCount(2,95,204) < tbItem[nType][1] then
		Talk(1,"","B�n kh�ng mang theo �� "..tbItem[nType][1].." Thi�n Cang L�nh!!!")
		return 0
	end			
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","H�nh trang c�a b�n kh�ng �� ch� tr�ng!!!")
        	return 0
	end		
	if DelItem(2,95,204,tbItem[nType][1]) == 1 then
		gf_AddItemEx2(tbItem[nType][2], tbItem[nType][3].." 20/7", "DOI TRANG BI", "��i th�nh c�ng", 7*24*60*60)
		Msg2Player("B�n nh�n ���c 1 "..tbItem[nType][3])
	end	
end