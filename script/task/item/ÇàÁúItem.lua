Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnUse(nIndex)
	if tGtTask:check_cur_task(78) ~= 1 then
		DelItem(2,0,30044,GetItemCount(2,0,30044));
		DelItem(2,0,30043,GetItemCount(2,0,300043));
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 512 then
		Talk(1,"","��o c� n�y s� d�ng trong t�ng 2 C� D��ng ��ng.");
		return 0;
	end
	if GetMapTaskTemp(512,Map_Glb_Valve10) > 6 then
		Talk(1,"","Chi�u d� Thanh Long th�t b�i, h�y ch� ch�t r�i th� l�i ho�c th� t�m n�i kh�c tr�n b�n ��.");
		return 0;
	end
	local tSex = gf_GetPlayerSexName();
	if GetItemCount(2,0,30044) < 9 then
		Talk(1,"",tSex.."Thu th�p kh�ng �� 9 c�i Thanh Long Huy�t, kh�ng th� chi�u d� Thanh Long.");
		return 0;
	end
	if GetItemCount(2,0,30043) < 1 then
		Talk(1,"","H�nh trang kh�ng c� H�a Long ��nh, h�y h�y b� v� b�t ��u l�i.");
		return 0;
	end
	if GetItemCount(2,0,30045) < 1 then
	--if DelItem(2,0,30044,GetItemCount(2,0,30044)) == 1 and DelItem(2,0,30043,GetItemCount(2,0,30043)) == 1 then
		local nNpcIndex = CreateNpc("Thanh Long","Thanh Long",GetWorldPos());
		SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\����Death.lua");
		SetMapTaskTemp(512,Map_Glb_Valve10,GetMapTaskTemp(512,Map_Glb_Valve10)+1);
		SetItemUseLapse(nIndex,18*60*3);
	end
end
