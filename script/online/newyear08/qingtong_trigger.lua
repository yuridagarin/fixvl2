--2008春节活动青铜掉落触发器
--by vivi
--2008/01/16

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function finishkill()
	if get_spring_festival_state() == 1 then
		local nNpcIdx,sMoban,sName = GetTriggeringUnit();
		local nNpcLv = GetUnitCurStates(nNpcIdx,0);
		if (sMoban == "Nghi謙 H錸" and sName == "L穘h Hng L╪g") or (sMoban == "S琻 T芻 u M鬰" and sName == "B綾 L鬰 L﹎ Minh Ch?") or (sMoban == "Huy襫 V? Th璷ng" and sName == "Thng Th莕 Doanh Thi猲") then
			local nRandnum = random(1,100);
			if nRandnum <= 15 then
				AddItem(2,1,3220,1);
			end
		end
		if nNpcLv >= 80 then
			local nRand = random(1,1000);
			if nRand <= 200 then
				AddItem(2,1,3212,1);
			elseif nRand <= 220 then
				AddItem(2,1,3223,1);
			elseif nRand <= 225 then
				AddItem(2,1,3222,1);
			elseif nRand <= 226 then
				AddItem(2,1,3221,1);
			end
		elseif nNpcLv >= 60 then
			local nRand = random(1,1000);
			if nRand <= 200 then
				AddItem(2,1,3212,1);
			elseif nRand <= 220 then
				AddItem(2,1,3223,1);
			elseif nRand <= 225 then
				AddItem(2,1,3222,1);
			end
		elseif nNpcLv >= 40 then	
			local nRand = random(1,1000);
			if nRand <= 200 then
				AddItem(2,1,3212,1);
			elseif nRand <= 220 then
				AddItem(2,1,3223,1);
			end
		elseif nNpcLv >= 20 then
			local nRand = random(1,1000);
			if nRand <= 200 then
				AddItem(2,1,3212,1);
			end
		end									
	end
end