--by liubo
--Ԫ����ӿ�interface
--1,include this file 
--2,tinsert(your table,VET_201111_YUANDAN_TITLE)

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201111_YUANDAN_TITLE = "Hoat dong tet Duong lich"

VET_201111_YUANDAN_AWARD  = {
    {1, 6, "B�n Long b�ch", {2, 1, 1000, 5}, 7 * 24 * 3600},
    {1, 6, "Nh� �", {0, 102, 23, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
    {1, 6, "C�t T��ng", {0, 102, 22, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
    {1, 39, "Qu� Hoa T�u", {2, 0, 189, 179}, 0},
    {1, 12, "�u ��", {2, 1, 30178, 22}, 0},
    {2, 31, 3900000, 1},
};

VET_201111_YUANDAN_TASK = TaskManager:Create(1,8)
VET_201111_YUANDAN_TASK.Times = 1
VET_201111_YUANDAN_TASK.Day = 2
VET_201111_YUANDAN_TASK.Limit = 19

function get_new_years_award()
	if gf_CheckEventDateEx(47) ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[1])
		return 0
	end
	Say("C�c h� c�n mang theo <color=green> 200<color> Thi�n Th�ch +<color=green> 100 <color> v�ng �� nh�n ph�n th��ng n�m m�i",2,"��ng �/ensure","�� ta suy ngh� l�i/do_nothing")
end

function ensure()
	if VET_201111_YUANDAN_TASK:GetTask(VET_201111_YUANDAN_TASK.Limit) >= 30 then
		Talk(1,"","B�n �� h�t l�n nh�n th��ng T�t D��ng L�ch")
		return 0
	end
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[2])
		return 0
	end
	if gf_Judge_Room_Weight(5,179," ") ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[3])
        return 0
    end
	if GetItemCount(2,2,8) < 200 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[4])
		return 0
	end
	--�жϴ���
	if VET_201111_YUANDAN_TASK:GetTask(VET_201111_YUANDAN_TASK.Day) ~= zgc_pub_day_turn() then 
		VET_201111_YUANDAN_TASK:SetTask(VET_201111_YUANDAN_TASK.Day,zgc_pub_day_turn())
		VET_201111_YUANDAN_TASK:SetTask(VET_201111_YUANDAN_TASK.Times,0)
	end
	
	if VET_201111_YUANDAN_TASK:GetTask(VET_201111_YUANDAN_TASK.Times) >= 3 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[5])
		return 0
	end
	if Pay(1000000) == 1 then
		if DelItem(2,2,8,200) ~= 1 then
			return 0
		end
		gf_EventGiveRandAward(VET_201111_YUANDAN_AWARD,100,VET_201111_YUANDAN_TITLE,"Ph�n th��ng n�m m�i")
		VET_201111_YUANDAN_TASK:SetTask(VET_201111_YUANDAN_TASK.Times,VET_201111_YUANDAN_TASK:GetTask(VET_201111_YUANDAN_TASK.Times)+1)
		VET_201111_YUANDAN_TASK:SetTask(VET_201111_YUANDAN_TASK.Limit,VET_201111_YUANDAN_TASK:GetTask(VET_201111_YUANDAN_TASK.Limit)+1)
		return 1
	else
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[6])
		return 0
	end
end

function do_nothing()
	--do nothing
end