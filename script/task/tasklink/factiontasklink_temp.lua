-----------------------------------------------------------------------
-- ������Ե II ʦ������
-- 2006/05/16
-- Created by Tony(Jizheng)
-----------------------------------------------------------------------

-- ����ļ����֧���Լ���ͼ��ת��֧��
Include("\\script\\task\\random\\task_gotoworld.lua");
-- �Ի�֮ҹͷ�ļ�
Include("\\script\\shinynight_head.lua");
Include("\\script\\lib\\lingshi_head.lua");
--2006��ʥ���ڻ����֧��
Include("\\script\\online\\zgc_temp_fun.lua")
--2007��ʥ���
Include("\\script\\online\\newyear08\\newyear08_head.lua");
--2009��6��7�»
Include("\\script\\online\\viet_event\\200907\\event_head.lua");
--Խ��09��7�»����ͷ�ļ�
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\writelog.lua");
--2009��8�»
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");
--2009��9�»
Include("\\script\\online\\viet_event\\200909\\event_head.lua");
--2009��11�»
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
--2009��12�»
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

--��2010�꿪ʼԽ��ʦ������ý���ͳһ�������������ļ�����ʵ�֣�Ȼ���ڱ��ļ�������ã�����ÿ�ζ��޸�����ļ�
Include("\\script\\online_activites\\award.lua");--for Give_Faction_Award()
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\voz\\xacthuc\\xacthuc.lua");
--========================================================================

TT_COLLECT_ITEM = 1				-- �ռ�һ����Ʒ����Ҫ���Ͻ�����Դ�Ǵ�ֵ���
TT_KILL_MONSTER = 2				-- ɱ��һ���������ض�����
TT_UPGRAGE_ATTR = 3				-- ����һ����ֵ���ض����ԣ����羭�飬�������ȼ���PKֵ�ȵȣ�
TT_SHOWOFF_ITEM = 4				-- �ռ���Ʒ��������Դ�����̵�
TT_SEND_MAIL = 5				-- ��ĳNPC�Ի�

-- ���������¼�� -----------------------------------------------------------------------------
TASKVALUE_CUR_DATE_ID = 333			-- ��ǰʦ�������ڵ�ʱ������ YYYYMMDD���������334������ֵ
TASKVALUE_FACTION_CONTRI_CUR_DAY_ID = 334	-- �����õ�ʦ�Ź��׶ȴ�ŵ��������
TASKVALUE_DIFFICULT_LEVEL_ID = 335	-- ��ǰѡ���ʦ��������Ѷȵȼ�
TASKVALUE_FACTION_CONTRI_ID = 336	-- ʦ�Ź��׶ȴ�ŵ��������

-- 337 - 340 ʦ���������õ��������
-- 341 - 344 �̻����������������

LAST_USE_DATE = 85			-- ʦ�������ϴ�ʹ�õ�����
MULTI_COUNT = 86			-- ��ǰ�ӳɱ���

TASKVALUE_FACTION_EVENT_ID = 345	-- ʦ��������¼�������ID��ŵ��������
TASKVALUE_CUR_DAY_TIMES_ID = 346	-- �������˼���ʦ������ļ�¼
-- 347 �Ѿ����ã�ʦ��������Ҫɱ�ֵ�����

TASKVALUE_LAST_CARD_CONTRIBUTE_ID = 348			-- �ϴ���ȡʦ������ʱ���ʦ�Ź��׶���ֵ��¼���������
TASKVALUE_LAST_GET_EVENT_DATE_ID = 349			-- �ϴ���ȡʦ�Ŵ��¼���ʱ��ο�ʼ����
TASKVALUE_GET_EVENT_TIMES_ID = 350				-- ��ʱ������Ѿ�������ȡʦ�Ŵ��¼��Ĵ���
TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID = 351	-- �ϴ���ȡʦ�Ŵ��¼�������ʱ��ο�ʼ����
TASKVALUE_GET_EVENT_PRIZE_TIMES_ID = 352		-- ��ʱ������Ѿ�������ȡʦ�Ŵ��¼������Ĵ���

-- ���������¼�� end--------------------------------------------------------------------------

TASK_ID_SHAOLIN_SUJIA = 1		-- �����׼ң������ѶȾ��� 1 2 3
TASK_ID_SHAOLIN_CHANSENG = 4	-- ������ɮ�������ѶȾ��� 4 5 6
TASK_ID_SHAOLIN_WUSENG = 7		-- ������ɮ�������ѶȾ��� 7 8 9

TASK_ID_DEFAULT_ROUTE = 10		-- ȡ���������������ֻ��Ҫ���̻���������ʹ�õ�������ID

TASK_ID_WUDANG_DAOJIA = 12		-- �䵱���ң������ѶȾ��� 12 13 14
TASK_ID_WUDANG_SUJIA = 15		-- �䵱�׼ң������ѶȾ��� 15 16 17

TASK_ID_EMEI_FOJIA = 18			-- ���ҷ�ң������ѶȾ��� 18 19 20
TASK_ID_EMEI_SUJIA = 21			-- �����׼ң������ѶȾ��� 21 22 23

TASK_ID_TANGMEN = 24			-- ����,�����ѶȾ��� 24 25 26

TASK_ID_GAIBANG_JINGYI = 27		-- ؤ�ﾻ��, �����ѶȾ��� 27 28 29
TASK_ID_GAIBANG_WUYI = 30		-- ؤ������, �����ѶȾ��� 30 31 32

TASK_ID_YANGMEN_QIANGQI = 33	-- ����ǹ��, �����ѶȾ��� 33 34 35
TASK_ID_YANGMEN_GONGQI = 36		-- ���Ź���, �����ѶȾ��� 36 37 38

TASK_ID_WUDU_XIEXIA = 39		-- �嶾а��, �����ѶȾ��� 39 40 41
TASK_ID_WUDU_GUSHI = 42			-- �嶾��ʦ, �����ѶȾ��� 42 43 44

TASK_ID_KUNLUN_TIANSHI = 45		-- ������ʦ, �����ѶȾ��� 45 46 47

TASK_ID_CUIYAN_WUXIAN = 48		-- ��������, �����ѶȾ��� 48 49 50
TASK_ID_CUIYAN_LINGNV = 51		-- ������Ů, �����ѶȾ��� 51 52 53

TASK_ID_MINGJIAO_SHENGZHAN = 54		-- ����ʥս, �����ѶȾ��� 54 55 56
TASK_ID_MINGJIAO_XUEREN = 57		-- ����Ѫ��, �����ѶȾ��� 57 58 59
TASK_ID_MINGJIAO_ZHENBING = 60		-- �������, �����ѶȾ��� 60 61 62

--========================================================================


-- ʦ���������ڣ�nFactionRouteNo���������������ɣ�ѡ�����õġ�
function task_main_entrance(nFactionRouteNo)
	if GetReputation() < 5 then
		Msg2Player("Ph�i c� �i�m danh v�ng t� 5 tr� l�n m�i c� th� nh�n nhi�m v� S� m�n!")
		return
	end
	local nTaskState = GetChainTaskStatus(nFactionRouteNo)
	-- ��ǰ�ȼ�����������
	local nFactionReputationLimit = 0;
	local nLevel = GetLevel()
	local nCurContriEEE = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- ��ǰʦ�Ź��׶�
	local nCreateTime = GetCreateTime()
	
	-- 1150732800 ��2006��6��20�գ����ʱ����ǰ�����Ľ�ɫ��������ȡ����
	if (nCreateTime < 1150732800) then
		if (nLevel < 60) then
			nFactionReputationLimit = 0
		elseif (nLevel < 70) then
			nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
			nFactionReputationLimit = floor(nFactionReputationLimit / 3)
		elseif (nLevel < 80) then
			nFactionReputationLimit = 1000
		else
			nFactionReputationLimit = 1500
		end
	end
	gf_WriteLogEx("Nhiem vu Su Mon", "tham gia")
	-- ��û�нӹ�����
	if (nTaskState == 0) then		
		if ((nCurContriEEE == 0) and (nFactionReputationLimit > 0) and GetTask(TASKVALUE_DIFFICULT_LEVEL_ID) == 0) then	-- ��һ�ν�����
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, nFactionReputationLimit)
			Msg2Player("C�n c� theo ��ng c�p, ph�n th��ng �� c�ng hi�n cho l�n ��u l�m nhi�m v� s� m�n l�"..nFactionReputationLimit.." �i�m")
		end
		get_new_task(nFactionRouteNo)
		
	-- �Ѿ��ӵ������ǻ�û�����		
	elseif (nTaskState == 1) then	
		process_cur_task(nFactionRouteNo)
		
	-- �Ѿ�������ϴνӵ�������
	elseif (nTaskState == 2) then	
		get_next_task(nFactionRouteNo)
	end
end;



-- ���ѡ���˳��Ի�
function cancel_dialog()
end;



-- ѡ����һ���������ң��Ѿ��ӵ������ˣ���ҿ���ѡ���������ǲ���
function get_one_task(task_link_id)

	--		          ��	       ��	       ��	       ʱ	       ��	       ��
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ���ڵ�����
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- �ϴν����������
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- �����µ�����
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- ��յ����õ�ʦ�Ź��׶�
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- ��յ������˵�ʦ���������
	end
	-- Modify by Trungbt
	local tbCheckType = {3, 6, 9, 12, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44}
	--Msg2Player("Gia tri check ID:  "..task_link_id)
	for i = 1, getn(tbCheckType) do
		if task_link_id == tbCheckType[i] then
			SetTask(TSK_CSD_ALLOW, 1)
			break
		end

	end
	------------------------

	-- �������������û�У���5�ξͲ��ü������� - Jeep tag ���ڲ������
	--local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)
	--if (nCurDayTimes >= 5) then
	--	Say("Ϊʦ�ող鿴���������������񣬽�����Ϊʦ�ŷ��׵Ĺ��׶��Ѿ��㹻��Ϊʦ�Ͳ����ɸ�����������ˣ��㻹�����������ɣ�", 0)
	--	return
	--end

	-- ����...
	-- ѡȡһ�������ɵ�������񣬲��ҷ�����������
	local nTaskType = SelectRandomTask(task_link_id)
	SetTask(TASKVALUE_DIFFICULT_LEVEL_ID, task_link_id)
	
	-- ����ʦ���������ɱ��
	if (nTaskType == TT_KILL_MONSTER) then
		strAnswer = {"�� t� ��ng �!/confirm_accept_task",
					 "�� t� th�c l�c c�n k�m, �� luy�n m�t th�i gian ��!/cancel_task"}

		-- ���ѡ��һ��������Ļ����������߻���������ʹ��ѽ�� Amen.	
		local nSel = random(1, 3)
		local strTaskInfo = GetInfo(task_link_id, nSel)
		local strAnswer = {
			"�� t� ��ng �!/confirm_accept_task",
			"�� t� th�c l�c c�n k�m, �� luy�n m�t th�i gian ��!/cancel_task",
		}
		Say(strTaskInfo, getn(strAnswer), strAnswer);
	end
end;

function confirm_accept_task()
	AskClientForString("confirm_accept_task_recv", "", 1, 20, "Nh�p: sm")
	
end

function confirm_accept_task_recv(szKey)
	
	if szKey == 'sm' then
		confirm_accept_task_ok()
	else
		Say("Vui l�ng nh�p ch� sm v�o � ki�m tra", 0);
	end
end

-- ȷ�Ͻ���ʦ����������񣬲���ѡ���Ƿ�ֱ��ȥ�������ڵ�
function confirm_accept_task_ok()
	local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
	-- �ڵ�ͼ�����ܹ��õ�Ҫȥ�ĵ�ͼ
	if ((nMapIndex ~= 0) and (nMapIndex ~= nil)) then
		Say("Ng��i nh�n ���c 1 nhi�m v� s� m�n, mu�n ��n �� kh�ng?",
			2,
			"Phi�n s� ph� ��a �� t� ��n n�i l�m nhi�m v�!/#gotoWorld("..nMapIndex..")",
			"�a t� s� ph�! �� t� s� t� �i!/cancel_dialog");
	else
		TaskTip("B�n nh�n ���c 1 nhi�m v� s� m�n!");
	end
	Msg2Player("B�n nh�n ���c 1 nhi�m v� s� m�n!");
end;



-- ���ȷ��Ҫȡ��������Լ������񣬽��п۳��������������Ĳ���
function confirm_cancel_task()
	-- ʦ�Ź��׶��㹻�۾�����ȡ��
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if (nCurFactionContribute >= 5) then			
		-- ��Ϊ����ʦ�������ǹ���һ�����������¼��
		-- ��������ֻҪ�����̻������11�Ϳ�����
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 5)
		Say("Nhi�m v� �� h�y, b�n c� th� nh�n nhi�m v� m�i.", 0);
		Msg2Player("B�n b� t�n th�t 5 �i�m c�ng hi�n do h�y nhi�m v�!");
		TaskTip("B�n b� t�n th�t 5 �i�m c�ng hi�n do h�y nhi�m v�!");
		SetTask(TSK_CSD_ALLOW,0)	-- Modify by Trungbt	
	-- ʦ�Ź��׶Ȳ�����
	else
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
		Say("Nhi�m v� �� h�y, b�n c� th� nh�n nhi�m v� m�i.", 0);
		Msg2Player("�� c�ng hi�n gi�m xu�ng 0 do b�n �� h�y nhi�m v�!");
	end
end;



-- ���Ҫ��ȡ��������Լ�������ʦ����������Ƿ�Ը�⣬��Ϊ����ʧʦ�Ź��׶ȵ�
function cancel_task()
	Say("<color=yellow>H�y b� nhi�m v�<color> s� �nh h��ng t�i <color=yellow>�� c�ng hi�n s� m�n<color>, ng��i mu�n h�y nhi�m v� n�y kh�ng?",
		2,
		"Nhi�m v� n�y ta kh�ng mu�n l�m!/confirm_cancel_task",
		"�� ta suy ngh� l�i!/cancel_dialog");
end;

-- �����ִ��������Ҫ��ȡ������ʦ���������ȷ��һ��
function cancel_processing_task()
	Say("<color=yellow>H�y b� nhi�m v�<color> s� �nh h��ng t�i <color=yellow>�� c�ng hi�n s� m�n<color>. Ng��i mu�n h�y b� th�t �?",
		2,
		"Nhi�m v� n�y ta kh�ng mu�n l�m!/confirm_cancel_task",
		"Cho ta th�m c� h�i!/cancel_dialog");
end;

-- ��һ�ν��������ѡ��Ҫ��ʲô�Ѷȵ�����
function get_new_task(nFactionRouteNo)
	task_link_id_low = nFactionRouteNo;
	task_link_id_middle = nFactionRouteNo + 1;
	task_link_id_high = nFactionRouteNo + 2;
	
	strTalk = {"Kh� l�m! �� xem ng��i gi�p ���c g� cho s� m�n!",
			   "\n Nhi�m v� s� c�p (Ph�n th��ng kinh nghi�m v� �� c�ng hi�n)./#get_one_task("..task_link_id_low..")",
			   "\n Nhi�m v� trung c�p (Ph�n th��ng tu luy�n v� �� c�ng hi�n)./#get_one_task("..task_link_id_middle..")",
			   "\n Nhi�m v� cao c�p (Ph�n th��ng �� c�ng hi�n)./#get_one_task("..task_link_id_high..")",
			   "\n �� t� kh�ng th� ��m nh�n, c�n ph�i r�n luy�n th�m!/cancel_dialog"}
	
	-- ����ҵĵȼ����ܽӵ���������Ѷȵȼ�Ҳ�в�ͬ
	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 30) then
		Say(strTalk[1], 2, strTalk[2], strTalk[5]);
	elseif (nCurPlayerLevel < 60) then
		Say(strTalk[1], 3, strTalk[2], strTalk[3], strTalk[5]);
	else
		Say(strTalk[1], 4, strTalk[2], strTalk[3], strTalk[4], strTalk[5]);
	end
end;



-- ����ִ�������ʱ���ʦ���Ի�
function process_cur_task(nFactionRouteNo)
		-- ��ȡ������ĵ�ͼ ID
		local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
		
		local strTalk = {"Ng��i l�m xong nhi�m v� vi s� giao ch�a?",
						 "Nh�ng nhi�m v� ta giao, ng��i l�m ��n ��u r�i?",
						 "Nh� s� ph� ki�m tra s� nhi�m v� �� t� �� l�m./faction_event_finish",
						 "Nhi�m v� l�p l�i l�n n�y �� ho�n th�nh!/confirm_finish_task",
						 "�� t� k�m c�i kh�ng th� ��m nh�n, xin ���c h�y nhi�m v�!/cancel_faction_event",
						 "�� t� k�m c�i kh�ng th� ��m nh�n, xin ���c h�y nhi�m v�!/cancel_processing_task",
						 "Xin s� ph� cho th�m �t th�i gian, hi�n ch�a ho�n th�nh/cancel_dialog"}
	
		if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
			Say(strTalk[1], 3, strTalk[4], strTalk[6], strTalk[7]);
		else
			Say(strTalk[2], 5, strTalk[3], strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
		end
end;



-- ʦ��˵���Ƿ����������ͽ�ܻش�˵�Ѿ�����˵�
function confirm_finish_task()
	-- �쿴�Ƿ��Ѿ����������
	if GetReputation() < 5 then
		Msg2Player("Ph�i c� �i�m danh v�ng t� 5 tr� l�n m�i c� th� tr� nhi�m v� S� m�n!")
		return
	end
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurTaskLinkID = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)	-- ��ǰ�Ѷȵȼ�
	local nTaskFinish = QueryTaskFinish(nCurTaskLinkID)
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()	-- ��ǰ�ȼ�����������
	local nLevel = GetLevel();

	-- �Ի�֮ҹ���������ı���
	local multiple = get_reward_multiple(SYS_MASTER_REPEATTASK)
	local nPerCent = floor(100 * multiple)				-- �����İٷֱ�
	nBaseDayLimit = floor(nBaseDayLimit * multiple)
	nExtraDayLimit = floor(nExtraDayLimit * multiple)

	-- Modify by Trungbt
--	if GetTask(TSK_CSD_ALLOW) == 1 then
--		local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)
--		if nCSD_SuMon < 300 and GetTask(TSK_CSD) == 1 then
--			SetTask(TSK_CSD_COUNT_A, GetTask(TSK_CSD_COUNT_A) + 1)
--		end
--		SetTask(TSK_CSD_ALLOW, 0)
--	end
	HoanThanhNhiemVuSuMon()
	------------------------------------

	local bExtra = 0;
	local nDayReputationLimit = nBaseDayLimit

	-- �������Ƿ��Ǹ߼������Ѷ�	
	if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		(nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING + 2)) then
		
		bExtra = 1
		nDayReputationLimit = nExtraDayLimit
	end

	--��¼�����ʱ�䣬����ȷ�Ͻ����Ƿ񻹿�����ȡʦ�Ź��׶�
	--		          ��	       ��	       ��	       ʱ	       ��	       ��
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ���ڵ�����
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- �ϴν����������
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- �����µ�����
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- ��յ����õ�ʦ�Ź��׶�
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- ��յ������˵�ʦ���������
	end

	if (nTaskFinish == 1) then
		local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID) + 1
		if nCurDayTimes == 5 then	--��5����ɽ���ʯ�䷽
			local nPFLevel = 0;
			if nLevel < 30 then
				nPFLevel = 1
			elseif nLevel < 40 then
				nPFLevel = random(1,2);
			elseif nLevel < 50 then
				nPFLevel = random(1,3);
			elseif nLevel < 60 then
				nPFLevel = random(1,4);
			elseif nLevel < 80 then
				nPFLevel = random(1,5);
			elseif nLevel <= 100 then
				nPFLevel = random(2,5);
			end;
            if GetAntiEnthrallmentStatus() == 0 then
    			if nPFLevel ~= 0 then
    				lspf_AddPeiFangInBottle(nPFLevel,1);
    				Msg2Player("B�n nh�n ���c 1 "..nPFLevel.."Ph�i ch� linh th�ch c�p, �� cho v�o T� Linh ��nh");
                end;
			end;
		end;		
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- ���½����Ѿ����˵��������
		if get_chrims_state() == 1 then
			if nCurDayTimes == 1 or nCurDayTimes == 2 then
				local nRand1 = random(getn(tStrewTask)-9,getn(tStrewTask));
				local nRand2 = random(getn(tStrewTask)-9,getn(tStrewTask));
				AddItem(tStrewTask[nRand1][3],tStrewTask[nRand1][4],tStrewTask[nRand1][5],tStrewTask[nRand1][1]);
				AddItem(tStrewTask[nRand2][3],tStrewTask[nRand2][4],tStrewTask[nRand2][5],tStrewTask[nRand2][1]);
				Msg2Player("B�n nh�n ���c "..tStrewTask[nRand1][2].."Thi�p ch�c m�ng"..tStrewTask[nRand1][1].."Tr��ng");	
				Msg2Player("B�n nh�n ���c "..tStrewTask[nRand2][2].."Thi�p ch�c m�ng"..tStrewTask[nRand2][1].."Tr��ng");
			end
		end	
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- ���½����Ѿ����˵��������
	        local nFactionNum = GetTask(VET_201009_00_TASK_NUM_FACTION)
                if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING )) then
                    if mod(nFactionNum,10) == 0 then
                        nFactionNum = nFactionNum + 1
                    end
		elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 1) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 1) or
		    		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+1) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+1 )) then
                    if mod(floor(nFactionNum/10),10) == 0 then
                        nFactionNum = nFactionNum + 10
                    end
                elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+2) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+2 )) then
                    if mod(floor(nFactionNum/100),10) == 0 then
                        nFactionNum = nFactionNum + 100
                    end
	        end
                --ÿ�λ�����������ô˺�������������ǰһ��ÿ�λ��дһ��������������
                SetTask(VET_201009_00_TASK_NUM_FACTION,nFactionNum)
                Give_Faction_Award();--from "\script\online_activites\award.lua"
		
		
        if GetAntiEnthrallmentStatus() == 0 then
            FinishTaskStep(nCurTaskLinkID, 0, nPerCent)			-- ������ǰ�����ҷ���
        elseif GetAntiEnthrallmentStatus() == 1 then
            FinishTaskStep(nCurTaskLinkID, 0, floor(nPerCent/2))			-- 3Сʱ������״̬��һ�뽱��
        else
            --5Сʱ������״̬��������
        end
		-- ʦͽ���� ��ʦ�ţ�
		local nChance, nMaxChance = CustomDataRead("mp_shimen")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shimen", "dd", nChance, nMaxChance)
				Msg2Player("Nhi�m v� S� ��- t�nh h�nh ho�n th�nh S� m�n-:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		-- �������Ҫ�Ի�õ��������д���
		-- ���Ӻ��ʦ�Ź��׶�
		local nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		-- �����Ѿ���õ�ʦ�Ź��׶�
		local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
		
		-- ������ӵ�ʦ�Ź��׶�
		local nAddedThisTimeContribute = nFactionContributeAfter - nCurFactionContribute
		
		-- �����˵����ܻ�õ������������ۻ�ȥ
		if (nCurDayGainReputation > nDayReputationLimit) then
			local nShouldBeMinus = nCurDayGainReputation - nDayReputationLimit
			-- ��������˸߼������ٻ������ͼ�������ôֻ�������������õ���ʦ�Ź��׶ȡ�
			if (nFactionContributeAfter - nShouldBeMinus < nCurFactionContribute) then
				nShouldBeMinus = nFactionContributeAfter - nCurFactionContribute
			end
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinus)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionContributeAfter - nShouldBeMinus)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinus
			if (bExtra == 1) then
				Msg2Player("H�m nay ng��i kh�ng th� nh�n th�m �i�m c�ng hi�n s� m�n, mau �i r�n luy�n th�m!")
			else
				Msg2Player("H�m nay ng��i kh�ng th� nh�n th�m �i�m c�ng hi�n s� m�n nh�ng n�u l�m th�m nh�ng nhi�m v� kh�c c�ng ���c �i�m.")
			end
		end
		
		nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- ������ʦ�Ź��׶�
		if (nFactionContributeAfter < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
			nFactionContributeAfter = 0
		end
		
		-- �����˱��ȼ��ܻ�õ����ʦ�Ź��׶ȣ��ۻ�ȥ
		if (nFactionContributeAfter > nFactionReputationLimit) then
			local nShouldBeMinuss = nFactionContributeAfter - nFactionReputationLimit
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinuss)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinuss
			Msg2Player("��ng c�p hi�n t�i kh�ng th� nh�n th�m �i�m c�ng hi�n s� m�n, l�n m�t c�p n�a h�y quay l�i.")
		end
		if GetReputation() >= 5 then
			ModifyReputation(-5, 0)
		else
			ModifyReputation(0 - GetReputation(), 0)
		end
		
		if (GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID) < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)
		end
		
		-- ʦ����������������
		other_faction_prize();
		
		-- �ж��Ƿ���Խӵ�ʦ�ŵ����ִ��¼�����Ҫû�ӵ�����������
		local bHaveOwnFactionEvent = GetTask(TASKVALUE_FACTION_EVENT_ID)
		if ((bHaveOwnFactionEvent == 0) and (check_faction_event_condition() == 1)) then
			if (StartFactionEvent() == 1) then
				local nSel = random(1, 4)
				local strTaskInfo = QueryFactionEventInfo(nSel)
				Say(strTaskInfo, 0);
			else
				Say("Ti�n b� nhanh l�m! �� Vi S� d�y ng��i th�m ch�t v� ngh�!", 0)
			end
		else
			Say("Ti�n b� nhanh l�m! �� Vi S� d�y ng��i th�m ch�t v� ngh�!", 0)
		end
		
		if (nAddedThisTimeContribute < 0) then
			nAddedThisTimeContribute = 0
		end

-- ===================ʦ������ӳɼ���===================================================		
		local nLastLingshuDate = GetTask(LAST_USE_DATE)			-- ʦ�������ϴ�ʹ�õ�����
		local nMultiCount = GetTask(MULTI_COUNT)				-- ��ǰ�ӳɱ���
		if (nLastLingshuDate == nCurDate) then
			local nStillShouldPlus = nAddedThisTimeContribute * (nMultiCount - 1)
			local nNowFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
			nNowFactionContribute = nNowFactionContribute + nStillShouldPlus
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nNowFactionContribute)
			nAddedThisTimeContribute = nAddedThisTimeContribute + nStillShouldPlus
		else
			SetTask(MULTI_COUNT, 1)
		end
-- ===================ʦ������ӳɼ���================================================end
		
		Msg2Player("Nhi�m v� l�n n�y b�n nh�n ���c  "..nAddedThisTimeContribute.." �i�m c�ng hi�n s� m�n!")
	else
		Say("Nhi�m v� d� nh� v�y m� kh�ng l�m ���c! Ng��i qu� k�m c�i!", 0)
		--if (nCurFactionContribute > 0) then
		--	SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 1)
		--end
	end
end;


-- ����������ϸ����������£�ѯ������Ƿ������
function get_next_task(nFactionRouteNo)
	local nCurDifficulty = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)
	local strTalk = {"Kh� l�m, c� mu�n l�m th�m kh�ng? Hay mu�n th� nhi�m v� kh� h�n?",
					 "�� t� ��ng �!/#get_one_task("..nCurDifficulty..")",
					 "Nhi�m v� n�y �� ho�n th�nh, xin ki�m tra l�i/faction_event_finish",
					 "�� t� k�m c�i kh�ng th� ��m nh�n, xin ���c h�y nhi�m v�!/cancel_faction_event",
					 "�� t� mu�n nh�n nhi�m v� kh� h�n/#get_new_task("..nFactionRouteNo..")",
					 "�� t� mu�n xem �i�m c�ng hi�n s� m�n/query_faction_contribute",
					 "�� t� c�n k�m c�i mu�n r�n luy�n th�m./cancel_dialog"}
	
	if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
		Say(strTalk[1], 4, strTalk[2], strTalk[5], strTalk[6], strTalk[7])
	else
		Say(strTalk[1], 6, strTalk[2], strTalk[3], strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
	end		 
end;

-- ��ѯ��ҵ�ǰ��ʦ�Ź��׶�
function query_faction_contribute()
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	-- ��ǰ�ȼ�����������
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	Say("�� c�ng hi�n s� m�n l� <color=yellow>"..nCurFactionContribute.."<color>, ��ng c�p hi�n t�i nh�n ���c �i�m c�ng hi�n t�i �a l� <color=yellow>"..nFactionReputationLimit.."<color>, c� l�n! M� giao di�n F3 c� th� xem �� c�ng hi�n s� m�n.", 0)
end;

-- �������Ƿ��Ѿ���������ִ��¼�����
function faction_event_finish()
	local bFinished = FinishFactionEvent()	-- ����Ƿ������ʦ�Ŵ��¼�
	if (bFinished == 1) then
		--����ռ为���ж�
		if get_free_room(1) ~= 1 then
			return 0;
		end
		local nBefore = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		faction_event_prize()
		local nAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		local nAdded = nAfter - nBefore
		
		Say("L�m t�t l�m! C� l�n! Ng��i m�i nh�n ���c <color=yellow>"..nAdded.."<color> �i�m c�ng hi�n S� M�n", 0)
	else
		Say("Nhi�m v� ta giao ng��i v�n ch�a ho�n th�nh", 0)
	end
end;

-- �ж��Ƿ���Խӵ����ִ��¼�
function check_faction_event_condition()
	--��Ҵ�50�����Խӵ�������
	local nLevel = GetLevel()
	if (nLevel < 50) then
		return 0
	end
	
	--��¼�����ʱ��
	--		          ��	       ��	       ��	       ʱ	       ��	       ��
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ���ڵ�����
	-- �ϴ���ȡʦ�Ŵ��¼���ʱ��ο�ʼ����
	local nLastGetEventDate = GetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID)
	-- ��ʱ������Ѿ�������ȡʦ�Ŵ��¼��Ĵ���
	local nCurGetEventTimes = GetTask(TASKVALUE_GET_EVENT_TIMES_ID)
	
	if ((nCurDate - nLastGetEventDate) > 7) then
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 0)
		SetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID, nCurDate)
		if ((nCurGetEventTimes >= 10) and (nCurGetEventTimes < 40)) then	-- �ϸ��׶��Ѿ�����10�λ�û���쵽
			return 1
		end
	end
	
	-- �����Ѿ��ӵ�����
	if (nCurGetEventTimes >= 40) then
		return 0
	end
	
	--���ܴ��¼�����ĸ���Ϊ�㶨ֵ,����Ϊ3%,һ��ֻ�ܽ���һ������.(����α���)
	local nRate = random(0, 100)
	if (nRate < 3) then
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 40)
		return 1
	else
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, nCurGetEventTimes + 1)
		return 0
	end
end;

-- ʦ����������Ժ����������
function other_faction_prize()
-- ÿ50�㹱�׶� ʦ������ һ��

	-- �������˼���ʦ��������
	local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)  
	-- �����ϴ���ʦ�����������˶���ʦ�Ź��׶�
	local nLastGetCard = GetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID)
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if nCurFactionContribute < nLastGetCard then	--�����ǰֵС���ϴλ������ʱ��ֵ
		SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID,nCurFactionContribute);
		nLastGetCard = nCurFactionContribute;
	end;
	local nContributeAdded = nCurFactionContribute - nLastGetCard
	
	if (nContributeAdded >= 20) then
		if GetAntiEnthrallmentStatus() == 0 then
			send_a_faction_card()	-- ��һ��ʦ������
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, (nLastGetCard + 20))
			local nRoute = GetPlayerRoute();
			if nRoute >= 23 then
				Msg2Player("�i�m c�ng hi�n s� m�n c�a ng��i ���c t�ch l�y 20 �i�m");
			else
				Msg2Player("�� c�ng hi�n s� m�n �� 20 �i�m nh�n ���c l�nh b�i s� m�n!")
			end
		end
	end
	
	-- �����һ�����ʦ������
	if (nCurDayTimes == 1 or nCurDayTimes == 6) then
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end		
		ModifyExp(nExpPrize)
		Msg2Player("Ho�n th�nh nhi�m v� S� m�n, nh�n ���c "..nExpPrize.." �i�m kinh nghi�m!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s� m�n l�n th� "..nCurDayTimes)
	end
	
	--09��11�»�����⽱��
	
	if  nCurDayTimes == 10 then
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = nExpPrize + floor(nExpPrize/3)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		Msg2Player("H�m nay l� l�n "..nCurDayTimes.." ho�n th�nh nhi�m v� s� m�n, nh�n ���c �i�m kinh nghi�m c�ng th�m."..nExpPrize.." �i�m!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s� m�n l�n th� "..nCurDayTimes)
	else
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = floor(nExpPrize/7)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		Msg2Player("H�m nay l� l�n "..nCurDayTimes.." ho�n th�nh nhi�m v� s� m�n, nh�n ���c �i�m kinh nghi�m c�ng th�m."..nExpPrize.." �i�m!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s� m�n l�n th� "..nCurDayTimes)
	end
	-------------ʥ���ڻ�����ɷ�-------------------
--		Xmas_prize_get(2)
	----------------------����-------------------------------
end;

-- ʦ�Ŵ��¼�����Ժ�Ľ���
function faction_event_prize()
	-- ����Ҿ��齱������ֵ����ҵȼ������η�
	local nPlayerLevelOfExp = GetLevel()
	local nShouldGiveExp = nPlayerLevelOfExp * nPlayerLevelOfExp * nPlayerLevelOfExp
	ModifyExp(nShouldGiveExp)
	Msg2Player("V� �� c�ng hi�n cho S� M�n, b�n nh�n ���c"..nShouldGiveExp.." �i�m kinh nghi�m!")
	
	-- �Ƿ����������ؼ�
	local bGetSuperMisteryBook = 0

	--��¼�����ʱ��
	--		          ��	       ��	       ��	       ʱ	       ��	       ��
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ���ڵ�����
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- �ϴν����������
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- �����µ�����
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- ��յ����õ�ʦ�Ź��׶�
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- ��յ������˵�ʦ���������
	end
	
	-- �ϴ���ȡʦ�Ŵ��¼�������ʱ��ο�ʼ����
	local nLastGetSuperPrizeDate = GetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID)
	-- ��ʱ������Ѿ�������ȡʦ�Ŵ��¼������Ĵ���
	local nCurGetSuperPrizeTimes = GetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID)
		
	-- ����45���ؼ�,��ø���12.5%,������(8��,����������)һ���˿��Ի��1��.(����α���)
	if ((nCurDate - nLastGetSuperPrizeDate) >= 56) then	-- 28���Ժ���
		SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 0)
		SetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID, nCurDate)
	end
	
	local nLottos = random(0, 1000);
	if (nCurGetSuperPrizeTimes == 7) then		-- ǰ�ߴζ�û���쵽�����һ����
		really_get_a_super_mistery_book()
		bGetSuperMisteryBook = 1
	elseif (nCurGetSuperPrizeTimes < 7) then	-- ���12.5%�ļ��ʿ����õ�ʦ���ؼ�
		if (nLottos < 125) then
			really_get_a_super_mistery_book()
			bGetSuperMisteryBook = 1
		end
	end
	
	-- ��ϼ,��ϼ,ճ��,����,���,����,��ʯ��Ϊ87.5%,ÿ��ֻ���ܻ��һ���ؼ�.
	-- Ҫ��û�л�������ؼ���������õ�
	if (bGetSuperMisteryBook == 0) then
		if nLottos <= 800 then
			local nBookID = random(1, 7)
			if (nBookID == 1) then
				AddItem(0, 107, 64, 1)		-- ��ϼ
			elseif (nBookID == 2) then
				AddItem(0, 107, 65, 1)		-- ��ϼ
			elseif (nBookID == 3) then
				AddItem(0, 107, 66, 1)		-- ճ��
			elseif (nBookID == 4) then
				AddItem(0, 107, 60, 1)		-- ����
			elseif (nBookID == 5) then
				AddItem(0, 107, 63, 1)		-- ���
			elseif (nBookID == 6) then
				AddItem(0, 107, 61, 1)		-- ����
			else
				AddItem(0, 107, 62, 1)		-- ��ʯ
			end
		else
		 local	tMijiName = {
							{"T� Linh Chi�n � Ph�",0,107,159},
							{"T� Linh Thi�n � Ph�",0,107,160},
							{"T� Linh T� � Ph�",0,107,161}
						};	
		 local nRandtb = random(1,3);
		 AddItem(tMijiName[nRandtb][2],tMijiName[nRandtb][3],tMijiName[nRandtb][4],1);		
		end
	end
	
	-- ʦ����������������50��
	-- ��ǰ�ȼ�����������
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	-- ��ǰ��ʦ������ �� �����Ѿ���õ�ʦ������
	local nFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
	
	local nShouldAdd = 50
	nCurDayGainReputation = nShouldAdd + nCurDayGainReputation
	if (nCurDayGainReputation > nExtraDayLimit) then
		nShouldAdd = nShouldAdd - (nCurDayGainReputation - nExtraDayLimit)
		nCurDayGainReputation = nExtraDayLimit
	end
	
	SetTask(TASKVALUE_FACTION_CONTRI_ID, (nFactionContribute + nShouldAdd))
	SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation)
	--SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 5)	-- ���ý��첻�ü�����ʦ��������
	
	-- ��������
	local strPlayerName = GetName()
	local strNews = "[Nhi�m v� s� m�n]: Ng��i ch�i "..strPlayerName.."  Ho�n th�nh nhi�m v� s� m�n nh�n ���c quy�n m�t t�ch."
--	AddGlobalNews(strNews)
end;

-- �����㵽����һ��ʦ��45���ؼ�
function really_get_a_super_mistery_book()
	SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 4)
	
	local nFactionRoute = GetPlayerRoute()	-- �����ҵ���������
	local nRate = random(0, 1)				-- ��һ���ؼ�
	
	if (nFactionRoute == 2) then			-- �����׼�
		AddItem(0, 107, (1 + nRate), 1)		-- ��շ�ħ�� or ��շ�ħ�ķ�
	elseif (nFactionRoute == 3) then		-- ��������
		AddItem(0, 107, (5 + nRate), 1)		-- �޳��ؼ� or �޳��ķ�
	elseif (nFactionRoute == 4) then		-- ��������
		AddItem(0, 107, (3 + nRate), 1)		-- Ǳ���ؼ� or Ǳ���ķ�
		
	elseif (nFactionRoute == 6) then		-- ����
		AddItem(0, 107, (7 + nRate), 1)		-- �����ؼ� or �����ķ�
		
	elseif (nFactionRoute == 8) then		-- ���ҷ��
		AddItem(0, 107, (9 + nRate), 1)		-- �����ؼ� or �����ķ�
	elseif (nFactionRoute == 9) then		-- �����׼�
		AddItem(0, 107, (11 + nRate), 1)	-- �̺��� or �̺��ķ�
		
	elseif (nFactionRoute == 11) then		-- ؤ�ﾻ��
		AddItem(0, 107, (13 + nRate), 1)	-- �����ؼ� or �����ķ�
	elseif (nFactionRoute == 12) then		-- ؤ������
		AddItem(0, 107, (15 + nRate), 1)	-- �����ؼ� or �����ķ�
		
	elseif (nFactionRoute == 14) then		-- �䵱����
		AddItem(0, 107, (17 + nRate), 1)	-- ��Ӱ�ؼ� or ��Ӱ�ķ�
	elseif (nFactionRoute == 15) then		-- �䵱�׼�
		AddItem(0, 107, (19 + nRate), 1)	-- �����ؼ� or �����ķ�
		
	elseif (nFactionRoute == 17) then		-- ����ǹ��
		AddItem(0, 107, (21 + nRate), 1)	-- ����ؼ� or ����ķ�
	elseif (nFactionRoute == 18) then		-- ���Ź���
		AddItem(0, 107, (23 + nRate), 1)	-- �����ؼ� or �����ķ�
		
	elseif (nFactionRoute == 20) then		-- �嶾а��
		AddItem(0, 107, (25 + nRate), 1)	-- ��ڤ��¼ or ��ڤ�ķ�
	elseif (nFactionRoute == 21) then		-- �嶾��ʦ
		AddItem(0, 107, (27 + nRate), 1)	-- ����ؼ� or ����ķ�
	elseif (nFactionRoute == 23) then		-- ������ʦ
		AddItem(0, 107, (180 + nRate), 1)	-- ����ؼ� or ����ķ�
	elseif (nFactionRoute == 25) then		-- ����ʥս
		AddItem(0, 107, (182 + nRate), 1)	-- ����ؼ� or ����ķ�
	elseif (nFactionRoute == 26) then		-- �������
		AddItem(0, 107, (184 + nRate), 1)	-- ����ؼ� or ����ķ�
	elseif (nFactionRoute == 27) then		-- ����Ѫ��
		AddItem(0, 107, (186 + nRate), 1)	-- ����ؼ� or ����ķ�
	elseif (nFactionRoute == 29) then		-- ��������
		AddItem(0, 107, (188 + nRate), 1)	-- ����ؼ� or ����ķ�
	elseif (nFactionRoute == 30) then		-- ������Ů
		AddItem(0, 107, (190 + nRate), 1)	-- ����ؼ� or ����ķ�
	end
	
	Msg2Player("B�n nh�n ���c 1 quy�n m�t t�ch!")
end;

--����ʦ�Ÿ߼��ؼ���������Ҫ��
function get_advanced_faction_book()
	local tGaojiMiji = {
				[0] = {{"Kim Cang B�t Nh� Kinh",0,107,166},{"V� Tr�n B� �� Kinh",0,107,168},{"Ti�m Long T�ch Di�t Kinh",0,107,167},{"Thi�n La Li�n Ch�u L�c",0,107,169},{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"B�ch H�i Tuy�t �m Ph�",0,107,171},{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172},{"Qu� Thi�n Du Long M�t T�ch",0,107,173},{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175},{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176},{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177},{"U Minh Phong Ma L�c",0,107,178},{"Linh C� Huy�n T� L�c",0,107,179}},
				[1] = {{"Kim Cang B�t Nh� Kinh",0,107,166},{"V� Tr�n B� �� Kinh",0,107,168},{"Ti�m Long T�ch Di�t Kinh",0,107,167}},
				[2] = {{"Kim Cang B�t Nh� Kinh",0,107,166}},
				[3] = {{"V� Tr�n B� �� Kinh",0,107,168}},
				[4] = {{"Ti�m Long T�ch Di�t Kinh",0,107,167}},
				[5] = {{"Thi�n La Li�n Ch�u L�c",0,107,169}},
				[6] = {{"Thi�n La Li�n Ch�u L�c",0,107,169}},
				[7] = {{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"B�ch H�i Tuy�t �m Ph�",0,107,171}},
				[8] = {{"Nh� � Kim ��nh M�t T�ch",0,107,170}},
				[9] = {{"B�ch H�i Tuy�t �m Ph�",0,107,171}},
				[10] = {{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172},{"Qu� Thi�n Du Long M�t T�ch",0,107,173}},
				[11] = {{"H�n ��n Tr�n Nh�c M�t T�ch",0,107,172}},
				[12] = {{"Qu� Thi�n Du Long M�t T�ch",0,107,173}},
				[13] = {{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175}},
				[14] = {{"Huy�n �nh M� Tung M�t T�ch",0,107,174}},
				[15] = {{"Qu�n T� Ti�t Phong M�t T�ch",0,107,175}},
				[16] = {{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176},{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177}},
				[17] = {{"Tr�n Qu�n Phi Long Th��ng Ph�",0,107,176}},
				[18] = {{"Xuy�n V�n L�c H�ng M�t T�ch",0,107,177}},
				[19] = {{"U Minh Phong Ma L�c",0,107,178},{"Linh C� Huy�n T� L�c",0,107,179}},
				[20] = {{"U Minh Phong Ma L�c",0,107,178}},
				[21] = {{"Linh C� Huy�n T� L�c",0,107,179}},
				[22] = {{"Thi�m L�i M�t T�ch",0,107,198}},
				[23] = {{"Thi�m L�i M�t T�ch",0,107,198}},
				[24] = {{"Tr�m Nh�t M�t T�ch",0,107,199},{"H�nh Tr�n M�t T�ch",0,107,200},{"Phong Huy�t M�t T�ch",0,107,201}},
				[25] = {{"Tr�m Nh�t M�t T�ch",0,107,199}},
				[26] = {{"H�nh Tr�n M�t T�ch",0,107,200}},
				[27] = {{"Phong Huy�t M�t T�ch",0,107,201}},
				[28] = {{"U M�ng Ph�",0,107,202},{"B�ch Hoa Ph�",0,107,203}},
				[29] = {{"U M�ng Ph�",0,107,202}},
				[30] = {{"B�ch Hoa Ph�",0,107,203}},
			};
	local nFactionRoute = GetPlayerRoute()	-- �����ҵ���������
	local nRandom = random(1,getn(tGaojiMiji[nFactionRoute]));
	local nAdd_flag = AddItem(tGaojiMiji[nFactionRoute][nRandom][2],tGaojiMiji[nFactionRoute][nRandom][3],tGaojiMiji[nFactionRoute][nRandom][4],1);
	if nAdd_flag == 1 then
		Msg2Player("B�n nh�n ���c 1 quy�n"..tGaojiMiji[nFactionRoute][nRandom][2]);
		WriteLog("[S� ki�n s� m�n]: "..GetName().."Ho�n th�nh s� ki�n s� m�n ���c 1 "..tGaojiMiji[nFactionRoute][nRandom][1]);
	else
		WriteLog("[S� ki�n s� m�n]: "..GetName().."Ho�n th�nh s� ki�n s� m�n ���c 1 "..tGaojiMiji[nFactionRoute][nRandom][1].."Th�t b�i: "..nAdd_flag);
	end	
end


-- ��һ��ʦ�����ƣ������ɸ���
function send_a_faction_card()
	if CheckXacThuc() == 0 then
		Msg2Player("T�i kho�n ch�a x�c th�c kh�ng ���c nh�n s� m�n l�nh b�i.")
		return
	end
	
	local nFaction = GetPlayerFaction()		-- �õ�������ĸ����ɵ�

	if (nFaction == 1) then			-- ����
		AddItem(2, 0, 205, 1)		-- ����ʦ������
	elseif (nFaction == 2) then		-- �䵱
		AddItem(2, 0, 206, 1)		-- �䵱ʦ������
	elseif (nFaction == 3) then		-- ����
		AddItem(2, 0, 207, 1)		-- ����ʦ������
	elseif (nFaction == 4) then		-- ؤ��
		AddItem(2, 0, 208, 1)		-- ؤ��ʦ������
	elseif (nFaction == 5) then		-- ����
		AddItem(2, 0, 209, 1)		-- ����ʦ������
	elseif (nFaction == 6) then		-- ����
		AddItem(2, 0, 350, 1)		-- ����ʦ������
	elseif (nFaction == 7) then		-- �嶾
		AddItem(2, 0, 390, 1)		-- �嶾ʦ������
	elseif (nFaction == 8) then		-- ����
--		AddItem(2,0,787, 1)		-- ����ʦ������
	elseif (nFaction == 9) then		-- ����
--		AddItem(2,0,788, 1)		-- ����ʦ������
	elseif (nFaction == 10) then		-- ����
--		AddItem(2,0,789, 1)		-- ����ʦ������
	end
end;

function cancel_faction_event()
	Say("�� c� m�t t�ch m�n ph�i c�n ho�n th�nh nhi�m v� s� m�n. Ng��i c� mu�n ti�p t�c l�m kh�ng?",
		2,
		"Ta mu�n h�y nhi�m v� n�y/confirm_cancel_faction_event",
		"�� ta ngh� l�i!/cancel_dialog")
end;

function confirm_cancel_faction_event()
	SetTask(TASKVALUE_FACTION_EVENT_ID, 0)
	Say("Ta �� h�y nhi�m v� s� m�n c�a ng��i, n�u mu�n l�m l�i th� ph�i xem c� duy�n n�a!", 0)
end;

function get_free_room(goods_num)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
		return 0
	else 
		return 1
	end
end
function add_0906and07_aword()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		local nCount = tb_shimen_aword[floor(GetLevel() / 10)][2];
		if GetTask(TASK_GET_MIBEN_DATE) < tonumber(date("%y%m%d")) then
			SetTask(TASK_GET_MIBEN_COUNT_TODAY, 0);
		end
		if GetTask(TASK_GET_MIBEN_COUNT_TODAY) < CONST_GET_MIBEN_MAX_COUNT then
			gf_SetLogCaption("Truy t�m tr��ng sinh ph�");
			local nRetCode = gf_AddItemEx({2, 1, 30088, nCount}, "B� Ph� C� N�t");
			WriteLogEx("Hoat dong thang 6","S� m�n"..floor(GetLevel() / 10).."x",nCount,"B� Ph� C� N�t");
			if nRetCode == 1 then
				SetTask(TASK_GET_MIBEN_DATE, tonumber(date("%y%m%d")));
				SetTask(TASK_GET_MIBEN_COUNT_TODAY, GetTask(TASK_GET_MIBEN_COUNT_TODAY) + 1);
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0908_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090807 and nDate < 090907 then
		local nCount = tVIET_SHIMEN_PUTAO[floor(GetLevel() / 10)];
		if GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE) < nDate then
			SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT, 0);
		end
		if GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT) < VIET_0908_CONST_SHIMEN_GET_MAX then
			gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30097, nCount}, "T�i Tr�i C�y");
			if nRetCode == 1 then
				SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT, GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT) + 1);
				levelGrade = floor(GetLevel() / 10);
				if levelGrade <= 2 then
					WriteLogEx("Hoat dong thang 8", "Nhan tui trai cay", nCount, "Su mon 1x2x");
				else
					WriteLogEx("Hoat dong thang 8", "Nhan tui trai cay", nCount, "Su mon "..levelGrade.."x");
				end
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0909_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090918 and nDate < 091026 then
		local nCount = tVIET_SHIMEN_BAIMIANBAO[floor(GetLevel() / 10)];
		if GetTask(VIET_0909_TASK_SHIMENG_DATE) < nDate then
			SetTask(VIET_0909_TASK_SHIMENG_NUM, 0);
		end
		if GetTask(VIET_0909_TASK_SHIMENG_NUM) < 10 then
			gf_SetLogCaption(VIET_0909_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30106, nCount}, "B�t M�");
			if nRetCode == 1 then
				local nLevel = floor(GetLevel() / 10)
				WriteLogEx("Hoat dong trung thu","S� M�n c�p "..nLevel,nCount,"B�t M�")
				SetTask(VIET_0909_TASK_SHIMENG_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0909_TASK_SHIMENG_NUM, GetTask(VIET_0909_TASK_SHIMENG_NUM) + 1);
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0911_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091206 then
		local nCount = tVIET_0911_SHIMEN_JUHUA[floor(GetLevel() / 10)];
		if GetTask(VIET_0911_TASK_SHIMENG_DATE) < nDate then
			SetTask(VIET_0911_TASK_SHIMENG_NUM, 0);
		end
		if GetTask(VIET_0911_TASK_SHIMENG_NUM) < 10 then
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30118, nCount}, "Hoa C�c");
			if nRetCode == 1 then
				SetTask(VIET_0911_TASK_SHIMENG_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0911_TASK_SHIMENG_NUM, GetTask(VIET_0911_TASK_SHIMENG_NUM) + 1);
				WriteLogEx(VIET_0911_LOG_TITLE,"S� m�n "..floor(GetLevel() / 10).."x",nCount,"Hoa C�c")
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0912_aword()
    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE.."- L�m nhi�m v� s� m�n ���c k�o gi�ng sinh"
    gf_EventFactionAward({2, 1, 30138}, "C�y K�o Gi�ng Sinh", VIET_0912_SHIMEN_SHENGDANTANGGUO, VIET_0912_SHIMEN_AWARD_MAX_COUNT, VIET_0912_TASK_SHIMENG_DATE, VIET_0912_TASK_SHIMENG_NUM, szFullLog, 091218, 100117);
end
