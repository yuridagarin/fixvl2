-- ����ս����
-- lizhi
-- 2007-5-9 9:29

Include("\\script\\gongcheng\\prison\\prison_head.lua")

tCityWarPrison = {730,731,732,733,734}

function main()
	local selTab =
	{
		"B�ng h�u ta � ��y, h�y �� ta v�o th�m./visit_a_prisoner",
		"Kh�ng c� g�/nothing",
	}
	Say("Lao l� tr�ng ��a! L�ng v�ng � ��y l�m g�?",getn(selTab),selTab)
end;

function visit_a_prisoner()
	Say("B�n mu�n ��n nh� lao � th�nh n�o?",
		6,
		"Nh� lao th�nh th� 1/#visit_yes(1)",
		"Nh� lao th�nh th� 2/#visit_yes(2)",
		"Nh� lao th�nh th� 3/#visit_yes(3)",
		"Nh� lao th�nh th� 4/#visit_yes(4)",
		"Nh� lao th�nh th� 5/#visit_yes(5)",
		"R�i kh�i/nothing"
		)

end

function visit_yes(nIndex)
	local selTab = 
	{
		"��ng �/#enter_jail("..nIndex..")",
		"H�y b�/nothing",
	}
	if GetTrigger(CITYWAR_ENTER_PRISON) == 0 then
		Say("D�o n�y b�n ��i gia h�i t�ng thi�u, mang ��n <color=yellow>1 l��ng<color> cho l�o gia mi u�ng r��u �i!",getn(selTab),selTab)
	else
		Say("Giao ti�n r�i, sao c�n ch�a v�o?",2,"�i v�o/#enter_jail("..nIndex..")","R�i kh�i/nothing")
	end
end

function enter_jail(nIndex)
	CleanInteractive()
	if GetTrigger(CITYWAR_ENTER_PRISON) == 0 then
		if Pay(10000) == 1 then
			CreateTrigger(2, 1805 + nIndex, CITYWAR_ENTER_PRISON)
			NewWorld(tCityWarPrison[nIndex], tCityWarPrisonPos[1], tCityWarPrisonPos[2])
		else
			Talk(1,"","Kh�ng ng� ng��i c�n ngh�o h�n ta n�a! Th�i kh�ng ti�n th� c�t x�o �i!")
		end
	else
		NewWorld(tCityWarPrison[nIndex], tCityWarPrisonPos[1], tCityWarPrisonPos[2])
	end
end
