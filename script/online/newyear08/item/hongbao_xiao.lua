--08����С����ű�
--by vivi
--2008/01/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	Say("S� d�ng ti�u h�ng bao s� nh�n ���c 1 s� b�nh n�m m�i, 1K� L�n, 1 Ti�u Th�n Th�ng Ph�, 20% x�c su�t nh�n ���c 1 s�i c�o. Sao h�?",
		2,
		"���c/confirm_get_xiao",
		"Kh�ng c�n/nothing")
end

function confirm_get_xiao()
	if Zgc_pub_goods_add_chk(6,20) ~= 1 then
		return
	end
	if DelItem(2,1,213,1) == 1 then
		AddItem(2,1,266,10);
		AddItem(2,1,267,3);
		AddItem(2,1,269,3);
		local add_flag,add_idx = AddItem(0,105,33,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(add_idx,86400); --������Ʒ����ʱ�䣬��λ��s
		AddItem(2,1,497,1);
		local nRand = random(1,100);
		if nRand <= 20 then
			AddItem(2,1,3218,1);
		end
	end
end