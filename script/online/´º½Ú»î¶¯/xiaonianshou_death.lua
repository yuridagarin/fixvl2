--filename:xiaonianshou_death.lua
--create date:2006-01-11
--author:yanjun
--describe:С���޶Ի��ű�
Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	local nTimeNow = GetTime();
	if nTimeNow - GetTask(TASK_GOT_NIANSHOU) >= 3600 then
		if gf_JudgeRoomWeight(1,10) == 1 then
			SetNpcLifeTime(nNpcIndex, 0)
			SetTask(TASK_GOT_NIANSHOU,nTimeNow);
			
			local nRet, nItem = 0, 0;
			nRet, nItem = gf_AddItemEx( {2,1,30002,1,1}, "M�u t� ��i h�ng bao" );
			if nRet ~= 0 and nItem ~= nil then
				nRet = gf_setItemExpireDate(nItem, 2008, 2, 29, 24);
				if nRet ~= 1 then
					WriteLog("Th�i h�n s� d�ng M�u t� ��i h�ng bao th�t b�i: date = 2008, 2, 29, 24");
				end
				WriteLog("[Ho�t ��ng n�m m�i]:"..GetName().."B�n nh�n ���c 1 M�u t� ��i h�ng bao.");
			end
		else
			Msg2Player("Kho�ng tr�ng trong t�i h�nh trang kh�ng ��");
		end;
	else
		Msg2Player("M�i ng��i, m�i ng�y ch� c� th� nh�n l�y m�t m�u t� ��i H�ng Bao");
	end;
end