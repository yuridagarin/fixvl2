--filename:guiyulaolao_npc.lua
--create date:2006-01-22
--author:yanjun
--describe:�������ѽű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex,30)
	SetNpcScript(npcIndex,"")
	if CanAcceptTask(TASK_LOVESTORY3,5) == 1 then
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY3,6)
			TaskTip("B�o tin m�ng cho Ninh Th�i Th�n")
		end
		PlayerIndex = OldPlayerIndex
	else
		Say("Nhi�m v� th�t b�i, kh�ng ph�i l� ng��i nh�n nhi�m v�, h�y v� g�p Ninh Th�i Th�n.",0)
	end
	
	if AllTaskComplete() ==1 then
		TaskTip("H�y ��n Nguy�t l�o l�nh th��ng.")
	end
end