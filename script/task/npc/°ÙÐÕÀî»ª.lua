--������ű�
Include("\\script\\task\\global_task\\task_id.lua")
function main()
	if GetTask(Task_id_003) ~= 1 then
		Talk(1,"","<color=green>B� t�nh L� Hoa: <color>th�i ti�t h�m nay th�t ��p!");
	else
		local tbString = {
				"<color=green>"..GetName()..":<color>��i ca, g�n ��y b� t�nh trong v�ng n�y ��u kh�e ch�?",
				"<color=green>B� t�nh L� Hoa:<color>Nh�t Nguy�t Th�n Gi�o, Nh�t th�ng giang h�, nh�t xu�t ��ng ph��ng, nh�t th� b�t b�i.",
				"<color=green>"..GetName()..":<color>V� ��i ca n�y �ang n�i g� th�, ta ��n xem v� ��i t� kia xem sao.",
			}
		Talk(3,"deal_task",tbString[1],tbString[2],tbString[3]);
	end
end

function deal_task()
	SetTask(Task_id_003,GetTask(Task_id_003)+1);
end