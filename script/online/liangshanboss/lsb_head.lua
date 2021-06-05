--��ɽboss�ͷ�ļ�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\liangshanboss\\lsb_npc_table.lua")
Include("\\script\\online\\liangshanboss\\lsb_define.lua")
Include("\\script\\online\\liangshanboss\\lsb_award_table.lua")

LSB_START_TIME = {2012,6,15,0,0,0};
LSB_END_TIME = {2012,7,6,0,0,0};

--�ص�·��
CallBack_Script = "\\script\\online\\liangshanboss\\lsb_head.lua";

--tbMap����ĵ�ͼ��
--nMapId��ǰ��ͼ
--return 1Ϊ��0Ϊ��
function LSB_IsAllowMap(tbMap,nMapId)
	for i=1,getn(tbMap) do
		if tbMap[i] == nMapId then
			return 1;
		end
	end
	return 0;
end

--�ʱ���ж�
function LSB_IsActivityOpen()
--	if nActivityId == nil or nActivityId <= 0 then return 0; end
--	if gf_CheckEventDateEx(nActivityId) ~= 1 then
--		return 0;
--	end
--	return 1;
	local nStartTime = MkTime(LSB_START_TIME[1],LSB_START_TIME[2],LSB_START_TIME[3],LSB_START_TIME[4],LSB_START_TIME[5],LSB_START_TIME[6]);
	local nEndTime = MkTime(LSB_END_TIME[1],LSB_END_TIME[2],LSB_END_TIME[3],LSB_END_TIME[4],LSB_END_TIME[5],LSB_END_TIME[6]);
	local nCurrTime = GetTime();
	if nStartTime >= nEndTime then
		print("ERROR:\script\online\liangshanboss\lsb_head.lua LSB_IsActivityOpen LSB_IsActivityOpen nStartTime > nEndTime");
		return 0;
	end
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		return 1;
	end
	return 0;
end

--��ɽ���ﵱ��ʹ�ô���
function LSB_MailUseTimes()
	--�Ƿ����
	LSB_Check_Day_Seq();
	return gf_GetTaskByte(VET_LSB_MAIL_NUM,1);
end

--�Ƿ����
--���п�������Ķ������ﴦ��
function LSB_Check_Day_Seq()
	if GetTask(VET_LSB_DAY_SEQ) ~= zgc_pub_day_turn() then
		SetTask(VET_LSB_DAY_SEQ,zgc_pub_day_turn());
		gf_SetTaskByte(VET_LSB_MAIL_NUM,1,0);
	end
end

--ȫ����������ص�
function LSB_Glb_CallFunc(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_Glb_CallFunc")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record3.nSortType, Lsb_Record3.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record3.itemkey)
	nFlag = nFlag or 0;
	local nCurrTime = tonumber(GetTime()) - TIME_ZOOM_DIFF;
--	print(type(nFlag),nFlag);
--	print(nCurrTime);
--	print(nCurrTime - nFlag);
	if nCurrTime - nFlag >= 60 * 60 * 24 then
		local nDayTime  = mod(nCurrTime,3600 * 24);
		nCurrTime = nCurrTime - nDayTime;
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record3.nSortType, Lsb_Record3.itemkey,"d",nCurrTime + 6 * 3600);
		--ִ��ȫ������
		LSB_Glb_Clear();
	end
	--ִ�й��ص�
	SetGlbValue(GS_GLOBAL_VALUE4, GetTime());
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function LSB_GetGlbTimeDis()
	return GetTime() - GetGlbValue(GS_GLOBAL_VALUE4);
end

--ȫ����������
function LSB_Glb_Clear()
	if LSB_IsActivityOpen() ~= 1 then
		return 0;
	end
--	print("LSB_Glb_Clear()")
	--��������ԯ
	SetGlbValue(GS_GLOBAL_VALUE1,0);
	SetGlbValue(GS_GLOBAL_VALUE2,0);
	--bossλ��
	SetGlbValue(GS_GLOBAL_VALUE3,0);
	--boss����
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
	--��ҿ�����Ŀ
	ApplyRelayShareData(Lsb_Record2.szKey,Lsb_Record2.nKey1,Lsb_Record2.nKey2,CallBack_Script,"LSB_DelDataRecord2");
end

function LSB_Exec_CleanData()
	if LSB_IsActivityOpen() ~= 1 then
		return 0;
	end
	--bossλ��
	SetGlbValue(GS_GLOBAL_VALUE3,0);
	--boss����
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
end

--��鵱ǰ��ͼboss����
function LSB_GetCurrMapBossNum(nMapId)
	if nMapId == nil or nMapId <= 0 then return 65536; end
	return GetMapTaskTemp(nMapId,LSB_MAP_TASK_TEMP);
end

--����BOSS
function LSB_CreateBoss(nFlag)
	local n = gf_GetRandItemByTable(LSB_NPC_SELECT, 1000, 3);
--	print("LSB_CreateBoss--n",n)
	if nFlag == 1 then
	--�ƽ�boss����
		if n == 1 then
			n = random(2,3);
		end
		dostring(LSB_NPC_SELECT[n][1]);
	elseif nFlag == 0 then
	--�ƽ�boss������
		if LSB_Allow_GlodBoss() ~= 1 then
		--ʱ�䲻����
			--print("ʱ�䲻����")
			if n == 1 then
				n = random(2,3);
			end
			dostring(LSB_NPC_SELECT[n][1]);
			return 0;
		end
		ApplyRelayShareData(Lsb_Record2.szKey,Lsb_Record2.nKey1,Lsb_Record2.nKey2,CallBack_Script,"LSB_Is_Num_Allow");
	end
end

--���һ�����������
function LSB_Is_Num_Allow(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record2.nSortType, Lsb_Record2.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record2.itemkey)
	nFlag = nFlag or 0;
	local n = gf_GetRandItemByTable(LSB_NPC_SELECT, 1000, 3);
--	print("nFlag2",nFlag);
--	print("n2",n);
	if nFlag >= 2 then
	--no
		if n == 1 then
			n = random(2,3);
		end
		dostring(LSB_NPC_SELECT[n][1]);
	else
	--yes
		if n == 1 then
			AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record2.nSortType, Lsb_Record2.itemkey,"d",nFlag + 1);
		end
		dostring(LSB_NPC_SELECT[n][1]);
	end
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--��ӻƽ�boss���ڼ�¼
function LSB_AddDataRecord(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_AddDataRecord")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"do_nothing",Lsb_Record.nSortType, Lsb_Record.itemkey,"d",1);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--ɾ���ƽ�boss���ڼ�¼
function LSB_DelDataRecord(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_DelDataRecord")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"do_nothing",Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--ɾ���ƽ�boss������¼
function LSB_DelDataRecord2(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("LSB_DelDataRecord2")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(Lsb_Record2.szKey,Lsb_Record2.nKey1,Lsb_Record2.nKey2,CallBack_Script,"do_nothing",Lsb_Record2.nSortType, Lsb_Record2.itemkey,"d",0);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--���
--��boss���ݿ�ص�
function LSB_Is_Allow_BOSS(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--boss�Ƿ����
--	print("nFlag",nFlag);
--	print("GetGlbValue(GS_GLOBAL_VALUE3)",GetGlbValue(GS_GLOBAL_VALUE3))
	if GetGlbValue(GS_GLOBAL_VALUE3) ~= 0 then
--		print("nFlag or 1 =",nFlag or 1)
		nFlag = nFlag or 1;
	end
	LSB_CreateBoss(nFlag);
	
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--Relay����callboss
function LSB_CallBoos_Relay_LM(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--ֻ��boss������ֱ�ӵ���
	if nFlag == 0 or nFlag == nil then
		--print("Relay�����ƽ��BOSS")
		LSB_Create_Gold_Boss(1,1);
	else
		--print("���ܴ����ƽ��BOSS")
	end
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--Relay����callboss1
function LSB_CallBoos_Relay_FB(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--ֻ��boss������ֱ�ӵ���
	if nFlag == 0 or nFlag == nil then
		--print("Relay�����ƽ��BOSS")
		LSB_Create_Gold_Boss(1,2);
	else
		--print("���ܴ����ƽ��BOSS")
	end
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--Relay����callboss
function LSB_CallBoos_Relay_FN(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, CallBack_Script, "do_nothing", Lsb_Record.nSortType, Lsb_Record.itemkey,"d",0)
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Lsb_Record.itemkey)
	nFlag = nFlag or 0;
	--ֻ��boss������ֱ�ӵ���
	if nFlag == 0 or nFlag == nil then
		--print("Relay�����ƽ��BOSS")
		LSB_Create_Gold_Boss(1,3);
	else
		--print("���ܴ����ƽ��BOSS")
	end
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--�ƽ�boss
function LSB_Create_Gold_Boss(nFlag,nRelayMap)
--	print("LSB_Create_Gold_Boss",nFlag,nRelayMap)
	nFlag = nFlag or 0;
	--����
	local n = gf_GetRandItemByTable(LSB_NPC_GOLD_BOSS, 1000, 1) or 1;
	
	--��ͼ
	local nIndex = 0;
	if nFlag == 1 and nRelayMap ~= nil then
		nIndex = nRelayMap or 1;--Relay
--		print("nIndex1",nIndex);
	else
--		print("nIndex2",nIndex);
		--��������
		local nMap,nX,nY = GetWorldPos();	
		nIndex = LSB_Check_MapIndex(nMap) --���
		if nIndex > 0 and nIndex <= 3 then
			local nNpcIdx = CreateNpc("B�o r��ng T�i nguy�n", format("B�o R��ng Ho�ng Kim c�a %s",GetName()), nMap, nX + 2, nY + 2);
			SetNpcLifeTime(nNpcIdx, 3 * 60);
			--��¼index
			SetTaskTemp(Gld_Boss_Index,nNpcIdx);
			SetNpcScript(nNpcIdx, Box_E_Script);
			Msg2Player(format("Boss ��i Ho�ng Kim Boss%s ��nh r�i khi tr�n tho�t",LSB_NPC_GOLD_BOSS[n][3]));
		else
			return 0;
		end
	end
	
	SetGlbValue(GS_GLOBAL_VALUE3,nIndex);
	local nNpcIndex = CreateNpc(LSB_NPC_GOLD_BOSS[n][1],LSB_NPC_GOLD_BOSS[n][3],LSB_GOLD_BOSS_LOCATION[nIndex][1],LSB_GOLD_BOSS_LOCATION[nIndex][2],LSB_GOLD_BOSS_LOCATION[nIndex][3]);
--	print("nNpcIndex =",nNpcIndex)
--	print("ͨ��")
	--���
	if nNpcIndex ~= 0 then
		SetNpcLifeTime(nNpcIndex,LSB_NPC_GOLD_BOSS[n][4]);
		SetNpcDeathScript(nNpcIndex,Gld_Boss_Death_Script);
		SetNpcRemoveScript(nNpcIndex,Gld_Boss_Remove_Script);
--		print("AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,do_nothing,Lsb_Record.nSortType, Lsb_Record.itemkey,d,1);")
		--��ӻƽ�boss���ڼ�¼
		--ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_AddDataRecord");
		AddRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"do_nothing",Lsb_Record.nSortType, Lsb_Record.itemkey,"d",1);
		--ͨ��
		local strMsg; 
		if nFlag == 0 or nFlag == nil then
			strMsg = format("%s R�t may m�n g�i ���c %s Boss ��i Ho�ng Kim, b�t c�n �� n� tr�n tho�t ra b�n �� %s, c�c h� h�y mau �i t�m �� ��nh b�i nh�n th��ng.",GetName(), LSB_NPC_GOLD_BOSS[n][3], LSB_Get_Map_Name(LSB_GOLD_BOSS_LOCATION[nIndex][1]));
		else
			strMsg = format("T�i b�n �� %s (X:%d, Y:%d) c� ng��i ph�t hi�n tung t�ch c�a Boss%s Ho�ng Kim, c�c v� ��i hi�p mau �i ��nh b�i �� nh�n th��ng.",LSB_Get_Map_Name(LSB_GOLD_BOSS_LOCATION[nIndex][1]),LSB_GOLD_BOSS_XY[nIndex][1],LSB_GOLD_BOSS_XY[nIndex][2],LSB_NPC_GOLD_BOSS[n][3]);
		end
		AddGlobalNews(strMsg);
		Msg2Global(strMsg);
	end
end

--��boss
function LSB_Create_Mid_Boss()
	local n = gf_GetRandItemByTable(LSB_NPC_MID_BOSS, 1000, 1) or 1;
	local nMapId,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc(LSB_NPC_MID_BOSS[n][1],LSB_NPC_MID_BOSS[n][3],nMapId,nX,nY,0,1,1,3);
	SetNpcLifeTime(nNpcIndex,LSB_NPC_MID_BOSS[n][4]);
	--��¼boss��index
	SetTaskTemp(Mid_Boss_Index,nNpcIndex);
	SetNpcDeathScript(nNpcIndex,Mid_Boss_Death_Script);
	SetNpcRemoveScript(nNpcIndex,Mid_Boss_Remove_Script);
	Msg2Player(format("C�c h� r�t may m�n tri�u g�i th�nh c�ng Boss Trung%s",LSB_NPC_MID_BOSS[n][3]));
	return 2,nMapId,nNpcIndex;
end

--Сboss
function LSB_Create_Sma_Boss()
	local n = gf_GetRandItemByTable(LSB_NPC_SMA_BOSS, 10000, 1) or 1;
	local nMapId,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc(LSB_NPC_SMA_BOSS[n][1],LSB_NPC_SMA_BOSS[n][3],nMapId,nX,nY,0,1,1,3);
	SetNpcLifeTime(nNpcIndex,LSB_NPC_SMA_BOSS[n][4]);
	--��¼boss��index
	SetTaskTemp(Sma_Boss_Index,nNpcIndex);
	SetNpcDeathScript(nNpcIndex,Sma_Boss_Death_Script);
	SetNpcRemoveScript(nNpcIndex,Sma_Boss_Remove_Script);
	Msg2Player(format("C�c h� �� may m�n tri�u g�i th�nh c�ng Ti�u Boss %s",LSB_NPC_SMA_BOSS[n][3]));
	return 3,nMapId,nNpcIndex;
end

--��ȡʱ��
function LSB_GetHourTime()
	return floor(mod(GetTime() - TIME_ZOOM_DIFF, 24 * 3600) / 3600);
end


--�ƽ�boss����ˢ��ʱ��
function LSB_Allow_GlodBoss()
	local nTime = LSB_GetHourTime();
--	print("nTime,",nTime)
	if nTime >= 2 and nTime < 10 then
		return 0;
	end
	return 1;
end


--������A
function LSB_Get_Award_A()
	gf_Modify("Exp",Exp_Award_A);
	gf_AddItemEx2(Box_Num_A,  "L��ng S�n M�t B�o R��ng", LSB_szLogTitle, "M� B�o R��ng A", 0, 1);
	gf_EventGiveRandAward(LSB_AWARD_A_TB, 100, 1, LSB_szLogTitle, "M� B�o R��ng A");
end

--������B
function LSB_Get_Award_B()
	gf_Modify("Exp",Exp_Award_B);
	gf_AddItemEx2(Box_Num_B,  "L��ng S�n M�t B�o R��ng", LSB_szLogTitle, "M� B�o R��ng B", 0, 1);
	gf_EventGiveRandAward(LSB_AWARD_B_TB, 100, 1, LSB_szLogTitle, "M� B�o R��ng B");
end

--���̶�����C
function LSB_Get_Award_Fix_C()
	gf_Modify("Exp",Exp_Award_C);
	gf_AddItemEx2(Box_Num_C,  "L��ng S�n M�t B�o R��ng", LSB_szLogTitle, "M� B�o R��ng C", 0, 1);
end

--Roll����C
function LSB_Get_Award_C(nNum,nFlag,targetNpc)
--	print("LSB_Get_Award_C",nNum,nFlag);
	nNum = nNum or 1;
	nFlag = nFlag or 0;
--	print("�����",GetGlbValue(GS_GLOBAL_VALUE1))
--	print("��ԯ",GetGlbValue(GS_GLOBAL_VALUE2))
	for i=1,nNum do
		local n = gf_GetRandItemByTable(LSB_AWARD_C_TB, 100, 1);
		--�����
--		print("before-n",n)
		if n == 1 then
			if GetGlbValue(GS_GLOBAL_VALUE1) ~= 0 then
				n = random(2,6);
			else
				SetGlbValue(GS_GLOBAL_VALUE1,1);
			end
		end
		--��ԯ
		if n == 7 then
			if GetGlbValue(GS_GLOBAL_VALUE2) ~= 0 then
				n = random(2,6);
			else
				SetGlbValue(GS_GLOBAL_VALUE2,1);
			end
		end
--		print("roll-n",n)
		--ֱ�Ӹ�
		if nFlag == 1 then
			if n == 5 then
				LSB_XingKe_Award();
			elseif n == 6 then
				LSB_TianYi_Award();
			elseif n == 7 then
				local nRand = LSB_XuanYuan_Award();
				--print("nRand",nRand);
				Msg2Global(format("Ng��i ch�i %s tham gia ho�t ��ng khi�u chi�n Boss ��i Ho�ng Kim �� may m�n nh�n ���c ph�n th��ng %s",GetName(),LSB_XUANYUAN_AWARD_TB[nRand][3]));
			else
				--print("gf_UnPack(LSB_AWARD_C_TB[n][4])",gf_UnPack(LSB_AWARD_C_TB[n][4]));
				gf_AddItemEx2(LSB_AWARD_C_TB[n][4], LSB_AWARD_C_TB[n][3], LSB_szLogTitle, LSB_szLogTitle, 0, 1);
				if n == 1 then
					Msg2Global(format("Ng��i ch�i %s tham gia ho�t ��ng khi�u chi�n Boss ��i Ho�ng Kim �� may m�n nh�n ���c ph�n th��ng %s",GetName(),LSB_AWARD_C_TB[n][3]));
				end
			end
		else
		--��ʼroll
			if n == 5 then
				LSB_Item_Roll(gf_RandRate(LSB_XINGKE_AWARD_TB,100,2)[4],targetNpc);
			elseif n == 6 then
				LSB_Item_Roll(gf_RandRate(LSB_TIANYI_AWARD_TB,100,2)[4],targetNpc);
			elseif n == 7 then
				LSB_Item_Roll(gf_RandRate(LSB_XUANYUAN_AWARD_TB,100,2)[4],targetNpc);
			else
				LSB_Item_Roll(LSB_AWARD_C_TB[n][4],targetNpc);
			end
		end
	end
end

--roll����
function LSB_Item_Roll(tbItem,targetNpc)
	if type(tbItem) ~= "table" then return end
	local diceId = ApplyItemDice(1, 100, 60, CallBack_Script, "LSB_CallBack_Roll", GetTeamSize(),targetNpc);
	AddDiceItemInfo(diceId, gf_UnPack(tbItem))
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsPlayerDeath() == 0 then
			RollItem(diceId);
		end
	end
	PlayerIndex = nPlayerOld;
end

--roll�ص�
function LSB_CallBack_Roll(dwID)
--	print("LSB_CallBack_Roll")
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bNotice = LSB_Is_Notice(szItem);
	local bAllGiveUp = 1;
	local tbTemp = {};
	if type(t) ~= "table" then return end
	for index, value in t do
		bFlag = 0;
		local str = value[1].."N�m"..value[2].." �i�m"
		if value[3] == 0 then
			str = value[1].."Ph�ng"
		elseif value[3] == 1 then
			str = str.." (Tuy�t c�u)"
			if value[4] == 1 then
				str = str.." -�� nh�t ���c"..szItem
				tbTemp[value[1]] = szItem;
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -�� nh�t ���c"..szItem
				tbTemp[value[1]] = szItem;
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bNotice == 1 then
		for index, value in tbTemp do
			if GetName() == index then
				Msg2Global(format("Ng��i ch�i %s tham gia ho�t ��ng khi�u chi�n Boss ��i Ho�ng Kim �� may m�n nh�n ���c ph�n th��ng %s",index,value));
			end
		end
	end
	if bAllGiveUp == 1 then
		Msg2Player("T�t c� ng��i ch�i �� b� cu�c")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh�ng ng��i ch�i kh�c �� v��t qu� th�i gian, xem nh� b� cu�c")
	end
end

--�ж��Ƿ�Ҫ����
function LSB_Is_Notice(strTab)
	if strTab == LSB_AWARD_C_TB[1][3] then
		return 1;
	end 
	for i = 1,getn(LSB_XUANYUAN_AWARD_TB) do 
		if strTab == LSB_XUANYUAN_AWARD_TB[i][3] then
			return 1;
		end
	end
	return 0;
end

--����ǿ�
function LSB_XingKe_Award()
	 return gf_EventGiveRandAward(LSB_XINGKE_AWARD_TB, 100, 1);
end

--�������
function LSB_TianYi_Award()
	return gf_EventGiveRandAward(LSB_TIANYI_AWARD_TB, 100, 1);
end

--�����ԯ
function LSB_XuanYuan_Award()
	return gf_EventGiveRandAward(LSB_XUANYUAN_AWARD_TB, 100, 1);
end

--��ȡ�ƽ��boss���ֵĵ�ͼ
function LSB_Get_Map_Name(nMapId)
	local tbMap = {
		[507] = "Long M�n tr�n",
		[504] = "B�c Ph�ng T��ng",
		[501] = "Nam Ph�ng T��ng",
	}
	return tbMap[nMapId];
end

function do_nothing()
--do nothing
end

--�ȼ������ж�
function LSB_Check_LR()
	if GetLevel() < Min_Level  then
		Talk(1,"",format("C�c h� ch�a ��t c�p �� <color=red>%d<color>",Min_Level));
		return 0;
	end
	if GetPlayerFaction() == 0 then
		Talk(1,"","C�c h� ch�a c� h� ph�i");
		return 0;
	end
	return 1;
end

--���boss�������Ƿ����
function LSB_Check_NpcName()
	local nIndex_Sma = GetTaskTemp(Sma_Boss_Index);
	local sBoxName = format("%s B�o R��ng",GetName());
	local sNpcName = GetNpcName(nIndex_Sma);
	if sNpcName == sBoxName then
		return 0;
	end 
	for i=1,getn(LSB_NPC_SMA_BOSS) do 
		if sNpcName == LSB_NPC_SMA_BOSS[i][3] then
			return 0;
		end
	end
	local nIndex_Mid = GetTaskTemp(Mid_Boss_Index);
	local sBoxName2 = format("��i B�o R��ng c�a %s",GetName());
	local sNpcName2 = GetNpcName(nIndex_Mid);
	if sNpcName2 == sBoxName2 then
		return 0;
	end 
	for i=1,getn(LSB_NPC_MID_BOSS) do 
		if sNpcName2 == LSB_NPC_MID_BOSS[i][3] then
			return 0;
		end
	end
	return 1;
end

--���ص�ͼtable index
function LSB_Check_MapIndex(nMapId)
 for i=1,getn(LSB_GOLD_BOSS_LOCATION) do
 	if nMapId == LSB_GOLD_BOSS_LOCATION[i][1] then
 		return i;
 	end
 end
 return 1;
end