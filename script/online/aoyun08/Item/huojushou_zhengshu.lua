--圣火传递活动火炬手资格证书
--by vivi
--2008/05/30

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

function OnUse()
	if GetTask(547) == 0 or GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then
		Talk(1,"","<color=green>Ch鴑g nh薾 quy襫 rc 畊鑓<color>: Xin l鏸, b筺 kh玭g ph秈 ngi rc 畊鑓.");
		return
	end
	local nTask = GetTask(TASK_AOYUN_HUOJU_NUM);
	local nStrtab = {
		"T譵 hi觰 ph莕 thng/huojushou_award",
		"Лa ta n Уi 畊鑓 tng 鴑g (50 b筩)/goto_huojutai",
		"T譵 t鋋  Уi 畊鑓/huoju_zuobiao",
		"Tho竧/nothing"
		};
	if nTask == 1 then
		Say("<color=green>Ch鴑g nh薾 quy襫 rc 畊鑓<color>: Ch骳 m鮪g, b筺  t? <color=yellow>Th竛h H醓 Уi<color> nh薾 頲 Th竛h H醓, chuy觧 n <color=yellow>Уi 畊鑓 1<color>, xin chu萵 b? trong ng祔 rc 畊鑓, chuy觧 ng鋘 th? nh蕋! <color=yellow>Trc khi Th竛h H醓 Уi b鑓 ch竬<color> chuy觧 n Уi 畊鑓 1, n誹 kh玭g n ng gi? th? s? kh玭g nh薾 頲 ph莕 thng.",
			getn(nStrtab),
			nStrtab);
	elseif nTask == 30 then
		Say("<color=green>Ch鴑g nh薾 quy襫 rc 畊鑓<color>: Ch骳 m鮪g, b筺  t? <color=yellow>Уi 畊鑓 29<color> nh薾 頲 Th竛h H醓, chuy觧 n <color=yellow>Уi 畊鑓 th辬h th?<color>, xin chu萵 b? trong ng祔 rc 畊鑓, chuy觧 ng鋘 cu鑙 c飊g! <color=yellow>Trc khi Th竛h H醓 Уi b鑓 ch竬<color> chuy觧 n Уi 畊鑓 th辬h th?, n誹 kh玭g n ng gi? th? s? kh玭g nh薾 頲 ph莕 thng.",
			getn(nStrtab),
			nStrtab);
	else
		Say("<color=green>Ch鴑g nh薾 quy襫 rc 畊鑓<color>: Ch骳 m鮪g, t? Уi 畊鑓 <color=yellow>"..(nTask-1).."<color> nh薾 頲 Th竛h H醓, chuy觧 n Уi 畊鑓 <color=yellow>"..nTask.."<color>, xin chu萵 b? trong ng祔 rc 畊鑓, chuy觧 ng鋘 n祔! <color=yellow>Trc khi Th竛h H醓 Уi b鑓 ch竬<color> chuy觧 n Уi 畊鑓 "..nTask..", n誹 kh玭g n ng gi? th? s? kh玭g nh薾 頲 ph莕 thng.",
			getn(nStrtab),
			nStrtab);
	end
end

function huojushou_award()
	Talk(1,"","<color=green>Ch鴑g nh薾 quy襫 rc 畊鑓<color>: Ph莕 thng ngi rc 畊鑓 nh? sau:\nSau khi ho箃 ng b総 u, ch? c莕 chuy觧 畊鑓 t? Уi 畊鑓 hi謓 t筰 n Уi 畊鑓 ch? nh l? c? th? nh薾 ph莕 thng kinh nghi謒 l藀 phng ng c蕄 x 15. N誹 c蕄 99 c? th? nh薾 1 vi猲 Linh th筩h ng蓇 nhi猲 c蕄 7.\nSau khi k誸 th骳 ho箃 ng, trong 2 ph髏 nh蕁 Уi 畊鑓 ch? nh l? c? th? nh薾 ph莕 thng kinh nghi謒 l藀 phng ng c蕄 x 10. N誹 c蕄 99 c? th? nh薾 1 vi猲 Linh th筩h ng蓇 nhi猲 c蕄 6-7.")
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Ph鬾g Tng: Th竛h H醓 Уi [228,191], Уi 畊鑓 1 [209,200], Уi 畊鑓 2 [207,193], Уi 畊鑓 3 [222,200]\nTng Dng: Уi 畊鑓 4 [192,1-79], Уi 畊鑓 5 [1-77,1-74], Уi 畊鑓 6 [168,1-79], Уi 畊鑓 7 [1-70,190], Уi 畊鑓 8 [189,190]\nTh祅h Й: Уi 畊鑓 9 [209,229], Уi 畊鑓 10 [213,21-7], Уi 畊鑓 11 [232,218], Уi 畊鑓 12 [220,221], Уi 畊鑓 13 [233,226]\nЧi L?: Уi 畊鑓 14 [191,182], Уi 畊鑓 15 [1-78,185], Уi 畊鑓 16 [181,193], Уi 畊鑓 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","Tuy襫 Ch﹗: Уi 畊鑓 18 [169,180], Уi 畊鑓 19 [169,190], Уi 畊鑓 20 [189,190], Уi 畊鑓 21 [188,181]\nDng Ch﹗: Уi 畊鑓 22 [203,191], Уi 畊鑓 23 [203,198], Уi 畊鑓 24 [218,198], Уi 畊鑓 25 [21-7,192]\nBi謓 Kinh: Уi 畊鑓 26 [158,185], Уi 畊鑓 27 [183,184], Уi 畊鑓 28 [183,1-73], Уi 畊鑓 29 [162,1-72], Уi 畊鑓 th辬h th? [1-70,1-79]");
end