-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC�ʷ��Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- ֱ���Լ������İɣ�

-- ======================================================
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
		if g_akct_GetTaskStep(bTag) then
			return
		end
	
		local t_dialog = {
			"<color=green>H� M�n<color>: Th�y Y�n M�n v�a v�o Trung Nguy�n �� thu h�t r�t nhi�u nh�n t�i gia nh�p, v� c�ng n�o nhi�t.",
			"<color=green>H� M�n<color>: Th�y Y�n M�n c�nh s�c m� ng��i, l� n�i t�t �� h�c m�a, nu�i Ti�u �i�u.",
			}
		Talk(1,"",t_dialog[random(getn(t_dialog))])
end;		
