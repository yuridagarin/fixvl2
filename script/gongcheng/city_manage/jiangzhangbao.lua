-- ���н��°�

Include("\\script\\online\\zgc_public_fun.lua")

function OnUse(idx)
	Say("M� bao huy ch��ng nh�n ���c <color=yellow>50<color> huy ch��ng, huy ch��ng kh�ng ���c trao ��i, mu�n m� bao kh�ng?",
		2,
		"X�c nh�n m�/tongcitywar_kai_bao",
		"K�t th�c ��i tho�i/no_say")
end

function tongcitywar_kai_bao()
	if Zgc_pub_goods_add_chk(1, 0) == 1 then
		if DelItem(2,0,766,1) == 1 then
			AddItem(2,0,765,50,1)
			Say("Ban nh�n ���c 50 huy ch��ng",0)
		end
	end
end

function no_say()
end