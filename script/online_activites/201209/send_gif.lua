--2012��8����ʳ�̻
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_201209_ACITIVITY_ID = 73;

VET_201209_NPC = "<color=green>Ch� T�u L�u:<color>";

VET_201209_Say_Tb = {
	"T�i h� mu�n ��ng g�p N��c Hoa Kh� 1 cho ch� em Ph� N� (ti�u hao 25 N��c Hoa Kh� 1 + 25 V�ng)/send_one_201209",
	"T�i h� mu�n ��ng g�p N��c Hoa Kh� 2 cho ch� em Ph� N� (ti�u hao 25 N��c Hoa Kh� 2 + 25 V�ng)/send_two_201209",
	"T�i h� mu�n ��ng g�p N��c Hoa Kh� 1 + N��c Hoa Kh� 2 cho ch� em Ph� N� (ti�u hao 25 N��c Hoa Kh� 1 + 25 N��c Hoa Kh�  2 + 25 V�ng)/send_both_201209",
};

VET_201209_ExcAw_TaskGroup = TaskManager:Create(10,3);
VET_201209_ExcAw_TaskGroup.DaySeq = 1;
VET_201209_ExcAw_TaskGroup.Times1 = 2;
VET_201209_ExcAw_TaskGroup.Times2 = 3;
VET_201209_ExcAw_TaskGroup.Times3 = 4;

Max_Count_201209 = 8; --ÿ�쵥�����8��
Exp_Award_Normal1_201209 = 6500000;
Exp_Award_Normal2_201209 = 12000000;
Zhenqi_Award1_201209 = 10;
Zhenqi_Award2_201209 = 30;
Item_Count1_201209 = 25;
Item_Count2_201209 = 25;
Coin_Consume_201209 = 25;
Item_table1_201209 = {2,1,30444,"N��c Hoa Kh� 1"};
Item_table2_201209 = {2,1,30445,"N��c Hoa Kh� 2"};
Acitivity_log1_201209 = "Ho�t ��ng ph� T�t Ph� N�";
Acitivity_log2_201209 = "T�ng N��c Hoa Kh�";

strMsg2Player1_201209 = "T�ng N��c Hoa Kh� 1 %d/%d";
strMsg2Player2_201209 = "T�ng N��c Hoa Kh�2 %d/%d";
strMsg2Player3_201209 = "T�ng N��c Hoa Kh� 1 v� N��c Hoa Kh� 2 %d/%d";


--������
Vet_201209_Award  = {
    {1, 1919, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
    {1, 1502, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2918, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 888, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 111, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 4, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {3, 2658, 990000, 1},
};
Vet_201209_Award_Special  = {
    {1, 1919, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
    {1, 1838, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "��i ��nh H�n ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 2525, 990000, 1},
    {3, 123, 9990000, 1},
};

function send_one_201209()
	if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count_201209));
		return 0;
	end

	if GetItemCount(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3]) < Item_Count1_201209 then
		Talk(1,"",VET_201209_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1_201209[4],Item_Count1_201209));
		return 0;
	end
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3],Item_Count1_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times1,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal1_201209 + 1000000);
			if GetTask(3052) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal1_201209 - 1500000);
			AwardGenuineQi(Zhenqi_Award1_201209);
			if GetTask(3052) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal1_201209);
		if GetTask(3052) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nh�n th�nh c�ng", 1, "Ph�n th��ng d�ng 1")
	Msg2Player(format(strMsg2Player1_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times1),Max_Count_201209));
end


function send_two_201209()
	if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count_201209));
		return 0;
	end

	if GetItemCount(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3]) < Item_Count2_201209 then
		Talk(1,"",VET_201209_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2_201209[4],Item_Count2_201209));
		return 0;
	end
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3],Item_Count2_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times2,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal1_201209 + 1000000);
			if GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal1_201209 - 1500000);
			AwardGenuineQi(Zhenqi_Award1_201209);
			if GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal1_201209);
		if GetTask(3053) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nh�n th�nh c�ng", 1, "Ph�n th��ng d�ng 2")
	Msg2Player(format(strMsg2Player2_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times2),Max_Count_201209));
end


function send_both_201209()
		if condition_check() == 0 then
		return 0;
	end

	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3) >= Max_Count_201209 then
		Talk(1,"",VET_201209_NPC..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count_201209));
		return 0;
	end
	
	if GetItemCount(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3]) < Item_Count1_201209 then
		Talk(1,"",VET_201209_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1_201209[4],Item_Count1_201209));
		return 0;
	end
	
	if GetItemCount(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3]) < Item_Count2_201209 then
		Talk(1,"",VET_201209_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2_201209[4],Item_Count2_201209));
		return 0;
	end
	
	if GetCash() < Coin_Consume_201209*10000 then
		Talk(1,"",VET_201209_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume_201209));
		return 0;
	end
	
	if DelItem(Item_table1_201209[1],Item_table1_201209[2],Item_table1_201209[3],Item_Count1_201209) ~= 1 then return 0; end
	if DelItem(Item_table2_201209[1],Item_table2_201209[2],Item_table2_201209[3],Item_Count2_201209) ~= 1 then return 0; end
	if Pay(Coin_Consume_201209 * 10000) ~= 1 then return 0; end
	
	VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times3,VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3)+1);
	
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3) == Max_Count_201209 then
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Normal2_201209 + 5500000);
			if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		else
			gf_Modify("Exp",Exp_Award_Normal2_201209 - 2000000);
			AwardGenuineQi(Zhenqi_Award2_201209);
			if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
				gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			else
				gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
			end
		end
	else
		gf_Modify("Exp",Exp_Award_Normal2_201209);
		if GetTask(3052) < 2000 or GetTask(3053) < 2000 then
		--	gf_EventGiveRandAward(Vet_201209_Award,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		else
		--	gf_EventGiveRandAward(Vet_201209_Award_Special,10000,1,Acitivity_log1_201209,Acitivity_log2_201209)
		end
	end
	gf_WriteLogEx("HOAT DONG PHU THANG 10", "nh�n th�nh c�ng", 1, "Ph�n th��ng d�ng 3")	
	Msg2Player(format(strMsg2Player3_201209, VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.Times3),Max_Count_201209));
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201209_NPC.."Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(3,100," ") ~= 1 then
			Talk(1,"",VET_201209_NPC.."Kh�ng gian h�nh trang kh�ng ��")
	    return 0
	end
	if VET_201209_ExcAw_TaskGroup:GetTask(VET_201209_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times1,0)		
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times2,0)	
		VET_201209_ExcAw_TaskGroup:SetTask(VET_201209_ExcAw_TaskGroup.Times3,0)
	end
	return 1;
end