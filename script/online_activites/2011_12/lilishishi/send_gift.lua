--by liubo
--�����������ǻ�ű�

Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201112_LILISHISHI_ID = 52 --�ID
VET_201112_LILISHISHI_MAXTIMES = 8 --������
VET_201112_LILISHISHI_EXP = 2500000 --��������
VET_201112_LILISHISHI_DELNUM  = 10  --�۳�����
VET_201112_LILISHISHI_MAXEXP = 20000000
--���������
VET_201112_LILISHISHI = TaskManager:Create(7,1)
VET_201112_LILISHISHI.DaySeq = 1
VET_201112_LILISHISHI.Times = 2

VET_201112_LILISHISHI_AWARD = {
	  {1, 1250, "C�y T� Linh", {2, 1, 30269, 1}, 7 * 24 * 3600},
    {1, 1250, "C�y B�t Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 2000, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 1000, "�u ��", {2, 1, 30178, 10}, 0},
    {1, 1000, "Xo�i", {2, 1, 30172, 10}, 0},
    {3, 3500, 680000, 1},
}

tSTRING_201112_ACTIVITY_TB = {
	[1] = "Ta mu�n t�ng l� x� cho c�c em nh� trong th�nh",
	[2] = "Nh�n v�t c�p 79 tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c 1 k� n�ng c�p 55 m�i c� th� tham gia",
	[3] = "M�i ng�y thi�u hi�p ch� c� th� t�ng <color=green>%d<color> l�n",
	[4] = "L� x� trong h�nh trang thi�u hi�p kh�ng �� <color=green>%d<color>",
	[5] = "Thao t�c th�t b�i, h�y th� l�i",
	[6] = "Ta s� chuy�n t�m l�ng th�nh c�a thi�u hi�p ��n c�c em nh� trong th�nh th� (L�n %d)",
	[7] = "Kh�ng c�n ��u",
}

----------------------------------------
--interface for vn
VET_201112_SENDGIFT_TABLE = tSTRING_201112_ACTIVITY_TB[1].."/send_gift";
VET_201112_SENDGIFT_EXIT = tSTRING_201112_ACTIVITY_TB[7].."/do_nothing";
--example:
--Include("this File")
function send_gift()
	local tbSay = {};
	local nSaySize = 0;
	local szSayHead = "L� X� n�m m�i"
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20120123 and nDate <= 20120201 then
		tinsert(tbSay,"��ng �/send_gift_accept");
		tinsert(tbSay,VET_201112_SENDGIFT_EXIT);		--[Optional]
	end
	nSaySize = getn(tbSay);
	Say(szSayHead, nSaySize, tbSay);
end
----------------------------------------



function send_gift_accept()
	if gf_CheckEventDateEx(VET_201112_LILISHISHI_ID) ~= 1 then
		Talk(1,"","Event �� h�t h�n!")
		return 0;
	end
	local nLevel = GetLevel()
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201112_ACTIVITY_TB[2])
		return 0
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.DaySeq) ~= zgc_pub_day_turn() then
		VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.DaySeq,zgc_pub_day_turn())
		VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.Times,0)
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) * VET_201112_LILISHISHI_EXP >= VET_201112_LILISHISHI_MAXEXP then
		Talk(1,"","Thi�u hi�p �� nh�n �� �i�m L� X� trong ng�y h�m nay, vui l�ng quay l�i v�o ng�y mai!")
		return 0
	end
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) >= VET_201112_LILISHISHI_MAXTIMES then
		Talk(1,"",format(tSTRING_201112_ACTIVITY_TB[3],VET_201112_LILISHISHI_MAXTIMES))
		return 0
	end
	if GetItemCount(2,1,30355) < 10 then
		Talk(1,"",format(tSTRING_201112_ACTIVITY_TB[4],VET_201112_LILISHISHI_DELNUM))
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"",tSTRING_MR_WHITE_NPC.."Kh�ng gian h�nh trang kh�ng ��")
        return 0
	end
	if DelItem(2,1,30355,10) == 0 then
		Msg2Player(tSTRING_201112_ACTIVITY_TB[5])
		return 0
	end
	VET_201112_LILISHISHI:SetTask(VET_201112_LILISHISHI.Times,VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times)+1)
	gf_Modify("Exp",VET_201112_LILISHISHI_EXP)
	if VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times) == VET_201112_LILISHISHI_MAXTIMES then
		gf_EventGiveRandAward(VET_201112_LILISHISHI_AWARD,10000,1,"Hoat dong thang 1 nam 2012","L�n t�ng qu� th� 8 nh�n ���c ph�n th��ng")
	end
	Msg2Player(format(tSTRING_201112_ACTIVITY_TB[6],VET_201112_LILISHISHI:GetTask(VET_201112_LILISHISHI.Times)))
end

function do_nothing()
end