Include("\\script\\online\\Ԫ���\\yuandan_head.lua")
function OnDeath(Launcher)
	SetDeathPunish(1)	--ȷ���������ͷ�������֮��϶��سǣ����϶������뿪��ͼ�Ľű���
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		KillFollower()
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		RemoveTitle(3,3)
		local npcFlag = CreateNpc("Ti�u s�-��i tho�i","Ti�u k�",GetWorldPos())
		SetNpcScript(npcFlag,"\\script\\online\\Ԫ���\\����.lua")
		SetDeathScript("")	
	end
end

