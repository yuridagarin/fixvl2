--=======================================================
--create by baiyun 2009.5.30
--describe:越南版7月份活动之一追寻长生普，复原真人NPC脚本
--=======================================================

Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("Ho箃 ng truy t譵 trng sinh ph? di詎 ra t? 19-06-2009 n 24:00 19-07-2009. Trong th阨 gian s? ki謓, ng o c? th? thu th藀 B? Ph? C? N竧 th玭g qua c竎 nhi謒 v? sau: S? M玭, Th竔 H?, B竧 Nh?, H箃 Gi鑞g, s╪ Th? M藀.\n- в kh玦 ph鬰 B? Ph? C? N竧 th祅h Trng Sinh Ph?, ng o d飊g 10 B? Ph? C? N竧 v? 1 Ph鬰 Nguy猲 Thu藅 (c? b竛 t筰 Ng? C竎) n NPC Ph鬰 Nguy猲 Ch﹏ Nh﹏ ho芻 t筰 C萴 Nang Чi S? Ki謓.\n Khi s? d鬾g Trng Sinh Ph?, ng o c? c? h閕 nh薾 頲 уng Ti襫 V祅g, c? t竎 d鬾g d飊g  i c竎 v藅 ph萴 gi? tr? t筰 NPC D? Th秓",
				3,
				"T筰 h? mu鑞 kh玦 ph鬰 B? Ph? C? N竧 (nh薾 頲 1 Trng Sinh Ph?)../GetChangshengpu",
				"T筰 h? 產ng c莕 1 C萴 Nang Чi S? Ki謓./GetJinnang",
				"T筰 h? ch? gh? ngang!/dialog_over");
	else
		Say("Ho箃 ng n祔  k誸 th骳!",0)
	end
end

function GetJinnang()
	if GetItemCount(2, 1, 30045) >= 1 then
		Talk(1, "", "C竎 h?  c? C萴 Nang Чi S? Ki謓 r錳, kh玭g th? nh薾 th猰 頲 n鱝!!");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	local nRetCode, nItem = gf_AddItemEx({2, 1, 30045, 1}, "C萴 Nang Чi S? Ki謓");
	gf_SetItemExpireTime(nItem, 2009, 7, 20, 0, 0, 0); 
end

function dialog_over()

end