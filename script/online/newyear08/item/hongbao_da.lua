--08���ڴ����ű�
--by vivi
--2008/01/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	Say("S� d�ng ��i h�ng bao s� nh�n ���c m�t s� b�nh n�m m�i, 1 K� L�n, ,3 Ti�u Th�n Th�ng Ph�, x�c su�t 40% nh�n ���c 1 s�i c�o, ng�u nhi�n 1-2 ��i N�i Thanh ��ng. Sao h�?",
		2,
		"���c/confirm_get_da",
		"Kh�ng c�n/nothing")
end

function confirm_get_da()
	if Zgc_pub_goods_add_chk(6,35) ~= 1 then
		return
	end
	if DelItem(2,1,212,1) == 1 then
		AddItem(2,1,266,20);
		AddItem(2,1,267,6);
		AddItem(2,1,269,5);
		local add_flag,add_idx = AddItem(0,105,33,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(add_idx,86400); --������Ʒ����ʱ�䣬��λ��s
		AddItem(2,1,497,3);
		local nRand = random(1,100);
		if nRand <= 40 then
			AddItem(2,1,3218,1);
		end
		local nRand2 = random(1,100);
		if nRand2 <= 50 then
			AddItem(2,1,3208,1);
		else
			AddItem(2,1,3208,2);
		end
	end
end