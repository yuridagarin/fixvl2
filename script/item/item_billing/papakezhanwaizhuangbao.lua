--ſſ��ջ��װ��
--�߻������죬����
--�ű���ī��
--�������ڣ�2008��8��20��

tb_prize = {
	[1] = {3,0,108,510,"C��c �i�m ��u (nam ti�u chu�n)",0,109,510,"C��c �i�m y (nam ti�u chu�n)",0,110,510,"C��c �i�m trang (nam ti�u chu�n)"},
	[2] = {3,0,108,511,"C��c �i�m ��u (nam kh�i ng�)",0,109,511,"C��c �i�m y (nam kh�i ng�)",0,110,511,"C��c �i�m trang (nam kh�i ng�)"},
	[3] = {3,0,108,513,"C��c �i�m ��u (n� g�i c�m)",0,109,513,"C��c �i�m y (n� g�i c�m)",0,110,513,"C��c �i�m trang (n� g�i c�m)"},
	[4] = {3,0,108,512,"C��c �i�m ��u (ki�u n�)",0,109,512,"C��c �i�m y (ki�u n�)",0,110,512,"C��c �i�m trang (ki�u n�)"}	
	
}

function OnUse(nIdx)
	local nTemp,nBody;
	local nItemIndex = tonumber(nIdx)
	local nTime = GetItemExpireTime(nItemIndex)
	
	nBody = GetBody();
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end;
	if DelItem(2,1,3383,1) ~= 1 then
		Talk(1,"","X�c nh�n tr�n ng��i b�n c� B�t B�t trang bao!");
		return
	end;
	for nTemp = 1,tb_prize[nBody][1] do
		local nRet, nItemIdx =AddItem(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4],1);
		if nRet > 0 then
			SetItemExpireTime(nItemIdx,nTime)
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