--�ű����ܣ������һ����Ի��ű�
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-16

Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	--2011���ָĽ�:��������
	local nGet = tGtCondition:check_taskid(369, 2);
	if nGet ~= nil and gf_GetTaskBit(3378, 1) ~= 1 then
		Talk(1, "", "T�m ���c m�t b�i th� �n tr�n v� ��o Hoa Th�\n<color=yellow>    ��o hoa t�ng trung ��o hoa am,\n    ��o hoa am h�u ��o hoa s�n.\n    Th� nh�n giai th�n ��o hoa di�m,\n    B�t ki�n th� h� ��o hoa t�n.<color>\n         --<color=green>Th�n tr��ng<color>");
		AddItem(2,0,778,1);
		gf_SetTaskBit(3378, 1, 1);
		return
	end

	--2011���ָĽ�֮ǰ

	if GetTask(1019) == 2 and BigGetItemCount(2,0,778) == 0 then
		AddItem(2,0,778,1)
	else
		if random(1000) == 137 then
			Talk(1,"","T�m ���c m�t b�i th� �n tr�n v� ��o Hoa Th�\n<color=yellow>    ��o hoa t�ng trung ��o hoa am,\n    ��o hoa am h�u ��o hoa s�n.\n    Th� nh�n giai th�n ��o hoa di�m,\n    B�t ki�n th� h� ��o hoa t�n.<color>\n         --<color=green>Th�n tr��ng<color>")
		end
	end
end
