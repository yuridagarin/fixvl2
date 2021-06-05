Include("\\script\\lib\\globalfunctions.lua")

CMS5_LOG_TITLE = "CSM 5 nam 2011"

function award_CSM5()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 110805 then
		Talk(1,"","�� h�t th�i gian nh�n th��ng!")
		return
	end
	
	local nSaveDate = floor(GetTask(TSK_AWARD_CSM5) / 100)
	if gf_GetExtPointBit(1, 1) == 1 and nDate ~= nSaveDate then
		if gf_SetExtPointBit(1, 1, 0) == 1 then
			SetTask(TSK_AWARD_CSM5, (nDate * 100) + 4)
		end
	end
	
	local nUse = mod(GetTask(TSK_AWARD_CSM5), 100)

	local nExp = 2000000
	
	if GetLevel() < 77 then
		Talk(1, "", "��ng c�p 77 tr� l�n m�i c� th� nh�n th��ng!")
		return
	end
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "Thi�u hi�p ch�a gia nh�p m�n ph�i n�n kh�ng th� nh�n th��ng!" )
		return
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Thi�u hi�p ph�i c� k� n�ng c�p 55 m�i c� th� nh�n th��ng!")
		return
	end
	
	if nUse == 0 then
		Talk(1,"", "H�m nay thi�u hi�p �� nh�n th��ng �� 4 l�n ho�c ch�a k�ch ho�t t� h� th�ng Game Menu!")
		return
	end

	local nDiff = GetTime() - GetTask(TSK_AWARD_CSM5_ACTIVE_TIME)
	if nDiff < 900 then
		local nWaitMin = floor(nDiff / 60)
		local nWaitSec = mod(nDiff, 60)
		Say("Thi�u hi�p c�n "..(14 - nWaitMin).." ph�t "..(60 - nWaitSec).." gi�y sau m�i c� th� nh�n th��ng", 1, "K�t th�c ��i tho�i/nothing");
		return 0;
	end
	
	SetTask(TSK_AWARD_CSM5, GetTask(TSK_AWARD_CSM5) - 1)
	SetTask(TSK_AWARD_CSM5_ACTIVE_TIME, GetTime())
	ModifyExp(nExp)
	Msg2Player("��i hi�p �� nh�n ���c ph�n th��ng "..nExp.." �i�m kinh nghi�m")
	gf_WriteLogEx(CMS5_LOG_TITLE, "Nh�n th��ng th�nh c�ng")
end

function nothing()

end