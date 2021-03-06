Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
Include("\\script\\lib\\lingshi_head.lua");
IB_VERSION = 1;
g_nMaxUseTime = 100;	--每周最大使用次数

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","Tu莕 n祔 b筺  d飊g "..g_nMaxUseTime.."Kh玭g th? d飊g l筰 Th鵦 Chi課 T﹎ Ьc n祔.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"","Ъng c蕄 c馻 ngi qu? th蕄, ngi ph秈 t n c蕄 <color=yellow>60<color> m韎 c? th? d飊g Th鵦 Chi課 T﹎ Ьc.");
		return 0;
	end;
	local szIntro = "";
	if IB_VERSION == 1 then
		local nExp = floor(nLevel^4/200);--等级的四次方/200
		local selTab = {};
		if nLevel == 99 then
			tinsert(selTab,"Ta mu鑞 i th祅h T? v? i h閕 b礽 v? Truy襫 C玭g T﹎ Ьc/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"Ta mu鑞 i th祅h T? v? i h閕 b礽 v? kinh nghi謒 ( "..floor(nExp/2).." 甶觤/cu鑞)/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"Ta mu鑞 i th祅h kinh nghi謒 ( "..nExp.." 甶觤/cu鑞)/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\nT筸 th阨 kh玭g d飊g/nothing");
		Say(szIntro.."Tu莕 n祔 ngi  i <color=yellow>"..(nUseXinDeNum+1).."<color> l莕 d飊g Th鵦 Chi課 T﹎ Ьc, b筺 c? mu鑞 d飊g Th鵦 Chi課 T﹎ Ьc kh玭g?",getn(selTab),selTab);
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor((nLevel^4)*300000/(80^4));	--玩家等级的四次方*30w/80的四次方
		local selTab = {};
		if nLevel == 99 then
			tinsert(selTab,"Ta mu鑞 i th祅h T? v? i h閕 b礽 v? Truy襫 C玭g T﹎ Ьc/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"Ta mu鑞 i th祅h T? v? i h閕 b礽 v? l蕐 甶觤 s鴆 kh醗 ( "..floor(nGoldenExp/2).." 甶觤/cu鑞) i th祅h kinh nghi謒/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"Ta mu鑞 l蕐 甶觤 s鴆 kh醗 ( "..nGoldenExp.." 甶觤/cu鑞) i th祅h kinh nghi謒/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\nT筸 th阨 kh玭g d飊g/nothing");
		Say(szIntro.."Зy l? cu鑞 Th鵦 Chi課 T﹎ Ьc th? <color=yellow>"..(nUseXinDeNum+1).."<color> m? b筺 d飊g trong tu莕 n祔, 甶觤 s鴆 kh醗 hi謓 t筰 l? <color=yellow>"..nCurGoldenExp.."<color>. B﹜ gi? b筺 c? mu鑞 d飊g Th鵦 Chi課 T﹎ Ьc kh玭g?",getn(selTab),selTab);
	end;
end;

function use_confirm(nItemIdx,nUseType)
	nUseType = nUseType or 0;
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	local nItemNum = GetItemCount(2,1,1101);
	local nMax = 0;
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMax = nItemNum;
	else
		nMax = g_nMaxUseTime - nUseXinDeNum;
	end;
	if nUseType == 1 then
		AskClientForNumber("use_real_1",1,nMax,"Xin h醝 d飊g m蕐 c竔");
		return
	elseif nUseType == 2 then
		AskClientForNumber("use_real_2",1,nMax,"Xin h醝 d飊g m蕐 c竔");
		return
	end;
	return
	
	
	
end;

function use_real_1(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--等级的四次方/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--收费区健康经验判断
	if IB_VERSION == 0 then
		if nLevel == 99  then
			if DelItem(2,1,1101,nCount) == 1 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("B筺 nh薾 頲 "..nCount.." T? v? i h閕 b礽 v? "..nCount.." Truy襫 C玭g T﹎ Ьc");
				SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
				Msg2Player("Tu莕 n祔 ngi  d飊g "..GetTask(TSK_USE_XINDE).." Th鵦 Chi課 T﹎ Ьc, m鏸 tu莕 ch? c? th? d飊g "..g_nMaxUseTime.." quy觧 Th鵦 Chi課 T﹎ Ьc");	
				return
			else
		
				Say("X竎 nh薾 b筺 c?  Th鵦 Chi課 T﹎ Ьc kh玭g!",1,"уng ?/nothing");
				
				return
			end;
		elseif floor(nGoldenExp/2)*nCount > GetGoldenExp() then
			Say("觤 s鴆 kh醗 c馻 b筺 <color=yellow>"..GetGoldenExp().."<color> kh玭g  <color=yellow>"..(floor(nGoldenExp/2)*nCount).."<color>, c? mu鑞 i kh玭g?",2,"уng ?/#use_shoufei("..nCount..",1)","H駓 b?/nothing");
			return
		else
			use_shoufei(nCount,1);
			return
		end;
	elseif IB_VERSION == 1 then
		if  DelItem(2,1,1101,nCount) == 1 then
			if nLevel == 99 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("B筺 nh薾 頲 "..nCount.." T? v? i h閕 b礽 v? "..nCount.." Truy襫 C玭g T﹎ Ьc");
			else
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
					
				ModifyExp(floor(nExp/2) * nCount);
				local nTemp = floor(nExp/2) * nCount;
				Msg2Player("B筺 nh薾 頲 "..nCount.." T? v? i h閕 b礽 v? "..nTemp.." 甶觤 kinh nghi謒");
			end;
		else
		
			Say("X竎 nh薾 b筺 c?  Th鵦 Chi課 T﹎ Ьc kh玭g!",1,"уng ?/nothing");
		
			return
		end;
	
	end;


	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("Tu莕 n祔 ngi  d飊g "..GetTask(TSK_USE_XINDE).." Th鵦 Chi課 T﹎ Ьc, m鏸 tu莕 ch? c? th? d飊g "..g_nMaxUseTime.." quy觧 Th鵦 Chi課 T﹎ Ьc");	

end
function use_real_2(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--等级的四次方/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--收费区健康经验判断
	if IB_VERSION == 0 then
		if nGoldenExp*nCount > GetGoldenExp() then
			Say("觤 s鴆 kh醗 c馻 b筺 <color=yellow>"..GetGoldenExp().."<color> kh玭g  <color=yellow>"..(nGoldenExp*nCount).."<color>, c? mu鑞 i kh玭g?",2,"уng ?/#use_shoufei("..nCount..",2)","H駓 b?/nothing");
			return
		else
			use_shoufei(nCount,2);
			return
		end;
	end;
	if DelItem(2,1,1101,nCount) == 1 then
		if IB_VERSION == 1 then	
			ModifyExp(nExp * nCount);
			Msg2Player("B筺 nh薾 頲 "..(nExp * nCount).." 甶觤 kinh nghi謒");
		end;
	else
		WriteLog("D飊g Th鵦 Chi課 T﹎ Ьc:"..GetName().."H駓 Th鵦 Chi課 T﹎ Ьc th蕋 b筰!");
		Say("X竎 nh薾 b筺 c?  Th鵦 Chi課 T﹎ Ьc kh玭g!",1,"уng ?/nothing")
		
		return
	end;
	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("Tu莕 n祔 ngi  d飊g "..GetTask(TSK_USE_XINDE).." Th鵦 Chi課 T﹎ Ьc, m鏸 tu莕 ch? c? th? d飊g "..g_nMaxUseTime.." quy觧 Th鵦 Chi課 T﹎ Ьc");	

end

function use_shoufei(nCount,nType)
	local nGoldenExp = 0;
	if DelItem(2,1,1101,nCount) == 1 then
		
		if nType == 1 then
			AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
			Msg2Player("B筺 nh薾 頲 "..nCount.." T? v? i h閕 b礽");
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4)/2)*nCount;
		else
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4))*nCount;
		end;
		gf_GoldenExp2Exp(nGoldenExp);
		
		SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
		Msg2Player("Tu莕 n祔 ngi  d飊g "..GetTask(TSK_USE_XINDE).." Th鵦 Chi課 T﹎ Ьc, m鏸 tu莕 ch? c? th? d飊g "..g_nMaxUseTime.." quy觧 Th鵦 Chi課 T﹎ Ьc");	
	end;

end

function nothing()

end;

-- 2,1,1101