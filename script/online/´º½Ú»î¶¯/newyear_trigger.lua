--filename:newyear_trigger.lua
--create date:2006-01-06
--author:yanjun
--describe:���ڻ������
Include("\\script\\online\\���ڻ\\newyear_head.lua")

function material_killed()
	--20����50���������
	--����˥��=��ǰ����*��1-(��ҵȼ�-����ȼ�)/70��
	local nHour = tonumber(date("%H"))
	local N	--˥��ϵ��
	if nHour >= 0 and nHour <= 9 then --0�㵽10�㲻�����ϡ�
		N = 0
	elseif nHour >=12 and nHour <= 21 then
		N = 1
	else
		N = 0.25
	end 
	local npcIndex = GetTriggeringUnit()
	local npcLevel = GetUnitBaseStates(npcIndex,0)
	local Quotiety 
	if GetLevel() > npcLevel then
		Quotiety = 1 - (GetLevel() - npcLevel)/70
	else
		Quotiety = 1
	end
	if npcLevel >= 20 and npcLevel <= 50 then
	local nTemp = random(1,1000000)
		if nTemp <= 300000*Quotiety*N then
			AddItem(2,1,255,1)	--���
		elseif nTemp <= 580000*Quotiety*N then
			AddItem(2,1,256,1)	--ʮ����
		elseif nTemp <= 750000*Quotiety*N then
			AddItem(2,1,262,1)	--�ײ�
		elseif nTemp <= 810000*Quotiety*N then
			AddItem(2,1,260,1)	--�ܲ�
		elseif nTemp <= 850000*Quotiety*N then
			AddItem(2,1,263,1)	--�۲�
		elseif nTemp <= 870000*Quotiety*N then
			AddItem(2,1,264,1)	--�²�
		elseif nTemp <= 880000*Quotiety*N then
			AddItem(2,1,257,1)	--����
		elseif nTemp <= 885000*Quotiety*N then
			AddItem(2,1,258,1)	--����
		elseif nTemp <= 887500*Quotiety*N then
			AddItem(2,1,259,1)	--Ϻ��
		end
	end
end

function KillFollower_OnTimer()
	RemoveTrigger(GetRunningTrigger())
	KillFollower()
	SetTask(TASK_PET_BORN,0)
	Msg2Player("Qu� th�i gian, th� c�ng r�i kh�i b�n.")
end

function LeaveSnowMap()
	SetDeathPunish(1)
	for SkillID=843,851 do
		RemoveSkill(SkillID)	--���Ǵ�ѩ�̼���
	end
	SetFightState(0)
	SetDeathScript("")
	UseScrollEnable(1)
	SetTempRevPos(0,0,0)
	Msg2Player("Hoan ngh�nh l�n sau c�c b�n v�o b�n �� tuy�t �o�t b�o.")
end
