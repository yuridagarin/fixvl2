--08���ڴ��������ͭ���ű�
--by vivi
--2008/01/14

tSuipian = {
		{"M�nh ��ng c�p 2",2,1,3212,25,712},
		{"Ph�i ki�n Thanh ��ng ��nh c�p 1",2,1,3220,3,715},
		{"Ph�i ki�n Thanh ��ng ��nh c�p 2",2,1,3221,3,725},
		{"Ph�i ki�n Thanh ��ng ��nh c�p 3",2,1,3222,10,750},
		{"Ph�i ki�n Thanh ��ng ��nh c�p 4",2,1,3223,12,1000}
		};

function OnUse()
	Say("<color=green>��ng g�i v� kh� ��i N�i Thanh ��ng<color>: M�i khi s� d�ng ��i N�i Thanh ��ng x�c su�t nh�n ���c v�t ph�m nh� sau, t�t c� ng�u nhi�n 20 l�n, b�n ch�p nh�n? \n 1 m�nh ��ng h�u d�ng 100%\n 25 m�nh ��ng c�p 2: 71.2% \n 12 Thanh ��ng ��nh ph�i ki�n c�p 4: 25%\n 10 ph�i ki�n Thanh ��ng ��nh c�p 3: 2.5% \n 3 Thanh ��ng ��nh ph�i ki�n c�p 2: 1% \n 3 Thanh ��ng ��nh ph�i ki�n c�p 1 : 0.3%",
		2,
		"���c/use_daneiqingtongqi",
		"Kh�ng c�n/nothing")
end

function use_daneiqingtongqi()
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,3209,1) == 1 then
		for j = 1,20 do
			local nRand = random(1,1000);
			local nIdx = 0;
			for i = 1,getn(tSuipian) do
				if nRand <= tSuipian[i][6] then
					nIdx = i;
					break
				end
			end
			AddItem(tSuipian[nIdx][2],tSuipian[nIdx][3],tSuipian[nIdx][4],tSuipian[nIdx][5]);
			AddItem(2,1,3217,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tSuipian[nIdx][5].."c�i"..tSuipian[nIdx][1]);
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

end