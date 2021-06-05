--�����Ƭ
Include("\\script\\lib\\globalfunctions.lua")

Item_table1 = {2,1,30390,"M�nh Thi�n Cang"};
Item_table2 = {2,95,204,"Thi�n Cang L�nh"};
Exp_cost = 400000;
Item_cost = 999;
Exp_Max = 2000000000

function OnUse(nItem)
	local tbSay = {
	"��i kinh nghi�m (1 m�nh Thi�n Cang=400,000 kinh nghi�m)/exchange_exp",
	"��i Thi�n Cang L�nh (999 m�nh Thi�n Cang=1 Thi�n Cang L�nh)/exchange_tgl",
	"Tho�t/nothing",
	};
	Say("C�c h� mu�n l�m g� ��?",getn(tbSay),tbSay);
end

function exchange_exp()
	AskClientForNumber("give_exp_award",0,GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]),"Nh�p s� l��ng ��i","")
end

function give_exp_award(nNum)
	if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < nNum then
		Talk(1,"",format("%s S� l��ng kh�ng �� %d c�i",Item_table1[4],nNum));
		return 0;
	end
	---------
	local nExpTemp = nNum * Exp_cost
	if (GetExp() + nExpTemp) > Exp_Max then
			Talk(1,"", "�i�m kinh nghi�m nh�n ���c kh�ng th� v��t qu� 2 t� !!!")
			return 0
	end
	---------	
	if DelItem(Item_table1[1],Item_table1[2],Item_table1[3],nNum) == 1 then
		gf_Modify("Exp",nNum * Exp_cost);
	end
end

function exchange_tgl()
	AskClientForNumber("give_tgl_award",0,floor(GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) / Item_cost),"Nh�p s� l��ng ��i","")
end

function give_tgl_award(nNum)
	if floor(GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) / Item_cost) < nNum then
		Talk(1,"",format("%s S� l��ng kh�ng �� %d c�i",Item_table1[4],nNum * Item_cost));
		return 0;
	end
	if gf_Judge_Room_Weight(ceil(nNum /10),nNum," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
  end
	if nNum ~= 0 and DelItem(Item_table1[1],Item_table1[2],Item_table1[3],nNum * Item_cost) == 1 then
		gf_AddItemEx2({Item_table2[1],Item_table2[2],Item_table2[3],nNum}, Item_table2[4], "��i m�nh Thi�n Cang ", "��i Thi�n Cang L�nh", 0, 1);
		Msg2Global(format("Ch�c m�ng ng��i ch�i %s d�ng M�nh Thi�n Cang ��i th�nh c�ng %d c�i Thi�n Cang L�nh",GetName(),nNum));
		AddRuntimeStat(14, 1, 0, nNum)
	end
end