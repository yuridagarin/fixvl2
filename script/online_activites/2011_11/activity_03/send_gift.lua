--by liubo
--ʥ���������ű�

Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
tSTRING_201111_ACTIVITY_TB = {
	[1] = "Ta mu�n t�ng qu� cho c�c em nh� trong th�nh th�",
	[2] = "Nh�n v�t c�p 79 tr� l�n, �� h�c k� n�ng c�p 55 m�i c� th� tham gia ho�t ��ng",
	[3] = "C�c h� ch� ���c t�ng qu� t�i �a <color=green>%d<color> l�n m�i ng�y",
	[4] = "H�p qu� trong h�nh trang c�c h� kh�ng �� <color=green>%d<color>",
	[5] = "Thao t�c th�t b�i, h�y th� l�i",
	[6] = "Ta s� chuy�n t�m l�ng th�nh c�a thi�u hi�p ��n c�c em nh� trong th�nh th� (L�n %d)",
	[7] = "��i hi�p �� s� d�ng h�t �i�m trong ng�y h�m nay, vui l�ng quay l�i v�o ng�y mai!!!"
}

VET_201111_SHENGDANGIFT_AWARD = {
    {1, 25, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
    {1, 10, "C�y T� Linh", {2, 1, 30269, 1}, 7 * 24 * 3600},
    {1, 20, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 10, "C�y B�t Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 10, "�u ��", {2, 1, 30178, 12}, 0},
    {3, 25, 60000, 1},
};

VET_201111_SHENGDANGIFT_ID = 49 --�ID
VET_201111_SHENGDANGIFT_MAXTIMES = 6 --������
VET_201111_SHENGDANGIFT_EXP = 2500000 --��������
VET_201111_SHENGDANGIFT_DELNUM  = 10  --�۳�����
--���������
VET_201111_SHENGDANGIFT = TaskManager:Create(4,3)
VET_201111_SHENGDANGIFT.DaySeq = 1
VET_201111_SHENGDANGIFT.Times = 2

function VET_201111_ShengdanGiftDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_SHENGDANGIFT_ID) == 1 then
		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TB[1].."/send_gift")
	end
    return tbSayDialog, szSayHead 
end

function send_gift()
	local nLevel = GetLevel()
	local nMax_Exp = 15000000
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_ACTIVITY_TB[2])
		return 0
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.DaySeq,zgc_pub_day_turn())
		VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.Times,0)
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) >= VET_201111_SHENGDANGIFT_MAXTIMES then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TB[3],VET_201111_SHENGDANGIFT_MAXTIMES))
		return 0
	end
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) *  VET_201111_SHENGDANGIFT_EXP >= nMax_Exp then
		Talk(1,"",tSTRING_201111_ACTIVITY_TB[7])
		return 0
	end
	if GetItemCount(2,1,30349) < 10 then
		Talk(1,"",format(tSTRING_201111_ACTIVITY_TB[4],VET_201111_SHENGDANGIFT_DELNUM))
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[3])
        return 0
	end
	if DelItem(2,1,30349,10) == 0 then
		Msg2Player(tSTRING_201111_ACTIVITY_TB[5])
		return 0
	end
	VET_201111_SHENGDANGIFT:SetTask(VET_201111_SHENGDANGIFT.Times,VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times)+1)
	ModifyExp(VET_201111_SHENGDANGIFT_EXP)
	Msg2Player("B�n nh�n ���c "..VET_201111_SHENGDANGIFT_EXP.." �i�m kinh nghi�m")
	gf_WriteLogEx("Tang qua noel" ,"nh�n 2500000 �i�m kinh nghi�m")
	if VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times) == VET_201111_SHENGDANGIFT_MAXTIMES then
		gf_EventGiveRandAward(VET_201111_SHENGDANGIFT_AWARD,100,1,"Tang qua noel","T�ng qu� l�n th� 6 nh�n ���c ph�n th��ng")
	end
	Msg2Player(format(tSTRING_201111_ACTIVITY_TB[6],VET_201111_SHENGDANGIFT:GetTask(VET_201111_SHENGDANGIFT.Times)))
end
