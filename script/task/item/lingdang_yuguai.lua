Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nItem)
--	print("OnUse",nItem)
	if tGtTask:check_cur_task(145) ~= 1 then
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 304 then
		Talk(1,"","V�t ph�m n�y ch� ���c s� d�ng t�i Nam Th�nh ��");
		return 0;
	end
	SetItemUseLapse(nItem, 10*60*18);
	local npcIndex = CreateNpc("qiannianyuguai", "Ng� Qu�i", GetWorldPos());
	SetNpcLifeTime(npcIndex, 10*60);
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yuguai_death.lua");
	Msg2Player("Ng� Qu�i xu�t hi�n r�i , h�y nhanh ch�ng ti�u di�t n� �i !");
end