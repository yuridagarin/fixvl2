Include("\\script\\online\\viet_event\\pet_instance\\head.lua")

function main()
	local nMap = GetWorldPos()
	local nZone = GetMapTaskTemp(nMap, 1)
	
	if GetMapTaskTemp(nMap,3) ~= 2 then
		Msg2Team("R��ng ch� m� ���c khi s� d�ng Th�i H� �a M�t Qu� v��t �i!")
		return
	end
	local npcIndex = GetTargetNpc()
	SetNpcLifeTime(npcIndex, 0)
	SetNpcScript(npcIndex, "")
	local OldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
        	PlayerIndex = GetTeamMember(i)
    		ModifyExp(1000000)
    		if GetTask(TSK_PET_TAIXU_INFO) ~= 0 and mod(GetTask(TSK_PET_TAIXU_DATE), 10) ~= 0 then
    			gf_AddItemEx2({2,1,30159, tPetFoodNum[nZone]}, "T�i th�c ph�m", "Thai Hu Huyen Canh Ban Dong Hanh", "nh�n th��ng ru�ng lo�i 2")
    		end
    		local nPoint = floor(GetTask(TSK_PET_TAIXU_POINT) / 1000)
    		if nPoint < 2000000 then
    			SetTask(TSK_PET_TAIXU_POINT, GetTask(TSK_PET_TAIXU_POINT) + 2000)
    		end
    	end
    	PlayerIndex = OldPlayer
end