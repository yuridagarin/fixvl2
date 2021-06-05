Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\lib\\globalfunctions.lua")

function main()
	if tonumber(date("%Y%m%d")) > 20101028 then
		return
	end
	local tSay = {}
	local szHeader = "Trung Thu n�m nay nh�n nh�p th�t, nh�ng H�ng Nga ta �ang c�n m�t s� l��ng l�n b�nh Trung Thu �� t�ng cho ch�ng ti�n, ��i hi�p c� th� gi�p �� kh�ng?"
	
	tinsert(tSay, "T�ng B�nh Trung Thu cho H�ng Nga (10 B�nh Trung Thu)/give_mooncake_201009")
	tinsert(tSay, "�� l�c kh�c nh�, gi� ta ch�a c� b�nh/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function give_mooncake_201009()
	local nUsedDate = floor(GetTask(EVENT201009_GIVE_CAKE) / 10)
	local nDate = tonumber(date("%y%m%d"))
	
	if nUsedDate ~= nDate then
		SetTask(EVENT201009_GIVE_CAKE, nDate * 10)
	end
	
	local nCount = mod(GetTask(EVENT201009_GIVE_CAKE), 10)	
	if nCount >= 3 then
		Talk(1,"","M�i ng�y ch� c� th� t�ng b�nh t�i �a 3 l�n m� th�i!")
		return
	end
	if GetItemCount(2, 1, 30236) < 10 then
		Talk(1,"","��i hi�p kh�ng mang �� B�nh Trung Thu r�i!")
		return
	end
	if DelItem(2, 1, 30236, 10) == 1 then
		ModifyExp(2000000)
		Msg2Player("Nh�n ���c 2000000 �i�m kinh nghi�m")
		gf_WriteLogEx("Hoat dong thang 9 n�m 2010", "T�ng b�nh Trung Thu nh�n 2000000 exp")
		SetTask(EVENT201009_GIVE_CAKE, GetTask(EVENT201009_GIVE_CAKE) + 1)
		if mod(GetTask(EVENT201009_GIVE_CAKE), 10) == 3 then
			gf_AddItemEx2({2,1,30239, 3}, "N�n V�ng", "Hoat dong thang 9 nam 2010", "T�ng B�nh Trung Thu nh�n N�n V�ng", 24 * 3600)
		end
	end
end

function do_nothing()

end