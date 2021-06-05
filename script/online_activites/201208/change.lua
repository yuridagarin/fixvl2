--201209����϶�ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

Npc_Name_201208 = "<color=green>H�ng Nga: <color>";

Npc_Say_Title_201208 = "T�ng v�t ph�m Trung Thu cho Thi�u Nhi!";

Npc_Say_Dialog_201208 = {
	"T�i h� mu�n t�ng B�nh N��ng (ti�u hao 25 B�nh N��ng + 25 V�ng) /exchange_one",
	"T�i h� mu�n t�ng B�nh D�o (ti�u hao 25 B�nh D�o + 25 V�ng) /exchange_two",
	"T�i h� mu�n t�ng l�ng ��n Trung Thu (ti�u hao 25 B�nh N��ng + 25 B�nh D�o + 25 V�ng)/exchange_both",
	"T�i h� mu�n nh�n ph�n th��ng 'Y�u Thi�u Nhi ' (ch� k�ch ho�t th�nh c�ng khi s� d�ng 06 l�n)/super_award",
	"T�i h� ch� xem qua th�i/do_nothing",
}

VET_201208_ExcAw_TaskGroup = TaskManager:Create(7,3);
VET_201208_ExcAw_TaskGroup.DaySeq = 1;
VET_201208_ExcAw_TaskGroup.Times1 = 2;
VET_201208_ExcAw_TaskGroup.Times2 = 3;
VET_201208_ExcAw_TaskGroup.Times3 = 4;
VET_201208_ExcAw_TaskGroup.Tag = 5;

Max_Count = 6; --ÿ�쵥�����8��
Exp_Award_Normal1 = 6000000;
Exp_Award_Normal2 = 12000000;
Item_Count1 = 25;
Item_Count2 = 25;
Coin_Consume = 25;
Item_table1 = {2,1,30433,"B�nh N��ng "};
Item_table2 = {2,1,30434,"B�nh D�o"};

Acitivity_log1 = "HOAT DONG PHU THANG 9";
Acitivity_log2 = "Vui c�ng ch� H�ng";

strMsg2Player1 = "T�ng B�nh N��ng %d/%d";
strMsg2Player2 = "T�ng B�nh D�o %d/%d";
strMsg2Player3 = "T�ng l�ng ��n Trung Thu %d/%d";

--������
Vet_201208_Award  = {
	{1, 2525, "B�ng th�ch", {2, 1, 149, 2}, 0},
    {1, 1919, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
    {1, 1838, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "��i ��nh H�n ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 123, 9990000, 1},
};
Vet_201208_Award_Special  = {
	{1, 2525, "B�ng th�ch", {2, 1, 149, 3}, 0},
    {1, 1515, "Nh�n S�m V�n N�m", {2, 1, 30071, 4}, 0},
    {1, 2020, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 678, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {1, 73, "��i ��nh H�n ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {1, 2020, "M�nh Thi�n Cang", {2, 1, 30390, 100}, 0},
    {3, 159, 9990000, 1},
};

function main()
	Say(Npc_Name_201208..Npc_Say_Title_201208,getn(Npc_Say_Dialog_201208),Npc_Say_Dialog_201208);
end

function exchange_one()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1) >= Max_Count then
		Talk(1,"",Npc_Name_201208..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1 then
		Talk(1,"",Npc_Name_201208..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1[4],Item_Count1));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",Npc_Name_201208..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times1,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1)+1);
	gf_Modify("Exp",Exp_Award_Normal1);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award,10000,1,Acitivity_log1,Acitivity_log2);
	--�󶨻�ⱬһ��
	if Vet_201208_Award[nRand][3] == "��i ��nh H�n " then
		Msg2Global(format("Ch�c m�ng %s may m�n nh�n ���c ph�n th��ng %s x %d",GetName(),Vet_201208_Award[nRand][3],Vet_201208_Award[nRand][4][4]));
	end
	Msg2Player(format(strMsg2Player1, VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1),Max_Count))
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nh�n th�nh c�ng", 1, "Ph�n th��ng d�ng 1")

end

function exchange_two()	
	if condition_check() == 0 then
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2) >= Max_Count then
		Talk(1,"",Npc_Name_201208..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2 then
		Talk(1,"",Npc_Name_201208..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2[4],Item_Count2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",Npc_Name_201208..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times2,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2)+1);
	gf_Modify("Exp",Exp_Award_Normal1);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award,10000,1,Acitivity_log1,Acitivity_log2)
	--�󶨻�ⱬһ��
	if Vet_201208_Award[nRand][3] == "��i ��nh H�n " then
		Msg2Global(format("Ch�c m�ng %s may m�n nh�n ���c ph�n th��ng %s x %d",GetName(),Vet_201208_Award[nRand][3],Vet_201208_Award[nRand][4][4]));
	end
	Msg2Player(format(strMsg2Player2, VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2),Max_Count));
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nh�n th�nh c�ng", 1, "Ph�n th��ng d�ng 2")
end

function exchange_both()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3) >= Max_Count then
		Talk(1,"",format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1 then
		Talk(1,"",Npc_Name_201208..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1[4], Item_Count1));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2 then
		Talk(1,"",Npc_Name_201208..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2[4],Item_Count2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",Npc_Name_201208..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1) ~= 1 then return 0; end
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times3,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3)+1);
	gf_Modify("Exp",Exp_Award_Normal2);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award,10000,1,Acitivity_log1,Acitivity_log2)
	--�󶨻�ⱬһ��
	if Vet_201208_Award[nRand][3] == "��i ��nh H�n " then
		Msg2Global(format("Ch�c m�ng %s may m�n nh�n ���c ph�n th��ng %s x %d",GetName(),Vet_201208_Award[nRand][3],Vet_201208_Award[nRand][4][4]));
	end
	Msg2Player(format(strMsg2Player3,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3),Max_Count));
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nh�n th�nh c�ng", 1, "Ph�n th��ng c� 2 d�ng")
end

function super_award()
	if condition_check() == 0 then
		return 0;
	end
	local nFlag = 0;
	local strMsg = "Ch�a �� �i�u ki�n nh�n ph�n th��ng:  \n";
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Tag) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng r�i")
		return 0;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player1,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times1),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player2,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times2),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player3,VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.Times3),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if nFlag == 1 then
		Talk(1,"",strMsg);
		return 0;
	end
	VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Tag,1);
	local nRand = gf_EventGiveRandAward(Vet_201208_Award_Special,10000,1,Acitivity_log1,Acitivity_log2)
	--�󶨻�ⱬһ��
	if Vet_201208_Award_Special[nRand][3] == "��i ��nh H�n " then
		Msg2Global(format("Ch�c m�ng %s may m�n nh�n ���c ph�n th��ng %s x %d",GetName(),Vet_201208_Award_Special[nRand][3],Vet_201208_Award_Special[nRand][4][4]));
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 9", "nh�n th�nh c�ng", 1, "Ph�n th��ng ��c bi�t")
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",Npc_Name_201208.."Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(3,100) ~= 1 then
			Talk(1,"",Npc_Name_201208.."Kh�ng gian h�nh trang kh�ng ��")
	    return 0
	end
	if VET_201208_ExcAw_TaskGroup:GetTask(VET_201208_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times1,0)		
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times2,0)	
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Times3,0)
		VET_201208_ExcAw_TaskGroup:SetTask(VET_201208_ExcAw_TaskGroup.Tag,0)
	end
	return 1;
end

function do_nothing()
--do nothing
end