--����ϵͳ�������
Include("\\settings\\static_script\\meridian\\meridian_title.lua")

--ָ��Ѩλָ���ȼ����������������Ƿ���
--1=�Ѵ��
--0=δ���
function CheckCondition(nLevel, bNotify)
	print(format("[%s]undefined meridian level %d", GetName(), nLevel))
	return 0;
end

--��ȡָ��Ѩλָ���ȼ����������������ı�
--����szDescription
function GetConditionDesc(nLevel)
	local str = format("")
	return str;
end

--��������ǰ����������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoBeforeLevelUpdateCallBack(nNewLevel)
	return 1;
end


--��������������������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoAfterLevelUpdateCallBack(nNewLevel)
	merdiantitle_check_add_title(0)--������ӳƺ�
	return 1;
end