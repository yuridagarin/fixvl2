Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnUse(nIndex)
	if tGtTask:check_cur_task(79) ~= 1 then
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 414 then
		Talk(1,"","��o c� ch� d�ng trong Ph�ng Nh�n ��ng.");
		return 0;
	end
	if GetMapTaskTemp(512,Map_Glb_Valve11) > 6 then
		Talk(1,"","Tri�u h�i Th��ng �ng th�t b�i, h�y ch� ch�t r�i th� l�i ho�c th� t�m n�i kh�c tr�n b�n ��.");
		return 0;
	end
	if GetItemCount(2,0,30023) < 9 then
		Talk(1,"","Long V� B�ch ��u �i�u trong h�nh trang kh�ng �� 9 ph�n, kh�ng t�m th�y Th��ng �ng.")
		return 0;
	end
	if GetItemCount(2,0,30046) < 1 then
		Talk(1,"","H�nh trang kh�ng c� Chi�u �ng Phi�n, h�y h�y b� b�t ��u nh�n nhi�m v� l�i.");
		return 0;
	end
	if GetItemCount(2,0,30048) >= 1 then
		return 0;
	end
	--if DelItem(2,0,30023,GetItemCount(2,0,30023)) == 1 then
	local nNpcIndex = CreateNpc("Th��ng �ng","Th��ng �ng",GetWorldPos());
	SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\��ӥDeath.lua");
	SetMapTaskTemp(512,Map_Glb_Valve11,GetMapTaskTemp(512,Map_Glb_Valve11)+1);
	SetItemUseLapse(nIndex,18*60*3);
	--end
end