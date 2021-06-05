--2012��5�³�����ٻ
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_CKSJ_ACITIVITY_ID = 62;

VET_CKSJ_NPC = "<color=green>Th��ng Nh�n Th�n B� :   <color>";

Vet_CKSJ_Say_Tb = {
	"T�i h� mu�n ��i Cocktail 7 m�u l�y ph�n th��ng (ti�u hao 25 Cocktail 7 m�u + 25 V�ng)/exchange_qcjwj",
	"T�i h� mu�n ��i Tr�i C�y ��p l�nh l�y ph�n th��ng (ti�u hao 25 Tr�i C�y ��p l�nh  + 25 V�ng)/exchange_bdsg",
	"T�i h� mu�n ��i Cocktail 7 m�u v� Tr�i C�y ��p l�nh l�y ph�n th��ng (ti�u hao 25 Cocktail 7 m�u  + 25 Tr�i C�y ��p l�nh + 25 V�ng)/exchange_both",
};

VET_201204_CKSJ_TaskGroup = TaskManager:Create(8,2);
VET_201204_CKSJ_TaskGroup.DaySeq = 1;
VET_201204_CKSJ_TaskGroup.Times1 = 2;
VET_201204_CKSJ_TaskGroup.Times2 = 3;
VET_201204_CKSJ_TaskGroup.Times3 = 4;

--externs task eq 2000
--don't modify
Vet_201204_Final_Tag1 = 2813;
Vet_201204_Final_Tag2 = 2814;

Max_Count = 8; --ÿ�쵥�����8��
Exp_Award_Normal1 = 6500000;
Exp_Award_Normal2 = 12000000;
Exp_Award_Final1 = 5000000;
Exp_Award_Final2 = 10000000;
Item_QCJWJ = 25;
Item_BDSG = 25;
Coin_Consume = 25;
--������
Vet_201204_Award  = {
    {1, 1850, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
    {1, 1502, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 2929, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 1010, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 51, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {3, 2658, 990000, 1},
};
Vet_201204_Award_Final  = {
    {1, 18020, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
    {1, 15020, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 38410, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 5218, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 2000, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 2, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0},
    {3, 20330, 990000, 1},
    {3, 1000, 9990000, 1},
};

function exchange_qcjwj()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return 0
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh�ng gian h�nh trang kh�ng ��")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1) >= 8 then
		Talk(1,"",VET_CKSJ_NPC..format("M�i ng�y m�i gamer ch� giao n�p t�i �a <color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30377) < Item_QCJWJ then
		Talk(1,"",VET_CKSJ_NPC..format("S� l��ng Cocktail 7 m�u trong h�nh trang kh�ng ��<color=green>%d ly <color>",Item_QCJWJ));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng<color=green>%d c�i <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30377,Item_QCJWJ) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201204_Final_Tag1) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"Ph�n th��ng t�i �a M�a H� S�ng Kho�i","Nh�n v�t ch�a s� d�ng t�i �a ho�t ��ng M�a H� S�ng Kho�i")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"Ph�n th��ng t�i �a M�a H� S�ng Kho�i","Nh�n v�t ch�a s� d�ng t�i �a ho�t ��ng M�a H� S�ng Kho�i")
		end
	end
	Msg2Player(format("��y l� l�n th� %d  b�n s� d�ng Cocktail 7 m�u l�y ph�n th��ng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times1)))
end


function exchange_bdsg()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return 0
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh�ng gian h�nh trang kh�ng ��")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2) >= 8 then
		Talk(1,"",VET_CKSJ_NPC..format("M�i ng�y m�i gamer ch� giao n�p t�i �a <color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30378) < Item_BDSG then
		Talk(1,"",VET_CKSJ_NPC..format("S� l��ng Tr�i C�y ��p l�nh trong h�nh trang kh�ng �� <color=green>%d tr�i <color>",Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng: <color=green>%d v�ng <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30378,Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal1);
	else
		gf_Modify("Exp",Exp_Award_Final1);
		if GetTask(Vet_201204_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"Ph�n th��ng t�i �a M�a H� S�ng Kho�i","Nh�n v�t ch�a s� d�ng t�i �a ho�t ��ng M�a H� S�ng Kho�i")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"Ph�n th��ng t�i �a M�a H� S�ng Kho�i","Nh�n v�t ch�a s� d�ng t�i �a ho�t ��ng M�a H� S�ng Kho�i")
		end
	end
	Msg2Player(format("��y l� l�n th� %d  b�n s� d�ng Tr�i c�y ��p l�nh l�y ph�n th��ng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times2)))
end


function exchange_both()
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",VET_CKSJ_NPC.."Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end	
	--�жϱ����ռ�
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(2,100," ") ~= 1 then
			Talk(1,"",VET_CKSJ_NPC.."Kh�ng gian h�nh trang kh�ng ��")
	    return 0
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.DaySeq) ~= zgc_pub_day_turn() then
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.DaySeq,zgc_pub_day_turn())
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times1,0)		
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times2,0)	
		VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,0)		
	end
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3) >= 8 then
		Talk(1,"",format("M�i ng�y m�i gamer ch� giao n�p t�i �a<color=green>%d<color>l�n",Max_Count));
		return 0;
	end
	if GetItemCount(2,1,30377) < Item_QCJWJ then
		Talk(1,"",VET_CKSJ_NPC..format("S� l��ng Cocktail 7 m�u trong h�nh trang kh�ng �� <color=green>%d ly <color>",Item_QCJWJ));
		return 0;
	end
	if GetItemCount(2,1,30378) < Item_BDSG then
		Talk(1,"",VET_CKSJ_NPC..format("S� l��ng Tr�i C�y ��p l�nh trong h�nh trang kh�ng �� <color=green>%d tr�i <color>",Item_BDSG));
		return 0;
	end
	if GetCash() < Coin_Consume*10000 then
		Talk(1,"",VET_CKSJ_NPC..format("Trong h�nh trang kh�ng �� s� l��ng v�ng: <color=green>%d v�ng <color>",Coin_Consume));
		return 0;
	end
	
	if DelItem(2,1,30377,Item_QCJWJ) ~= 1 then return 0; end
	if DelItem(2,1,30378,Item_BDSG) ~= 1 then return 0; end
	if Pay(Coin_Consume*10000) ~= 1 then return 0; end
	
	VET_201204_CKSJ_TaskGroup:SetTask(VET_201204_CKSJ_TaskGroup.Times3,VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3)+1);
	if VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3) ~= 8 then
		gf_Modify("Exp",Exp_Award_Normal2);
	else
		gf_Modify("Exp",Exp_Award_Final2);
		if GetTask(Vet_201204_Final_Tag1) == 2000 and GetTask(Vet_201204_Final_Tag2) == 2000 then
			gf_EventGiveRandAward(Vet_201204_Award_Final,100000,1,"Ph�n th��ng t�i �a M�a H� S�ng Kho�i","Nh�n v�t ch�a s� d�ng t�i �a ho�t ��ng M�a H� S�ng Kho�i")
		else
			gf_EventGiveRandAward(Vet_201204_Award,10000,1,"Ph�n th��ng t�i �a M�a H� S�ng Kho�i","Nh�n v�t ch�a s� d�ng t�i �a ho�t ��ng M�a H� S�ng Kho�i")
		end
	end
	Msg2Player(format("��y l� l�n th� %d  b�n s� d�ng Cocktail 7 m�u v� Tr�i c�y ��p l�nh l�y ph�n th��ng",VET_201204_CKSJ_TaskGroup:GetTask(VET_201204_CKSJ_TaskGroup.Times3)))
end

