Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MAX_ZHENQI_PER_DAY=1000
--bCostItem=nil --�Ƿ����ĵ���
SZ_THIS_SCRIPT="\\script\\meridian\\meridian_exp_exchg_zhenqi.lua"
N_THIS_CALL_BACK_CODE_NO_ITEM=13 --����һ����ֵ ����У��� <100��ʾҪ�ж���������
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
		t_add_rate_item = nil, --{2, 1, 1001, 1, "��Ԫ��"}
		exchg_table = 
		{
        	--�ջ��������Сֵ���ջ���������ֵ�����ľ���(��)�������ɹ��ʣ��������ӳɹ��ʣ��һ��ɹ���õ�����
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

--�����ص�����
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE_NO_ITEM and wCheckCode ~= N_THIS_CALL_BACK_CODE_HAVE_ITEM then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,905,0,1); --������Ч
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --��Ч
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
	elseif (mod(wCurProcess, N_ONE_AWARD_CALL_BACK_CNT) == 0) then
		local nState = _DoOneExpChgZhenqi(wCheckCode == N_THIS_CALL_BACK_CODE_HAVE_ITEM)
		local tFaceTable = nil
		if nState == 0 then
			Msg2Player("K�ch huy�t th�t b�i")
			SetCurrentNpcSFX(nPidxNpc, 922, 0, 0); --��Ч
			tFaceTable = t_expression[1]
		elseif nState == 1 then
			Msg2Player("K�ch huy�t th�nh c�ng")
			SetCurrentNpcSFX(nPidxNpc, 921, 0, 0); --��Ч
			tFaceTable = t_expression[2]
		else
			DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
		end
		if tFaceTable then
			local nFaceIndex = random(1,getn(tFaceTable))
			local szFaceMsg = format("%s", tFaceTable[nFaceIndex])
			NpcChat(PIdx2NpcIdx(PlayerIndex), szFaceMsg, 1)
		end
	end
	
	local nExpEnough = _CheckCanStartExpExchg(1, 0)
	if 1 ~= nExpEnough then
		DoStartScriptCallBack(0, 0, 0, "", 1) --ֹͣ���
		Talk(1,"",format("Kinh nghi�m kh�ng ��, t�m d�ng k�ch huy�t ch�n khi!"))
	end
end

--����ϵͳ����һ������ű�
function DoStartExpExchgGenuineQi(nCount)
	--�رվ�������������
	do	return 0 end
	--�رվ�������������end
	
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
    		tinsert(tbSay, format("K�ch huy�t th�ng th��ng/#_OnExchange(%d)", nCount))
    		if tItem then
    			szNeedItemDesc = format("S� d�ng ��o c�<color=yellow>%s<color>K�ch huy�t s� c� t� l� th�nh c�ng cao h�n", tItem[5] or "");
--    			tinsert(tbSay, format("s� d�ng %s k�ch huy�t/#_OnExchangeByItem(%d)", tItem[5] or "", nCount))
    		end
    		tinsert(tbSay, "Th�i, kh�ng mu�n k�ch huy�t n�a/no")
    		local szTitle = format("C�c h� �� ch�n ti�n h�nh <color=yellow>%d<color> l�n kinh nghi�m k�ch huy�t ch�n kh�, m�i l�n k�ch huy�t c�n ti�u hao 100 v�n kinh nghi�m, c� c� h�i nh�n ���c 10 ch�n kh�. %s c�c h� c�n k�ch huy�t nh� th� n�o?", nCount, szNeedItemDesc)
    		Say(szTitle, getn(tbSay), tbSay)
		end
	else
		--Talk(1,"",format("���鲻�㣬�����������ʧ��!"))
	end
end

function _OnExchange(nCount)
	_DoExchange(nCount, N_THIS_CALL_BACK_CODE_NO_ITEM);
end

function _OnExchangeByItem(nCount)
	_DoExchange(nCount, N_THIS_CALL_BACK_CODE_HAVE_ITEM);
end

function _DoExchange(nCount, nCallBackCode)
	--DoStartScriptCallBack(0, 0, 0, "", 1)--��ֹͣ���ڽ��еĻص�
	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_AWARD_CALL_BACK_CNT * nCount + 1, nCallBackCode, SZ_THIS_SCRIPT, 1) then
		local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
		SetCurrentNpcSFX(nPidxNpc,905,0,1); --������Ч
	end
end

-- ִ��һ�γ��
-- ����-1��ʾû��Ҫ�ٽ��г����
-- ����0 ��ʾ���γ��ʧ��
-- ����1 ��ʾ���γ���ɹ�
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
				Msg2Player(format("%s kh�ng ��, s� d�ng ph��ng th�c th�ng th��ng k�ch huy�t ch�n kh�",tItem[5]))
			end
		end
		local nRate = tChg[nCurIndex][4]
		if 1 == bAddRate then
			nRate = nRate + tChg[nCurIndex][5]
		end
		if random(1, N_MAX_RATE) <= nRate then
			local nArardStatus = AwardGenuineQiByType(tChg[nCurIndex][6], AWARD_QENUINEQI_TYPE_EXP)
			if 1 ~= nArardStatus then--�������ʧ��
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

--�ж��Ƿ���Կ�ʼ����������
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
			--Msg2Player(format("��ǰ���鲻��[%d]���ܳ������", nNeedExp))
			Talk(1, "", format("Kinh nghi�m kh�ng �� [%d] kh�ng th� k�ch huy�t ch�n kh�", nNeedExp));
			return 0
		end
		local  nCapacity = GetTodayAwardGenuineQiLeftCapacityByType(AWARD_QENUINEQI_TYPE_EXP)
		if nCapacity <= 0 then
			Talk(1, "", format("K�ch huy�t kinh m�ch trong ng�y h�m nay kh�ng th� nh�n th�m ch�n kh�"));
			return 0
		end
		if bModify == 1 then
			ModifyExp(-1 * nNeedExp)--�۳�����
		end
		return 1
	else
		Talk(1, "", format("K�ch huy�t kinh m�ch trong ng�y h�m nay kh�ng th� nh�n th�m ch�n kh�"));
		--Msg2Player("����ͨ����������Ѳ����ٻ������")
		return 0
	end
	return 0
end

--��ȡ����������Ĵ���
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
				--ʣ�����������ˣ��˳�ѭ��
				bLoop = 0
			end
			local nCntByExp = nLeftExp / nIndexNeedExp
			local nCntByGenuineQi = nIndexLeftGenuineQi / nIndexAwardGenuineQi
			local nCntAdd = nCntByGenuineQi
			if nCntAdd > nCntByExp then
				nCntAdd = nCntByExp
				--���鲻���ˣ��˳�ѭ��
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
		--Msg2Player("��ǰ���ܿ�ʼ��������")
		Talk(1, "", format("Kinh nghi�m kh�ng �� 100 v�n ho�c  Ch�n Kh� luy�n h�a �� ��t gi�i h�n trong ng�y, kh�ng th� luy�n h�a Ch�n Kh�"));
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
