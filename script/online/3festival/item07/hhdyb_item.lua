Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if DelItem(tMoonCake[18][2],tMoonCake[18][3],tMoonCake[18][4],1) == 1 then
		local nLevel = GetLevel();
		local nUseTimes = GetTask(TASK_USE_HHDYB);
		local nX = 100;
		if nUseTimes > 100 then
			nX = max(20,200-nUseTimes);
		end;
		local nExp = floor((nX/100)*(100000*nLevel^3)/(80^3));
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		Msg2Player("��y l� l�n th� "..(nUseTimes+1).." s� d�ng b�nh Trung Thu b� h�ng, nh�n ���c "..nExp.." �i�m kinh nghi�m");
		SetTask(TASK_USE_HHDYB,nUseTimes+1);
		local nRand = random(1,100);
		if nRand <= 25 then
			CastState("state_confusion",0,10*18,1,211000);
			Msg2Player("H�n lo�n 10 gi�y");
		elseif nRand <= 50 then
			CastState("state_vertigo",0,10*18,1,213000);
			Msg2Player("B� cho�ng 10 gi�y");
		end;
	end;
end;