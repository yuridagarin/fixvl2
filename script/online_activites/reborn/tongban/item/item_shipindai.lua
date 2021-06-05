Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\pet_instance\\head.lua");

function OnUse(nItemIdx)
	local nMapId = GetWorldPos()
	if nMapId ~= 1010 and nMapId ~= 2010 then
		Talk(1, "", "Ch� c� th� s� d�ng T�i Th�c Ph�m trong khi v��t �i Th�i H� c�ng b�n ��ng h�nh!")
		return
	end
	
	if GetTaskTemp(TAIXU_PET_USEFOOD) <= 0 then
		Talk(1,"","S� l�n t�ch l�y b�m m�u cho b�n ��ng h�nh c�a b�n c�n l�i l� 0, kh�ng th� s� d�ng!")
		return
	end
	
	if GetTask(TSK_PET_TAIXU_INFO) == 0 or mod(GetTask(TSK_PET_TAIXU_DATE), 10) == 0 then
		Talk(1,"","B�n ��ng h�nh �� b� tr�ng th��ng, kh�ng th� s� d�ng T�i Th�c Ph�m!")
		return
	end
	
	local nGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT) / 100)
	if nGodPoint <= 0 then
		Talk(1, "", "Kh�ng th� s� d�ng T�i Th�c Ph�m do b�n ��ng h�nh kh�ng c� �i�m linh l�c!")
		return
	end
	
	local nMaxHP, nCurHP = GetUnitCurStates(GetTask(TSK_PET_TAIXU_INFO), 1)
	if DelItem(2,1,30159,1) == 1 then
		SetTaskTemp(TAIXU_PET_USEFOOD, GetTaskTemp(TAIXU_PET_USEFOOD) - 1)
		ModifyNpcData(GetTask(TSK_PET_TAIXU_INFO), 0, nCurHP + nGodPoint * 50, 0)
		Msg2Player("S� l�n s� d�ng T�i Th�c Ph�m c�n l�i: "..GetTaskTemp(TAIXU_PET_USEFOOD))
	end
end	
	

--    if vet_201003_tongban_judge_if_jihuo() == 0 then
--        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[19]);
--        return 0;
--    end
--    
--    if GetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT) >= 300 then
--        Talk(1, "", VET_201003_TONGBAN_STR_SHOW_MASSAGE[5]);
--        return 0;
--    end
--    
--    if DelItemByIndex(nItemIdx, 1) == 1 then
--        
--        local nHealthPoint = GetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT);
--        local nPoint = nHealthPoint;
--        if nHealthPoint + VET_201003_TONGBAN_GET_HEALTH_POINT_FROM_SHIPINDAI > VET_201003_TONGBAN_HEALTH_POINT_MAX then
--            nHealthPoint = VET_201003_TONGBAN_HEALTH_POINT_MAX;
--        else
--            nHealthPoint = nHealthPoint + VET_201003_TONGBAN_GET_HEALTH_POINT_FROM_SHIPINDAI;
--        end
--        SetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT, nHealthPoint);
--        if nPoint == 0 then
--            CreateTrigger(1, 1502, VET_201003_TONGBAN_TASK_TRIGGER_ID_DEFINE);
--            ContinueTimer(GetTrigger(VET_201003_TONGBAN_TASK_TRIGGER_ID_DEFINE));
--        end        
--    end
