--����ϵͳѨλ��������ģ��

--����Ѩλ������������Ҫװ��8���貨΢������

SZ_NEED_SKILL_NAME = "L�ng Ba Vi B�"
N_NEED_SKILL_LEVEL = 8
N_NEED_SKILL_ID = 477

N_SAVE_TSK_ID = 2951
N_SAVE_TSK_ID_BIT = 1



--ָ��Ѩλָ���ȼ����������������Ƿ���
--1=�Ѵ��
--0=δ���
function CheckCondition(nNodeId, nLevel, bNotify)
	if 1 == nLevel then
		if 0 == _CheckSkillBit() then
			if GetSkillLevel(N_NEED_SKILL_ID) < N_NEED_SKILL_LEVEL then
				if 1 == bNotify then
					Msg2Player(format("B�n ch�a k�ch ho�t c�p %d k� n�ng %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME))
				end
				return 0
			end
		end
	end

	return 1;
end

--��ȡָ��Ѩλָ���ȼ����������������ı�
--����szDescription
function GetConditionDesc(nNodeId, nLevel)
	local str = ""
	if 1 == nLevel then
		str = format("C�n ph�i k�ch ho�t c�p %d k� n�ng %s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME)
	end
	return str;
end

--Ѩλ����������������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	if 13 == nNodeId and 1 == nLevel then
		return _SetSkillBit(1)
	end
	return 1;
end

function _CheckSkillBit()
	local nTaskVal = GetTask(N_SAVE_TSK_ID)
	local nRet = GetBit(nTaskVal, N_SAVE_TSK_ID_BIT)
	return nRet
end

function _SetSkillBit(nBitValue)
	local nTaskVal = GetTask(N_SAVE_TSK_ID)
	local nRet = SetBit(nTaskVal, N_SAVE_TSK_ID_BIT, nBitValue)
	SetTask(N_SAVE_TSK_ID, nRet)
	return 1
end