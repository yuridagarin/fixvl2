--����нű�
--by vivi
--09/13/2007

function OnUse()
	Say("M� h�p c� t� l� 90% nh�n ���c H�p Ng�n B�i Vinh D�, 10% nh�n ���c H�p Kim B�i Vinh D�, b�n mu�n m� ch�?",
		2,
		"��ng �/just_do_it",
		"Kh�ng c� g�/nothing")
end

function just_do_it()
	if Zgc_pub_goods_add_chk(1,10) ~= 1 then
		return
	end
	if DelItem(2,0,1080,1) == 1 then
		local nRand = random(1,100);
		local nRetCode = 0;
		if nRand <= 90 then
			nRetCode = AddItem(2,0,1078,1);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c H�p Ng�n B�i Vinh D�");
			end
		else
			nRetCode = AddItem(2,0,1079,1);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c H�p Kim B�i Vinh D�");
			end
		end
		if nRetCode ~= 1 then
			WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."M� h�p nh�n v�t ph�m th�t b�n, v� tr� th�t b�i:"..nRetCode);
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

function nothing()

end;