--=============================================
--create by baiyun 2009.10.14
--describe:Խ�ϰ�11�·ݻ ����ű��ļ�
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

function OnUse(nItemIdx)
	if GetTask(VIET_0911_TASK_ZHENZHU_COUNT) >= VIET_0911_ZHENZHU_MAX_COUNT then
		Talk(1, "", "��i hi�p s� d�ng ng�c trai ��t ��n s� l�n cho ph�p, kh�ng th� s� d�ng ���c n�a");
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		ModifyExp(500000)
		SetTask(VIET_0911_TASK_ZHENZHU_COUNT, GetTask(VIET_0911_TASK_ZHENZHU_COUNT) + 1);
	end
end