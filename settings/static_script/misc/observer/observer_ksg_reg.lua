Include("\\script\\system_switch_config.lua")

--event ids see \script\misc\observer\observer_head.lua
-- �¼����� --------------------------------------------------
-- ����ϵͳ
--SYSEVENT_GAMESERVER_START           = 1	--gs�����¼�
--SYSEVENT_PLAYER_LOGIN               = 2	--login�¼�
--SYSEVENT_PLAYER_LOGOUT              = 3	--logout�¼�
--SYSEVENT_DAILY_CLEAR                = 4	--ÿ�������¼�
--SYSEVENT_WEEKLY_CLEAR               = 5	--ÿ�������¼�
--SYSEVENT_MONTHLY_CLEAR              = 6	--ÿ�������¼�
--�ؿ��¼�
--SYSEVENT_LIANGSHAN_STAGE_FINISH     = 101	--��ɽ
--SYSEVENT_LIANGSHAN_TASK_AWARD       = 102
--SYSEVENT_DIXUANGONG_STAGE_FINISH    = 101	--������
--SYSEVENT_DIXUANGONG_TASK_AWARD      = 102
--SYSEVENT_WANJIANZHONG_STAGE_FINISH  = 301	--��ڣ
--SYSEVENT_WANJIANZHONG_TASK_AWARD    = 302
--SYSEVENT_CANGJIAN_STAGE_FINISH      = 401	--�ؽ�ɽׯ
--SYSEVENT_TAIYI_NOR_STAGE_FINISH     = 501	--̫һ��
--SYSEVENT_TAIYI_HARD_STAGE_FINISH    = 502
----SYSEVENT_TAIYI_TASK_AWARD           = 503
--SYSEVENT_TAIXU_STAGE_FINISH         = 601	--̫��þ�

--SYSEVENT_GLOBAL_COST_IB         	= 10001	--����IB

--data maybe table/number
--function example_event_handler_gs_start1(id, data)
--end
--function example_event_handler_gs_start2(id, data)
--end

function ObserverImpt:ksg_reg()
	if OBSERVER_DEGUG == 1 then
		print(format("ObserverImpt:ksg_reg()"))
	end
	--self:register(OE_GameSvr_Startup, "vng_onstart1", example_event_handler_gs_start);
	--self:register(OE_GameSvr_Startup,	"vng_onstart2","\\script\\ks2vng\\misc\\observer\\observer_vng_reg.lua", "example_event_handler_gs_start2");

	self:register(SYSEVENT_PLAYER_LOGIN, "add_tifyzhiyin", add_tifyzhiyin)
	self:register(SYSEVENT_GLOBAL_COST_IB, "_on_cost_ib_item", _on_cost_ib_item)
end

function add_tifyzhiyin(id, data)
	if IsExpSvrSystemOpen() == 1 then
		--���ָ������ʽ�汾Ҫɾ����---------------------------
    	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
    		AddItem(2,1,30644,1)
    	end
	end
end

--����IB Item
function _on_cost_ib_item(id, data)
	local nG, nD, nP, nNum = data[1],data[2],data[3],data[4]
	nNum = nNum or 1
	if nG==2 and nD == 97 and nP == 236 then --�콾��
		--CDKey���ĵ��콾�����
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_SetCostIB(%d)", nNum))
	end
end
