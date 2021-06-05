--by liubo
--�ͻ���ű�

Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua") 

tSTRING_201111_ACTIVITY_TWO = {
	[1] = "T�ng hoa ��n c�c v� s� ph� trong thi�n h�",
	[2] = "Nh�n v�t c�p 77 tr� l�n, �� h�c k� n�ng c�p 55 m�i c� th� tham gia ho�t ��ng",
	[3] = "Thi�u hi�p ch� c� th� t�ng hoa <color=green>%d<color> l�n",
	[4] = "Hoa S�n Tr� thi�u hi�p mang theo kh�ng �� <color=green>%d<color> hoa",
	[5] = "Thao t�c th�t b�i, h�y th� l�i",
	[6] = "C�c v� tr��ng m�n �� nh�n ���c t�m l�ng th�nh c�a c�c h� r�i (t�ng hoa l�n %d)",
}

VET_201111_SENDFLOWER_ID = 43 --�ID
VET_201111_SENDFLOWER_MAXTIMES = 6 --������
VET_201111_SENDFLOWER_EXP = 2500000 --��������
VET_201111_SENDFLOWER_DELNUM  = 10  --�۳�����
--���������
VET_201111_SEND_FLOWER = TaskManager:Create(2,6)
VET_201111_SEND_FLOWER.DaySeq = 1
VET_201111_SEND_FLOWER.Times = 2

function VET_201111_SendFlowerDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_SENDFLOWER_ID) == 1 then
		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TWO[1].."/send_flower")
	end
    return tbSayDialog, szSayHead 
end

function send_flower()
	local nLevel = GetLevel()
    if nLevel < 77  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_ACTIVITY_TWO[2])
		return 0
	end
	if VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.DaySeq,zgc_pub_day_turn())
		VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.Times,0)
	end
	if VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times) >= VET_201111_SENDFLOWER_MAXTIMES then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TWO[3],VET_201111_SENDFLOWER_MAXTIMES))
		return 0
	end
	if BigGetItemCount(2,1,30334) < 10 then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TWO[4],VET_201111_SENDFLOWER_DELNUM))
		return 0
	end
	if BigDelItem(2,1,30334,10) == 0 then
		Msg2Player(tSTRING_201111_ACTIVITY_TWO[5])
		return 0
	end
	VET_201111_SEND_FLOWER:SetTask(VET_201111_SEND_FLOWER.Times,VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times)+1)
	--gf_Modify("Exp",VET_201111_SENDFLOWER_EXP)
	ModifyExp(VET_201111_SENDFLOWER_EXP)
	WriteLogEx("Tang hoa Thay Co", " nh�n ���c "..VET_201111_SENDFLOWER_EXP.."  �i�m kinh nghi�m")
	Msg2Player("B�n nh�n ���c "..VET_201111_SENDFLOWER_EXP.."  �i�m kinh nghi�m")
	Msg2Player(format(tSTRING_201111_ACTIVITY_TWO[6],VET_201111_SEND_FLOWER:GetTask(VET_201111_SEND_FLOWER.Times)))
end

--��������
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end