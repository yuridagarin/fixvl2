--�򱦸��䷽ϻ�ű�
--by vivi
--08/21/2007

Include("\\script\\lib\\lingshipeifang_info.lua")

function OnUse()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end 	
	local tPeifang = lspf_GetRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,1,5);
	if type(tPeifang) ~= "table" then
		return 0;
	end
	if DelItem(2,1,2640,1) == 1 then
		local add_flog_one = AddItem(tPeifang[1],tPeifang[2],tPeifang[3],1,1);
		local add_flog_two = AddItem(2,1,2641,1,1);
		if add_flog_one == 1 and add_flog_two == 1 then
			Msg2Player("Ch�c m�ng b�n ��t ���c 1 Linh th�ch ph�i ph��ng ");
			Msg2Player("Ch�c m�ng b�n ��t ���c 1 Linh th�ch ph�i ph��ng r�ch");
		else
			WriteLog("H�p V�n B�o C�c ph�i ph��ng: Ng��i ch�i "..GetName().."Ph�i ph��ng th�m v�o th�t b�i, id th�t b�i l�: "..add_flog_one.." v�"..add_flog_two);
		end
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