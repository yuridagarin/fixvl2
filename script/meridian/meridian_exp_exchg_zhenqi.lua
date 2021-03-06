Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MAX_ZHENQI_PER_DAY=1000
--bCostItem=nil --是否消耗道具
SZ_THIS_SCRIPT="\\script\\meridian\\meridian_exp_exchg_zhenqi.lua"
N_THIS_CALL_BACK_CODE_NO_ITEM=13 --随便的一个数值 用于校验的 <100表示要判断真气容量
N_THIS_CALL_BACK_CODE_HAVE_ITEM=14

N_ONE_CALL_BACK_SEC = 5
N_ONE_AWARD_CALL_BACK_CNT = 3

N_CONSUME_EXP_ONE_TIME_UNIT=10000

t_expression = 
{
	--{":Z", ":<", ":H", "@@", ":$", ":@", ":(", ":L", ":F", ":(", ":T", ":W", "(dd)", ":o","(sx)"},
	--{":)", ":U", ":P", "^o^", "^^", ":E", ":D", ":K",  ":0", "^0^", "^m^", ":U", ":)"},
}

N_MAX_RATE = 100
t_level_exp_chg_table =
{
	[2] = 
	{
		--open_item_add_rate = 0,
		t_add_rate_item = nil, --{2, 1, 1001, 1, "培元丹"}
		exchg_table = 
		{
        	--日获得真气最小值，日获得真气最大值，消耗经验(万)，基础成功率，道具增加成功率，兑换成功获得的真气
        	{  1, 200,  100, 70, 0, 10},
        	{201, 400,  100, 60, 0, 10},
        	{401, 600,  100, 50, 0, 10},
        	{601, 800,  100, 40, 0, 10},
        	{801, 1000, 100, 30, 0, 10},
		}
	}
}

--open_item_add_rate = 0
--t_exchg_level_info = {}
--t_exchg_para = {}

t_rand_npc_sfx = 
{
	928, 929, 930, 932, 949
}

--步进回调函数
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE_NO_ITEM and wCheckCode ~= N_THIS_CALL_BACK_CODE_HAVE_ITEM then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,905,0,1); --地面特效
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --特效
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
	elseif (mod(wCurProcess, N_ONE_AWARD_CALL_BACK_CNT) == 0) then
		local nState = _DoOneExpChgZhenqi(wCheckCode == N_THIS_CALL_BACK_CODE_HAVE_ITEM)
		local tFaceTable = nil
		if nState == 0 then
			Msg2Player("K輈h huy謙 th蕋 b筰")
			SetCurrentNpcSFX(nPidxNpc, 922, 0, 0); --特效
			tFaceTable = t_expression[1]
		elseif nState == 1 then
			Msg2Player("K輈h huy謙 th祅h c玭g")
			SetCurrentNpcSFX(nPidxNpc, 921, 0, 0); --特效
			tFaceTable = t_expression[2]
		else
			DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
		end
		if tFaceTable then
			local nFaceIndex = random(1,getn(tFaceTable))
			local szFaceMsg = format("%s", tFaceTable[nFaceIndex])
			NpcChat(PIdx2NpcIdx(PlayerIndex), szFaceMsg, 1)
		end
	end
	
	local nExpEnough = _CheckCanStartExpExchg(1, 0)
	if 1 ~= nExpEnough then
		DoStartScriptCallBack(0, 0, 0, "", 1) --停止冲击
		Talk(1,"",format("Kinh nghi謒 kh玭g , t筸 d鮪g k輈h huy謙 ch﹏ khi!"))
	end
end

--经脉系统经验兑换真气脚本
function DoStartExpExchgGenuineQi(nCount)
	--关闭经验冲击真气功能
	do	return 0 end
	--关闭经验冲击真气功能end
	
	if 1 ~= IsMeridianSystemOpen() then
		return 0
	end
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return
	end
	local nExpEnough = _CheckCanStartExpExchg(1, 0)
	if nExpEnough == 1 then
		if tChg then
    		local szNeedItemDesc = ""
    		local tbSay = {}
    		tinsert(tbSay, format("K輈h huy謙 th玭g thng/#_OnExchange(%d)", nCount))
    		if tItem then
    			szNeedItemDesc = format("S? d鬾g o c?<color=yellow>%s<color>K輈h huy謙 s? c? t? l? th祅h c玭g cao h琻", tItem[5] or "");
--    			tinsert(tbSay, format("s? d鬾g %s k輈h huy謙/#_OnExchangeByItem(%d)", tItem[5] or "", nCount))
    		end
    		tinsert(tbSay, "Th玦, kh玭g mu鑞 k輈h huy謙 n鱝/no")
    		local szTitle = format("C竎 h?  ch鋘 ti課 h祅h <color=yellow>%d<color> l莕 kinh nghi謒 k輈h huy謙 ch﹏ kh?, m鏸 l莕 k輈h huy謙 c莕 ti猽 hao 100 v筺 kinh nghi謒, c? c? h閕 nh薾 頲 10 ch﹏ kh?. %s c竎 h? c莕 k輈h huy謙 nh? th? n祇?", nCount, szNeedItemDesc)
    		Say(szTitle, getn(tbSay), tbSay)
		end
	else
		--Talk(1,"",format("经验不足，开启冲击真气失败!"))
	end
end

function _OnExchange(nCount)
	_DoExchange(nCount, N_THIS_CALL_BACK_CODE_NO_ITEM);
end

function _OnExchangeByItem(nCount)
	_DoExchange(nCount, N_THIS_CALL_BACK_CODE_HAVE_ITEM);
end

function _DoExchange(nCount, nCallBackCode)
	--DoStartScriptCallBack(0, 0, 0, "", 1)--先停止正在进行的回调
	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_AWARD_CALL_BACK_CNT * nCount + 1, nCallBackCode, SZ_THIS_SCRIPT, 1) then
		local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
		SetCurrentNpcSFX(nPidxNpc,905,0,1); --地面特效
	end
end

-- 执行一次冲击
-- 返回-1表示没必要再进行冲击了
-- 返回0 表示本次冲击失败
-- 返回1 表示本次冲击成功
function _DoOneExpChgZhenqi(bNeedItem)
	local nCurIndex = _GetCurrentExpExchgIndex()
	local nExpEnough = _CheckCanStartExpExchg(1, 1)
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return -1
	end
	if nCurIndex >=1 and nCurIndex <= getn(tChg) and nExpEnough == 1 then
		local bAddRate = 0
		if bNeedItem and tItem then
			bAddRate = DelItem(tItem[1], tItem[2], tItem[3], tItem[4])
			if 0 == bAddRate then
				Msg2Player(format("%s kh玭g , s? d鬾g phng th鴆 th玭g thng k輈h huy謙 ch﹏ kh?",tItem[5]))
			end
		end
		local nRate = tChg[nCurIndex][4]
		if 1 == bAddRate then
			nRate = nRate + tChg[nCurIndex][5]
		end
		if random(1, N_MAX_RATE) <= nRate then
			local nArardStatus = AwardGenuineQiByType(tChg[nCurIndex][6], AWARD_QENUINEQI_TYPE_EXP)
			if 1 ~= nArardStatus then--获得真气失败
				return -1
			end
			return 1
		else
			return 0
		end
		
	end
	return -1
end

function _GetCurrentExpExchgIndex()
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return 0
	end
	local nCurCount = GetTodayAwardGenuineQiByType(AWARD_QENUINEQI_TYPE_EXP)
	nCurCount = nCurCount + 1
	for i=1, getn(tChg) do
		if nCurCount >= tChg[i][1] and nCurCount <= tChg[i][2] then
			return i
		end
	end
	return 0
end

--判断是否可以开始经验冲击真气
function _CheckCanStartExpExchg(nCount, bModify)
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return 0
	end
	local nCurIndex = _GetCurrentExpExchgIndex()
	if nCurIndex >=1 and nCurIndex <= getn(tChg) then
		local nNeedExp = tChg[nCurIndex][3] * N_CONSUME_EXP_ONE_TIME_UNIT
		local nCurExp = GetExp()
		if nCurExp < nNeedExp then
			--Msg2Player(format("当前经验不足[%d]不能冲击真气", nNeedExp))
			Talk(1, "", format("Kinh nghi謒 kh玭g  [%d] kh玭g th? k輈h huy謙 ch﹏ kh?", nNeedExp));
			return 0
		end
		local  nCapacity = GetTodayAwardGenuineQiLeftCapacityByType(AWARD_QENUINEQI_TYPE_EXP)
		if nCapacity <= 0 then
			Talk(1, "", format("K輈h huy謙 kinh m筩h trong ng祔 h玬 nay kh玭g th? nh薾 th猰 ch﹏ kh?"));
			return 0
		end
		if bModify == 1 then
			ModifyExp(-1 * nNeedExp)--扣除经验
		end
		return 1
	else
		Talk(1, "", format("K輈h huy謙 kinh m筩h trong ng祔 h玬 nay kh玭g th? nh薾 th猰 ch﹏ kh?"));
		--Msg2Player("今日通过冲击经脉已不能再获得真气")
		return 0
	end
	return 0
end

--获取能炼化经验的次数
function GetCanExpchgCnt(bNotify)
	--print(format("GetCanExpchgCnt(%d)", bNotify))
	local nRet = 0
	local t = _GetExchgLevelInfo() or {}
	local tItem = t.t_add_rate_item
	local tChg = t.exchg_table
	if not tChg then
		return 0
	end
	local nCurIndex = _GetCurrentExpExchgIndex()
	local nMaxIndex = getn(tChg)
	local nIndex = nCurIndex
	if nCurIndex >= 1 and nCurIndex <= nMaxIndex then
		local nLeftExp = GetExp()
		local  nLeftCapacity = GetTodayAwardGenuineQiLeftCapacityByType(AWARD_QENUINEQI_TYPE_EXP)
		local nCurAwardGenuineQiCount = GetTodayAwardGenuineQiByType(AWARD_QENUINEQI_TYPE_EXP)
		local bLoop = 1
		while bLoop == 1 and nIndex <= nMaxIndex do
			local nIndexNeedExp = tChg[nIndex][3] * N_CONSUME_EXP_ONE_TIME_UNIT
			if nIndexNeedExp <= 0 then
				nIndexNeedExp = 1
			end
			local nIndexAwardGenuineQi = tChg[nIndex][6]
			if nIndexAwardGenuineQi <= 0 then
				nIndexAwardGenuineQi = 1
			end
			local nIndexLeftGenuineQi = tChg[nIndex][2] - nCurAwardGenuineQiCount
			if nIndexLeftGenuineQi > nLeftCapacity then
				nIndexLeftGenuineQi = nLeftCapacity
				--剩余容量不足了，退出循环
				bLoop = 0
			end
			local nCntByExp = nLeftExp / nIndexNeedExp
			local nCntByGenuineQi = nIndexLeftGenuineQi / nIndexAwardGenuineQi
			local nCntAdd = nCntByGenuineQi
			if nCntAdd > nCntByExp then
				nCntAdd = nCntByExp
				--经验不足了，退出循环
				bLoop = 0
			end

			local nOldIndex = nIndex
			if nCntAdd > 0 then
				nRet = nRet + nCntAdd
				if  bLoop == 1 then
					nCurAwardGenuineQiCount = tChg[nIndex][2]
					nLeftCapacity = nLeftCapacity - (nCntAdd * tChg[nIndex][6])
					nLeftExp = nLeftExp - (nCntAdd * nIndexNeedExp)
					nIndex = nIndex + 1
				else
					bLoop = 0
					break
				end
			else
				bLoop = 0
				break
			end
			
--			print(format("\n--------------------\n"))
--			print(format("nOldIndex = %d\n", nOldIndex))
--			print(format("nMaxIndex = %d\n", nMaxIndex))
--			print(format("nIndexLeftGenuineQi = %d\n", nIndexLeftGenuineQi))
--			print(format("nOldIndex = %d\n", nOldIndex))
--			print(format("nLeftExp = %d\n", nLeftExp))
--			print(format("nCntByExp = %d\n", nCntByExp))
--			print(format("nIndexLeftGenuineQi = %d\n", nIndexLeftGenuineQi))
--			print(format("nCntByGenuineQi = %d\n", nCntByGenuineQi))
--			print(format("nCntAdd = %d\n", nCntAdd))
--			print(format("bLoop = %d\n", bLoop))
--			print(format("nRet = %d\n", nRet))
--			print(format("nCurAwardGenuineQiCount = %d\n", nCurAwardGenuineQiCount))
--			print(format("nLeftCapacity = %d\n", nLeftCapacity))
		end
	end
	
	if 1 == bNotify and nRet <= 0 then
		--Msg2Player("当前不能开始炼化真气")
		Talk(1, "", format("Kinh nghi謒 kh玭g  100 v筺 ho芻  Ch﹏ Kh? luy謓 h鉧  t gi韎 h筺 trong ng祔, kh玭g th? luy謓 h鉧 Ch﹏ Kh?"));
	end
	return nRet
end

function _GetExchgLevelInfo()
	local nCurMeridianLevel = MeridianGetLevel()
	local tPara = t_level_exp_chg_table[nCurMeridianLevel]
	return tPara
end

function no()
end
