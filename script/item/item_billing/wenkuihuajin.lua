--�Ŀ�������
--2007-08-29�峤ת�Ƶ������
Suit_be_date_num = 30

tAll_cloth = {
	{  --��׼��
		{"V�n C�m B�o 1",259},{"V�n C�m B�o 1",260}
	},
	{  --������
		{"V�n C�m B�o 2",261},{"V�n C�m B�o 2",262}
	},
	{  --�Ը�Ů
		{"V�n C�m Th��ng (��)",263},{"V�n C�m Th��ng (H�ng)",264},{"V�n C�m Th��ng (Xanh L�)",265},{"V�n C�m Th��ng (Xanh D��ng)",266},
		{"V�n C�m Th��ng (V�ng)",267},{"V�n C�m Th��ng (Cam)",268},{"V�n C�m Th��ng (�en)",269}
	},
	{  --��СŮ
		{"V�n C�m Th��ng (��)",270},{"V�n C�m Th��ng (H�ng)",271},{"V�n C�m Th��ng (Xanh L�)",272},{"V�n C�m Th��ng (Xanh D��ng)",273},
		{"V�n C�m Th��ng (V�ng)",274},{"V�n C�m Th��ng (Cam)",275},{"V�n C�m Th��ng (�en)",276}	
	},
}

tLinglong = {  -- ͷ,�·�,����
		{{207,213}, {281,287}, {281,287}, "Linh Lung Th��ng (��) "},  --��
		{{208,214}, {282,288}, {282,288}, "Linh Lung Th��ng (V�ng)"},  --��
		{{209,215}, {283,289}, {283,289}, "Linh Lung Th��ng (Ph�n)"},  --��
		{{210,216}, {284,290}, {284,290}, "Linh Lung Th��ng (T�m)"},  --��
		{{211,217}, {285,291}, {285,291}, "Linh Lung Th��ng (Lam)"},  --��
		{{212,218}, {286,292}, {286,292}, "Linh Lung Th��ng (L�c)"},  --��
}
tLinglongPart = {{108,"Linh Lung Qu�n "},{109,"Trang s�c Linh Lung"},{110,"Linh Lung h� trang"}}

function OnUse(nItemIdx)
	local player_sex = GetBody()
	if player_sex < 3 then
		Say("Nh�n v�t nam kh�ng th� s� d�ng V�n C�m H�p! ",0)
		return
	end
	Say("��i hi�p c�n ngo�i trang lo�i n�o? Xin t�y � l�a ch�n: ",3,
			"Ta c�n V�n C�m Th��ng/#give_wenkui("..nItemIdx..")",
			"Ta c�n Linh Lung Th��ng /#give_linglong("..nItemIdx..")",
			"Ta suy ngh� l�i/end_say"
	)
end

function give_wenkui(nItemIdx)
	local player_sex = GetBody()
	local tSay = {}
	for i = 1,getn(tAll_cloth[player_sex]) do
		tinsert(tSay,tAll_cloth[player_sex][i][1].."/#wk_give_cloth("..tAll_cloth[player_sex][i][2]..", "..nItemIdx..")")
	end
	tinsert(tSay,"Ta suy ngh� l�i/end_say")
	Say("��i hi�p c�n ngo�i trang lo�i n�o? Xin t�y � l�a ch�n: ",getn(tSay),tSay)
end

function give_linglong(nItemIdx)
	local tSay = {}
	for i = 1,getn(tLinglong) do
		tinsert(tSay,tLinglong[i][4].."/#ll_give_cloth("..i..", "..nItemIdx..")")
	end
	tinsert(tSay,"Ta suy ngh� l�i/end_say")
	Say("��i hi�p c�n Linh Lung Th��ng lo�i n�o? Xin t�y � l�a ch�n: ",getn(tSay),tSay)
end

function wk_give_cloth(nDetail, nItemIdx)
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 5 then
		Say("H�nh trang c�a b�n �� kh�ng c�n ch� tr�ng. Xin s�p x�p l�i! ",0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local add_flag,goods_index = AddItem(0,109,nDetail,1)
		SetItemExpireTime(goods_index, nExpireTime)
	end
end

function ll_give_cloth(nDetail, nItemIdx)
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 50 then
		Say("H�nh trang c�a b�n �� kh�ng c�n ch� tr�ng. Xin s�p x�p l�i! ",0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody()
		for i = 1,3 do
			local add_flag,goods_index = AddItem(0,tLinglongPart[i][1],tLinglong[nDetail][i][nBody-2],1,1)
			SetItemExpireTime(goods_index, nExpireTime)
		end
	end
end

function end_say()
end