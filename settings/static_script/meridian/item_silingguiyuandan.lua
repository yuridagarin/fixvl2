--�����Ԫ����Ʒ�ű�

Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MAX_USETIME_PER_DAY=12
SZ_THIS_SCRIPT="\\settings\\static_script\\meridian\\item_silingguiyuandan.lua"
N_THIS_CALL_BACK_CODE=18 --����һ����ֵ ����У���(<100��ʾҪ�����������)

N_ADD_ZHENQI_TYPE = AWARD_QENUINEQI_IB

SZ_ITEM_NAME="T� Linh Quy Nguy�n ��n"
N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 3
N_ONE_AWARD_ZHENQI = 4

N_CNT_DAILY_TASK_IDX=3
N_CNT_DAILY_TASK_BYTE_IDX=2

t_rand_npc_sfx = 
{
	927, 931, 935
}

--�����ص�����
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,926,0,1); --������Ч
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --��Ч
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
	else
		if 1 ~= AwardGenuineQiByType(N_ONE_AWARD_ZHENQI, N_ADD_ZHENQI_TYPE) then
			DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
		end
	end
end


function OnUse_Real(id)
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng, hi�n v�n ch�a th� s� d�ng v�t ph�m n�y!"))
		return 0
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"",format("Ch�a ph�i c�nh gi�i k�ch ho�t, t�m th�i kh�ng th� s� d�ng v�t ph�m n�y!"))
		return 0
	end
	
	local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
	if nDailiCapacity <= 0 then
		Talk(1,"",format("Th�ng qua %s trong ng�y h�m nay �� kh�ng th� nh�n th�m ch�n kh�!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
		return
	else
		_DoUseItem(id)
	end
	
--	local nTodayUseCnt = _GetTodayUseCount()
--	if nTodayUseCnt < MAX_USETIME_PER_DAY then
--		local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
--    	if nDailiCapacity <= 0 then
--    		Talk(1,"",format("����ͨ��%s�Ѿ������ٻ������!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
--    		return
--    	elseif nDailiCapacity < N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT then
--    		local szTitle = format("ʹ��%s���ɻ��%d�������������ͨ��%s��໹���Ի��%d������������Ľ�����˷�,ȷ��ʹ����?", SZ_ITEM_NAME, N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT
--    			, t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5], nDailiCapacity)
--        		local tbSay = {}
--        		tinsert(tbSay, format("ȷ��ʹ��/#_DoUseItem(%d)", id))
--        		tinsert(tbSay, "���ˣ����ǲ�ʹ����/no")
--        		Say(szTitle, getn(tbSay), tbSay)
--    		return
--    	else
--    		_DoUseItem(id)
--    	end
--	else
--		Talk(1,"",format("����ʹ��%s���Ѿ�����%d�Σ��������ٳ԰�!", SZ_ITEM_NAME, MAX_USETIME_PER_DAY))
--	end
end

function _DoUseItem(id)
	local nDelResult = DelItemByIndex(id, -1)
	if 1 == nDelResult then
		AwardGenuineQiByType(N_ONE_AWARD_ZHENQI * N_ONE_CALL_BACK_CNT, N_ADD_ZHENQI_TYPE)
	end
	
--	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 0) then
--		--ɾ����Ʒ
--		local nDelResult = DelItemByIndex(id, -1)
--		if 1 == nDelResult then
--			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
--			SetCurrentNpcSFX(nPidxNpc,926,0,1); --������Ч
--			SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --��Ч
--
--			if 1 ~= _AddTodayUseCount() then
--				DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ����
--			end
--			--DoWait(0, 0,g_nReadTime-nReadTime);
--			
--			local nTodayUseCnt = _GetTodayUseCount()
--			local szMsg = format("����컹��ʹ��%d/%d��%s", MAX_USETIME_PER_DAY - nTodayUseCnt, MAX_USETIME_PER_DAY, SZ_ITEM_NAME)
--			Msg2Player(szMsg)
--		else
--			DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ����
--		end
--	end
end

function _GetTodayUseCount()
	local nDailyTaskVal = GetDailyTask(N_CNT_DAILY_TASK_IDX)
	local nCnt = GetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX)
	return nCnt
end

function _AddTodayUseCount()
	local nDailyTaskVal = GetDailyTask(N_CNT_DAILY_TASK_IDX)
	local nCnt = GetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX)
	if nCnt < 255 then
		nCnt = nCnt + 1
		local nNewVal = SetByte(nDailyTaskVal, N_CNT_DAILY_TASK_BYTE_IDX, nCnt)
		SetDailyTask(N_CNT_DAILY_TASK_IDX, nNewVal)
		return 1
	else
		return 0
	end
	
	return 0
end

function no()
end
