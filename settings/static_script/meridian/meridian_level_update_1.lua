--����ϵͳ�������
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\settings\\static_script\\meridian\\meridian_title.lua")

--ָ��Ѩλָ���ȼ����������������Ƿ���
--1=�Ѵ��
--0=δ���
function CheckCondition(nLevel, bNotify)
	if 1 ~= nLevel then
		return 0
	end
	if 1 ~= meridianlevel_check_require(nLevel, bNotify) then
		return 0
	end
	--������������ж�
	return 1;
end

--��ȡָ��Ѩλָ���ȼ����������������ı�
--����szDescription
function GetConditionDesc(nLevel)
	local str = format("%s ho�c %s","Ho�n th�nh chu�i nhi�m v� Ti�u Ng�o Giang H�", "T�m <color=yellow>Nh�c B�t Qu�n<color> khai th�ng c�nh gi�i")
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
