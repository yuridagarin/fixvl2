Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\tmp_task_id_def.lua")

function main()
	if tGtTask:check_cur_task(106) == 0  then
		return 0;
	end
	local nKey = mod(PlayerIndex, 8);
	if nKey <= 0 or nKey > 8 then
		nKey = random(8);
	end
	local tNpcName = {
		"Th� V� th� 1","Th� v� th� 2","Th� v� th� 3","Th� v� th� 4","Th� v� th� 5","Th� v� th� 6","Th� v� th� 7","Th� v� th� 8",
		}
	if GetItemCount(2, 0, 30059) > 0 then
		Talk(1,"","Kh�ng ph�i ng��i �� l�y ch�a kh�a r�i sao?")
		return 0;
	end
	local nIndex1 = mod(nKey + 2, 8);
	local nIndex2 = mod(nKey + 3, 8);
	if nIndex1 == 0 then nIndex1 = 8; end
	if nIndex2 == 0 then nIndex2 = 8; end
	if GetNpcName(GetTargetNpc()) == tNpcName[nKey] then
		if GetTaskTemp(TMP_TASK_ID_TAG_106) == 0 and GetTaskTemp(TMP_TASK_ID_TAG_106) ~= -1 then
			if random(100) <= 50 then
				Talk(1,"get_item_yaoshi","��i hi�p tha m�ng, ch�a kh�a ��y, ng�i h�y mang �i");
				SetTaskTemp(TMP_TASK_ID_TAG_106, -1);
			else
				SetTaskTemp(TMP_TASK_ID_TAG_106, 1);
				Talk(1,"",format("��i hi�p tha cho t�i �i, t�i kh�ng mang ch�a kh�a, t�i ph�t hi�n ng��i mang l� %s ho�c %s.", tNpcName[nIndex1], tNpcName[nIndex2]));
			end
		else
			Talk(1,"","Ng��i �o�n xem ch�a kh�a ai �ang n�m gi�?");		
		end
		return 0;
	end
	if GetNpcName(GetTargetNpc()) == tNpcName[nIndex1] then
		if GetTaskTemp(TMP_TASK_ID_TAG_106) == 1 then
			if random(100) <= 50 then
				Talk(1,"get_item_yaoshi","��i hi�p tha m�ng, ch�a kh�a ��y, ng�i h�y mang �i");
			else
				SetTaskTemp(TMP_TASK_ID_TAG_106, 2);
				Talk(1,"",format("��i hi�p tha cho t�i �i, t�i kh�ng mang ch�a kh�a, t�i ph�t hi�n ng��i mang l� %s ho�c %s.", tNpcName[nKey], tNpcName[nIndex2]));
			end
		else
			Talk(1,"","Ng��i �o�n xem ch�a kh�a ai �ang n�m gi�?");		
		end
		return 0;
	end
	if GetNpcName(GetTargetNpc()) == tNpcName[nIndex2] then
		if GetTaskTemp(TMP_TASK_ID_TAG_106) == 2 then
			get_item_yaoshi();
		else
			Talk(1,"","Ng��i �o�n xem ch�a kh�a ai �ang n�m gi�?");	
		end
		return 0;
	end
	Talk(1,"","Ng��i �o�n xem ch�a kh�a ai �ang n�m gi�?");
end

function get_item_yaoshi()
	if GetItemCount(2, 0, 30059) < 1 then
		AddItem(2, 0, 30059, 1);
	end
end