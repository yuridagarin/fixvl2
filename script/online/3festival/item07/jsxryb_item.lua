Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[3][2],tMoonCake[3][3],tMoonCake[3][4],1) == 1 then
		AddItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1)
		Msg2Player("B�n nh�n ���c 1 B�nh Trung Thu Giang S�n M� V� ");
	end
end;