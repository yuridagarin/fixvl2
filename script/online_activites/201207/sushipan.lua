--2012��8����ʳ�̻
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\meridian\\meridian_script_api.lua")

VET_201207_ACITIVITY_ID = 69;

VET_201207_NPC = "<color=green>Ch� T�u L�u:<color>";

VET_201207_Say_Tb = {
	"Ta mu�n th��ng th�c Gi� Chay (Ti�u hao 25 ��a Hoa Vu Lan + 25 V�ng) /#exchange_one(1)",
	"Ta mu�n th��ng th�c Nem (Ti�u hao 25 ��a Hoa Vu Lan + 25 V�ng) /#exchange_one(2)",
	"Ta mu�n th��ng th�c Rau X�o Th�p C�m (Ti�u hao 25 ��a Hoa t�ng M� + 25 V�ng) /#exchange_two(1)",
	"Ta mu�n th��ng th�c C�i Th�o Ti�m N�m ��ng C� (Ti�u hao 25 ��a Hoa t�ng M� + 25 V�ng) /#exchange_two(2)",
	"Ta mu�n th��ng th�c M�m C� Vu Lan (Ti�u hao 50 ��a Hoa Vu Lan + 50 ��a Hoa t�ng M� + 50 V�ng)/exchange_both",
	"Ta mu�n nh�n th��ng Si�u Th��ng Th�c (K�ch ho�t 06 l�n t�t c� d�ng ch�n)/super_award",
};

VET_201207_ExcAw_TaskGroup = TaskManager:Create(5,3);
VET_201207_ExcAw_TaskGroup.DaySeq = 1;
VET_201207_ExcAw_TaskGroup.Times1 = 2;
VET_201207_ExcAw_TaskGroup.Times2 = 3;
VET_201207_ExcAw_TaskGroup.Times3 = 4;
VET_201207_ExcAw_TaskGroup.Times4 = 5;
VET_201207_ExcAw_TaskGroup.Times5 = 6;
VET_201207_ExcAw_TaskGroup.Tag = 7;


Max_Count = 6; --ÿ�쵥�����8��
Exp_Award_Normal1 = 6000000;
Exp_Award_Normal2 = 24000000;
Item_Count1 = 25;
Item_Count2 = 25;
Coin_Consume = 25;
Item_table1 = {2,1,30423,"��a Hoa Vu Lan"};
Item_table2 = {2,1,30422,"��a Hoa t�ng M�"};
Acitivity_log1 = "HOAT DONG PHU THANG 8";
Acitivity_log2 = "M�m C� Chay";

strMsg2Player1 = "Th��ng th�c Gi� Chay %d/%d";
strMsg2Player2 = "Th��ng th�c Nem %d/%d";
strMsg2Player3 = "Th��ng th�c Rau X�o Th�p C�m %d/%d";
strMsg2Player4 = "Th��ng th�c C�i Th�o Ti�m N�m ��ng C� %d/%d";
strMsg2Player5 = "Th��ng th�c M�m C� Vu Lan %d/%d";

--������
Vet_201207_Award  = {
    {1, 1919, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
    {1, 1838, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2525, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 522, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 200, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 333, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {1, 15, "��i ��nh H�n ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {3, 123, 9990000, 1},
    {3, 2525, 990000, 1},
};
Vet_201207_Award_Special  = {
    {1, 1515, "Nh�n S�m V�n N�m", {2, 1, 30071, 4}, 0},
    {1, 2020, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 678, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {1, 73, "��i ��nh H�n ", {2, 1, 1113, 1}, 7 * 24 * 3600},
    {1, 2020, "M�nh Thi�n Cang", {2, 1, 30390, 100}, 0},
    {3, 2525, 990000, 1},
    {3, 159, 9990000, 1},
};

function exchange_one(nFlag)
	if condition_check() == 0 then
		return 0;
	end
	if nFlag == 1 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
			return 0;
		end
	end
	if nFlag == 2 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
			return 0;
		end
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1 then
		Talk(1,"",VET_201207_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1[4],Item_Count1));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201207_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	if nFlag == 1 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times1,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1)+1);
	end
	if nFlag == 2 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times2,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2)+1);
	end
	gf_Modify("Exp",Exp_Award_Normal1);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	 gf_WriteLogEx(Acitivity_log1, "nh�n th�nh c�ng", 1, "T�ng nh�n 6 tri�u Gi� Nem (21/8) lo�i "..nFlag)
	if nFlag == 1 then
		Msg2Player(format(strMsg2Player1, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1),Max_Count));
	end
	if nFlag == 2 then
		Msg2Player(format(strMsg2Player2, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2),Max_Count));
	end
end


function exchange_two(nFlag)
	if condition_check() == 0 then
		return 0
	end
	if nFlag == 1 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
			return 0;
		end
	end
	if nFlag == 2 then
		if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4) >= Max_Count then
			Talk(1,"",VET_201207_NPC..format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
			return 0;
		end
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2 then
		Talk(1,"",VET_201207_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2[4],Item_Count2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_201207_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	if nFlag == 1 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times3,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3)+1);
	end
	if nFlag == 2 then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times4,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4)+1);
	end
	gf_Modify("Exp",Exp_Award_Normal1);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nh�n th�nh c�ng", 1, "T�ng nh�n 6 tri�u Rau C�i (21/8) lo�i "..nFlag)
	if nFlag == 1 then
		Msg2Player(format(strMsg2Player3, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3),Max_Count));
	end
	if nFlag == 2 then
		Msg2Player(format(strMsg2Player4, VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4),Max_Count));
	end
end


function exchange_both()
	if condition_check() == 0 then 
		return 0;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5) >= Max_Count then
		Talk(1,"",format("M�i ng�y m�i nh�n v�t t�i �a ch� c� th� ho�n th�nh<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < Item_Count1*2 then
		Talk(1,"",VET_201207_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table1[4], Item_Count1*2));
		return 0;
	end
	if GetItemCount(Item_table2[1],Item_table2[2],Item_table2[3]) < Item_Count2*2 then
		Talk(1,"",VET_201207_NPC..format("S� l��ng %s trong h�nh trang kh�ng �� <color=green>%d c�i <color>",Item_table2[4],Item_Count1*2));
		return 0;
	end
	if GetCash() < Coin_Consume*10000*2 then
		Talk(1,"",VET_201207_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume*2));
		return 0;
	end
	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],Item_Count1*2) ~= 1 then return 0; end
	if DelItem(Item_table2[1],Item_table2[2],Item_table2[3],Item_Count2*2) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000*2) ~= 1 then return 0; end
	
	VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5)+1);
	gf_Modify("Exp",Exp_Award_Normal2);
	gf_EventGiveRandAward(Vet_201207_Award,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nh�n th�nh c�ng", 1, "T�ng nh�n 24 tri�u (21/8)")
	Msg2Player(format(strMsg2Player5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5),Max_Count))
end

function condition_check()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201207_NPC.."Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"",VET_201207_NPC.."Kh�ng gian h�nh trang kh�ng ��")
	    return 0
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times1,0)		
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times2,0)	
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times3,0)
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times4,0)	
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Times5,0)
		VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Tag,0)
	end
	return 1;
end

function super_award()
	if condition_check() == 0 then
		return 0;
	end
	local nFlag = 0;
	local strMsg = "Kh�ng �� �i�u ki�n nh�n ph�n th��ng Si�u Th��ng Th�c: \n";
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Tag) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng Si�u Th��ng Th�c r�i")
		return 0;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player1,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times1),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player2,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times2),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player3,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times3),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player4,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times4),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5) ~= Max_Count then
		strMsg = strMsg.."<color=green>"..format(strMsg2Player5,VET_201207_ExcAw_TaskGroup:GetTask(VET_201207_ExcAw_TaskGroup.Times5),Max_Count).."<color>\n";
		nFlag = 1;
	end
	if nFlag == 1 then
		Talk(1,"",strMsg);
		return 0;
	end
	VET_201207_ExcAw_TaskGroup:SetTask(VET_201207_ExcAw_TaskGroup.Tag,1);
	local nRand = gf_EventGiveRandAward(Vet_201207_Award_Special,10000,1,Acitivity_log1,Acitivity_log2)
	gf_WriteLogEx(Acitivity_log1, "nh�n th�nh c�ng", 1, "T�ng nh�n ��c bi�t (21/8)")
	--�󶨻�ⱬһ��
	if nRand == 5 then
		Msg2Global(format("Ch�c m�ng %s nh�n ���c ph�n th��ng Si�u Th��ng Th�c trong ho�t ��ng Vu Lan B�o Hi�u %s x %d",GetName(),Vet_201207_Award_Special[nRand][3],Vet_201207_Award_Special[nRand][4][4]));
	end
end