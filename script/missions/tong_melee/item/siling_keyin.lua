--�ٻ�����
Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local nMapId, nMapTemplteId = SubWorldIdx2ID(SubWorld);
	if nMapTemplteId ~= 6074 then
		Talk(1,"","B�n �� n�y kh�ng th� s� d�ng");
		return 0;
	end
	DoWait(117, 118, 3);
	SetItemUseLapse(nItem, 2*60*18);
end

function dowait_cb()
	local sName = GetName();
	local nMapId, nX, nY = GetWorldPos();
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex ~= oldPlayerIndex then
			SetTaskTemp(TMP_TASK_TONG_MELEE_X, nX);
			SetTaskTemp(TMP_TASK_TONG_MELEE_Y, nY);
			SetPlayerScript("\\script\\missions\\tong_melee\\item\\siling_keyin.lua");
			Say(format("%s [Th�n Th� Khan H� Gi�] tri�u h�i ng��i! ", sName), 2, "H��ng �ng chi�u g�i/ensure", "Ta r�t b�n/nothing");
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function ensure() 
	SetPos(GetTaskTemp(TMP_TASK_TONG_MELEE_X), GetTaskTemp(TMP_TASK_TONG_MELEE_Y));
	Msg2Player("Ng��i h��ng �ng tri�u g�i Th�n Th� Khan H� Gi�!");
end

function nothing()
end