--head�ļ�
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\online\\olympic\\oly_award_table.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")

--�ص�����·��
Oly_CallBack_Script = "\\script\\online\\olympic\\oly_head.lua";

OLY_ACTIVITY_DURATION = 1296000 --3600 * 24 * 15�ʱ��

--���ʼʱ��(���ݸ�ʽ����)!!!!!!!!!
--activity start time
--ACTIVITY_START_DATE = {2012,7,6} --{year��mouth��day}
ACTIVITY_START_DATE = {2013,7,12} --{year��mouth��day}

--�����ʱ���ж�
function oly_IsActivityOpen()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nEndTime = nStartTime + OLY_ACTIVITY_DURATION;
	if nCurrTime >= nStartTime and nCurrTime <= nEndTime then
		return 1;
	else
		return 0;
	end
end

--�����ѿ�������
function oly_GetActivityOpenDays()
	local nCurrTime = GetTime();
	local nStartTime = MkTime(ACTIVITY_START_DATE[1],ACTIVITY_START_DATE[2],ACTIVITY_START_DATE[3],0,0,0);
	local nSpaceTimeSceconds = nCurrTime - nStartTime;
	return floor(nSpaceTimeSceconds / (3600 * 24)) + 1;
end

--�ȼ���������
function oly_Is_LevelSkill()
	local nLevel = GetLevel();
	--if nLevel < 70 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
	--	Talk(1,"","���<color=green>70<color>�����ϡ��Ѽ�������ѧ��<color=green>1<color>��<color=green>55<color>�����ܲſ��Բμӻ");
	if nLevel < 80 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("Ng��i ch�i c�p <color=green>%d<color> tr� l�n �� gia nh�p h� ph�i h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia ho�t ��ng.", 80));
		return 0;
	end
	return 1;
end

--����nNum������ʥ��
function oly_GetFlameNum(nKind,nNum)
	if GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) >= nNum then
		return 1;
	end
	return 0;
end

--IB�ϳ�
function begin_combining_1(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"","S� l��ng Th�nh H�a kh�ng ��");
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	local nNum1 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_1_callback",0,min(nNum,nNum1),"H�y nh�p s� l��ng v�o");
end

function begin_combining_1_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_1) == 0 then
		Talk(1,"","S� l��ng Th�nh H�a kh�ng ��");
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_1 then
		return 0;
	end
	local nNum2 = GetItemCount(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3]);
	if nNum2 < nNum * Compose_ShenShi_Num_1 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_1) == 1 and DelItem(WuCai_Shenshi[1],WuCai_Shenshi[2],WuCai_Shenshi[3],nNum * Compose_ShenShi_Num_1) == 1 then
		gf_AddItemEx2({2,1,30402,nNum}, "Ng� Th�i Th�nh H�a", szLogTitle, "Gh�p Th�nh H�a", 0, 1);
	end
end

--��Ѻϳ�
function begin_combining_2(nKind)
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"","S� l��ng Th�nh H�a kh�ng ��");
		return 0;
	end
	local nNum = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]) / Compose_ShengHuo_Num_2;
	local nNum1 = floor(GetCash() / (Compose_Coin_Num_2 * 10000));
	SetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX,nKind);
	AskClientForNumber("begin_combining_2_callback",0,min(nNum,nNum1),"H�y nh�p s� l��ng v�o");
end

function begin_combining_2_callback(nNum)
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
  	return 0
	end
	local nKind = GetTaskTemp(TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX);
	if oly_GetFlameNum(nKind,Compose_ShengHuo_Num_2) == 0 then
		Talk(1,"","S� l��ng Th�nh H�a kh�ng ��");
		return 0;
	end
	if nKind < 1 or nKind > 5 then return 0; end
	local nNum1 = GetItemCount(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3]);
	if nNum1 < nNum * Compose_ShengHuo_Num_2 then
		return 0;
	end
	local nNum2 = GetCash();
	if nNum2 < nNum * Compose_Coin_Num_2 * 10000 then
		return 0;
	end
	--DelItem(g,d,p,num)
	if DelItem(Flame_Table[nKind][1],Flame_Table[nKind][2],Flame_Table[nKind][3],nNum * Compose_ShengHuo_Num_2) == 1 and Pay(Compose_Coin_Num_2 * 10000 * nNum) == 1 then
		gf_AddItemEx2({2,1,30402,nNum}, "Ng� Th�i Th�nh H�a", szLogTitle, "Gh�p Th�nh H�a", 0, 1);
	end
end

--��������Ϸ
function oly_begin_guess()
	if oly_Is_LevelSkill() ~= 1 then
		return 0;
	end
	--��Ϸ��ʼ������Ŀ����
	local nTarget = random(1,OLY_MAX_RAND);
	gf_SetTaskByte(VET_OLY_TASK,2,nTarget,TASK_ACCESS_CODE_OLYMPIC); --���ɵ���
	gf_SetTaskByte(VET_OLY_TASK,3,0,TASK_ACCESS_CODE_OLYMPIC); --�µĴ���
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC); --�ݹ����
	oly_begin_guess_input();
end

function oly_begin_guess_input()
	gf_SetTaskByte(VET_OLY_TASK,4,gf_GetTaskByte(VET_OLY_TASK,4) + 1,TASK_ACCESS_CODE_OLYMPIC)
	AskClientForNumber("oly_begin_guess_Child1",1,OLY_MAX_RAND,"Nh�p ch� s� c�c h� �o�n tr�ng");
end

--��ʱȫ�ֻ���µ�����
function oly_begin_guess_Child1(nNum)
	local nTarget = gf_GetTaskByte(VET_OLY_TASK,2);
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,4);
	if nNum == nTarget then
		Talk(1,"",format("Ch�c m�ng c�c h� �� �o�n tr�ng r�i!!!  \n Ch� s� may m�n c�a c�c h� l�<color=green>%d<color>, s� l�n �o�n l�<color=green>%d<color>",nTarget,nTimes));
		gf_SetTaskByte(VET_OLY_TASK,3,nTimes,TASK_ACCESS_CODE_OLYMPIC);
		gf_SetTaskByte(VET_OLY_TASK,4,Guess_Flag,TASK_ACCESS_CODE_OLYMPIC);
	else
		if nTimes >= OLY_MAX_GUESS then
			Talk(1,"",format("S� l�n �o�n qu�<color=green>%d<color>l�n, <color=red>�� �o�n sai<color>, Ch� s� may m�n c�a c�c h� l�<color=red>%d<color>.",OLY_MAX_GUESS,nTarget));
			return 0;
		end
		if nNum > nTarget then
			Talk(1,"oly_begin_guess_input",format("Ch� s� �o�n l�n %d c�a c�c h� l�<color=red>%d<color>, qu� l�n r�i, h�y �o�n s� nh� h�n t�.",nTimes,nNum));
		else
			Talk(1,"oly_begin_guess_input",format("Ch� s� �o�n l�n %d c�a c�c h� l�<color=red>%d<color>, qu� nh� r�i, h�y �o�n s� l�n h�n t�.",nTimes,nNum));
		end
	end
end

--�����ֽ���
function oly_get_last_guess_award()
	if gf_GetTaskByte(VET_OLY_TASK,4) == 0 then
		Talk(1,"","Hi�n t�i c�c h� kh�ng c�n ph�n th��ng �� nh�n n�a r�i!")
		return 0;
	end
	if gf_GetTaskByte(VET_OLY_TASK,4) ~= Guess_Flag then
		Talk(1,"","L�n tr��c c�c h� �� �o�n sai, kh�ng th� nh�n ph�n th��ng!")
		return 0;
	end
	local nNum = gf_GetTaskByte(VET_OLY_TASK1,1);
	if nNum >= OLY_MAX_AWARD_NUM then
		Talk(1,"","S� l�n nh�n ph�n th��ng �� qu� 3 l�n, kh�ng th� nh�n th�m ���c n�a.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
  	Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
  	return 0
	end
	local nTimes = gf_GetTaskByte(VET_OLY_TASK,3);--���´���
	if nTimes < 1 or nTimes > 5 then return 0; end
	--�콱
	gf_SetTaskByte(VET_OLY_TASK1,1,nNum + 1,TASK_ACCESS_CODE_OLYMPIC);
	gf_SetTaskByte(VET_OLY_TASK,4,0,TASK_ACCESS_CODE_OLYMPIC);
	gf_Modify("Exp",OLY_GUESS_AWARD_TABLE[nTimes][1]);
	gf_AddItemEx2(OLY_GUESS_AWARD_TABLE[nTimes][2], "Lam S�c Th�nh H�a", szLogTitle, "Ph�n th��ng �o�n s�", 0, 1);
end

--���ص�ǰʱ��s
function oly_GetDayCurrTime()
	local nHour = tonumber(date("%H"));
	local nMinute = tonumber(date("%M"));
	local nSecond = tonumber(date("%S"));
	return nHour * 3600 + nMinute * 60 + nSecond;
end

--����ѷ������������
function oly_CallBack_GetTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_TGL_NUM,nFlag);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--�ѷ������������+
function oly_CallBack_ModifyTGNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_ModifyTGNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nTglNum = gf_GetMyTaskByte(VET_OLY_TASK2,3,4);
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nTglNum);
		--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record.itemkey)
	nFlag = nFlag or 0;
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",nFlag + nTglNum);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--��ȡ������ۼ���Ŀ
function oly_GetAccumulatedTglNum()
	--�ۼ���������Ŀ
	--Ϊ0ȥ�������ݿ�ȡ
	ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_GetTGNum");
	local nDaysNum = oly_GetActivityOpenDays();
	nTgl = GetGlbValue(Glb_Oly_TGL_NUM) or 0;
	local nTglNum = nDaysNum * OLY_EXCHANGE_BASE - nTgl; --�ۼ���Ŀ
	if nTglNum < 0 or nTglNum > (OLY_ACTIVITY_DURATION / (3600 * 24)) * OLY_EXCHANGE_BASE then
		print("ERROE:oly_GetAccumulatedTglNum() TGL")
		return -1;
	end
	return nTglNum;
end

function oly_CreateDlgTable()
	local tbSay = {};
	local nDayTime = oly_GetDayCurrTime(); --����ʱ��
--	print("nDayTime",nDayTime);
	--���Բ��������֣���ʾ��������
	--0-21
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		if gf_GetTaskByte(VET_OLY_TASK,1) < 6 then
			tinsert(tbSay,"Ch�a ho�n th�nh th�p s�ng 6 l�n /do_nothing");
		else
			if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
				tinsert(tbSay,"Nh�p ch� s� may m�n v�o /input_luck_num_201207");
			else
				tinsert(tbSay,format("Ch� s� may m�n h�m nay c�a c�c h� l�%d/do_nothing",gf_GetMyTaskByte(VET_OLY_TASK1,2,3)));
			end
		end
	end
	--�����Բ������ˣ���ʾ��û�У�������ʾ�Ǽ�
	--21:00-21:30
	if nDayTime >= OLY_TIME_START and nDayTime < OLY_TIME_MID then
		--ȫ����Ϊ0��ȥ�������ݿ�ȡ
		--if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
		ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		--end
		local nRelayLuckNum = GetGlbValue(Glb_Oly_Luck_NUM) or 0;
		local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3) or 0;
		if nRelayLuckNum == nMyluckNum and nRelayLuckNum ~= 0 then
			if gf_GetTaskByte(VET_OLY_TASK1,4) ~= 1 then
				tinsert(tbSay,"Tr�ng th��ng r�i, t�i h� mu�n ��ng k�/register_mylucknum_201207");
			else
				tinsert(tbSay,"Tr�ng th��ng r�i, �� ���c ��ng k�/do_nothing");
			end
		else
			tinsert(tbSay,"C�c h� �� kh�ng tr�ng th��ng, h�y may m�n l�n sau/do_nothing");
		end
	end
	--�����Բ������ˣ���ʾ��û�У��Ǽ�����ʾ�콱
	--21:30-22:00
	if nDayTime >= OLY_TIME_MID and nDayTime < OLY_TIME_END then
		--ȫ����Ϊ0��ȥ�������ݿ�ȡ
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		local nRelayLuckNum = GetGlbValue(Glb_Oly_Luck_NUM) or 0;
		local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3) or 0;
		if nMyluckNum == 0 or nRelayLuckNum ~= nMyluckNum then
			tinsert(tbSay,"C�c h� �� kh�ng tr�ng th��ng, h�y may m�n l�n sau/do_nothing");
		else
			if gf_GetTaskByte(VET_OLY_TASK1,4) == 1 then
				tinsert(tbSay,"Tr�ng th��ng r�i, t�i h� mu�n nh�n ph�n th��ng/get_lucknum_award_201207");
			else
				tinsert(tbSay,"Tr�ng th��ng r�i, nh�ng ch�a ��ng k� ho�c �� nh�n ph�n th��ng r�i/do_nothing");
			end
		end
	end
	--22:00-24:00
	if nDayTime >= OLY_TIME_END then
		tinsert(tbSay,"Ng�y mai h�y ��n/do_nothing");
	end

	return tbSay;
end

--Relay�������ݿ�ص�����
--ÿ��21�����һ��
--ÿ̨gs��ִ��һ������������Ϊ׼
function oly_CallBack_Relay_Random(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_Callback_Relay_Random")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nRandom = random(1,OLY_MAX_LUCK_NUM);
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",nRandom);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--��ȡ��������
--Glb_Oly_Luck_NUM
function oly_CallBack_GetLuckNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	--0��21��֮��
	local nDayTime = oly_GetDayCurrTime(); --����ʱ��
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		SetGlbValue(Glb_Oly_Luck_NUM,0);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record2.itemkey)
	nFlag = nFlag or 0;
	SetGlbValue(Glb_Oly_Luck_NUM,nFlag);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function do_nothing()
	--do nothing
end

--������ۼ���Ŀ���������֣������������
function oly_GetBaseInfo()
	--�������Ŀ
	local nTglNum = floor(oly_GetAccumulatedTglNum() / OLY_EXCHANGE_BASE);
	if nTglNum < 0 then
		print("ERROR:TGL Num is error");
		return 0,"",0;
	end
	--�������������
	local strNum = "";
	if oly_GetDayCurrTime() < OLY_TIME_START then
		strNum = "21:00 t�i nay m� th��ng, tr��c 21:30 ��ng k� tr�ng th��ng, tr��c 22:00 nh�n th��ng";
	else
		--��������Ϊ0��ȥ�������ݿ�ȡ
		if GetGlbValue(Glb_Oly_Luck_NUM) == 0 then
			ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckNum");
		end
		local nNumTemp = GetGlbValue(Glb_Oly_Luck_NUM);
		if nNumTemp ~= 0 then
			strNum = tostring(nNumTemp);
		else
			strNum = "21:00 t�i nay m� th��ng, tr��c 21:30 ��ng k� tr�ng th��ng, tr��c 22:00 nh�n th��ng";
		end
	end
	--�ҵ���������
	local nMyluckNum = gf_GetMyTaskByte(VET_OLY_TASK1,2,3);
	return nTglNum,strNum,nMyluckNum;
end

--�Ǽ��н�����+1
function oly_CallBack_Rigister(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Rigister")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0;
	--�Ǽ�����������10
	if nFlag < MAX_WIN_NUM then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag + 1);
		--�Ǽ�����
		gf_SetTaskByte(VET_OLY_TASK1,4,1,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("C�c h� �� ��ng k� r�i, t� %d:%d��n%d:%dgi� h�y ��n nh�n ph�n th��ng",floor(OLY_TIME_MID/3600),floor(mod(OLY_TIME_MID,3600)/60),floor(OLY_TIME_END/3600),floor(mod(OLY_TIME_END,3600)/60)));
	else
		Msg2Player(format("S� l�n ��ng k� �� v��t qua %d l�n, kh�ng th� ��ng k� n�a",MAX_WIN_NUM));
	end
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--�Ǽ��н�����-1
function oly_CallBack_Rigister_Dec(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Rigister_Dec")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	if nCount == 0 then
		-- û�м�¼
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
		--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
		DelRelayShareDataCopy(szKey, nKey1, nKey2);
		return 0;
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	--�Ǽ�������С��0
	if nFlag > 0 then
		AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",nFlag - 1);
	end
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--ȡ���������콱
function oly_CallBack_GetLuckPersonNum(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_GetLuckPersonNum")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	local nFlag, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Oly_Record3.itemkey)
	nFlag = nFlag or 0; --����
	--�콱��
	oly_GetLuckNumAward(nFlag);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

function oly_GetLuckNumAward(nFlag)
	if nFlag <= 0 or nFlag == nil then return 0; end
	local nTgl = oly_GetAccumulatedTglNum(); --�����Ƭ����
	if nTgl <= 0 then return 0; end
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0;
	end
	local nNum1 = floor(nTgl /OLY_EXCHANGE_BASE);
	if nNum1 == (nTgl /OLY_EXCHANGE_BASE) and (nNum1 /nFlag) == floor(nNum1 /nFlag) then
		--=======�����
		gf_AddItemEx2({2,95,204,nNum1 /nFlag}, "Thi�n Cang L�nh", szLogTitle, "Nh�n th��ng ch� s� may m�n", 0, 1);
		--Msg2Global(format("��ϲ���%s�ڰ������˳齱�л�������*%d",GetName(),nNum1 /nFlag));
		Msg2Global(format("Ch�c m�ng ng��i ch�i %s �� r�t th��ng ���c Thi�n Cang L�nh*%d",GetName(),nNum1 /nFlag));
		--�콱���
		gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
		--������ȡ����
		gf_SetMyTaskByte(VET_OLY_TASK2,3,4,(nNum1 /nFlag) * OLY_EXCHANGE_BASE,TASK_ACCESS_CODE_OLYMPIC);
		--�ۼ�����+
		ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_ModifyTGNum");
	else
		--=======����Ƭ
		gf_AddItemEx2({2,1,30390,floor(nTgl /nFlag)}, "M�nh Thi�n Cang", szLogTitle, "Nh�n th��ng ch� s� may m�n", 0, 1);
		--Msg2Global(format("��ϲ���%s�ڰ������˳齱�л�������Ƭ*%d",GetName(),floor(nTgl /nFlag)));
		Msg2Global(format("Ch�c m�ng ng��i ch�i %s �� r�t th��ng ���c M�nh Thi�n Cang*%d",GetName(),floor(nTgl /nFlag)));
		--�콱���
		gf_SetTaskByte(VET_OLY_TASK1,4,0,TASK_ACCESS_CODE_OLYMPIC);
		--������ȡ����
		gf_SetMyTaskByte(VET_OLY_TASK2,3,4,floor(nTgl /nFlag),TASK_ACCESS_CODE_OLYMPIC);
		--�ۼ�����
		ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_ModifyTGNum");
	end
	--�Ǽ�������1
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister_Dec");
end

--��������ֵ0
function oly_CallBack_LuckNum_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_LuckNum_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record2.nSortType, Oly_Record2.itemkey,"d",0);
	SetGlbValue(Glb_Oly_TGL_NUM,0);
	SetGlbValue(Glb_Oly_Luck_NUM,0);
	--�����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2);
end

--�Ǽ�������0
function oly_CallBack_Register_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
--	print("oly_CallBack_Register_ReSet")
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record3.nSortType, Oly_Record3.itemkey,"d",0);
end

--�������������������Ŀ
function oly_CallBack_TGL_ReSet(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end
	AddRelayShareData(szKey, nKey1, nKey2, Oly_CallBack_Script, "do_nothing", Oly_Record.nSortType, Oly_Record.itemkey,"d",0);
end

--�������ۼƽ���
function oly_Accumulate_FireNum()
	local nNum = gf_GetMyTaskByte(VET_OLY_TASK2,1,2) + 1;
	--����+1
	gf_SetMyTaskByte(VET_OLY_TASK2,1,2,nNum,TASK_ACCESS_CODE_OLYMPIC);
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] == nNum  then
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 1 then
				gf_AddItemEx2(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3], OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4], szLogTitle, "Ph�n th��ng th�p s�ng c�ng d�n ", OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][6], 1);
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 2 then
				gf_EventGiveCustomAward(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][1],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][2],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][3],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][4],OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3][5])
			elseif OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][2] == 3 then
				if type(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]) == "string" then
					dostring(OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][3]);
				end
			end
			--������չ
			if OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][4] == "Thi�n Cang L�nh" then
				gf_SetMyTaskByte(VET_OLY_TASK2,1,2,0,TASK_ACCESS_CODE_OLYMPIC);
				Msg2Global(format("Ch�c m�ng %s ��t ��n s� l�n th�p s�ng Th�nh H�a ��n nh�n ���c Thi�n Cang L�nh x 1",GetName()));
			end
			break
		end
	end
end

--����ǿ�
function oly_XingKe_Award()
	gf_EventGiveRandAward(OLY_XINGKE_AWARD_TB, gf_SumRandBase(OLY_XINGKE_AWARD_TB), 1);
end

--�������
function oly_TianYi_Award()
	gf_EventGiveRandAward(OLY_TIANYI_AWARD_TB, gf_SumRandBase(OLY_TIANYI_AWARD_TB), 1);
end

--ʦ��4��
function oly_ShiMeng4_Award()
	MA_GiveFactionEquip4({1, nil, nil, 0}, szLogTitle);
end

--����2
function oly_YunLing2_Award()
	MA_GiveLevel2WenShi({1, nil, 30, 0}, szLogTitle);
end

--������1
function oly_GiveAward1()
--	print("oly_GiveAward1")
--	gf_Modify("Exp",120000);
	gf_Modify("Exp",180000);
	gf_EventGiveRandAward(OLY_AWARD_1_TABLE,gf_SumRandBase(OLY_AWARD_1_TABLE),1,szLogTitle,"Ph�n th��ng 1");
end

--������2
function oly_GiveAward2()
--	print("oly_GiveAward2")
--	gf_Modify("Exp",200000);
	gf_Modify("Exp",OLY_EXP_2);
	gf_EventGiveRandAward(OLY_AWARD_2_TABLE,gf_SumRandBase(OLY_AWARD_2_TABLE),1,szLogTitle,"Ph�n th��ng 2");
end

--������3
function oly_GiveAward3()
--	print("oly_GiveAward3")
--	gf_Modify("Exp",300000);
	gf_Modify("Exp",OLY_EXP_3);
--	local nRand = gf_EventGiveRandAward(OLY_AWARD_3_TABLE,1000000,1,szLogTitle,"������3");
--	if nRand == 30 or nRand == 23 or nRand == 22 or nRand == 21 or nRand == 20  then
--		local strName = OLY_AWARD_3_TABLE[nRand][3];
--		if nRand == 30 then
--			strName = "7����ʯ";
--		end
--		Msg2Global(format("��ϲ���%s�ڰ��˻�л��%s*1",GetName(),strName));
--	end
	gf_EventGiveRandAward(OLY_AWARD_3_TABLE,gf_SumRandBase(OLY_AWARD_3_TABLE),1,szLogTitle,"Ho�t ��ng Th�nh H�a");
end

--��ʥ��
function oly_AddShengHuo(nNum,nIndex)
	if oly_IsActivityOpen() == 1 then
		AddItem(Flame_Table[nIndex][1],Flame_Table[nIndex][2],Flame_Table[nIndex][3],nNum);
		Msg2Player(format("C�c h� nh�n ���c %s x %d",Flame_Table[nIndex][5],nNum));
	end
end

function oly_GetCountStep(nNum)
--	if nNum >= 0 and nNum < 50 then
--		return 50;
--	elseif nNum >= 50 and nNum < 100 then
--		return 100;
--	elseif nNum >= 100 and nNum < 150 then
--		return 150;
--	elseif nNum >= 150 and nNum < 300 then
--		return 300;
--	elseif nNum >= 300 and nNum < 600 then
--		return 600;
--	elseif nNum >= 600 and nNum < 800 then
--		return 800;
--	elseif nNum >= 800 and nNum < 1000 then
--		return 1000;
--	elseif nNum >= 1000 and nNum < 1200 then
--		return 1200;
--	end
	for i = 1, getn(OLY_ACCUMULATE_FIRE_AWARD_TABLE) do
		if nNum < OLY_ACCUMULATE_FIRE_AWARD_TABLE[i][1] then
			return i;
		end
	end
end

function oly_StarEquip_Award()
	gf_EventGiveRandAward(OLY_STAREQUIP_AWARD_TB, gf_SumRandBase(OLY_STAREQUIP_AWARD_TB), 1, szLogTitle, "Ho�t ��ng Th�nh H�a");
end
