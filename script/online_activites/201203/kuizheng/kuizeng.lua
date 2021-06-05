--2012��4�������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_201203_KuiZeng_tbTalkDialog = {
	"Trao t�ng gi�i th��ng cho nh�n s� c� c�ng lao trong server(l�n th� 8   t�ng qu� m�i ng�y s� nh�n ���c ph�n th��ng v�t ph�m t�ng th�m, ng��i ch�i ��t ��n gi�i h�n trong ho�t ��ng m� ti�c khao qu�n s� nh�n ���c ph�n th��ng v�t ph�m t�ng th�m phong ph� h�n)",
	"T�i h� mu�n phong t�ng Hu�n Ch��ng cho c�c nh�n s� c� c�ng v�i Server( Ti�u hao 25 Hu�n Ch��ng +25 v�ng)/get_xunzhang_award_ib",
	"T�i h� mu�n phong t�ng B�ng khen cho c�c nh�n s� c� c�ng v�i Server (Ti�u hao 25 B�ng khen +25 v�ng)/get_jiangzhuang_award_ib",
	"T�i h� mu�n phong t�ng B�ng Khen v� Hu�n Ch��ng cho c�c nh�n s� c� c�ng v�i Server( Ti�u hao 25 Hu�n Ch��ng + 25 B�ng Khen + 25 v�ng)/get_both_award_ib",
	"Kh�ng c�n ��u/do_nothing",
}

VET_201203_KuiZeng_TaskGroup = TaskManager:Create(6,2)
VET_201203_KuiZeng_TaskGroup.DaySeq = 1
VET_201203_KuiZeng_TaskGroup.Times1 = 2
VET_201203_KuiZeng_TaskGroup.Times2 = 3
VET_201203_KuiZeng_TaskGroup.Times3 = 4

--externs task eq 2000
--don't modify
Vet_201203_Final_Tag1 = 2826
Vet_201203_Final_Tag2 = 2827

Max_Count = 8 --ÿ�쵥�����8��
Exp_Award_Normal1 = 6500000
Exp_Award_Normal2 = 12000000
Exp_Award_Final1 = 5000000
Exp_Award_Final2 = 10000000
Item_XunZhang = 25
Item_JiangZhuang = 25
Coin_Consume = 25
--������
Vet_201203_Award  = {
    {1, 1850, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
    {1, 1502, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2929, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 51, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {3, 2658, 830000, 1},
};
Vet_201203_Award_Final  = {
    {1, 18020, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
    {1, 15020, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 38410, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 5218, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 2000, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 2, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {3, 20330, 830000, 1},
    {3, 1000, 8300000, 1},
};

function get_xunzhang_award_ib()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[3])
	        return 0
	end
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times1,0)
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times2,0)	
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times3,0)			
	end
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times1) >= 8 then
		Talk(1,"",format("M�i ng�y m�i gamer ch� giao n�p t�i �a<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30366) < Item_XunZhang then
		Talk(1,"",format("Trong h�nh trang kh�ng �� s� l��ng Hu�n Ch��ng <color=green>%d c�i <color>",Item_XunZhang));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",format("Trong h�nh trang kh�ng �� s� l��ng v�ng: <color=green>%d v�ng <color>",Coin_Consume));
		return 0;
	end
	if DelItem(2,1,30366,Item_XunZhang) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times1,VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times1)+1);
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times1) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201203_Final_Tag1) == 2000 then
			gf_EventGiveRandAward(Vet_201203_Award_Final,100000,1,"Ban t�ng ph�n th��ng t�i �a","Nh�n v�t  �n t�i �a ho�t ��ng M� Ti�c Khao Qu�n")
		else
			gf_EventGiveRandAward(Vet_201203_Award,10000,1,"Ban t�ng ph�n th��ng t�i �a","Nh�n v�t ch�a �n t�i �a ho�t ��ng M� Ti�c Khao Qu�n ")
		end
	end
	Msg2Player(format("��y l� l�n th� %d ��ng ��o t�ng Hu�n Ch��ng cho c�c nh�n s� c� c�ng v�i Server",VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times1)))
end


function get_jiangzhuang_award_ib()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[3])
	        return 0
	end
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times1,0)	
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times2,0)	
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times3,0)	
	end
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times2) >= 8 then
		Talk(1,"",format("M�i ng�y m�i gamer ch� giao n�p t�i �a<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30365) < Item_JiangZhuang then
		Talk(1,"",format("Trong h�nh trang kh�ng �� s� l��ng B�ng Khen <color=green>%d c�i <color>",Item_JiangZhuang));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",format("Trong h�nh trang kh�ng �� s� l��ng v�ng: <color=green>%d v�ng<color>",Coin_Consume));
		return 0;
	end
	if DelItem(2,1,30365,Item_JiangZhuang) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times2,VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times2)+1);
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times2) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201203_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201203_Award_Final,100000,1,"Ban t�ng ph�n th��ng t�i �a","Nh�n v�t  �n t�i �a ho�t ��ng M� Ti�c Khao Qu�n")
		else
			gf_EventGiveRandAward(Vet_201203_Award,10000,1,"Ban t�ng ph�n th��ng t�i �a","Nh�n v�t ch�a �n t�i �a ho�t ��ng M� Ti�c Khao Qu�n ")
		end
	end
	Msg2Player(format("��y l� l�n th� %d ��ng ��o t�ng B�ng khen cho c�c nh�n s� c� c�ng v�i Server",VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times2)))
end


function get_both_award_ib()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",tSTRING_MR_WHITE_NPC..tSTRING_201111_TABLE[3])
	        return 0
	end
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times1,0)
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times2,0)	
		VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times3,0)		
	end
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times3) >= 8 then
		Talk(1,"",format("M�i ng�y m�i gamer ch� giao n�p t�i �a<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30366) < Item_XunZhang then
		Talk(1,"",format("Trong h�nh trang kh�ng �� s� l��ng Hu�n Ch��ng <color=green>%d c�i <color>",Item_XunZhang));
		return 0;
	end
	if GetItemCount(2,1,30365) < Item_JiangZhuang then
		Talk(1,"",format("Trong h�nh trang kh�ng �� s� l��ng B�ng Khen <color=green>%d c�i <color>",Item_JiangZhuang));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",format("Trong h�nh trang kh�ng �� s� l��ng v�ng: <color=green>%d v�ng <color>",Coin_Consume));
		return 0;
	end
	if DelItem(2,1,30366,Item_XunZhang) ~= 1 then return 0; end
	if DelItem(2,1,30365,Item_JiangZhuang) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	VET_201203_KuiZeng_TaskGroup:SetTask(VET_201203_KuiZeng_TaskGroup.Times3,VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times3)+1);
	if VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times3) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal2);
	else
		gf_Modify("Exp",Exp_Award_Final2);
		if GetTask(Vet_201203_Final_Tag1) == 2000 and GetTask(Vet_201203_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201203_Award_Final,100000,1,"Ban t�ng ph�n th��ng t�i �a","Nh�n v�t  �n t�i �a ho�t ��ng M� Ti�c Khao Qu�n")
		else
			gf_EventGiveRandAward(Vet_201203_Award,10000,1,"Ban t�ng ph�n th��ng t�i �a","Nh�n v�t ch�a �n t�i �a ho�t ��ng M� Ti�c Khao Qu�n ")
		end
	end
	Msg2Player(format("��y l� l�n th� %d ��ng ��o t�ng Hu�n Ch��ng v� B�ng khen  cho c�c nh�n s� c� c�ng v�i Server",VET_201203_KuiZeng_TaskGroup:GetTask(VET_201203_KuiZeng_TaskGroup.Times3)))
end

function do_nothing()
end