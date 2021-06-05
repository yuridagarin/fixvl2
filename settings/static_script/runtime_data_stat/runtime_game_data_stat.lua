Include("\\settings\\static_script\\vip_feedback_system\\ib_consumme_level.lua")
--��������Ľӿ�
RUNTIME_STAT_SYS_ENHANCE = 		1 --//ǿ��
RUNTIME_STAT_SYS_REPAIR = 		2 --//����
RUNTIME_STAT_SYS_ADVREPAIR = 	3 --//�߼�����
RUNTIME_STAT_SYS_STALL = 		4 --//��̯
RUNTIME_STAT_SYS_TRADE = 		5 --//ֱ�ӽ���
RUNTIME_STAT_SYS_ITEM_ADD_DEL = 6 --//AddItem DelItem
RUNTIME_STAT_SYS_GOLD_EARN_PAY = 7 --//Earn Pay

RUNTIME_STAT_SYS_LIANGSHAN = 		100 --//��ɽ
RUNTIME_STAT_SYS_TIANMENZHEN = 		101 --//������
RUNTIME_STAT_SYS_DIXUANGONG = 		102 --//������
RUNTIME_STAT_SYS_WANJIANZHONG = 	103 --��ڣ
RUNTIME_STAT_SYS_KFBATTLE = 		104 --//���ս��
RUNTIME_STAT_SYS_ITEM_USE = 		105 --//ʹ�õ���

RUNTIME_STAT_EVENT_PAY_MONEY = 1	--//��Ǯ
RUNTIME_STAT_EVENT_GAIN_MONEY = 2	--//��Ǯ
RUNTIME_STAT_EVENT_BUY_ITEM = 3	--//���׵���
--RUNTIME_STAT_EVENT_SELL_ITEM = 4	--//���׵���
RUNTIME_STAT_EVENT_ADD = 4	--//Add
RUNTIME_STAT_EVENT_DEL = 5	--//Del

RUNTIME_STAT_EVENT_FINISH_TASK = 100 --�������

_t_trade_item_stat={--��Ҫͳ�Ƶĺ��ĵ��߽��׼۸������
	--[gdp] = 1,
	[2+95*256+204*65536] = 1,--�����
	[2+1*256+30370*65536] = 1,--���Ž���
	[2+1*256+30614*65536] = 1,--�׻�����2	1	30614
}


--���򴫹�����ͳ����Ϣ
function runtime_stat_event(uSys, uEvent, uExt, uCount)
	local id = uSys*1000+uEvent
	if t_event_to_stat[id] then
		t_event_to_stat[id](uSys, uEvent, uExt, uCount)
	end
end

_t_evnet_pay_sys2main={
	[1001] = 1,
	[2001] = 8,
	[3001] = 15,
	[4001] = 22,
	[4002] = 29,
}
function _proc_runtime_stat_event_pay_(uSys, uEvent, uExt, uCount)
	local nType = ib_get_last_month_consume_level()
	local id = uSys*1000+uEvent
	local nSub = _t_evnet_pay_sys2main[id] + nType - 1
	local uGold = floor(uCount/10000)
	local uCoin = mod(uCount,10000)
	if nType > 0 and  nSub then
		AddRuntimeStat(9, nSub, 0, uGold) --main id = 9
		AddRuntimeStat(9, nSub, 1, uCoin) --main id = 9
	end
--	if RUNTIME_STAT_SYS_STALL == uSys and RUNTIME_STAT_EVENT_GAIN_MONEY==uEvent then
--		--���׵İѽ��Ӳ��������Ķ�����
--		AddRuntimeStat(16, 1, 0, -1*uGold)
--		AddRuntimeStat(16, 1, 1, -1*uCoin)
--		AddRuntimeStat(16, 2, 0, -1*uGold)
--		AddRuntimeStat(16, 2, 1, -1*uCoin)
--	end
	if uEvent == RUNTIME_STAT_EVENT_PAY_MONEY and _t_trade_item_stat[uExt] then--���ĵ��߰�̯���׼۸�
		AddRuntimeStat(9, 36, uExt, uGold) --main id = 9
		AddRuntimeStat(9, 36, uExt+10, uCoin) --main id = 9
	end
end
function _proc_runtime_stat_event_gain_(uSys, uEvent, uExt, uCount)
	_proc_runtime_stat_event_pay_(uSys, uEvent, uExt, uCount)
end
function _proc_runtime_stat_event_stall_buy_item_(uSys, uEvent, uExt, uCount)
	if uEvent == RUNTIME_STAT_EVENT_BUY_ITEM and _t_trade_item_stat[uExt] then--���ĵ��߰�̯���׼۸�
		AddRuntimeStat(9, 37, uExt, uCount) --main id = 9
	end
end
function _proc_runtime_stat_event_trade_buy_item_(uSys, uEvent, uExt, uCount)
	if uEvent == RUNTIME_STAT_EVENT_BUY_ITEM and _t_trade_item_stat[uExt] then--���ĵ��߰�̯���׼۸�
		AddRuntimeStat(13, 1, uExt, uCount) --main id = 9
	end
end

_t_evnet_finish_task_sys2main = {
	--main,sub_start,count
	[100100] = {3, 15, 3},
	[102100] = {1, 20, 3},
	[103100] = {4, 15, 4},
}
function _proc_runtime_stat_event_finish_task_(uSys, uEvent, uExt, uCount)
	local id = uSys*1000+uEvent
	local t = _t_evnet_finish_task_sys2main[id]
	if t then
		if uExt > 0 and uExt <= t[3] then
			local sub = t[2] + uExt - 1
			AddRuntimeStat(t[1], sub, 0, uCount)
		end
	end
end

_t_add_del_item_stat={--���ĵ��߲���������ͳ��
	[2*1000*100000+95*100000+204] 	= 1,--�����
	[2*1000*100000+1*100000+30390] 	= 1,--�����Ƭ
	[2*1000*100000+1*100000+30369] 	= 1,--������
	[2*1000*100000+1*100000+30370] 	= 1,--���Ž���
	[2*1000*100000+1*100000+30410] 	= 1,--������Ƭ
	[2*1000*100000+1*100000+30409] 	= 1,--ͨ������
	[2*1000*100000+1*100000+30411] 	= 1,--С��ͨ������
	[2*1000*100000+1*100000+30412] 	= 1,--���ͨ������
	[2*1000*100000+95*100000+208] 	= 1,--������
	[2*1000*100000+95*100000+210] 	= 1,--С��������
	[2*1000*100000+95*100000+211] 	= 1,--���������
	[2*1000*100000+1*100000+536] 	= 1,--�Ͻ������գ�
	[2*1000*100000+1*100000+537] 	= 1,--�Ͻ���
	[2*1000*100000+1*100000+538] 	= 1,--�ƽ�������գ�
	[2*1000*100000+1*100000+539] 	= 1,--�ƽ����
	[2*1000*100000+1*100000+30133] 	= 1,--�ƽ�Կ��
	[2*1000*100000+1*100000+30228] 	= 1,--�׽���( ��)
	[2*1000*100000+1*100000+30229] 	= 1,--�׽����
	[2*1000*100000+1*100000+30490] 	= 1,--�ƽ����Ʊ
	[2*1000*100000+1*100000+199] 	= 1,--����Ʊ
	[2*1000*100000+1*100000+30603] 	= 1,--��ң��
	[2*1000*100000+1*100000+30604] 	= 1,--��ң���
	[2*1000*100000+1*100000+30605] 	= 1,--��ң���
	[2*1000*100000+1*100000+30614] 	= 1,--�׻�����
	[2*1000*100000+2*100000+7] 		= 1,--������Ƭ
	[2*1000*100000+2*100000+8] 		= 1,--����
	[2*1000*100000+1*100000+1009] 	= 1,--������ʯ
	[2*1000*100000+1*100000+1049] 	= 1,--�����������Ƭ
	[2*1000*100000+1*100000+1050] 	= 1,--���������
	[2*1000*100000+1*100000+1051] 	= 1,--�����������ʯ
	[2*1000*100000+1*100000+1067] 	= 1,--����������ʯ
	[2*1000*100000+1*100000+1068] 	= 1,--������ʯ
	[2*1000*100000+1*100000+1113] 	= 1,--�󶨻�������ʯ
	[2*1000*100000+1*100000+3356] 	= 1,--С����������ʯ
	[2*1000*100000+1*100000+30424] 	= 1,--12��ǿ����
	[2*1000*100000+1*100000+30425] 	= 1,--13��ǿ����
	[2*1000*100000+1*100000+30426] 	= 1,--14��ǿ����
	[2*1000*100000+1*100000+30427] 	= 1,--15��ǿ����
	[2*1000*100000+1*100000+30521] 	= 1,--1��ϴ��ʯ
	[2*1000*100000+1*100000+30522] 	= 1,--2��ϴ��ʯ
	[2*1000*100000+1*100000+30523] 	= 1,--3��ϴ��ʯ
	[2*1000*100000+1*100000+30524] 	= 1,--4��ϴ��ʯ
	[2*1000*100000+1*100000+30525] 	= 1,--5��ϴ��ʯ
	[2*1000*100000+1*100000+30526] 	= 1,--6��ϴ��ʯ
	[2*1000*100000+1*100000+30527] 	= 1,--1����¯��
	[2*1000*100000+1*100000+30528] 	= 1,--2����¯��
	[2*1000*100000+1*100000+30529] 	= 1,--3����¯��
	[2*1000*100000+1*100000+30530] 	= 1,--4����¯��
	[2*1000*100000+1*100000+30531] 	= 1,--5����¯��
	[2*1000*100000+1*100000+30532] 	= 1,--6����¯��
	[2*1000*100000+1*100000+30533] 	= 1,--1������
	[2*1000*100000+1*100000+30534] 	= 1,--2������
	[2*1000*100000+1*100000+30535] 	= 1,--3������
	[2*1000*100000+1*100000+30612] 	= 1,--4������
	[2*1000*100000+1*100000+30497] 	= 1,--ħ��
	[2*1000*100000+1*100000+30498] 	= 1,--��ʿѫ��
	[2*1000*100000+1*100000+30499] 	= 1,--Ӣ��ѫ��
	[2*1000*100000+1*100000+30491] 	= 1,--��������
	[2*1000*100000+1*100000+30492] 	= 1,--��������
	[2*1000*100000+1*100000+30493] 	= 1,--ͭ������
	[2*1000*100000+1*100000+30230] 	= 1,--����Xu
    [0*1000*100000+107*100000+204] 	= 1,--"��հ������",
    [0*1000*100000+107*100000+205] 	= 1,--"Ǳ���������",
    [0*1000*100000+107*100000+206] 	= 1,--"�޳��������",
    [0*1000*100000+107*100000+207] 	= 1,--"�����������",
    [0*1000*100000+107*100000+208] 	= 1,--"��������",
    [0*1000*100000+107*100000+209] 	= 1,--"�̺��������",
    [0*1000*100000+107*100000+210] 	= 1,--"�����������",
    [0*1000*100000+107*100000+211] 	= 1,--"�����������",
    [0*1000*100000+107*100000+212] 	= 1,--"��Ӱ�������",
    [0*1000*100000+107*100000+213] 	= 1,--"���ӽط����",
    [0*1000*100000+107*100000+214] 	= 1,--"�������ǹ���"
    [0*1000*100000+107*100000+215] 	= 1,--"����������",
    [0*1000*100000+107*100000+216] 	= 1,--"��ڤ��ħ���",
    [0*1000*100000+107*100000+217] 	= 1,--"��ƻ�а���",
    [0*1000*100000+107*100000+218] 	= 1,--"����������",
    [0*1000*100000+107*100000+222] 	= 1,--"�쳾�������",
    [0*1000*100000+107*100000+223] 	= 1,--"�绨ǧҶ���",
    [0*1000*100000+112*100000+78] 	= 1,--"�貨΢��",
    [0*1000*100000+112*100000+158] 	= 1,--"�貨΢��ȫ��",
}
function _proc_runtime_stat_event_item_add_del_(uSys, uEvent, uExt, uCount)
	if _t_add_del_item_stat[uExt] then
		if uEvent == RUNTIME_STAT_EVENT_ADD then
			AddRuntimeStat(16, 3, uExt, uCount)
		elseif uEvent == RUNTIME_STAT_EVENT_DEL then
			AddRuntimeStat(16, 4, uExt, uCount)
		end
	end
end

function _proc_runtime_stat_event_gold_earn_pay_(uSys, uEvent, uExt, uCount)
	local nGold = floor(uCount/10000)
	local nCoin = mod(uCount,10000)
	if uEvent == RUNTIME_STAT_EVENT_GAIN_MONEY then
		AddRuntimeStat(16, 1, 0, nGold)
		AddRuntimeStat(16, 1, 1, nCoin)
	elseif uEvent == RUNTIME_STAT_EVENT_PAY_MONEY then
		AddRuntimeStat(16, 2, 0, nGold)
		AddRuntimeStat(16, 2, 1, nCoin)
	end
end

t_event_to_stat={
	--[uSys*1000+uEvent] = func
	[1001] = _proc_runtime_stat_event_pay_,
	[2001] = _proc_runtime_stat_event_pay_,
	[3001] = _proc_runtime_stat_event_pay_,
	[4001] = _proc_runtime_stat_event_pay_,
	[4002] = _proc_runtime_stat_event_gain_,
	[4003] = _proc_runtime_stat_event_stall_buy_item_,
	[5003] = _proc_runtime_stat_event_trade_buy_item_,
	[100100] = _proc_runtime_stat_event_finish_task_,
	[102100] = _proc_runtime_stat_event_finish_task_,
	[6004] = _proc_runtime_stat_event_item_add_del_,
	[6005] = _proc_runtime_stat_event_item_add_del_,
	[7001] = _proc_runtime_stat_event_gold_earn_pay_,
	[7002] = _proc_runtime_stat_event_gold_earn_pay_,
}
