Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\task\\global_task\\task_id.lua")
function OnUse(nItemIndex)
	SendScript2Client("Open([[LargeMsg]], 2, [[h�p th� th�n b� ]]);");
	--Talk(1,"get_new_task","<color=green>��λ�������ͣ�<color>\n\n   ���Ǻã��������н���ף��������һ���������飬��ƾ�Ҹ�������������ɴ��£���˿����λ���ָ��ְ�æ������λ����Ը��������һͬ��ɴ��£����¶�������������ǡ����ǿ������踮���ң��һ���ϸ˵�����¡���л��λ���ͣ�\n\n                                                                    <color=green> �����<color>")
	--SetItemUseLapse(nItemIndex,18*60*3);
	get_new_task();
end

function get_new_task()
	local nLevel = GetLevel();
	if nLevel < 80 or GetPlayerFaction() == 0 then
		Talk(1,"","Ng��i ch�i <color=green>c�p 80<color>tr� l�n, c� h� ph�i m�i c� th� ti�p nh�n chu�i nhi�m v� h��ng d�n v�o �i");
		return 0;
	end
	DirectGetGTask(74,1);
end