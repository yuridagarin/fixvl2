GET_WENZI_ID = 2434

function main()
	if GetLevel() < 10 then
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		return 0
	end
	
	local nDate = tonumber(date("%Y%m%d"));
	local nTaskVal = GetTask(GET_WENZI_ID)
		
	if nTaskVal == nDate then
		Talk(1,"","M�i ng�y ch� c� th� nh�t 1 V�n T� Bao.")
		return 0	
	end	
	
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	
	SetTask(GET_WENZI_ID,nDate)
	
	local nExp = 500000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.."Kinh nghi�m");
end