--Խ�ϰ�õ�����ű�
--by vivi
--2008/03/06

Include("\\script\\online\\march08\\march08_head.lua");

function finishkill() 
	if get_march_state() == 1 then
		local nNpcIdx,sMoban,sName = GetTriggeringUnit();
		local nNpcLv = GetUnitCurStates(nNpcIdx,0);
		if nNpcLv > 20 then
			local nRand = random(1,1000);
			if nRand <= 15 then
				AddItem(2,0,1164,1);  --�ۺ�õ��
			elseif nRand <= 20 then
				AddItem(2,0,1162,1);  --��õ��
			end
		end
	end		
end