--����ϵͳѨλ��������ģ��

function _get_this_node_index(nNodeId)
	local nThisIndex = 0
	for i= 1, getn(t_node_id_list) do
		if t_node_id_list[i] == nNodeId then
			nThisIndex = i
			break
		end
	end
	return nThisIndex
end

function _get_require_level(nLevel)
	return nLevel - 1
end

t_node_id_list = {4}
t_require_node_list =
{
	--require node id, require node name, require node level function
	{65, "Kh� Xung", _get_require_level}
}

--ָ��Ѩλָ���ȼ����������������Ƿ���
--1=�Ѵ��
--0=δ���
function CheckCondition(nNodeId, nLevel, bNotify)
	local nThisIndex = _get_this_node_index(nNodeId)
	if nThisIndex > 0 then
		for i= 1, getn(t_node_id_list) do
			local nRequireLevel = t_require_node_list[i][3](nLevel)
    		local nCheckNodeId = t_require_node_list[i][1]
    		local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
    		if nCheckNodeLevel < nRequireLevel then
    			if 1 == bNotify then
    				Msg2Player(format("%s huy�t v� ch�a ��t ��n t�ng %d, �i�m huy�t th�t b�i", t_require_node_list[i][2], nRequireLevel))
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
	if _get_this_node_index(nNodeId) > 0 then
		for i = 1, getn(t_require_node_list) do
			local nRequireLevel = t_require_node_list[i][3](nLevel)
			if nRequireLevel >= 1 then
				local strTemp = format("%s huy�t v� �� ��t t�ng %d", t_require_node_list[i][2], nRequireLevel)
				if i == 1 then
					str = strTemp
				else
					local strOld = str;
					str = format("%s\n%s", strOld, strTemp)
				end
			end
		end
	end
	return str;
end

--Ѩλ����������������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end