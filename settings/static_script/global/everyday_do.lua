Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task_access_code_def.lua")
--Include("\\script\\lib\\globalfunctions.lua")
--��Ҫ���⴦���ÿ���������������
--�ڲ������Ѿ�ʵ������Ҫ��ʱ���Զ���������ű�
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")
Include("\\script\\function\\cdkey\\ck_head.lua")

function OnDailyDoSpecial()
	SetTask(VET_TSK_IPBONUS_ONLINE_AWARD, 0);
	SetTask(VET_TSK_IPBONUS_BUFF_TYPE, 0);
	SetTask(VET_MS_LS_TASKID_LIANGSHAN_ITEM_DAILY,0)
	SetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_BOSS_KILL,0)
	SetTask(TASKID_TMZ_PLAY_NUM, 0)
	SetTask(TASKID_TMZ_PLAY_RESULT, 0)
	--===================������====================
	SetTask(VET_TREASURE_BOX_PNUM,0)
	SetTask(VET_TREASURE_BOX_MNUM,0)
	SetTask(VET_TREASURE_BOX_CNUM,0)
	--ͨ�����ڣ(������������0)
	if tGtTask:check_cur_task(83) == 0 then
		SetTask(VET_TDD_DALIY_TASK_CROSS,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,1,0,4);
	end
	if tGtTask:check_cur_task(85) == 0 then
		SetTask(VET_WJZ_DALIY_TASK_CROSS,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,3,0,4);
	end
	if tGtTask:check_cur_task(87) == 0 then
		SetTask(VET_DALIY_TASK_FANPAI,0)
		gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,5,0,4);
	end
	--��ս��ɽBOSS�
	if tGtTask:check_cur_task(89) == 0 then
		SetTask(VET_LSB_GETBOX,0);
		gf_SetTaskByte(VET_LSB_MAIL_NUM,2,0);
	end
	if tGtTask:check_cur_task(90) == 0 then
		SetTask(VET_LSB_CALLBOSS,0);
		gf_SetTaskByte(VET_LSB_MAIL_NUM,3,0);
	end
	if tGtTask:check_cur_task(91) == 0 then
		SetTask(VET_LSB_OPENBOX,0);
		gf_SetTaskByte(VET_LSB_MAIL_NUM,4,0);
	end	
	--��ս��ɽBOSS�ȫ����������
	if LSB_IsActivityOpen() == 1 and LSB_GetGlbTimeDis() > 3600 then
		--����Сʱ��һ��
		ApplyRelayShareData(Lsb_Record3.szKey,Lsb_Record3.nKey1,Lsb_Record3.nKey2,CallBack_Script,"LSB_Glb_CallFunc")
	end
	if oly_IsActivityOpen() == 1 then
		--���������
		gf_SetTaskByte(VET_OLY_TASK,1,0,TASK_ACCESS_CODE_OLYMPIC);
		--�������콱����
		gf_SetTaskByte(VET_OLY_TASK1,1,0,TASK_ACCESS_CODE_OLYMPIC);
		--�������콱����
		gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
		--��������
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,0,TASK_ACCESS_CODE_OLYMPIC);
		--�������0
		gf_SetTaskByte(VET_OLY_TASK3,1,0,TASK_ACCESS_CODE_OLYMPIC);
		--ڤ����鴥����������
		gf_SetTaskByte(VET_OLY_TASK3,2,0,TASK_ACCESS_CODE_OLYMPIC);
	end
	--����ս��
	ZQ_Everyday_ReSet();
	--���ս��
	KF_Daily_Reset();
	--3v3
	SetTask(TASKID_3V3_WIN_ROUND_DAILY , 0);
	SetTask(TASKID_3V3_TOTAL_ROUND_DAILY , 0);
	SetTask(TASKID_3V3_SCORE_DAILY , 0);
	SetTask(TASKID_3V3_KILL_DAILY , 0);
	SetTask(TASKID_3V3_DEAD_DAILY , 0);
	SetTask(TASKID_3V3_ESCAPE_DAILY , 0);
	--���ɿ���
	tf_ResetTask_Everyday();
	
	dixuangong_daily_clear()--������ÿ���������� --Include("\\script\\missions\\dixuangong\\daily_task.lua")
	
	vc_DailyTaskReset(); --����vip��ÿ������
	lb_DailyClear(); --���˰ٱ���ÿ������

	--̫һ��ÿ������
	SetPlayerScript("\\script\\missions\\taiyi\\tyfunctions.lua");
	SendScript2VM("\\script\\missions\\taiyi\\tyfunctions.lua", "TY_DailyClear()");
	
	--����BOSSÿ������
	SetPlayerScript("\\script\\function\\world_boss\\wb_head.lua");
	SendScript2VM("\\script\\function\\world_boss\\wb_head.lua", "wb_DailyClear()");
	
	ck_DailyReset() --cdkey�
	
	--131�
	SetPlayerScript("\\script\\online_activites\\award.lua");
	SendScript2VM("\\script\\online_activites\\award.lua", "vaf_get_prize_daily_reset()");
	
	--��Թ̨ս��
	SetPlayerScript("\\script\\missions\\eyt_battle\\eyt_head.lua")
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_DailyReset()");
end