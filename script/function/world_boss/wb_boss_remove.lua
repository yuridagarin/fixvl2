--����BOSS�Ƴ�ʱ�ű�
Include("\\script\\function\\world_boss\\wb_head.lua")

function OnRemove(id, npcName)
	local nIndex = wb_MatchNpc(tostring(npcName))
	if nIndex == -1 then
		return
	end
	local msg = format("Sau m�t h�i chi�n ��u k�ch li�t, xu�t hi�n t�i %s-%s �� ch�y tho�t!", WB_WORLD_BOSS_MAP[nIndex], npcName);
	Msg2Global(msg)
	AddLocalNews(msg)
end