----------------------------------------------------------------
-- observer �¼�ģʽ
-- by windle
--
-- Ŀ��: ��װ�仯, �Ѹ��־������ֵĲ���ʽ�޸ļ�������
-- ʹ��:
--	1. �����¼�: ��head�ļ���EVENTID�ж���һ�����ֺ�, ��ͳһ�¼���ʶ
--	2. ע���¼�hook: ��ObserverImpt:init��ע���¼�
Include("\\script\\lib\\string.lua")

--rege event handler
--reg function in 
--\settings\static_script\misc\observer\observer_ksg_reg.lua
--\script\ks2vng\misc\observer\observer_vng_reg.lua

--usage : add event
--Include("\\script\\misc\\observer\\observer_head.lua")
--Observer:onEvent(SYSEVENT_PLAYER_LOGIN, ExchangeComing)
--Observer:onTeamEvent(SYSEVENT_PLAYER_LOGIN, ExchangeComing)

OBSERVER_DEGUG = 0

-- �¼����� --------------------------------------------------
-- ����ϵͳ
SYSEVENT_GAMESERVER_START           = 1	--gs�����¼�
SYSEVENT_PLAYER_LOGIN               = 2	--login�¼�
SYSEVENT_PLAYER_LOGOUT              = 3	--logout�¼�
SYSEVENT_DAILY_CLEAR                = 4	--ÿ�������¼�
SYSEVENT_WEEKLY_CLEAR               = 5	--ÿ�������¼�
SYSEVENT_MONTHLY_CLEAR              = 6	--ÿ�������¼�

--�ؿ��¼�
SYSEVENT_LIANGSHAN_STAGE_FINISH     = 101	--��ɽ
SYSEVENT_LIANGSHAN_TASK_AWARD       = 102
SYSEVENT_DIXUANGONG_STAGE_FINISH    = 101	--������
SYSEVENT_DIXUANGONG_TASK_AWARD      = 102
SYSEVENT_WANJIANZHONG_STAGE_FINISH  = 301	--��ڣ
SYSEVENT_WANJIANZHONG_TASK_AWARD    = 302
SYSEVENT_CANGJIAN_STAGE_FINISH      = 401	--�ؽ�ɽׯ
SYSEVENT_TAIYI_NOR_STAGE_FINISH     = 501	--̫һ��
SYSEVENT_TAIYI_HARD_STAGE_FINISH    = 502
--SYSEVENT_TAIYI_TASK_AWARD           = 503
SYSEVENT_TAIXU_STAGE_FINISH         = 601	--̫��þ�

SYSEVENT_GLOBAL_COST_IB         	= 10001	--����IB

EVENTID2NAME={
	[SYSEVENT_GAMESERVER_START] = "SYSEVENT_GAMESERVER_START",	--data=0
	[SYSEVENT_PLAYER_LOGIN] = "SYSEVENT_PLAYER_LOGIN",			--data=ExchangeComing
	[SYSEVENT_PLAYER_LOGOUT] = "SYSEVENT_PLAYER_LOGOUT",		--data=0
	[SYSEVENT_DAILY_CLEAR] = "SYSEVENT_DAILY_CLEAR",			--data={LastDate,CurDate}
	[SYSEVENT_WEEKLY_CLEAR] = "SYSEVENT_WEEKLY_CLEAR",			--data={LastWeek,CurWeek}
	[SYSEVENT_MONTHLY_CLEAR] = "SYSEVENT_MONTHLY_CLEAR",		--data={LastMonth,CurMonth}
	
	[SYSEVENT_LIANGSHAN_STAGE_FINISH] = "SYSEVENT_LIANGSHAN_STAGE_FINISH",		--data=nStage {1..8}
	[SYSEVENT_LIANGSHAN_TASK_AWARD] = "SYSEVENT_LIANGSHAN_TASK_AWARD",			--data=nTaskIdx {1..3}
	[SYSEVENT_DIXUANGONG_STAGE_FINISH] = "SYSEVENT_DIXUANGONG_STAGE_FINISH",	--data=nStage {1..7}
	[SYSEVENT_DIXUANGONG_TASK_AWARD] = "SYSEVENT_DIXUANGONG_TASK_AWARD",		--data=nTaskIndex {1..3}
	[SYSEVENT_WANJIANZHONG_STAGE_FINISH] = "SYSEVENT_WANJIANZHONG_STAGE_FINISH",--data=nStage {1..4}
	[SYSEVENT_WANJIANZHONG_TASK_AWARD] = "SYSEVENT_WANJIANZHONG_TASK_AWARD",	--data=nTaskIndex {1..4} {daily_pass,daily_fanpai,weekly_pass,weekly_fanpai}
	[SYSEVENT_CANGJIAN_STAGE_FINISH] = "SYSEVENT_CANGJIAN_STAGE_FINISH",
	[SYSEVENT_TAIYI_NOR_STAGE_FINISH] = "SYSEVENT_TAIYI_NOR_STAGE_FINISH",		--data=nStage {1..6}
	[SYSEVENT_TAIYI_HARD_STAGE_FINISH] = "SYSEVENT_TAIYI_HARD_STAGE_FINISH",	--data=nStage {1..6}
	--[SYSEVENT_TAIYI_TASK_AWARD] = "SYSEVENT_TAIYI_TASK_AWARD",
	[SYSEVENT_TAIXU_STAGE_FINISH] = "SYSEVENT_TAIXU_STAGE_FINISH",
	[SYSEVENT_GLOBAL_COST_IB] = "SYSEVENT_GLOBAL_COST_IB",
}

--------------------------------------------------------------
EVENTID = {
	[SYSEVENT_GAMESERVER_START] = {},	--data=0
	[SYSEVENT_PLAYER_LOGIN] = {},		--data=ExchangeComing
	[SYSEVENT_PLAYER_LOGOUT] = {},		--data=0
	[SYSEVENT_DAILY_CLEAR] = {},		--data={LastDate,CurDate}
	[SYSEVENT_WEEKLY_CLEAR] = {},		--data={LastWeek,CurWeek}
	[SYSEVENT_MONTHLY_CLEAR] = {},		--data={LastMonth,CurMonth}
	
	[SYSEVENT_LIANGSHAN_STAGE_FINISH] = {},		--data=nStage {1..8}
	[SYSEVENT_LIANGSHAN_TASK_AWARD] = {},		--data=nTaskIdx {1..3}
	[SYSEVENT_DIXUANGONG_STAGE_FINISH] = {},	--data=nStage {1..7}
	[SYSEVENT_DIXUANGONG_TASK_AWARD] = {},		--data=nTaskIndex {1..3}
	[SYSEVENT_WANJIANZHONG_STAGE_FINISH] = {},	--data=nStage {1..4}
	[SYSEVENT_WANJIANZHONG_TASK_AWARD] = {},	--data=nTaskIndex {1..4} {daily_pass,daily_fanpai,weekly_pass,weekly_fanpai}
	[SYSEVENT_CANGJIAN_STAGE_FINISH] = {},
	[SYSEVENT_TAIYI_NOR_STAGE_FINISH] = {},		--data=nStage {1..6}
	[SYSEVENT_TAIYI_HARD_STAGE_FINISH] = {},	--data=nStage {1..6}
	--[SYSEVENT_TAIYI_TASK_AWARD] = {},
	[SYSEVENT_TAIXU_STAGE_FINISH] = {},			--data=nStage {1..8}
	[SYSEVENT_GLOBAL_COST_IB] = {},				--data={nG,nD,nP,nNum}
}

Observer = Observer or {}
Observer.agents = EVENTID
Observer.szVM = "\\script\\misc\\observer\\observer.lua"

function Observer:getname(id)
	if EVENTID2NAME[id] then
		return EVENTID2NAME[id]
	end
	return "undefine"
end
function Observer:checkId(id)
	if EVENTID[id] then
		return 1
	end
--	for i = 1, getn(EVENTID) do
--		if EVENTID[i] == id then
--			return 1;
--		end
--	end
end

function Observer:onEvent(id, data)
--	if self:checkId(id) ~= 1 then
--		WriteLog(format("[ObserverImpt:onEvent] [Error] [id = %d, data = %s]", id, Val2Str(data)));
--		return
--	end
	local sCall = format("ObserverImpt:onEvent(%d, %s)", tonumber(id), Val2Str(data));
	SendScript2VM(self.szVM, sCall);
end

function Observer:show_regs()
--	if self:checkId(id) ~= 1 then
--		WriteLog(format("[ObserverImpt:onEvent] [Error] [id = %d, data = %s]", id, Val2Str(data)));
--		return
--	end
	local sCall = format("ObserverImpt:show_regs()");
	SendScript2VM(self.szVM, sCall);
end

--����ע��, ע�������Ҫpreload����, Ԥ�ȼ�����Ҫע���ģ��, ����ע�᲻��
--function Observer:register(id, name, szScript, szFunc)
--	local sCall = format("ObserverImpt:unregister(%d, %s, %s, %s)", tonumber(id), name, szScript, szFunc);
--	SendScript2VM(self.szVM, sCall);
--end
--
--function Observer:unregister(id, name)
--	local sCall = format("ObserverImpt:unregister(%d, %s)", tonumber(id), tostring(name));
--	SendScript2VM(self.szVM, sCall);
--end

function Observer:onTeamEvent(id, data)
	local nCount = GetTeamSize();
	if nCount < 1 then
		self:onEvent(id, data);
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nCount do
			PlayerIndex = GetTeamMember(i);
			self:onEvent(id, data);
		end
		PlayerIndex = oldPlayerIndex;
	end
--	gf_TeamOperate(self.onEvent, self, id, data);
end
