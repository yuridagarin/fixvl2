--=======================================================
--create by baiyun 2009.5.31
--describe:越南版7月份活动之二夜草，金库老板脚本
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("Ch? Ng﹏ Kh?: Ta chuy猲 ph? tr竎h vi謈 i Ti觰 Nh? ? th祅h уng Ti襫 V祅g. Trong kho秐g th阨 gian t? ng祔 <color=red>19-06-2009 n 24:00 19-07-2009<color>, ng o d飊g Ti觰 Nh? ? i l蕐 уng Ti襫 V祅g v韎 gi? tr? quy i nh? sau: 1 Ti觰 Nh? ? = 1 уng Ti襫 V祅g. L璾 ?: sau th阨 gian n祔, Ti觰 Nh? ? s? kh玭g th? s? d鬾g 頲 n鱝.",
				2,
				"Ta mu鑞 i Ti觰 Nh? ? th祅h уng Ti襫 V祅g./GetTongQian",
				"T筰 h? ch? gh? ngang!/end_dialog");
	else
		Say("Ho箃 ng n祔  k誸 th骳!",0)
	end
end

--把小如意换成铜钱
function GetTongQian()
	local nCount = GetItemCount(2, 1, 30030);
	if nCount == 0 then
		Talk(1, "", "Tr猲 h祅h trang kh玭g c? Ti觰 Nh? ?");
		return
	end
	AskClientForNumber("ConfirmGetTongQian",1,nCount,"Nh藀 s? lng c莕 i")
end

function ConfirmGetTongQian(nCount)
	if nCount == 0 then
		return
	end
	if GetItemCount(2, 1, 30030) < nCount then
		Talk(1, "", "S? lng ti觰 nh? ? kh玭g   i"..nCount.." ng ti襫 v祅g!");
		return
	end
	if gf_Judge_Room_Weight(2, 10, " ") == 0 then
		return
	end
	if DelItem(2, 1, 30030, nCount) == 1 then
		gf_SetLogCaption("Hoat dong da thao tro lai");
		gf_AddItemEx({2, 1, 30094, nCount}, "уng Ti襫 V祅g");
		WriteLogEx("Hoat dong thang 6","D? Th秓 Tr? l筰	",1,"уng Ti襫 V祅g");
		gf_SetLogCaption("");
	end
end

--结束对话
function end_dialog()
end