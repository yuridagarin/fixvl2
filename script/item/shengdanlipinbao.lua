--08����ʥ����Ʒ���ű�
--by vivi
--2007/12/07

function OnUse()
	Say("<color=green>t�i l� v�t gi�ng sinh<color>: k�ch ho�t t�i �� s� nh�n ���c 1 c�y th�ng tuy�t ��p, b�n x�c nh�n?",
		2,
		"��ng �/huo_chrims_tree",
		"Kh�ng c�n/nothing")
end

function huo_chrims_tree()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if DelItem(2,1,1192,1) == 1 then
		AddItem(2,0,574,1);
	end
end

function nothing()

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