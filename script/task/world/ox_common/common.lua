-- ���ù��ܺ���

-- cf : Common Function

-- Danexx
-- 2005.5.30
------------------------------------------------------------

-- ͨ����������һ�����ֵ���ɫ
-- text : ��Ҫ��ʾ������
-- color : ��ɫ
function cf_ox_SetColor(text, color)
	return "<color="..color..">"..text.."<color>"
end

-- ͨ��������������Ա�ƺ�
-- male : ����������򷵻�����ַ���
-- female : �����Ů���򷵻�����ַ���
function cf_ox_GetSex(male, female)
	if (GetSex() == 1) then
		return male
	else
		return female
	end
end

-- ͨ����������һ���ָ���
-- length : �ָ��ߵĳ���
function cf_ox_partingline(length)
	local partingline = "\n"
	if (length == 0) then
		length = 8
	end
	for i=1,length do 
		partingline = partingline.."�"
	end
	return partingline.."\n"
end

--function cf_ox_questnote(mode)
--	if (mode == 0) then
--		return " [�����Ѿ���ȡ] "
--	elseif (mode == 1) then
--		return " [����δ���] "	
--	elseif (mode == 2) then
--		return " [�����Ѿ����] "	
--	end
--end