--2008���ڻ��ͭ���䴥����
--by vivi
--2008/01/16

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function finishkill()
	if get_spring_festival_state() == 1 then
		local nNpcIdx,sMoban,sName = GetTriggeringUnit();
		local nNpcLv = GetUnitCurStates(nNpcIdx,0);
		if (sMoban == "Nghi�t H�n" and sName == "L�nh H��ng L�ng") or (sMoban == "S�n T�c ��u M�c" and sName == "B�c L�c L�m Minh Ch�") or (sMoban == "Huy�n V� Th�ong" and sName == "Th��ng Th�n Doanh Thi�n") then
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