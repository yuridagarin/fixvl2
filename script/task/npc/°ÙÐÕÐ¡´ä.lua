--����С��ű�
Include("\\script\\task\\global_task\\task_id.lua")
function main()
	if GetTask(Task_id_003) ~= 2 then
		Talk(1,"","<color=green>B� t�nh ti�u Th�y: <color> nh�ng con di�u n�y th�t ��p!");
	else
		local tbString = {
				"<color=green>"..GetName()..":<color>T� t�, g�n ��y b� t�nh trong v�ng n�y ��u kh�e ch�?",
				"<color=green>B� t�nh ti�u Th�y: <color>Nh�t Nguy�t Th�n Gi�o, Nh�t th�ng giang h�, nh�t xu�t ��ng ph��ng, nh�t th� b�t b�i.",
				"<color=green>"..GetName()..":<color>C� ph�i m�i ng��i �� tr�ng ��c c�a Nh�t Nguy�t Th�n Gi�o kh�ng? ��y l� lo�i ��c gi�, c� Long M�n Tr�n c�ng kh�ng m�t ai c� th� b�o cho ta bi�t ���c, Nh�c ch��ng m�n c� d�n ta r�ng b� t�nh t�i Bi�n Kinh ��u t�c tr� �a m�u, h�c th�c uy�n b�c, hi v�ng h� c� th� bi�t ���c ��u g� ��.",
			}
		Talk(3,"deal_task",tbString[1],tbString[2],tbString[3]);
	end
end

function deal_task()
		SetTask(Task_id_003,GetTask(Task_id_003)+1);
end