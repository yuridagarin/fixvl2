--2012��6���л������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_ExcAw_ACITIVITY_ID = 64;

VET_ExcAw_NPC = "<color=green>Th��ng Nh�n Th�n B� :   <color>";

Vet_ExcAw_Say_Tb = {
	"T�i h� mu�n ��i B�nh � Tro l�y ph�n th��ng (ti�u hao 25 B�nh � Tro + 25 V�ng)/exchange_one",
	"Ta� h� mu�n ��i B�nh � Tro ��u �� l�y ph�n th��ng (ti�u hao 25 B�nh � Tro ��u ��  + 25 V�ng)/exchange_two",
	"T�i h� mu�n ��i B�nh � Tro v� B�nh � Tro ��u �� l�y ph�n th��ng (ti�u hao 25 B�nh � Tro + 25 B�nh � Tro ��u �� + 25 V�ng)/exchange_both",
};

VET_201205_ExcAw_TaskGroup = TaskManager:Create(10,2);
VET_201205_ExcAw_TaskGroup.DaySeq = 1;
VET_201205_ExcAw_TaskGroup.Times1 = 2;
VET_201205_ExcAw_TaskGroup.Times2 = 3;
VET_201205_ExcAw_TaskGroup.Times3 = 4;

--externs task eq 2000
--don't modify
Vet_201205_Final_Tag1 = 3052;
Vet_201205_Final_Tag2 = 3053;

Max_Count = 8; --ÿ�쵥�����8��
Exp_Award_Normal1 = 6500000;
Exp_Award_Normal2 = 12000000;
Exp_Award_Final1 = 5000000;
Exp_Award_Final2 = 10000000;
Item_QCJWJ = 25;
Item_BDSG = 25;
Coin_Consume = 25;
Item_table1 = {2,1,30382,"B�nh � Tro"};
Item_table2 = {2,1,30383,"B�nh � Tro ��u ��"};
Acitivity_log1 = "Ho�t ��ng ph� th�ng 6";
Acitivity_log2 = "��i ph�n th��ng";
Zhenqi_value1 = 10;
Zhenqi_value2 = 30;
--������
Vet_201205_Award  = {
    {1, 1850, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
    {1, 1502, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2929, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 51, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {3, 2658, 990000, 1},
};
Vet_201205_Award_Final  = {
    {1, 18020, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
    {1, 15020, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 38410, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 5218, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 2000, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 2, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {3, 20330, 990000, 1},
    {3, 1000, 9990000, 1},
};

function exchange_one()
	if condition_check() == 0 then
		return 0;
	end
	if VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times1) >= Max_Count then
		Talk(1,"",VET_ExcAw_NPC..format("M�i ng�y m�i gamer ch� giao n�p t�i �a<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_QCJWJ then
		Talk(1,"",VET_ExcAw_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1[4],Item_QCJWJ));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_ExcAw_NPC..format("Trong h�nh trang kh�ng �� <color=green>%d v�ng<color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_QCJWJ) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201205_ExcAw_TaskGroup:SetTask(VET_201205_ExcAw_TaskGroup.Times1,VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times1)+1);
	if VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times1) ~= Max_Count then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Final1+2500000);
		else
		 	if ActivityGetDailyGenuineQiLeftCapacity() < 1 then
		 		gf_Modify("Exp",Exp_Award_Final1+2500000);
		 	else
				gf_Modify("Exp",Exp_Award_Final1);
			end
			ActivityAwardGenuineQiDaily(Zhenqi_value1);
		end
		if GetTask(Vet_201205_Final_Tag1) == 2000 then
			gf_EventGiveRandAward(Vet_201205_Award_Final,100000,1,Acitivity_log1,Acitivity_log2)
		else
			gf_EventGiveRandAward(Vet_201205_Award,10000,1,Acitivity_log1,Acitivity_log2)
		end
	end
	Msg2Player(format("C�c h� �� l�n th� %d s� d�ng %s ��i ph�n th��ng r�i ", VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times1),Item_table1[4]))
end


function exchange_two()
	if condition_check() == 0 then
		return 0
	end
	if VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times2) >= Max_Count then
		Talk(1,"",VET_ExcAw_NPC..format("M�i ng�y m�i gamer ch� giao n�p t�i �a<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_BDSG then
		Talk(1,"",VET_ExcAw_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2[4], Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_ExcAw_NPC..format("Trong h�nh trang kh�ng �� <color=green>%d v�ng <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201205_ExcAw_TaskGroup:SetTask(VET_201205_ExcAw_TaskGroup.Times2,VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times2)+1);
	if VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times2) ~= Max_Count then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Final1+2500000);
		else
			if ActivityGetDailyGenuineQiLeftCapacity() < 1 then
		 		gf_Modify("Exp",Exp_Award_Final1+2500000);
		 	else
				gf_Modify("Exp",Exp_Award_Final1);
			end
			ActivityAwardGenuineQiDaily(Zhenqi_value1);
		end
		if GetTask(Vet_201205_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201205_Award_Final,100000,1,Acitivity_log1,Acitivity_log2)
		else
			gf_EventGiveRandAward(Vet_201205_Award,10000,1,Acitivity_log1,Acitivity_log2)
		end
	end
	Msg2Player(format("C�c h� �� l�n th� %d s� d�ng %s ��i ph�n th��ng r�i ",VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times2),Item_table2[4]))
end


function exchange_both()
	if condition_check() == 0 then 
		return 0;
	end
	if VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times3) >= Max_Count then
		Talk(1,"",format("M�i ng�y m�i gamer ch� giao n�p t�i �a<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_QCJWJ then
		Talk(1,"",VET_ExcAw_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1[4], Item_QCJWJ));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_BDSG then
		Talk(1,"",VET_ExcAw_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2[4],Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_ExcAw_NPC..format("Trong h�nh trang kh�ng �� <color=green>%d v�ng<color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_QCJWJ) ~= 1 then return 0; end
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201205_ExcAw_TaskGroup:SetTask(VET_201205_ExcAw_TaskGroup.Times3,VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times3)+1);
	if VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times3) ~= Max_Count then
		gf_Modify("Exp",Exp_Award_Normal2);
	else
		if MeridianGetLevel() < 1 then
			gf_Modify("Exp",Exp_Award_Final2+7500000);
		else
			if ActivityGetDailyGenuineQiLeftCapacity() < 1 then
		 		gf_Modify("Exp",Exp_Award_Final2+7500000);
		 	else
				gf_Modify("Exp",Exp_Award_Final2);
			end
			ActivityAwardGenuineQiDaily(Zhenqi_value2);
		end
		if GetTask(Vet_201205_Final_Tag1) == 2000 and GetTask(Vet_201205_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201205_Award_Final,100000,1,Acitivity_log1,Acitivity_log2)
		else
			gf_EventGiveRandAward(Vet_201205_Award,10000,1,Acitivity_log1,Acitivity_log2)
		end
	end
	Msg2Player(format("C�c h� l�n th� %d s� d�ng %s v� %s ��i ph�n th��ng r�i",VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.Times3),Item_table1[4],Item_table2[4]))
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_ExcAw_NPC.."Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",VET_ExcAw_NPC.."Kh�ng gian h�nh trang kh�ng ��")
	    return 0
	end
	if VET_201205_ExcAw_TaskGroup:GetTask(VET_201205_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201205_ExcAw_TaskGroup:SetTask(VET_201205_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201205_ExcAw_TaskGroup:SetTask(VET_201205_ExcAw_TaskGroup.Times1,0)		
		VET_201205_ExcAw_TaskGroup:SetTask(VET_201205_ExcAw_TaskGroup.Times2,0)	
		VET_201205_ExcAw_TaskGroup:SetTask(VET_201205_ExcAw_TaskGroup.Times3,0)		
	end
	return 1;
end