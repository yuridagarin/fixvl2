--����ϵͳѨλ��������ģ��

--ָ��Ѩλָ���ȼ����������������Ƿ���
--1=�Ѵ��
--0=δ���
function CheckCondition(nNodeId, nLevel, bNotify)
	if GetTask(2951) == nLevel then
		return 1;
	end
	if 0 ~= bNotify then
		Msg2Player(format("GetTask(2951) ~= %d", nLevel))
	end
	return 0;
end

--��ȡָ��Ѩλָ���ȼ����������������ı�
--����szDescription
function GetConditionDesc(nNodeId, nLevel)
	local str = format("GetTask(2951) == %d", nLevel)
	return str;
end

--Ѩλ����������������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end