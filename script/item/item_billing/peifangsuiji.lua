--�����¼�ű����򱦸���ͼ��
--by vivi
--08/21/2007
--�޸���2008/03/07

Include("\\script\\lib\\lingshi_head.lua")

function OnUse()
	Say("S� d�ng V�n B�o C�c V�n B�o �� c� th� nh�n ���c 1 Linh Th�ch ph�i ph��ng nh� sau, b�n mu�n s� d�ng kh�ng?\n 50% Linh Th�ch ph�i ph��ng c�p 4\n25% Linh Th�ch ph�i ph��ng c�p 5\n20% Linh Th�ch ph�i ph��ng c�p 6\n5% Linh Th�ch ph�i ph��ng c�p 7",
		2,
		"��ng �/confirm_get",
		"Kh�ng s� d�ng/nothing")
end

function confirm_get()	
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end 	
	if DelItem(2,1,2643,1) == 1 then
		local nRand = random(1,100);
		if nRand <= 50 then
			lspf_AddPeiFangInBottle(4,1)
			Msg2Player("Ch�c m�ng b�n nh�n ���c1 Linh Th�ch ph�i ph��ng c�p 4, �� nh�p v�o T� linh ��nh.");
		elseif nRand <= 75 then
			lspf_AddPeiFangInBottle(5,1)
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch ph�i ph��ng c�p 5, �� nh�p v�o T� linh ��nh.");		
		elseif nRand <= 95 then
			lspf_AddPeiFangInBottle(6,1)
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch ph�i ph��ng c�p 6, �� nh�p v�o T� linh ��nh.");
			Msg2Global("Ng��i ch�i"..GetName().."M� V�n B�o C�c V�n B�o �� nh�n �u�c 1 Linh Th�ch ph�i ph��ng c�p 6"); 	
			WriteLog("V�n B�o C�c V�n B�o ��: ng��i ch�i "..GetName().."M� V�n B�o C�c V�n B�o �� nh�n �u�c 1 Linh Th�ch ph�i ph��ng c�p 6");
		else
			lspf_AddPeiFangInBottle(7,1)
			Msg2Player("Ch�c m�ng b�n �� ��t ���c 1 linh th�ch ph�i ph��ng c�p 7 �� cho v�o T� Linh ��nh. ");
			Msg2Global("Ng��i ch�i"..GetName().."M� V�n B�o C�c V�n B�o �� nh�n ���c nh�n ���c 1 Linh th�ch ph�i ph��ng c�p 7.");	
			WriteLog("V�n B�o C�c V�n B�o ��: ng��i ch�i "..GetName().."M� V�n B�o C�c V�n B�o �� nh�n ���c nh�n ���c 1 Linh th�ch ph�i ph��ng c�p 7.");		
		end
		AddItem(2,1,2641,1,1);
		Msg2Player("Ch�c m�ng b�n ��t ���c 1 Linh th�ch ph�i ph��ng r�ch");	
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