--NPCĬ�϶Ի��ű�
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	--�
	local tID = {125, 140}
	for i = 1, getn(tID) do
		if g_akct_ShowDialog(tID[i], bTag) then
			return
		end
	end
	
	local tbSay = {};
	Say("<color=green>Th�n tr��ng: <color>N�m nay l� n�m ��i thu!",getn(tbSay),tbSay);
end