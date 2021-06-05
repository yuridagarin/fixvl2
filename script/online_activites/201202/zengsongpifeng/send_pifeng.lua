--by liubo 
--2012��3�¹��ʸ�Ů�ڸ��

Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_201202_SENDPIFENG_ID = 57; 
VET_201202_SENDPIFENG_Exp1 = 2000000;
VET_201202_SENDPIFENG_Exp2 = 1000000;
VET_201202_SENDPIFENG_DelItemNum = 8;
VET_201202_SENDPIFENG_DelGold = 3; --����3J
VET_201202_SENDPIFENG_SendCount = 8;--8��

VET_201202_SENDPIFENG_TASK = TaskManager:Create(3,5);
VET_201202_SENDPIFENG_TASK.Num = 1;
VET_201202_SENDPIFENG_TASK.DaySeq = 2;

VET_201202_SENDPIFENG_AWARD1 = {
	  {1, 1850, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
  	  {1, 1502, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    	  {1, 2929, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	  {1, 1010, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
	  {1, 51, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	  {3, 2658, 830000, 1},
};

VET_201202_SENDPIFENG_AWARD2 = {
	{1, 18020, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
    	{1, 15020, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
	{1, 38410, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	{1, 5218, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    	{1, 2000, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	{1, 2, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    	{3, 20330, 830000, 1},
    	{3, 1000, 8300000, 1},
};

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 120312 or nDate > 120408 then
		Talk(1, "", "�� h�t h�n t�ng qu� cho ch� em Ph� N�!")
		return
	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ch�o m�ng l� qu�c t� Ph� N� 8 - 3. B�n h�y t�ng qu� cho ch� em Ph� N�:"
	local tbSayDialog = {};
	local nSaySize = 0;

	tinsert(tbSayDialog, "Ta mu�n t�ng Phi Phong Ho�ng Kim cho ch� em Ph� N� (8 phi phong Ho�ng Kim + 3 v�ng/deal_send")
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
	
end

function deal_send()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.DaySeq,zgc_pub_day_turn())
		VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.Num,0)
	end
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num) >= VET_201202_SENDPIFENG_SendCount then
		Talk(1,"",format("M�i ng�y gi�i h�n t�ng <color=green>%d<color> l�n Ho�ng Kim Phi Phong",VET_201202_SENDPIFENG_SendCount));
		return 0;
	end
	if GetItemCount(2,1,30362) < VET_201202_SENDPIFENG_DelItemNum then 
		Talk(1,"",format("Phi Phong trong h�nh trang kh�ng �� <color=green>%d<color>",VET_201202_SENDPIFENG_DelItemNum))
		return 0;
	end
	if GetCash() < VET_201202_SENDPIFENG_DelGold*10000 then
		Talk(1,"",format("Ti�n v�ng trong h�nh trang kh�ng �� <color=grenn>%d<color>",VET_201202_SENDPIFENG_DelGold))
		return 0;
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
    return 0
	end
	if DelItem(2,1,30362,VET_201202_SENDPIFENG_DelItemNum) ~= 1 then
		return 0
	end
	if Pay(VET_201202_SENDPIFENG_DelGold*10000) ~= 1 then
		return 0
	end
	VET_201202_SENDPIFENG_TASK:SetTask(VET_201202_SENDPIFENG_TASK.Num,VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num)+1);
	if VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num) == VET_201202_SENDPIFENG_SendCount then
		gf_Modify("Exp",VET_201202_SENDPIFENG_Exp2);
		--\script\misc\taskmanager.lua�������2783��¼�Ƿ���ȡ���ս���
		if GetTask(2783) == 0 then
		 	gf_EventGiveRandAward(VET_201202_SENDPIFENG_AWARD1,10000,1,"QUOC TE PHU NU","Ph�n th��ng t�ng qu� l�n th� 8");
		else
			gf_EventGiveRandAward(VET_201202_SENDPIFENG_AWARD2,100000,1,"QUOC TE PHU NU","Ph�n th��ng t�ng qu� l�n th� 8");
		end		
	else
		gf_Modify("Exp",VET_201202_SENDPIFENG_Exp1);
	end
	Msg2Player(format("T�t c� ch� em ph� n� trong th�nh �� nh�n ���c qu� Qu�c T� Ph� N� c�a b�n r�i (l�n th� %d)",VET_201202_SENDPIFENG_TASK:GetTask(VET_201202_SENDPIFENG_TASK.Num)))
end
