--��ʯ�����ű�
--by vivi
--08/21/2007
--�޸���2008/03/07

Include("\\script\\lib\\lingshi_head.lua")

function OnUse()
	Say("D�ng B�o th�ch Bao c� th� nh�n ���c 1 Linh th�ch, b�n mu�n d�ng kh�ng? Thu th�p 1000 m�nh Linh th�ch c� th� d�ng [Hoan Linh Sa] chuy�n th�nh 1 Linh th�ch c�p 6 b�t k�\nM�nh Linh th�ch (kh�a) 100%\nLinh th�ch c�p 1-4: 93.9%\nLinh th�ch c�p 5: 5%\nLinh th�ch c�p 6: 1%\nLinh th�ch c�p 7: 0.1%",
		2,
		"��ng �/confirm_get",
		"Kh�ng s� d�ng/nothing")
end

function confirm_get()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end 
	if DelItem(2,1,2642,1) == 1 then
		local nRand = random(1,1000);
		if nRand <= 249 then
			lspf_AddLingShiInBottle(1,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch C�p 1, n� trong T� linh ��nh.");
		elseif nRand <= 479 then
			lspf_AddLingShiInBottle(2,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 2, �� nh�p v�o T� linh ��nh.");		
		elseif nRand <= 709 then
			lspf_AddLingShiInBottle(3,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c1 Linh Th�ch c�p 3, �� nh�p v�o T� linh ��nh.");		
		elseif nRand <= 939 then
			lspf_AddLingShiInBottle(4,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 4, �� nh�p v�o T� linh ��nh.");		
		elseif nRand <= 989 then
			lspf_AddLingShiInBottle(5,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 5, �� nh�p v�o T� linh ��nh.");		
		elseif nRand <= 999 then
			lspf_AddLingShiInBottle(6,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 6, �� nh�p v�o T� linh ��nh.");
			Msg2Global("Ng��i ch�i"..GetName().."M� bao B�o th�ch nh�n ���c 1 Linh Th�ch c�p 6");
			WriteLog("Bao B�o th�ch: ng��i ch�i "..GetName().."M� bao B�o th�ch nh�n ���c 1 Linh Th�ch c�p 6");		
		else
			lspf_AddLingShiInBottle(7,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 7, �� nh�p v�o T� linh ��nh.");		
			Msg2Global("Ng��i ch�i"..GetName().."M� bao B�o th�ch nh�n ���c 1 Linh Th�ch c�p 7");
			WriteLog("Bao B�o th�ch: ng��i ch�i "..GetName().."M� bao B�o th�ch nh�n ���c 1 Linh Th�ch c�p 7");
		end
		AddItem(2,1,2646,1,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch tan r�");
	end
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end	

function nothing()

end