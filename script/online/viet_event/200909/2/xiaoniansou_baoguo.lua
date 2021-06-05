-- TSK_NIENTHU20101201_TIME = 2175
-- TSK_NIENTHU20101201_INFO = 2176

Include ("\\script\\lib\\globalfunctions.lua");
Include ("\\script\\online\\viet_event\\vng_task_control.lua ") 

function main()

	-- c�p 80 tr� l�n m�i c� th� nh�n ���c ph�n th��ng
	if GetLevel() < 80 then
		Talk(1, "", "��ng c�p 80 tr� l�n m�i c� th� nh�n th��ng!")
		return 0
	end
	
	-- gia nh�p m�n ph�i m�i nh�n ph�n thu�ng
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch� c� ng��i �� gia nh�p m�n ph�i m�i c� th� nh�n th��ng!")
		return 0
	end
	
	-- thoi gian gian cach hai l�n nh�n thu�ng l� 30 ph�t
	if GetTime() - GetTask(TSK_NIENTHU20101201_TIME) < 30 * 60 then
		Talk(1,"","B�n c�n "..GetTask(TSK_NIENTHU20101201_TIME) + (30*60) - GetTime().." gi�y m�i c� th� ti�p t�c nh�n th��ng t� ti�u ni�n th�.")
		return 0
	end
	
	-- set th�i gian gi�n c�ch nh�n th��ng
	SetTask(TSK_NIENTHU20101201_TIME,GetTime())
	
	-- local nDate = tonumber(date("%d"));
	-- local nTaskVal = GetTask(TSK_NIENTHU20101201_INFO)	
	----------------------------------------------------------------------------------------
	--if GetByte(nTaskVal,1) ~= nDate then
--		nTaskVal  = SetByte(nTaskVal,1,nDate)
		--nTaskVal  = SetByte(nTaskVal,2,0)
		--nTaskVal  = SetByte(nTaskVal,3,0)
		--SetTask(TSK_NIENTHU20101201_INFO, nTaskVal)
	--end	
	--nTaskVal = GetTask(TSK_NIENTHU20101201_INFO)	
	----------------------------------------------------------------------------------------
	
	local nDate = tonumber( date( "%y%m%d" ) ) --101116
	
	-- hai s� cu�i c�a task l� s� l�n s� d�ng trong ng�y
	local nCurDate = floor ( GetTask( TSK_NIENTHU20101201_INFO ) / 100 ) -- l�y 6 s� ��u ti�n
	
	-- Th�c hi�n reset s� l�n s� d�ng trong ng�y v� th�i gian gi�n c�ch s� d�ng . n�u kh�ng ph�i l� ng�y hi�n t�i
	if nCurDate ~= nDate then
		SetTask ( TSK_NIENTHU20101201_INFO, nDate * 100 )
	end	
		
	-- Vu�t qu� s� l�n s� d�ng --> tho�t 	
	local nCount = mod ( GetTask(TSK_NIENTHU20101201_INFO), 100 ) 
	if nCount >= 12 then
		Talk(1,"","M�i ng�y ch� c� th� nh�n th��ng t� 12 con Ti�u ni�n th�.")
		return 0
	end
	
	--if GetByte(nTaskVal,3) >= 12 then
	--	Talk(1,"","M�i ng�y ch� c� th� nh�n th��ng t� 12 con Ti�u ni�n th�.")
	--	return 0
	--end
			
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)
	SetNpcScript(nSelfIndex, "")

	-- SetTask(GET_PANGTUZI_ID, SetByte(nTaskVal,3,1))	
	SetTask(TSK_NIENTHU20101201_INFO, GetTask(TSK_NIENTHU20101201_INFO) + 1)
	
	ModifyExp(1000000)
	WriteLogEx("Hoat dong Thang 12","Ti�u ni�n th�",1000000,"�i�m kinh nghi�m")
	Msg2Player("B�n nh�n ���c 1000000 �i�m kinh nghi�m!")
	
	-- doi 30*60 gi�y m�i c� th� �n ���c n�a	
	StartTimeGuage("Ti�u ni�n th�", 30*60 ,0,1)	
end
-- ================================================
