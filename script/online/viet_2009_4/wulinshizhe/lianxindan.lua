--=============================================
--create by baiyun 2009.4.14
--describe:Խ�ϰ�4�·�����ʹ�߻ ���ĵ�
--=============================================
Include("\\script\\online\\viet_2009_4\\wulinshizhe\\wulinshizhe.lua");

function OnUse()
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate > JXWEB_EXPIRED_DATE then
		Msg2Player("V�t ph�m n�y �� qu� h�n, kh�ng th� s� d�ng th�m n�a.")
		return 0;
	end	
	
	-----�жϵȼ�----------------------------------------------------
	if GetLevel() < WL_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V�n ch�a ��t ��n c�p <color=yellow>" .. WL_ROLE_LEVEL_LIMIT .. "<color> c�p, kh�ng th� s� d�ng Li�n T�m ��n");
		return 0;
	end
	
	-----�ж�ʹ�����ĵ���õľ����Ƿ��Ѿ��ﵽ����
	if GetTask(WL_TASK_ALREADY_GET_EXP) >= WL_GET_MAX_EXP then
		Talk(1, "", "S� d�ng Li�n T�m ��n �� ��t ��n kinh nghi�m gi�i h�n cao nh�t");
		return 0;		
	end
	
	-----��þ���
	if DelItem(2, 1, 30085, 1) == 1 then
		SetTask(WL_TASK_ALREADY_GET_EXP, GetTask(WL_TASK_ALREADY_GET_EXP) + WL_GET_EACH_EXP);
		ModifyExp(WL_GET_EACH_EXP);
		Msg2Player("B�n nh�n ���c " .. WL_GET_EACH_EXP .. "Kinh nghi�m");
	end
	
end