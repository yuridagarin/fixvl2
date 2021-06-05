-- ��ʱ��

Include("\\script\\gongcheng\\prison\\prison_head.lua")

function OnTimer()
	local nTrigger = GetRunningTrigger()
	if nTrigger ~= 0 then
		local nStep = GetTriggerParam(nTrigger, 2)
		SetTriggerParam(nTrigger, 2, nStep + 1)
		if nStep + 1 < CITYWAR_MAX_STEP then
			Msg2Player("Th�i gian qua ["..(nStep + 1).."/"..CITYWAR_MAX_STEP.."]")
		else
			if mod(nStep, 10) == 0 then
				Msg2Player("B�n �� c� th� r�i lao!")
			end
		end
	end
end

function Leave_Map()
	print("Citywar Prison Leave_Map")
	RemoveTrigger(GetTrigger(CITYWAR_LEAVE_PRISON))
	StallEnable(1)		-- �ܰ�̯
	ForbidRead(0)		--������
	UseScrollEnable(1)	--����ʹ�ûس�
end

function Enter_Map()
	print("Citywar Prison Enter_Map")
	RemoveTrigger(GetTrigger(CITYWAR_ENTER_PRISON))
	StallEnable(0)	-- ���ܰ�̯
	ForbidRead(1)	--��������
	UseScrollEnable(0)	--��ֹʹ�ûس�
end