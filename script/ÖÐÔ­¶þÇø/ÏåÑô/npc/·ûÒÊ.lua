Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	
	Talk(1,"","H�m� m�i ng��i ��u n�i trong s�ch c� ho�ng kim, ta ��c s�ch bao nhi�u n�m nay c� th�y g� ��u!");
end;