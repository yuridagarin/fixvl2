Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\settings\\static_script\\online\\qianhe_tower\\qht_define.lua")
Include("\\script\\online\\qianhe_tower\\qht_npc_table.lua")
Include("\\settings\\static_script\\online\\qianhe_tower\\qht_award_table.lua")
Include("\\settings\\static_script\\online\\general_award_group.lua")


--�ʱ��
QIANHE_START_TIME = 2014091200;
QIANHE_END_TIME = 2014092900;

--���ʼʹ����ʱ����������ٴο���Ҫע����
QHT_TASK_GROUP =  TaskManager:Create(7, 9);
QHT_TASK_GROUP.DaySeq = 1; --����
QHT_TASK_GROUP.DailyExp = 2; --ÿ�ջ�ȡ����
QHT_TASK_GROUP.DailyZhenQi = 3; --ÿ�ջ�ȡ����
QHT_TASK_GROUP.DailyXiuWei = 4; --ÿ����Ϊ
QHT_TASK_GROUP.DailyShengWang = 5; --ÿ������
QHT_TASK_GROUP.DailyShiMen = 6; --ÿ��ʦ��
QHT_TASK_GROUP.InPosFlag = 7; --������¼
QHT_TASK_GROUP.NumJW = 8; --���Ļ����������
QHT_TASK_GROUP.BoxIndex = 9; --���������index
QHT_TASK_GROUP.TongFlag = 10; --����ս���콱,1,2

--��Ƿ���
function qht_activity_isopen()
	return gf_CheckEventDateEx2(QIANHE_START_TIME, QIANHE_END_TIME);
end

--���������
function qht_check_condition(bTag)
	return gf_CheckBaseCondition(85,bTag);
end

--ÿ������
function qht_DailyTaskReSet()
	if QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DaySeq) ~= zgc_pub_day_turn() then
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DaySeq,zgc_pub_day_turn());
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyExp,0);
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyZhenQi,0);
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyXiuWei,0);
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyShengWang,0);
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyShiMen,0);
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.NumJW,0);
		QHT_TASK_GROUP:SetTaskBit(QHT_TASK_GROUP.TongFlag, 1, 0);
		QHT_TASK_GROUP:SetTaskBit(QHT_TASK_GROUP.TongFlag, 2, 0);
	end
end

--������
function qht_add_exp(nExp)
	qht_DailyTaskReSet();
	local nRemainExp = QHT_EXP_MAX - QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyExp);
	if nRemainExp > 0 then
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyExp,QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyExp) + min(nExp,nRemainExp));
		gf_Modify("Exp",min(nExp,nRemainExp));
		HeadMsg2Player(format("C�c h� nh�n ���c %d �i�m kinh nghi�m",min(nExp, nRemainExp)));
	else
		Msg2Player(format("C�c h� h�m nay nh�n ���c %s �� ��t gi�i h�n %d, kh�ng th� nh�n th�m %s","Kinh nghi�m",QHT_EXP_MAX,"Kinh nghi�m"));
	end
end

--������
function qht_add_zhenqi(nZhenQi)
	qht_DailyTaskReSet();
	if MeridianGetLevel() < 1 then
			Msg2Player("C�c h� ch�a k�ch ho�t Kinh M�ch, kh�ng th� nh�n ���c Ch�n Kh�.")
			return 0;
	end
	local nRemainZhenQi = QHT_ZHENQI_MAX - QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyZhenQi);
	if nRemainZhenQi > 0 then
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyZhenQi,QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyZhenQi) + min(nZhenQi,nRemainZhenQi));
		AwardGenuineQi(min(nZhenQi,nRemainZhenQi));
		HeadMsg2Player(format("C�c h� nh�n ���c %d �i�m ch�n kh�",min(nZhenQi,nRemainZhenQi)));
	else
		Msg2Player(format("C�c h� h�m nay nh�n ���c %s �� ��t gi�i h�n %d, kh�ng th� nh�n th�m %s","Ch�n kh�",QHT_ZHENQI_MAX,"Ch�n kh�"));
	end
end

--����Ϊ
function qht_add_xiuwei(nXiuWei)
	qht_DailyTaskReSet();
	local nRemainXiuWei = QHT_XIUWEI_MAX - QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyXiuWei);
	if nRemainXiuWei > 0 then
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyXiuWei,QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyXiuWei) + min(nXiuWei,nRemainXiuWei));
		gf_EventGiveCustomAward(26,min(nXiuWei,nRemainXiuWei),1,1);
		HeadMsg2Player(format("C�c h� nh�n ���c %d �i�m tu luy�n",min(nXiuWei,nRemainXiuWei)));
	else
		Msg2Player(format("C�c h� h�m nay nh�n ���c %s �� ��t gi�i h�n %d, kh�ng th� nh�n th�m %s","Luy�n",QHT_XIUWEI_MAX,"Luy�n"));
	end
end

--������
function qht_add_shengwang(nShengWang)
	qht_DailyTaskReSet();
	local nRemainShengWang = QHT_SHENGWANG_MAX - QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyShengWang);
	if nRemainShengWang > 0 then
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyShengWang,QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyShengWang) + min(nShengWang,nRemainShengWang));
		gf_EventGiveCustomAward(3,min(nShengWang,nRemainShengWang),1,1);
		HeadMsg2Player(format("C�c h� nh�n ���c %d �i�m danh v�ng",min(nShengWang,nRemainShengWang)));
	else
		Msg2Player(format("C�c h� h�m nay nh�n ���c %s �� ��t gi�i h�n %d, kh�ng th� nh�n th�m %s","Danh v�ng",QHT_SHENGWANG_MAX,"Danh v�ng"));
	end
end

--��ʦ��
function qht_add_shimen(nShiMen)
	qht_DailyTaskReSet();
	local nRemainShiMen = QHT_SHIMENGXD_MAX - QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyShiMen);
	if nRemainShiMen > 0 then
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.DailyShiMen,QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.DailyShiMen) + min(nShiMen,nRemainShiMen));
		gf_EventGiveCustomAward(4,min(nShiMen,nRemainShiMen),1,1);
		HeadMsg2Player(format("C�c h� nh�n ���c %d �i�m c�ng hi�n s�  m�n",min(nShiMen,nRemainShiMen)));
	else
		Msg2Player(format("C�c h� h�m nay nh�n ���c %s �� ��t gi�i h�n %d, kh�ng th� nh�n th�m %s","S� m�n",QHT_SHIMENGXD_MAX,"S� m�n"));
	end
end

--����NPC����
function qht_create_npc_ds()
	if qht_activity_isopen() ~= 1 then
		return 0;
	end
	local tPos = {
		{6021,1791,3532},
		{6022,1599,3004},
		{6023,1609,3376},
	}
	local tPosinfo
	for _,tPosinfo in tPos do
		local nNpcIndex = CreateNpc("V� L�m Minh Ch�1","��i S� ho�t ��ng",tPosinfo[1],tPosinfo[2],tPosinfo[3]);
		SetNpcScript(nNpcIndex,"\\script\\online\\qianhe_tower\\npc\\activity_ds_jy.lua");
	end
end

--����������
function qht_create_trigger()
	if qht_activity_isopen() ~= 1 then
		if GetTrigger(1277 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1277 * 2));
		end
	else
		if qht_check_condition(1)~= 0 and GetTrigger(1277 * 2) == 0 then
			CreateTrigger(0, 1277, 1277 * 2);
		end
	end
end

--��ͼ�Ƿ�����
function qht_map_allow(tbMapID, nMapID)
	return gf_MapIsAllow(tbMapID, nMapID);
end

--6021ɱ��
function qht_kill_6021_monster()
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		return 0;
	end
	gf_EventGiveRandAward(QHT_TRIGGER_6021_TABLE,gf_SumRandBase(QHT_TRIGGER_6021_TABLE),1);
end

--6022ɱ��
function qht_kill_6022_monster()
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		return 0;
	end
	gf_EventGiveRandAward(QHT_TRIGGER_6022_TABLE,gf_SumRandBase(QHT_TRIGGER_6022_TABLE),1);
end


--6023ɱ��
function qht_kill_6023_monster()
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		return 0;
	end
	gf_EventGiveRandAward(QHT_TRIGGER_6023_TABLE,gf_SumRandBase(QHT_TRIGGER_6023_TABLE),1);
end

--���ִ���
function qht_create_languai()
	local nMapID, nX, nY = GetWorldPos();
	if qht_boss_max(nMapID) ~= 1 then
		return 0;
	end
	local nMapID,nX,nY = GetWorldPos();
	SetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX,GetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX) + 1);
	local nRandIndex = random(getn(QHT_LANGUAI_TABLE));
	local npcIndex = CreateNpc(QHT_LANGUAI_TABLE[nRandIndex][1],QHT_LANGUAI_TABLE[nRandIndex][2],GetWorldPos());
	SetNpcDeathScript(npcIndex,QHT_NPC_SCRIPT_LANGUAI);
	AddRuntimeStat(22, 5, 0, 1);
end

--Сboss
function qht_create_xiaoboss()
	local nMapID, nX, nY = GetWorldPos();
	if qht_boss_max(nMapID) ~= 1 then
		return 0;
	end
	local nMapID,nX,nY = GetWorldPos();
	SetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX,GetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX) + 1);
	local nRandIndex = random(getn(QHT_XIAOBOSS_TABLE));
	local npcIndex = CreateNpc(QHT_XIAOBOSS_TABLE[nRandIndex][1],QHT_XIAOBOSS_TABLE[nRandIndex][2],GetWorldPos());
	SetNpcDeathScript(npcIndex,QHT_NPC_SCRIPT_XIAOGUAI);
	AddRuntimeStat(22, 7, 0, 1);
end

--��boss
function qht_create_zhongboss()
	local nMapID, nX, nY = GetWorldPos();
	if qht_boss_max(nMapID) ~= 1 then
		return 0;
	end
	local nMapID,nX,nY = GetWorldPos();
	SetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX,GetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX) + 1);
	local nRandIndex = random(getn(QHT_ZHONGBOSS_TABLE));
	local npcIndex = CreateNpc(QHT_ZHONGBOSS_TABLE[nRandIndex][1],QHT_ZHONGBOSS_TABLE[nRandIndex][2],GetWorldPos());
	SetNpcDeathScript(npcIndex,QHT_NPC_SCRIPT_ZHONGGUAI);
	AddRuntimeStat(22, 9, 0, 1);
end

--��boss
function qht_create_daboss()
	local nMapID, nX, nY = GetWorldPos();
	if qht_boss_max(nMapID) ~= 1 then
		return 0;
	end
	local nMapID,nX,nY = GetWorldPos();
	SetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX,GetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX) + 1);
	local nRandIndex = random(getn(QHT_DABOSS_TABLE));
	local npcIndex = CreateNpc(QHT_DABOSS_TABLE[nRandIndex][1],QHT_DABOSS_TABLE[nRandIndex][2],GetWorldPos());
	SetNpcDeathScript(npcIndex,QHT_NPC_SCRIPT_DAGUAI);
	AddRuntimeStat(22, 11, 0, 1);
end

--�ƽ�boss
function qht_create_goldboss()
--	local nMapID, nX, nY = GetWorldPos();
--	if qht_boss_max(nMapID) ~= 1 then
--		return 0;
--	end
--	local nMapID,nX,nY = GetWorldPos();
--	local nNum = GetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_GOLDBOSS_MAX);
--	if nNum < 3 then
--		SetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_GOLDBOSS_MAX,nNum + 1);
--		SetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX,GetMapTaskTemp(nMapID,QHT_MAPTEMPTASK_BOSS_MAX) + 1);
--		local nRandIndex = random(getn(QHT_GOLDBOSS_TABLE));
--		local npcIndex = CreateNpc(QHT_GOLDBOSS_TABLE[nRandIndex][1],QHT_GOLDBOSS_TABLE[nRandIndex][2],GetWorldPos());
--		SetNpcDeathScript(npcIndex,QHT_NPC_SCRIPT_GOLDBOSS);
--		Msg2Global(format("�ƽ�BOSS%s�����ˣ���λ��������ǰ��ǧѰ��������ս��",QHT_GOLDBOSS_TABLE[nRandIndex][2]));
--	else
--		qht_create_daboss();
--	end
end

--�ͼ�����
function qht_create_diji_box()
	local npcIndex = CreateNpc(QHT_BOX_TABLE[1][1],QHT_BOX_TABLE[1][2],GetWorldPos());
	SetNpcScript(npcIndex, QHT_NPC_SCRIPT_DIJIBOX);
end

--�м�����
function qht_create_zhongji_box()
	local npcIndex = CreateNpc(QHT_BOX_TABLE[2][1],QHT_BOX_TABLE[2][2],GetWorldPos());
	SetNpcScript(npcIndex, QHT_NPC_SCRIPT_ZHONGJIBOX);
end

--�߼�����
function qht_create_gaoji_box()
	local npcIndex = CreateNpc(QHT_BOX_TABLE[3][1],QHT_BOX_TABLE[3][2],GetWorldPos());
	SetNpcScript(npcIndex, QHT_NPC_SCRIPT_GAOJIBOX);
end

--���boss���ж�
function qht_boss_max(nMapID)
	local tbTemp = {
		[6021] = {QHT_MAPTEMPTASK_BOSS_MAX,QHT_BOSS_6021_MAX},
		[6022] = {QHT_MAPTEMPTASK_BOSS_MAX,QHT_BOSS_6022_MAX},
		[6023] = {QHT_MAPTEMPTASK_BOSS_MAX,QHT_BOSS_6023_MAX},
	};
	if tbTemp[nMapID] ~= nil and GetMapTaskTemp(nMapID,tbTemp[nMapID][1]) < tbTemp[nMapID][2] then
		return 1;
	end
	return 0;
end

--������1
function qht_award_one(targetNpcIdx)
	--�����齱��
	gf_TeamOperateEX(function ()
		local nMapID,nX,nY = GetWorldPos();
		if gf_Judge_Room_Weight(1,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			qht_add_exp(100000);
			gf_AddItemEx2({2,1,30435,1}, "M�nh H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Nh�m ph�n th��ng 1 ", 0, 1);
		end
	end)
	if gf_Judge_Room_Weight(2,10," ") ~= 1 then
		return 0;
	end
	--�����˽���
	gf_EventGiveRandAward(QHT_AWARD_PERSONAL_1, gf_SumRandBase(QHT_AWARD_PERSONAL_1), 1);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE1,targetNpcIdx);
end

--������2
function qht_award_two(targetNpcIdx)
	--�����齱��
	gf_TeamOperateEX(function ()
		local nMapID,nX,nY = GetWorldPos();
		if gf_Judge_Room_Weight(1,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			qht_add_exp(200000);
			gf_AddItemEx2({2,1,30435,2}, "M�nh H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Nh�m ph�n th��ng 2 ", 0, 1);
		end
	end)
	if gf_Judge_Room_Weight(2,10," ") ~= 1 then
		return 0;
	end
	--�����˽���
	gf_EventGiveRandAward(QHT_AWARD_PERSONAL_2, gf_SumRandBase(QHT_AWARD_PERSONAL_2), 1);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE2,targetNpcIdx);
end

--������3
function qht_award_three(targetNpcIdx)
	--�����齱��
	gf_TeamOperateEX(function ()
		local nMapID,nX,nY = GetWorldPos();
		if gf_Judge_Room_Weight(1,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			qht_add_exp(600000);
			gf_AddItemEx2({2,1,30435,3}, "M�nh H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Nh�m ph�n th��ng 3 ", 0, 1);
		end
	end)
	if gf_Judge_Room_Weight(2,10," ") ~= 1 then
		return 0;
	end
	--�����˽���
	gf_EventGiveRandAward(QHT_AWARD_PERSONAL_3, gf_SumRandBase(QHT_AWARD_PERSONAL_3), 1);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE3,targetNpcIdx);
end

--������4
function qht_award_four(targetNpcIdx)
	--���齱��
	gf_TeamOperateEX(function ()
		local nMapID,nX,nY = GetWorldPos();
		if gf_Judge_Room_Weight(2,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			qht_add_exp(2000000);
			gf_AddItemEx2({2,1,30435,4}, "M�nh H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Nh�m ph�n th��ng 3 ", 0, 1);
			--�����ƻ���
			qht_award_jinwenhufu(1,100,100);
		end
	end)
	if gf_Judge_Room_Weight(4,10," ") ~= 1 then
		return 0;
	end
	--�����˽���
	gf_EventGiveRandAward(QHT_AWARD_PERSONAL_4, gf_SumRandBase(QHT_AWARD_PERSONAL_4), 1);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE4_1,targetNpcIdx);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE4_2,targetNpcIdx);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE4_3,targetNpcIdx);
end

--������5
function qht_award_five(targetNpcIdx)
--	--���齱��
--	gf_TeamOperateEX(function ()
--		local nMapID,nX,nY = GetWorldPos();
--		if gf_Judge_Room_Weight(2,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
--			qht_add_exp(4000000);
--			gf_AddItemEx2({2,1,30435,5}, "������Ƭ", "��սǧѰ��", "������3 ", 0, 1);
--			qht_add_zhenqi(50);
--			qht_add_xiuwei(100);
--			qht_add_shengwang(50);
--			qht_add_shimen(50);
--			--�����ƻ���
--			qht_award_jinwenhufu(1,40,100);
--		end
--	end)
--	if gf_Judge_Room_Weight(3,10," ") ~= 1 then
--		return 0;
--	end
--	--Ͷ�㽱��
--	qht_award_throwdice(QHT_AWARD_THROW_DICE5_1,targetNpcIdx);
--	--Ͷ�㽱��
--	qht_award_throwdice(QHT_AWARD_THROW_DICE5_2,targetNpcIdx);
--	--Ͷ�㽱��
--	local tbTemp = qht_award_resettable(QHT_AWARD_THROW_DICE5_3);
--	if tbTemp ~= nil then
--		qht_award_throwdice(tbTemp,targetNpcIdx);
--	end
end

--������6
function qht_award_six(targetNpcIdx)
	local szNpcName = GetNpcName(targetNpcIdx);
	--���齱��
	gf_TeamOperateEX(function ()
		local nMapID,nX,nY = GetWorldPos();
		if gf_Judge_Room_Weight(2,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			qht_add_exp(6000000);
			gf_AddItemEx2({2,1,30435,5}, "M�nh H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Nh�m ph�n th��ng 3 ", 0, 1);
			qht_add_zhenqi(200);
			qht_add_xiuwei(100);
			qht_add_shengwang(50);
			qht_add_shimen(50);
			--�����ƻ���
			qht_award_jinwenhufu(1,100,100);
		end
	end)
	if gf_Judge_Room_Weight(3,10," ") ~= 1 then
		return 0;
	end
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE6_1,targetNpcIdx);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE6_2,targetNpcIdx);
	--Ͷ�㽱��
	local tbTemp = qht_award_resettable(QHT_AWARD_THROW_DICE6_3);
	if tbTemp ~= nil then
		qht_award_throwdice(tbTemp,targetNpcIdx);
	end
	--����
	local strMsg = ""
	if gf_GetTeamSize() > 2 then
		strMsg = format("Ch�c m�ng %s d�n d�t ��i ng� t�i Thi�n T�m Th�p ��nh b�i Ho�ng Kim boss %s", GetCaptainName(), szNpcName);
	else
		strMsg = format("Ch�c m�ng %s t�i Thi�n T�m Th�p ��nh b�i Ho�ng Kim boss %s", GetName(), szNpcName);
	end
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
end

--������7
function qht_award_seven(targetNpcIdx)
	local szNpcName = GetNpcName(targetNpcIdx);
	--���齱��
	gf_TeamOperateEX(function ()
		local nMapID,nX,nY = GetWorldPos();
		if gf_Judge_Room_Weight(2,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			qht_add_exp(9000000);
			gf_AddItemEx2({2,1,30435,5}, "M�nh H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Nh�m ph�n th��ng 3 ", 0, 1);
			qht_add_zhenqi(400);
			qht_add_xiuwei(100);
			qht_add_shengwang(50);
			qht_add_shimen(50);
			--�����ƻ���
			qht_award_jinwenhufu(1,100,100);
		end
	end)
	if gf_Judge_Room_Weight(3,10," ") ~= 1 then
		return 0;
	end
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE7_1,targetNpcIdx);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE7_2,targetNpcIdx);
	--Ͷ�㽱��
	local tbTemp = qht_award_resettable(QHT_AWARD_THROW_DICE7_3);
	if tbTemp ~= nil then
		qht_award_throwdice(tbTemp,targetNpcIdx);
	end
	--����
	local strMsg = ""
	if gf_GetTeamSize() > 2 then
		strMsg = format("Ch�c m�ng %s d�n d�t ��i ng� t�i Thi�n T�m Th�p ��nh b�i Ho�ng Kim boss %s", GetCaptainName(), szNpcName);
	else
		strMsg = format("Ch�c m�ng %s t�i Thi�n T�m Th�p ��nh b�i Ho�ng Kim boss %s", GetName(), szNpcName);
	end
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
end

--������8
function qht_award_eight(targetNpcIdx)
	local szNpcName = GetNpcName(targetNpcIdx);
	--���齱��
	gf_TeamOperateEX(function ()
		local nMapID,nX,nY = GetWorldPos();
		if gf_Judge_Room_Weight(2,1," ") == 1 and qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			qht_add_exp(12000000);
			gf_AddItemEx2({2,1,30435,5}, "M�nh H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Nh�m ph�n th��ng 3 ", 0, 1);
			qht_add_zhenqi(1000);
			qht_add_xiuwei(100);
			qht_add_shengwang(50);
			qht_add_shimen(50);
			--�����ƻ���
			qht_award_jinwenhufu(1,100,100);
		end
	end)
	if gf_Judge_Room_Weight(3,10," ") ~= 1 then
		return 0;
	end
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE8_1,targetNpcIdx);
	--Ͷ�㽱��
	qht_award_throwdice(QHT_AWARD_THROW_DICE8_2,targetNpcIdx);
	--Ͷ�㽱��
	local tbTemp = qht_award_resettable(QHT_AWARD_THROW_DICE8_3);
	if tbTemp ~= nil then
		qht_award_throwdice(tbTemp,targetNpcIdx);
	end
	--����
	local strMsg = ""
	if gf_GetTeamSize() > 2 then
		strMsg = format("Ch�c m�ng %s d�n d�t ��i ng� t�i Thi�n T�m Th�p ��nh b�i Ho�ng Kim boss %s", GetCaptainName(), szNpcName);
	else
		strMsg = format("Ch�c m�ng %s t�i Thi�n T�m Th�p ��nh b�i Ho�ng Kim boss %s", GetName(), szNpcName);
	end
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
end

--�ǿ�Ͷ��
function qht_award_xingke(targetNpcIdx)
	local tbTemp = {
		_XINGKE_WEAPON_TABLE,
		_XINGKE_CAP_TABLE,
		_XINGKE_CLOTH_TABLE,
		_XINGKE_SHOE_TABLE,
		_XINGKE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	local nIdx = gf_GetRandItemByTable(tbTemp[nIndex], gf_SumRandBase(tbTemp[nIndex]), 1);
	if tbTemp[nIndex][nIdx] and tbTemp[nIndex][nIdx][4] then
		qht_itmedice_roll(tbTemp[nIndex][nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx);
	else
		print("ERROE:qht_award_xingke()");
	end
end

--����Ͷ��
function qht_award_tianyi(targetNpcIdx)
	local tbTemp = {
		_TIANYI_WEAPON_TABLE,
		_TIANYI_CAP_TABLE,
		_TIANYI_CLOTH_TABLE,
		_TIANYI_SHOE_TABLE,
		_TIANYI_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	local nIdx = gf_GetRandItemByTable(tbTemp[nIndex], gf_SumRandBase(tbTemp[nIndex]), 1);
	if tbTemp[nIndex][nIdx] and tbTemp[nIndex][nIdx][4] then
		qht_itmedice_roll(tbTemp[nIndex][nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx);
	else
		print("ERROE:qht_award_tianyi()");
	end
end

--����
function qht_award_ziyan(targetNpcIdx)
	local tbTemp = {
		_ZIGUANG_WEAPON_TABLE,
		_ZIGUANG_CAP_TABLE,
		_ZIGUANG_CLOTH_TABLE,
		_ZIGUANG_SHOE_TABLE,
		_ZIGUANG_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	local nIdx = gf_GetRandItemByTable(tbTemp[nIndex], gf_SumRandBase(tbTemp[nIndex]), 1);
	if tbTemp[nIndex][nIdx] and tbTemp[nIndex][nIdx][4] then
		qht_itmedice_roll(tbTemp[nIndex][nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx);
	else
		print("ERROE:qht_award_tianyi()");
	end
end

--���Ͷ��
function qht_award_haoyue(targetNpcIdx)
	local tbTemp = {
		_HAOYUE_WEAPON_TABLE,
		_HAOYUE_CAP_TABLE,
		_HAOYUE_CLOTH_TABLE,
		_HAOYUE_SHOE_TABLE,
		_HAOYUE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	local nIdx = gf_GetRandItemByTable(tbTemp[nIndex], gf_SumRandBase(tbTemp[nIndex]), 1);
	if tbTemp[nIndex][nIdx] and tbTemp[nIndex][nIdx][4] then
		qht_itmedice_roll(tbTemp[nIndex][nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx);
	else
		print("ERROE:qht_award_haoyue()");
	end
end

--1������Ͷ��
function qht_award_1_yunling(targetNpcIdx)
	local nIdx = gf_GetRandItemByTable(_YUNLING_1_TABLE, gf_SumRandBase(_YUNLING_1_TABLE), 1);
	if _YUNLING_1_TABLE[nIdx] and _YUNLING_1_TABLE[nIdx][4] then
		qht_itmedice_roll(_YUNLING_1_TABLE[nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx, 7 * 24 * 3600);
	else
		print("ERROE:qht_award_1_yunling()");
	end
end

--2������Ͷ��
function qht_award_2_yunling(targetNpcIdx)
	local nIdx = gf_GetRandItemByTable(_YUNLING_2_TABLE, gf_SumRandBase(_YUNLING_2_TABLE), 1);
	if _YUNLING_2_TABLE[nIdx] and _YUNLING_2_TABLE[nIdx][4] then
		qht_itmedice_roll(_YUNLING_2_TABLE[nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx, 7 * 24 * 3600);
	else
		print("ERROE:qht_award_2_yunling()");
	end
end

--3������Ͷ��
function qht_award_3_yunling(targetNpcIdx)
	local nIdx = gf_GetRandItemByTable(_YUNLING_3_TABLE, gf_SumRandBase(_YUNLING_3_TABLE), 1);
	if _YUNLING_3_TABLE[nIdx] and _YUNLING_3_TABLE[nIdx][4] then
		qht_itmedice_roll(_YUNLING_3_TABLE[nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx, 7 * 24 * 3600);
	else
		print("ERROE:qht_award_3_yunling()");
	end
end

--��������Ͷ��--����
function qht_award_zuoji(targetNpcIdx)
	local nCount = GetMapTaskTemp(6023,QHT_MAPTEMPTASK_YJZUOJI_MAX);
	if nCount > 0 then
		return 0;
	end
	local nIdx = gf_GetRandItemByTable(QHT_AWARD_HORSE, gf_SumRandBase(QHT_AWARD_HORSE), 1);
	if QHT_AWARD_HORSE[nIdx] and QHT_AWARD_HORSE[nIdx][4] then
		qht_itmedice_roll(QHT_AWARD_HORSE[nIdx][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx);
		SetMapTaskTemp(6023,QHT_MAPTEMPTASK_YJZUOJI_MAX, nCount + 1);
	else
		print("ERROE:qht_award_zuoji()");
	end	
end

--�����Ͷ��--����
function qht_award_tiangang(targetNpcIdx)
	local nCount = GetMapTaskTemp(6023, QHT_MAPTEMPTASK_TIANGANG_MAX);
	if nCount > 0 then
		return 0;
	end
	qht_itmedice_roll({2,95,204,1}, QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx);
	SetMapTaskTemp(6023,QHT_MAPTEMPTASK_TIANGANG_MAX, nCount + 1);
end

--���Ž���Ͷ��--����
function qht_award_tianmen(targetNpcIdx)
	local nCount = GetMapTaskTemp(6023, QHT_MAPTEMPTASK_TIANMEN_MAX);
	if nCount > 0 then
		return 0;
	end
	qht_itmedice_roll({2,1,30370,1}, QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx);
	SetMapTaskTemp(6023,QHT_MAPTEMPTASK_TIANMEN_MAX, nCount + 1);
end

--���ݲ������Ƶ���table
function qht_award_resettable(tbTemlate)
	--���������ж�
	if not tbTemlate then
		return 0;
	end
	local tbTemp = {};
	for i = 1, getn(tbTemlate) do
		tinsert(tbTemp, tbTemlate[i]);
	end
	local nNum = 0;
	--����
	nNum = GetMapTaskTemp(6023,QHT_MAPTEMPTASK_YJZUOJI_MAX);
	if nNum >= QHT_YJZUOJI_MAX then
		for i=1,getn(tbTemp) do
			if tbTemp[i][3] == "qht_award_zuoji()" then
				tremove(tbTemp,i);
			end
		end
	end
	--���
	nNum = GetMapTaskTemp(6023,QHT_MAPTEMPTASK_TIANGANG_MAX);
	if nNum >= QHT_TIANGANG_MAX then
		for i=1,getn(tbTemp) do
			if tbTemp[i][3] == "qht_award_tiangang()" then
				tremove(tbTemp,i);
			end
		end
	end
	--����
	nNum = GetMapTaskTemp(6023,QHT_MAPTEMPTASK_TIANMEN_MAX);
	if nNum >= QHT_TIANMEN_MAX then
		for i=1,getn(tbTemp) do
			if tbTemp[i][3] == "qht_award_tianmen()" then
				tremove(tbTemp,i);
			end
		end
	end
	return tbTemp;
end

--����Ͷ����
function qht_award_throwdice(tbAward,targetNpcIdx)
	local nRandIndex = gf_GetRandItemByTable(tbAward, gf_SumRandBase(tbAward), 1);
--	for i = 1, getn(tbAward[nRandIndex]) do
--		print(tbAward[nRandIndex][i])
--	end
	if tbAward[nRandIndex] then
		if tbAward[nRandIndex][1] == 1 then
				qht_itmedice_roll(tbAward[nRandIndex][4], QHT_THROWDICE_CBFILE, "qht_throwdice_callback", 100, 60, qht_get_teamsize(),targetNpcIdx, tbAward[nRandIndex][5]);
		elseif tbAward[nRandIndex][1] == 31 then
				dostring(format(tbAward[nRandIndex][3],targetNpcIdx));
		end
	else
		print("ERROR:qht_award_throwdice()");
	end
end

--�����Ļ���
function qht_award_jinwenhufu(nNum, nProbability, nBaseMax, bBind)
	qht_DailyTaskReSet();
	if QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.NumJW) >= QHT_JWHF_MAX then
		return 0;
	end
	if random(nBaseMax) <= nProbability then
		gf_AddItemEx2({2,1,30438,nNum,(bBind or 4)}, "Kim H� ph�", "C�ng chi�n Thi�n T�m Th�p", "Kim H� ph�", 0, 1);
		QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.NumJW,QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.NumJW) + nNum);
		AddRuntimeStat(22, 1, 0, nNum or 1);
	end 
end

--roll����
function qht_itmedice_roll(tbItem, sFilePath, cbFunc, nMax, nTime, nTeamSize,targetNpcIdx,nLimitTime)
	if type(tbItem) ~= "table" then return end
	if not sFilePath then return end
	if not cbFunc then return end
	if not nMax then return end
	if not nTime then return end
	if not nTeamSize or nTeamSize < 1 then return end
	local diceId;
	if targetNpcIdx and targetNpcIdx ~= 0 then
		--�Ƿ���������Ŀ��NPCIndex
		diceId = ApplyItemDice(1, nMax, nTime, sFilePath, cbFunc, nTeamSize,targetNpcIdx);
	else
		diceId = ApplyItemDice(1, nMax, nTime, sFilePath, cbFunc, nTeamSize);
	end
	if not diceId then
		print("ERROR:ApplyItemDice return nil");
		return 0;
	end
	local nItemIndex = AddDiceItemInfo(diceId, gf_UnPack(tbItem))
	if nLimitTime and nItemIndex and type(nLimitTime) == "number" and nLimitTime > 0 then
		SetItemExpireTime(nItemIndex, nLimitTime);
	end
	if nTeamSize > 1 then
		local nPlayerOld = PlayerIndex
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i);
			local nMapID,nX,nY = GetWorldPos();
			if qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
				RollItem(diceId);
			end
		end
		PlayerIndex = nPlayerOld;	
	else
		local nMapID,nX,nY = GetWorldPos();
		if qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			RollItem(diceId);
		end
	end
end

--Ͷ��ص�����
function qht_throwdice_callback(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bNotice = qht_award_isnotice(szItem);
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
				gf_WriteLogEx("C�ng chi�n Thi�n T�m Th�p", "qht_throwdice_callback", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -�� nh�t ���c"..szItem
				tbTemp[value[1]] = szItem;
				gf_WriteLogEx("C�ng chi�n Thi�n T�m Th�p", "qht_throwdice_callback", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	--����
	if bNotice == 1 then
		for index, value in tbTemp do
			if GetName() == index then
				Msg2Global(format("Ng��i ch�i %s c�ng chi�n Thi�n T�m Th�p may m�n nh�n ���c ph�n th��ng %s",index,value));
			end
		end
	end
	if bAllGiveUp == 1 then
		Msg2Player("T�t c� ng��i ch�i �� b� cu�c")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh�ng ng��i ch�i kh�c �� v��t qu� th�i gian, xem nh� b� cu�c")
	end
end

--�Ƿ���Ҫ����
function qht_award_isnotice(sItemName)
	--��Ҫ�����Item��
	local tbItem = {
		"Linh Th�ch Nguy�n Th�ch c�p 7",
		"C��ng h�a quy�n 15",
		"C��ng h�a quy�n 14",
		"Thi�n Cang L�nh",
		"Thi�n M�n Kim L�nh",
		"B�o Tr�ng B�o B�o",
		"B�o �en B�o B�o",
		"B�o V�ng B�o B�o",
		"T� Ngh�a L�nh",
		"Th�ng Thi�n L�nh",
		"Chi�n H�i Kim Ch� ng� h�nh",
		"Chi�n H�i M�c Ch� ng� h�nh",
		"Chi�n H�i Th�y Ch� ng� h�nh",
		"Chi�n H�i H�a Ch� ng� h�nh",
		"Chi�n H�i Th� Ch� ng� h�nh",
		"Chi�n H�i �m Ch� ng� h�nh",
		"Huy Ch��ng Kim Ch� ng� h�nh",
		"Huy Ch��ng M�c Ch� ng� h�nh",
		"Huy Ch��ng Th�y Ch� ng� h�nh",
		"Huy Ch��ng H�a Ch� ng� h�nh",
		"Huy Ch��ng Th� Ch� ng� h�nh",
		"Huy Ch��ng �m Ch� ng� h�nh", 
		"Huy�tTr�chTh�ch Lv4",
		"Nguy�tB�chTh�ch Lv4",
		"H� Ph�ch Th�ch C�p 4",
		"H�c Di�u Th�ch C�p 4",
		"Bao Thi�n Ki�u L�nh L�n",
		"Bao Thi�n Ki�u L�nh Nh�",
	};
	for i=1, getn(tbItem) do
		if tbItem[i] == sItemName then
			return 1;
		end
	end
	return 0;
end

--��Ҫgs���������
function qht_gs_daily_clean()
	SetMapTaskTemp(6021, QHT_MAPTEMPTASK_BOSS_MAX, 0);
	SetMapTaskTemp(6022, QHT_MAPTEMPTASK_BOSS_MAX, 0);
	SetMapTaskTemp(6023, QHT_MAPTEMPTASK_BOSS_MAX, 0);
	
	SetMapTaskTemp(6023, QHT_MAPTEMPTASK_GOLDBOSS_MAX, 0);
	SetMapTaskTemp(6023, QHT_MAPTEMPTASK_TIANGANG_MAX, 0);
	SetMapTaskTemp(6023, QHT_MAPTEMPTASK_YJZUOJI_MAX, 0);
	SetMapTaskTemp(6023, QHT_MAPTEMPTASK_TIANMEN_MAX, 0);
end

function qht_get_teamsize()
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	if GetTeamSize() > 1 then
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			local nMapID,nX,nY = GetWorldPos();
			if qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
				nCount = nCount + 1;
			end
		end
		PlayerIndex = oldPlayerIndex;
	else
		local nMapID,nX,nY = GetWorldPos();
		if qht_map_allow(QHT_MAP_TABLE,nMapID) == 1 then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

--�ؿ����˲���
function qht_raid_award(tbAward)
	if not tbAward then return end
	if qht_activity_isopen() ~= 1 then
		return 0;
	end
	if qht_check_condition(1) ~= 1 then
		return 0;
	end
	gf_EventGiveRandAward(tbAward, gf_SumRandBase(tbAward), 1, "C�ng chi�n Thi�n T�m Th�p", "R�i ra trong �i");
end

function qht_raid_ls_14()
	qht_raid_award(QHT_RAID_AWARD_LS_14);
end

function qht_raid_ls_58()
	qht_raid_award(QHT_RAID_AWARD_LS_58);
end

function qht_raid_wj_13()
	qht_raid_award(QHT_RAID_AWARD_WJ_13);
end

function qht_raid_wj_4()
	qht_raid_award(QHT_RAID_AWARD_WJ_4);
end

function qht_raid_ttd_13()
	qht_raid_award(QHT_RAID_AWARD_TTD_13);
end

function qht_raid_ttd_47()
	qht_raid_award(QHT_RAID_AWARD_TTD_47);
end

function qht_raid_dxg_13()
	qht_raid_award(QHT_RAID_AWARD_DXG_13);
end

function qht_raid_dxg_47()
	qht_raid_award(QHT_RAID_AWARD_DXG_47);
end

function qht_raid_tyt_13()
	qht_raid_award(QHT_RAID_AWARD_TYT_13);
end

function qht_raid_tyt_46()
	qht_raid_award(QHT_RAID_AWARD_TYT_46);
end

----��ĳ��ħ��״̬
--function qht_magic_attrib(tbMagic)
--	if qht_activity_isopen() ~= 1 then
--		return 0;
--	end
--	if not tbMagic then return 0 end
--	local tState = tbMagic.tState;
--	local tInfo = tbMagic.tInfo;
--	if tInfo and tState then
----		for i=1, getn(tState) do
----			RemoveState(tState[i][1]);
----		end
--		local nRandIndex = gf_GetRandItemByTable(tState,100,1);
--		CastState(tState[nRandIndex][3], tState[nRandIndex][4], tState[nRandIndex][6] * 60 * 18, 1, tState[nRandIndex][1], 0);
--		SyncCustomState(1, tState[nRandIndex][1], 1, format(tInfo[1],tInfo[2],tState[nRandIndex][6]));
--		Talk(1,"",format("����%sЧ��",tState[nRandIndex][5]));
--	end
--end

--ˢNPC
--����������table
function qht_random_flash(nMapID, tbPoint)
	if qht_activity_isopen() ~= 1 then
		return nil,nil,nil;
	end
	if not tbPoint then 
		return nil,nil,nil; 
	end
	if qht_map_allow(QHT_MAP_TABLE,nMapID) ~= 1 then return 0; end
	local nSize = QHT_MAP_FLASH_POINT[nMapID][1] + QHT_MAP_FLASH_POINT[nMapID][2] + QHT_MAP_FLASH_POINT[nMapID][3];
	if nSize ~= getn(tbPoint) then
		return nil,nil,nil;
	end
	local tBuffTempPoint = {};
	local tBoxTempPoint = {};
	local tBossTempPoint = {};
	--��û���ҵ��õİ취ʵ��
	local tSeedRand = random(nSize);
	local n = 1;
	for i = tSeedRand, tSeedRand + QHT_MAP_FLASH_POINT[nMapID][1] - 1 do
		n = mod(i, nSize);
		if n == 0 then n = nSize; end
		tBuffTempPoint[i - tSeedRand + 1] = n;
	end
	n = n + 1;
	n = mod(n, nSize);
	if n == 0 then n = nSize; end
	tSeedRand = n;
	for i = tSeedRand, tSeedRand + QHT_MAP_FLASH_POINT[nMapID][2] - 1 do
		n = mod(i, nSize);
		if n == 0 then n = nSize; end
		tBoxTempPoint[i - tSeedRand + 1] = n;
	end
	n = n + 1;
	n = mod(n, nSize);
	if n == 0 then n = nSize; end
	tSeedRand = n;
	for i = tSeedRand, tSeedRand + QHT_MAP_FLASH_POINT[nMapID][3] - 1 do
		n = mod(i, nSize);
		if n == 0 then n = nSize; end
		tBossTempPoint[i - tSeedRand + 1] = n;
	end
	return tBuffTempPoint, tBoxTempPoint, tBossTempPoint;
end

--gs������ʱ�򴴽�mission
function qht_create_mission()
	if qht_activity_isopen() ~= 1 then
		return 0;
	end
	for i = 1, getn(QHT_MAP_TABLE) do
		if SubWorldID2Idx(QHT_MAP_TABLE[i]) ~= -1 then
			mf_OpenMission(QHT_MISSION_ID[i],QHT_MAP_TABLE[i]);
		end
	end
end

--Npc����ƥ��
function qht_npc_name_cmp(strName)
	for i = 1, getn(QHT_LANGUAI_TABLE) do
		if strName == QHT_LANGUAI_TABLE[i][2] then
			return 1;
		end
	end
	for i = 1, getn(QHT_XIAOBOSS_TABLE) do
		if strName == QHT_XIAOBOSS_TABLE[i][2] then
			return 1;
		end
	end
	for i = 1, getn(QHT_ZHONGBOSS_TABLE) do
		if strName == QHT_ZHONGBOSS_TABLE[i][2] then
			return 1;
		end
	end
	for i = 1, getn(QHT_DABOSS_TABLE) do
		if strName == QHT_DABOSS_TABLE[i][2] then
			return 1;
		end
	end
	for i = 1, getn(QHT_GOLDBOSS_TABLE) do
		if strName == QHT_GOLDBOSS_TABLE[i][2] then
			return 1;
		end
	end
	for i = 1, getn(QHT_BOX_TABLE) do
		if strName == QHT_BOX_TABLE[i][2] then
			return 1;
		end
	end
	for i = 1, getn(QHT_SHENTAN_TABLE_6021) do
		if strName == QHT_SHENTAN_TABLE_6021[i][3] then
			return 1;
		end
	end
	for i = 1, getn(QHT_SHENTAN_TABLE_6022) do
		if strName == QHT_SHENTAN_TABLE_6022[i][3] then
			return 1;
		end
	end
	for i = 1, getn(QHT_SHENTAN_TABLE_6023) do
		if strName == QHT_SHENTAN_TABLE_6023[i][3] then
			return 1;
		end
	end
	return 0;
end

--����buff��
function qht_create_buff(tbBuff,tPoint)
	if not tbBuff or not tPoint then return end
	local nRand = gf_GetRandItemByTable(tbBuff, gf_SumRandBase(tbBuff), 1);
	local npcIndex = CreateNpc(tbBuff[nRand][1], tbBuff[nRand][3], tPoint[1], tPoint[2], tPoint[3]);
	SetNpcScript(npcIndex, tbBuff[nRand][4]);
	return npcIndex;
end

--����box��
function qht_create_box(tbBox,tPoint)
	if not tbBox or not tPoint then return end
	local nRand = gf_GetRandItemByTable(tbBox, gf_SumRandBase(tbBox), 1);
	if tbBox[nRand][1] == "" then
		return 0;
	end 
	local npcIndex = CreateNpc(tbBox[nRand][1], tbBox[nRand][3], tPoint[1], tPoint[2], tPoint[3]);
	SetNpcScript(npcIndex, tbBox[nRand][4]);
	return npcIndex;
end

--����boss��
function qht_create_boss(tbBoss,tPoint)
	if not tbBoss or not tPoint then return end
	local nRand = gf_GetRandItemByTable(tbBoss, gf_SumRandBase(tbBoss), 1);
	local nNum = GetMapTaskTemp(6023,QHT_MAPTEMPTASK_GOLDBOSS_MAX);
	if tbBoss[nRand][1] == 5 then
		if nNum >= 3 then
			--tbBoss���ܸĶ�
			nRand = nRand - 1;
		end
	end
	if nRand < 1 or nRand > getn(tbBoss) then return nil; end
	if not tbBoss[nRand][3] then return nil; end
	local tbTemp = tbBoss[nRand][3];
	local nRandIndex = random(getn(tbTemp));
	local npcIndex = CreateNpc(tbTemp[nRandIndex][1], tbTemp[nRandIndex][2], tPoint[1], tPoint[2], tPoint[3]);
	if tbBoss[nRand][1] == 5 then
		SetMapTaskTemp(6023,QHT_MAPTEMPTASK_GOLDBOSS_MAX, GetMapTaskTemp(6023, QHT_MAPTEMPTASK_GOLDBOSS_MAX) + 1);
		Msg2Global(format("Boss Ho�ng Kim %s �� xu�t hi�n, c�c v� ��i hi�p mau �i Thi�n T�m Th�p t�ng 3 khi�u chi�n.",tbTemp[nRandIndex][2]));
	end
	SetNpcDeathScript(npcIndex, tbBoss[nRand][4]);
	return npcIndex;
end


--ɱ��ͨ�ִ���ʥ̳
function qht_create_shengtan(nMapID,nKind)
	local tbTemp = {
		[6021] = QHT_SHENTAN_TABLE_6021,
		[6022] = QHT_SHENTAN_TABLE_6022,
		[6023] = QHT_SHENTAN_TABLE_6023,
	};
	if not tbTemp[nMapID] then  return 0; end
	if nKind < 1 or nKind > getn(tbTemp[nMapID]) then return 0; end
	local npcIndex = CreateNpc(tbTemp[nMapID][nKind][1],tbTemp[nMapID][nKind][3],GetWorldPos());
	SetNpcScript(npcIndex, tbTemp[nMapID][nKind][4]);
end

function qht_ds_goto_check()
	local oldPlayerIndex = PlayerIndex;
	if GetName() ~= gf_GetCaptainName() then
		Talk(1,"","Ch� c� ��i tr��ng m�i c� th� ti�n h�nh thao th�c n�y");
		return 0;
	end
	local msg = "Ng��i ch�i kh�ng c� � b�n �� n�y: \n";
	local nNum = 0;
	local nMapID_Cap = GetWorldPos();
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		local nMapID,nX,nY = GetWorldPos();
		if nMapID ~= nMapID_Cap then
			msg = msg.."<color=red>"..GetName().."<color>\n";
			nNum = nNum + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if gf_GetTeamSize() > 1 and nNum > 0 then
		Talk(1,"",msg);
		return 0;
	end
	
	local msg = "Ng��i ch�i d��i ��y kh�ng �� �i�u ki�n k� n�ng v� c�p ��:\n"
	local nNum = 0;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if gf_CheckBaseCondition(80,1) ~= 1 then
			msg = msg.."<color=red>"..GetName().."<color>\n";
			nNum = nNum + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if nNum > 0 then
		Talk(1,"",msg);
		return 0;
	end
	
	return 1;
end

function qht_ds_goto_qht(nNum)
	if qht_check_condition() ~= 1 then
		return 0;
	end
	if qht_ds_goto_check() ~= 1 then
		return 0;
	end
	local tbPos = {};
	local nMapId,nX,nY = GetWorldPos();
	local oldPlayerIndex = PlayerIndex;
	local nSize = GetTeamSize();
	local sMyName = GetName();
	local sCaptainName = GetCaptainName();
	if nNum == 1 then
		tbPos = {
			{1551,3314},
			{1601,3362},
			{1595,3248},
			{1651,3300},
		}
		local nIndex = random(4);
		if nSize == 0 or sCaptainName ~= sMyName then 
			QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.InPosFlag,nMapId);
			if nMapId ~= QHT_MAP_TABLE[1] and nMapId ~= QHT_MAP_TABLE[2] and nMapId ~= QHT_MAP_TABLE[3] then
				SetTempRevPos(nMapId, nX * 32, nY * 32);
				SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
			end
			NewWorld(6021,tbPos[nIndex][1],tbPos[nIndex][2]);
			SetFightState(1); 
			SetDeathPunish(0);
			gf_WriteLogEx("THIEN TAM HUYEN CANH", "tham gia th�nh c�ng", 1, "T�ng 1")					
		elseif sCaptainName == sMyName then
			for i = 1, nSize do
				PlayerIndex = GetTeamMember(i)
				QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.InPosFlag,nMapId);
				if nMapId ~= QHT_MAP_TABLE[1] and nMapId ~= QHT_MAP_TABLE[2] and nMapId ~= QHT_MAP_TABLE[3] then
					SetTempRevPos(nMapId, nX * 32, nY * 32);
					SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
				end
				NewWorld(6021,tbPos[nIndex][1],tbPos[nIndex][2]);
				SetFightState(1);
				SetDeathPunish(0);
				gf_WriteLogEx("THIEN TAM HUYEN CANH", "tham gia th�nh c�ng", 1, "T�ng 1")						
			end
			PlayerIndex = oldPlayerIndex;
		end
		return 1;
	end
	if nNum == 2 then
		tbPos = {
			{1489,2944},
			{1630,2827},
			{1885,3062},
			{1549,3285},
			{1657,3224},
			{1395,3094},
		}
		local nIndex = random(6);
		if nSize == 0 or sCaptainName ~= sMyName then 
			QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.InPosFlag,nMapId);
			if nMapId ~= QHT_MAP_TABLE[1] and nMapId ~= QHT_MAP_TABLE[2] and nMapId ~= QHT_MAP_TABLE[3] then
				SetTempRevPos(nMapId, nX * 32, nY * 32);
				SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
			end
			NewWorld(6022,tbPos[nIndex][1],tbPos[nIndex][2]);
			SetFightState(1);
			SetDeathPunish(0);
			gf_WriteLogEx("THIEN TAM HUYEN CANH", "tham gia th�nh c�ng", 1, "T�ng 2")					
		elseif sCaptainName == sMyName then
			for i = 1, nSize do
				PlayerIndex = GetTeamMember(i)
				QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.InPosFlag,nMapId);
				if nMapId ~= QHT_MAP_TABLE[1] and nMapId ~= QHT_MAP_TABLE[2] and nMapId ~= QHT_MAP_TABLE[3] then
					SetTempRevPos(nMapId, nX * 32, nY * 32);
					SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
				end
				NewWorld(6022,tbPos[nIndex][1],tbPos[nIndex][2]);
				SetFightState(1);
				SetDeathPunish(0);
				gf_WriteLogEx("THIEN TAM HUYEN CANH", "tham gia th�nh c�ng", 1, "T�ng 2")						
			end
			PlayerIndex = oldPlayerIndex;
		end
		return 1;
	end
	if nNum == 3 then
		tbPos = {
			{1609,3694},
			{1578,3238},
		}
		local nIndex = random(2);
		if nSize == 0 or sCaptainName ~= sMyName then 
			QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.InPosFlag,nMapId);
			if nMapId ~= QHT_MAP_TABLE[1] and nMapId ~= QHT_MAP_TABLE[2] and nMapId ~= QHT_MAP_TABLE[3] then
				SetTempRevPos(nMapId, nX * 32, nY * 32);
				SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
			end
			NewWorld(6023,tbPos[nIndex][1],tbPos[nIndex][2]);
			SetFightState(1); 
			SetDeathPunish(0);
			gf_WriteLogEx("THIEN TAM HUYEN CANH", "tham gia th�nh c�ng", 1, "T�ng 3")					
		elseif sCaptainName == sMyName then
			for i = 1, nSize do
				PlayerIndex = GetTeamMember(i)
				QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.InPosFlag,nMapId);
				if nMapId ~= QHT_MAP_TABLE[1] and nMapId ~= QHT_MAP_TABLE[2] and nMapId ~= QHT_MAP_TABLE[3] then
					SetTempRevPos(nMapId, nX * 32, nY * 32);
					SetDeathScript("\\script\\online\\qianhe_tower\\qht_playerdeath.lua");
				end
				NewWorld(6023,tbPos[nIndex][1],tbPos[nIndex][2]);
				SetFightState(1);
				SetDeathPunish(0);
				gf_WriteLogEx("THIEN TAM HUYEN CANH", "tham gia th�nh c�ng", 1, "T�ng 3")						
			end
			PlayerIndex = oldPlayerIndex;
		end
		return 1;
	end
end

function qht_award_wuxing_foot_3()
	gf_EventGiveRandAward(QHT_AWARD_FOOT_3, gf_SumRandBase(QHT_AWARD_FOOT_3), 1, "C�ng chi�n Thi�n T�m Th�p", "Gi�y Ng� H�nh c�p 3")
end

function qht_award_wuxing_badge_3()
	gf_EventGiveRandAward(QHT_AWARD_BADGE_3, gf_SumRandBase(QHT_AWARD_BADGE_3), 1, "C�ng chi�n Thi�n T�m Th�p", "Huy Ch��ng Ng� H�nh c�p 3")
end

function qht_award_tong_fight_flag()
	QHT_TASK_GROUP:SetTaskBit(QHT_TASK_GROUP.TongFlag, 1, 1);
	qht_add_exp(12000000);
	qht_add_zhenqi(800);
	qht_add_shengwang(200);
	qht_add_shimen(300);
	qht_award_jinwenhufu(1,100,100);
	gf_WriteLogEx("C�ng chi�n Thi�n T�m Th�p", "Bang H�i Chi�n K�");
end

function qht_award_tong_fight_flag_tiexue()
	QHT_TASK_GROUP:SetTaskBit(QHT_TASK_GROUP.TongFlag, 2, 1);
	qht_add_exp(15000000);
	qht_add_zhenqi(1000);
	qht_add_shengwang(300);
	qht_add_shimen(400);
	qht_award_jinwenhufu(3,100,100);
	gf_WriteLogEx("C�ng chi�n Thi�n T�m Th�p", "Thi�t Huy�t Bang H�i Chi�n K�");
end

function qht_relay_create_gold_boss(nRandSeed)
	if qht_activity_isopen() ~= 1 then
		return 0;
	end
	
	--�㲥
	local strMsg = format("Thi�n T�m Huy�n C�nh Ho�ng Kim �� xu�t hi�n, nhanh ch�n ��n ��");
	Msg2Global(strMsg);
	AddLocalNews(strMsg);
		
	local nPosTable = {
		QHT_RANDOM_POINT_6021,
		QHT_RANDOM_POINT_6022,
		QHT_RANDOM_POINT_6023,
	}
	for nIndex = 1, getn(nPosTable) do
		local nPosIndex = random(getn(nPosTable[nIndex]));
				
		--�����ͼ��������������Ͳ�ˢ
		if SubWorldID2Idx(nPosTable[nIndex][nPosIndex][1]) == -1 then
			return 0;
		end
		
		--ˢNPC
		local npcIdx = CreateNpc(QHT_RELAY_CREATE_GOLD_BOSS[nIndex][1], QHT_RELAY_CREATE_GOLD_BOSS[nIndex][2], nPosTable[nIndex][nPosIndex][1], nPosTable[nIndex][nPosIndex][2], nPosTable[nIndex][nPosIndex][3]);
		if npcIdx > 0 then
			SetNpcDeathScript(npcIdx, QHT_RELAY_CREATE_GOLD_BOSS[nIndex][3]);
			SetNpcLifeTime(npcIdx, 60*30);
			AddRuntimeStat(22, 13, 0, 1);
		end
	end
end