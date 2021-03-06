--冰晶石：叠加999，可以交易，可以使用1个冰晶石将低级洗心石，炼炉铁合成高级洗心石，炼炉铁。 IB 售价90Xu
--2级洗心石/炼炉铁=4个1级洗心石/炼炉铁+1冰晶石
--2级洗心石/炼炉铁=4个2级洗心石/炼炉铁+2冰晶石
--合成的道具均为绑定道具
Include("\\script\\lib\\globalfunctions.lua")

--t_compose = {
--	[401] = {
--		award = {"4级洗心石", 2, 1, 30524, 1,
--			},
--		need={
--			{{"3级洗心石", 2, 1, 30523, 4,},
--			{{"冰晶石", 2, 1, 30554, 3,},
--			},
--		},
--	[402] = {
--		award = {"4级炼炉铁", 2, 1, 30530, 1,
--			},
--		need={
--			{{"3级炼炉铁", 2, 1, 30529, 4,},
--			{{"冰晶石", 2, 1, 30554, 3,},
--			},
--		},
--}

function OnUse(nItem)
	local tSay = {
		"H頿 th祅h T葃 T﹎ Th筩h c蕄 2 = 4*1 c蕄 T葃 T﹎ Th筩h + B╪g Tinh Th筩h/compose2x",
		"H頿 th祅h Luy謓 L? Thi誸 c蕄 2 = 4*1 c蕄 Luy謓 L? Thi誸 + 2 B╪g Tinh Th筩h/compose2l",
		"H頿 th祅h T葃 T﹎ Th筩h c蕄 3 = 4*2 c蕄 T葃 T﹎ Th筩h + B╪g Tinh Th筩h/compose3x",
		"H頿 th祅h Luy謓 L? Thi誸 c蕄 3 = 4*2 c蕄 Luy謓 L? Thi誸 + 2 B╪g Tinh Th筩h/compose3l",
		"H頿 th祅h c蕄 4 T葃 T﹎ Th筩h = 4*3 c蕄 T葃 T﹎ Th筩h + 3 B╪g Tinh Th筩h/compose4x",
		"H頿 th祅h c蕄 4 Luy謓 L? Thi猼 = 4*3 c蕄 Luy謓 L? Thi誸 + 3 B╪g Tinh Th筩h/compose4l",
		"Ra kh醝/do_nothing",
	}
--	for i,v in t_compose do
--		local szNeed = format("%sx%d",v.need[1][1], ,v.need[1][5])
--		for k=2, getn(v.need) do
--			szNeed=format("%s+%sx%d",v.need[k][1], ,v.need[k][5])
--		end
--		local szOp = format("合成%s=%s/", v.award[1], )
--		tinsert(tSay, "")
--	end
--	tinsert(tSay, "退出/do_nothing")
	Say("B╪g Tinh Th筩h: Ngi mu鑞 l祄 kh玭g?", getn(tSay), tSay);
end

function do_nothing()
	--do nothing()
end

function compose2x()
	local nCount = min(GetItemCount(2,1,30554), floor(GetItemCount(2,1,30521) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose2x_deal",0,min(nCount, nFrreRoom),"H穣 nh藀 s? lng h頿 th祅h v祇","")
end

function compose2x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum) and 1 == DelItem(2,1,30521,4*nNum) then
		gf_AddItemEx2({2,1,30522,nNum,4}, "C蕄 2 T葃 T﹎ Th筩h", "H頿 th祅h B╪g Tinh Th筩h", "H頿 th祅h T葃 T﹎ Th筩h c蕄 2", 0, 1);
		AddRuntimeStat(2,1,0,nNum);
	end
end

function compose2l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 2), floor(GetItemCount(2,1,30527) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose2l_deal",0,min(nCount, nFrreRoom),"H穣 nh藀 s? lng h頿 th祅h v祇","")
end

function compose2l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*2) and 1 == DelItem(2,1,30527,4*nNum) then
		gf_AddItemEx2({2,1,30528,nNum,4}, "C蕄 2 Luy謓 L? Thi誸", "H頿 th祅h B╪g Tinh Th筩h", "H頿 th祅h Luy謓 L? Thi誸 c蕄 2", 0, 1);
		AddRuntimeStat(2,3,0,nNum);
	end
end

function compose3x()
	local nCount = min(GetItemCount(2,1,30554), floor(GetItemCount(2,1,30522) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose3x_deal",0,min(nCount, nFrreRoom),"H穣 nh藀 s? lng h頿 th祅h v祇","")
end

function compose3x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum) and 1 == DelItem(2,1,30522,4*nNum) then
		gf_AddItemEx2({2,1,30523,nNum,4}, "C蕄 3 T葃 T﹎ Th筩h", "H頿 th祅h B╪g Tinh Th筩h", "H頿 th祅h T葃 T﹎ Th筩h c蕄 3", 0, 1);
		AddRuntimeStat(2,2,0,nNum);
	end
end

function compose3l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 2), floor(GetItemCount(2,1,30528) / 4));
	local nFrreRoom = GetFreeItemRoom();
	AskClientForNumber("compose3l_deal",0,min(nCount, nFrreRoom),"H穣 nh藀 s? lng h頿 th祅h v祇","")
end

function compose3l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*2) and 1 == DelItem(2,1,30528,4*nNum) then
		gf_AddItemEx2({2,1,30529,nNum,4}, "C蕄 3 Luy謓 L? Thi誸", "H頿 th祅h B╪g Tinh Th筩h", "H頿 th祅h Luy謓 L? Thi誸 c蕄 3", 0, 1);
		AddRuntimeStat(2,4,0,nNum);
	end
end

function compose4x()
	local nCount = min(floor(GetItemCount(2,1,30554)/3), floor(GetItemCount(2,1,30523) / 4));
	local nFreeRoom = GetFreeItemRoom();
	local nRealCount = min(nCount, nFreeRoom)
	if nRealCount >= 0 then
		AskClientForNumber("compose4x_deal",0,nRealCount,"H穣 nh藀 s? lng h頿 th祅h v祇","")
	end
end

function compose4x_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*3) and 1 == DelItem(2,1,30523,4*nNum) then
		gf_AddItemEx2({2,1,30524,nNum,4}, "T葃 T﹎ Th筩h c蕄 4", "H頿 th祅h B╪g Tinh Th筩h", "H頿 th祅h c蕄 4 T葃 T﹎ Th筩h", 0, 1);
		AddRuntimeStat(2,5,0,nNum);
	end
end

function compose4l()
	local nCount = min(floor(GetItemCount(2,1,30554) / 3), floor(GetItemCount(2,1,30529) / 4));
	local nFreeRoom = GetFreeItemRoom();
	local nRealCount = min(nCount, nFreeRoom)
	if nRealCount >= 0 then
		AskClientForNumber("compose4l_deal",0, nRealCount,"H穣 nh藀 s? lng h頿 th祅h v祇","")
	end
end

function compose4l_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if 1 == DelItem(2,1,30554,nNum*3) and 1 == DelItem(2,1,30529,4*nNum) then
		gf_AddItemEx2({2,1,30530,nNum,4}, "Luy謓 L? Thi誸 c蕄 4", "H頿 th祅h B╪g Tinh Th筩h", "H頿 th祅h c蕄 4 Luy謓 L? Thi誸", 0, 1)
		AddRuntimeStat(2,6,0,nNum)
	end
end
