--����ϵͳѨλ��������ģ��

t_node_id_list = {19, 23, 27}

--ָ��Ѩλָ���ȼ����������������Ƿ���
--1=�Ѵ��
--0=δ���
function CheckCondition(nNodeId, nLevel, bNotify)
	local nThisIndex = 0
	for i= 1, getn(t_node_id_list) do
		if t_node_id_list[i] == nNodeId then
			nThisIndex = i
			break
		end
	end
	if nThisIndex > 0 then
		for i= 1, getn(t_node_id_list) do
    		local nCheckNodeId = t_node_id_list[i]
    		local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
    		if nCheckNodeLevel > 0 and nCheckNodeId ~= nNodeId then
    			if 1 == bNotify then
    				--Msg2Player("���ࡢ������������ѨѨλ��壬��Ѩʧ��")
    				Talk(1, "", format("Huy�n Khu, Ch� D��ng, Th�n Tr� 3 huy�t v� t��ng xung, �i�m huy�t th�t b�i"));
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
	local str = "Huy�n Khu, Ch� D��ng, Th�n Tr� 3 huy�t t��ng xung"
	return str;
end

--Ѩλ����������������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end