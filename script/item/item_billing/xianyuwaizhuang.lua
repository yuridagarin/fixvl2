--������װ��
--�߻������죬����
--�ű���ī��
--�������ڣ�2008��8��20��

tb_prize = {
	[1] = {1,0,109,505,"Ti�m v� trang (nam ti�u chu�n)"},
	[2] = {1,0,109,506,"Ti�m v� trang (nam kh�i ng�)"},
	[3] = {3,0,108,485,"Ti�m v� tr�m (n� g�i c�m)",0,109,503,"Ti�m v� th��ng (n� g�i c�m)",0,110,225,"Ti�m v� qu�n (n� g�i c�m)"},
	[4] = {3,0,108,486,"Ti�m v� tr�m (ki�u n�)",0,109,504,"Ti�m v� th��ng (ki�u n�)",0,110,226,"Ti�m v� qu�n (ki�u n�)"}	
	
}

function OnUse(nItemIdx)
	local nTemp,nBody;
	nBody = GetBody();
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end;
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if DelItem(2,1,3384,1) ~= 1 then
		Talk(1,"","X�c nh�n tr�n ng��i b�n c� Ti�m v� ngo�i trang bao! ");
		return
	end;
	for nTemp = 1,tb_prize[nBody][1] do
		local nRet,nIdx = AddItem(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4],1);
		if nRet == 1 then
			SetItemExpireTime(nIdx, nExpireTime)
		end
		Msg2Player("B�n nh�n ���c "..GetItemName(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4]));
	end
end;

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м�� 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"end_dialog","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end