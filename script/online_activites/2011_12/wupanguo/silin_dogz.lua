--�������޽ӿڽű�

Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201112_SILINDOGZ_FRUITS = {
	{2,1,30164},
	{2,1,30165},
	{2,1,30166},
	{2,1,30167},
	{2,1,30168},
	{2,1,30169},
	{2,1,30170},
	{2,1,30171},
	{2,1,30172},
	{2,1,30173},
	{2,1,30174},
	{2,1,30175},
	{2,1,30176},
	{2,1,30177},
	{2,1,30178},
	{2,1,30179},
	{2,1,30180},
	{2,1,30181},
	{2,1,30182},
	{2,1,30183},
}

VET_201112_SILINDOGZ_AWARD = {
	{1, 18, "B�n Long b�ch", {2, 1, 1000, 2}, 7 * 24 * 3600},
    	{1, 3, "Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1}, 7 * 24 * 3600},
    	{1, 9, "V� s�", {2, 0, 225, 2}, 0},
    	{1, 39, "Qu� Hoa T�u", {2, 0, 189, 68}, 0},
    	{1, 10, "H�ng bao", {2, 1, 508, 1}, 0},
    	{1, 21, "�u ��", {2, 1, 30178, 6}, 0},
}

VET_201112_SILINDOGZ_ID = 54
VET_201112_SILINDOGZ_COST = 68  
VET_201112_SILINDOGZ_DAYTIME = 1
VET_201112_SILINDOGZ_TOTALTIME = 20

VET_201112_SILINDOGZ_TASK = TaskManager:Create(9,1);
VET_201112_SILINDOGZ_TASK.DayTime = 1;
VET_201112_SILINDOGZ_TASK.ToTalTime = 2;
VET_201112_SILINDOGZ_TASK.DaySeq = 3;

----------------------------------------
--interface for vn
VET_201112_SILINDOGZ_TABLE = "Nh� Th�n Th� gh�p gi�p ta M�m Ng� Qu�/blag_blessing";
VET_201112_SILINDOGZ_EXIT = "Kh�ng c�n ��u/do_nothing";
--example:
--Include("this File")
--function main()
--local tbSay = {};
--	local nSaySize = 0;
--	local szSayHead = "M�m Ng� Qu� cho n�m m�i 2012"
--	local nDate = tonumber(date("%Y%m%d"))
-- 	if nDate >= 20120113 and nDate <= 20120201 then
--		tinsert(tbSay,"��ng �/blag_blessing");
--		tinsert(tbSay,VET_201112_SILINDOGZ_EXIT);  --[Optional]
--	end
--	nSaySize = getn(tbSay);
--	Say(szSayHead, nSaySize, tbSay);
--end
----------------------------------------

function blag_blessing()
	if gf_CheckEventDateEx(VET_201112_SILINDOGZ_ID) ~= 1 then
		Talk(1,"","Ho�t ��ng �� h�t h�n!");
		return 0;
	end
	Say(format("Thi�u hi�p c�n giao n�p <color=green>5<color> lo�i tr�i c�y (M�i lo�i <color=green>10<color> qu�) + %d v�ng",VET_201112_SILINDOGZ_COST),2,"X�c nh�n/ensure","�� ta suy ngh� l�i/do_nothing")
end

function do_nothing()
end

function ensure()
	local nLevel = GetLevel()
    if nLevel < 79  or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh�n v�t c�p 79 tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c 1 k� n�ng c�p 55 m�i c� th� tham gia");
		return 0
	end
	--������´���
	if VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.DaySeq,zgc_pub_day_turn());
		VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.DayTime,0);
	end
	if VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.DayTime) >= VET_201112_SILINDOGZ_DAYTIME then 
		Talk(1,"",format("M�m ng� qu� ch�c ph�c t�t xu�n m�i ng�y ch� c� th� nh�n ���c <color=green>%d<color> l�n",VET_201112_SILINDOGZ_DAYTIME));
		return 0;
	end
	if VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.ToTalTime) >= VET_201112_SILINDOGZ_TOTALTIME then 
		Talk(1,"",format("M�m ng� qu� ch�c ph�c m�i nh�n v�t gi�i h�n gh�p <color=green>%d<color> l�n",VET_201112_SILINDOGZ_TOTALTIME));
		return 0;
	end
	if GetCash() < VET_201112_SILINDOGZ_COST*10000 then
		Talk(1,"",format("Ng�n l��ng trong h�nh trang kh�ng �� <color=green>%d<color> v�ng",VET_201112_SILINDOGZ_COST));
		return 0;
	end
	local nTag = 0;
	local nCount = 0;
	local tPosInfo;
	for _,tPosInfo in VET_201112_SILINDOGZ_FRUITS do 
		if GetItemCount(tPosInfo[1],tPosInfo[2],tPosInfo[3]) >= 10 then
			nCount = nCount + 1;
		end
	end
	if nCount < 5 then
		Talk(1,"","C�n 5 lo�i tr�i c�y b�t k�, m�i lo�i <color=green>10<color> qu�.");
		return 0;
	end
	Pay(VET_201112_SILINDOGZ_COST*10000);
	nCount = 0;
	for _,tPosInfo in VET_201112_SILINDOGZ_FRUITS do 
		if GetItemCount(tPosInfo[1],tPosInfo[2],tPosInfo[3]) >= 10 and nCount < 5 then
			DelItem(tPosInfo[1],tPosInfo[2],tPosInfo[3],10);
			nCount = nCount + 1;
		end
	end
	VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.DayTime,1);
	VET_201112_SILINDOGZ_TASK:SetTask(VET_201112_SILINDOGZ_TASK.ToTalTime,VET_201112_SILINDOGZ_TASK:GetTask(VET_201112_SILINDOGZ_TASK.ToTalTime)+1);
	gf_Modify("Exp",20000000);
	gf_EventGiveRandAward(VET_201112_SILINDOGZ_AWARD,100,1,"Mam Ngu Qua","Ph�n th��ng M�m ng� qu�");	
end