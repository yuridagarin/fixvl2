--�������������npc��Ү�ɱ�ͼ
--by vivi
--2009-08-04
Include("\\script\\task\\world\\task_award.lua");

function OnDeath()
	local nOldPlayer = PlayerIndex;
	if GetTeamSize() == 1 or GetTeamSize() == 0 then
		if GetTask(1401) == 139 then
			TMZ_Task_Deal()
		end
	else
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetTask(1401) == 139 then
					TMZ_Task_Deal()
				end
			end
		end
		PlayerIndex = nOldPlayer;	
	end
end
--Ү�ɱ�ͼ������
function TMZ_Task_Deal()
	SetTask(1401,140);
	GivePlayerExp(SkeyTianmenzhen,"liaojunjunguan")
	Msg2Player("S�n t�m kh�p n�i c�ng kh�ng ph�t hi�n g�, h�y quay v� t�m M�c Qu� Anh h�i th�m tin t�c.");
	TaskTip("S�n t�m kh�p n�i c�ng kh�ng ph�t hi�n g�, h�y quay v� t�m M�c Qu� Anh h�i th�m tin t�c.");
end