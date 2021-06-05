--�һ����ű�
Include("\\script\\online\\spring2014\\sp_head.lua")

function main()
	sp_DailyReset();
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85, 1) ~= 1 then
			return 0;
	end
	local nTimes = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsDrop);
	if nTimes >= 3 then
		Talk(1,"",format("N�m m�i vui v�! ��i hi�p h�m nay �� nh�n h�t %d ph�n th��ng, h�y ��n ng�m hoa ��o v� nh�n th��ng v�o ng�y mai nh� !", 3));
		return 0;
	end
	--������60s
	if GetTime() - SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsChickTime) < 60 then
		--Talk(1,"",format("��ȴ�%d��ſɼ�������齱��ף��Һ���������", 60));
		return 0;
	end
	if random(1000) <= 500 then
		return 0;
	end
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsDrop, nTimes + 1);
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsChickTime, GetTime());
	local tAward = {
		{31, 40, "spths_Exp()", 1},
		{31, 40, "spths_ZhenQi()", 1},
		{31, 20, "spths_YinJuan()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1);
end

function spths_Exp()
	local tAward = {
		{2, 25, 100, 1},
		{2, 25, 1000, 1},
		{2, 25, 10000, 1},
		{2, 20, 100000, 1},
		{2, 5, 20132014, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event T�t Kingsoft", "��o Hoa th�");
end

function spths_ZhenQi()
	local tAward = {
		{31, 60, "AwardGenuineQi(10)", 1},
		{31, 30, "AwardGenuineQi(50)", 1},
		{31, 5, "AwardGenuineQi(100)", 1},
		{31, 4, "AwardGenuineQi(500)", 1},
		{31, 1, "AwardGenuineQi(1000)", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event T�t Kingsoft", "��o Hoa th�");
end

function spths_YinJuan()
	local tAward = {
		{31, 50, "ModifyYinJuan(10, 1)", 1},
		{31, 40, "ModifyYinJuan(100, 1)", 1},
		{31, 10, "ModifyYinJuan(1000, 1)", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event T�t Kingsoft", "��o Hoa th�");
end