--=============================================
--create by baiyun 2009.10.15
--describe:Խ�ϰ�11�·ݻ �̻�ű��ļ�
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\item\\yanhuo.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 091106 or nDate > 091206 then
		Talk(1, "", "Ho�t ��ng l�n n�y �� k�t th�c");
		return
	end
	if GetLevel() < 10 then
		Talk(1, "", "C�p b�c ��i hi�p kh�ng �� 10, kh�ng th� s� d�ng ph�o hoa");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", "��i hi�p ch�a gia nh�p m�n ph�i, kh�ng th� s� d�ng ph�o hoa");
		return
	end
	if GetTask(VIET_0911_TASK_YANHUO_DATE) < nDate then
		SetTask(VIET_0911_TASK_YANHUO_NUM, 0);
		SetTask(VIET_0911_TASK_LAST_USE_TIME, 0);
	end
	if GetTask(VIET_0911_TASK_YANHUO_NUM) >= 16 then
		Talk(1, "", "M�i ng�y m�i nh�n v�t ch� c� th� s� d�ng 16 ph�o h�a");
		return
	end
	if GetTime() - GetTask(VIET_0911_TASK_LAST_USE_TIME) < 120 then
		Talk(1, "", "Th�i gian s� d�ng li�n ti�p ph�o hoa l� 2 ph�t, c�n ph�i ��i "..(120 - GetTime() + GetTask(VIET_0911_TASK_LAST_USE_TIME)).." gi�y m�i c� th� s� d�ng ti�p");
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		DoFireworks(801, 10);
		if nDate < 091109 then
			ModifyExp(1000000);
			Msg2Player("B�n nh�n ���c 1000000 �i�m kinh nghi�m.")
			WriteLogEx(VIET_0911_LOG_TITLE,"Ph�o hoa",1000000,"�i�m kinh nghi�m")
		else
			ModifyExp(100000);
			Msg2Player("B�n nh�n ���c 100000 �i�m kinh nghi�m.")
			WriteLogEx(VIET_0911_LOG_TITLE,"Ph�o hoa",100000,"�i�m kinh nghi�m")
		end
		ModifyReputation(10, 0);
		
		local nRand = random(1,100)
		if nRand <= 33 then
			AddItem(2,1,30120,1)
			Msg2Player("B�n nh�n ���c 1 B�nh B�ch Hoa");	
		elseif nRand <= 67 then
			AddItem(2,1,30118,2)
			Msg2Player("B�n nh�n ���c 2 Hoa C�c");	
		else
			AddItem(2,0,351,1)
			Msg2Player("B�n nh�n ���c 1 L� Th�y");	
		end
		SetTask(VIET_0911_TASK_YANHUO_NUM, GetTask(VIET_0911_TASK_YANHUO_NUM) + 1);
		SetTask(VIET_0911_TASK_YANHUO_DATE, nDate);
		SetTask(VIET_0911_TASK_LAST_USE_TIME, GetTime());		
		WriteLogEx(VIET_0911_LOG_TITLE,"Ph�o hoa",10,"�i�m danh v�ng")
	end
end