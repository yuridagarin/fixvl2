--filename:����.lua
--create date:2005-12-23
--author:yanjun
--describe:ְ��NPC�ű�
Include("\\script\\online\\Ԫ���\\yuandan_head.lua")

function main()
	SetDeathPunish(0)	--ȷ���������ͷ�
	if GetLevel() < 10 then	--С�ڣ��������ܲμ�
		Say("��ng c�p c�a ng��i th�p h�n <color=red>10<color> c�ng mu�n tham gia �o�t k� �? H�y r�n luy�n th�m v�i ba n�m n�a nh�!",0)
		return 0
	end
	if GetPlayerRoute() == 0 then	--û���������߲��ܲμ�
		Say("Ng��i ch�i ph�i gia nh�p m�n ph�i m�i c� th� tham gia Nguy�n ��n �o�t k�.",0)
		return 0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--�µ�һ�죬�Ѷ�������0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Say("B�n �� �o�t k� th�nh c�ng, h�m nay kh�ng th� tham gia ti�p, ng�y mai h�y quay l�i nh�!",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("M�i ng��i ch� c� th� mang 1 ti�u k�.",0)
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		SetDeathScript("\\script\\online\\Ԫ���\\playerdeath.lua")
		npcIndex = GetTriggeringUnit()
		SetNpcLifeTime(npcIndex,0)
		SummonNpc("Ti�u s�-chi�n ��u","Ti�u k�")
		AddTitle(3,3)
		SetCurTitle(3,3)
		Msg2Player("B�n �� �o�t ���c ti�u k�, h�y mau giao cho �o�t ti�u gi�o ��u.")
		mapID,mapX,mapY = GetWorldPos()
		SetTaskTemp(MAP_ID,mapID)	--��¼�õ�����ʱ��ҵ�����
		SetTaskTemp(MAP_X,mapX)
		SetTaskTemp(MAP_Y,mapY)
		SetTaskTemp(TASK_FLAG_FOLLOW,1)
	end
end
